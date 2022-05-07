/*--------------------------------------------------------------------
  This code is free software:
  you can redistribute it and/or modify it under the terms of a Creative
  Commons Attribution-NonCommercial 4.0 International License
  (http://creativecommons.org/licenses/by-nc/4.0/) by
  Remko Welling (http://pe1mew.nl) E-mail: pe1mew@gmail.com

  The program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
  --------------------------------------------------------------------*/

/*!
 * \file wifi-mqtt-tx_001.ino
 * \brief Posts changes on GPIO ports on MQTT through a WiFi connection .
 * Inspired on: https://techtutorialsx.com/2017/04/09/esp8266-connecting-to-mqtt-broker/
 * \author Remko Welling (pe1mew@gmail.com)
 * 
 * # Revision history
 * 
 * Version|Date      |Note
 * --------------------------------------
 * 0.1    |7-5-2022  | Initial release
 * 
 * 
 * \todo send state on request.
 * \todo respond to status request
 */
 
#include <ESP8266WiFi.h>
#include <PubSubClient.h>

#include <string.h> // memset()

const int OUTPUT_0_PIN = 2;   // GPIO2  D4
const int OUTPUT_1_PIN = 0;   // GPIO0  D3
const int OUTPUT_2_PIN = 4;   // GPIO4  D2
const int OUTPUT_3_PIN = 5;   // GPIO5  D1
const int OUTPUT_4_PIN = 14;  // GPIO14 D5/SCK
const int OUTPUT_5_PIN = 12;  // GPIO12 D6/MISO
const int OUTPUT_6_PIN = 13;  // GPIO13 D7/MOSI
const int OUTPUT_7_PIN = 15;

uint8_t outputState    = 0x00;
uint8_t newOutputState = 0x00;
bool    setState       = false;
bool    sendState      = false;
 
const char*   WiFissid           = "laserbase"; ///< SSID of WiFi access point
const char*   WiFipassword       = "laserbase"; ///< passwordt for WiFi accesspoint
unsigned long WiFipreviousMillis = 0;           ///< Variable to hold last moment on which WiFi connection is tested. 
unsigned long WiFiinterval       = 30000;       ///< inteval in milliseconds at which WiFi connection is tested.

const char* mqttServer   = "172.31.0.10";       ///< MQTT broker address or IP
const int   mqttPort     = 1883;                ///< MQTT broker portnumber
const char* mqttUser     = "remko";             ///< MQTT username for access to broker
const char* mqttPassword = "remko";             ///< MQTT password for access to broker

const String baseTopic   = "lasermaze/";        ///< Base topic for topic structure on broker
uint32_t chipId;                                ///< Chip ID as retrieved from ESP8266 in setup()
String topic;                                   ///< Topic to be used prefixing other publications and subscriptions
#define TOPIC_BUFFER_SIZE 50                    ///< Size of helper buffer
char topicBuffer[TOPIC_BUFFER_SIZE];            ///< helper buffer for conversions of topics in String format.
       
WiFiClient espClient;                           ///< WiFi opbject on ESP8266
PubSubClient client(espClient);                 ///< MQTT client object
 
/// \brief initialize WiFi on ESP8266
void WiFiinit() {
  WiFi.mode(WIFI_STA);
  WiFi.begin(WiFissid, WiFipassword);
  Serial.print("WIFI: Connecting...\n");
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print('.');
    delay(1000);
  }
  Serial.print("\nWiFi: ");
  Serial.println(WiFi.localIP());
  //The ESP8266 tries to reconnect automatically when the connection is lost
  WiFi.setAutoReconnect(true);
  WiFi.persistent(true);
}

/// \brief test if WiFi is connected and reconnect when disconnected. 
/// When connected the RSSI is printed and published on MQTT
/// This function acivates every WiFiinterval in milliseconds
void WiFireconnect(){
  unsigned long WiFicurrentMillis = millis();
  if (WiFicurrentMillis - WiFipreviousMillis >= WiFiinterval){
    switch (WiFi.status()){
      case WL_NO_SSID_AVAIL:
        Serial.println("WiFi: SSID cannot be reached");
        break;
      case WL_CONNECTED:
        Serial.println("WiFi: connection established");
        break;
      case WL_CONNECT_FAILED:
        Serial.println("WiFi: Connection failed");
        break;
    }
    Serial.printf("WiFi: status: %d, ", WiFi.status());
    Serial.print("RSSI: ");
    int rssi = WiFi.RSSI();
    Serial.print(rssi);
    Serial.println(" dBm.");

    if(client.connected()){
      memset(topicBuffer, 0, TOPIC_BUFFER_SIZE);
      String tempTopic = topic + "wifi/rssi/";
      tempTopic.toCharArray(topicBuffer, TOPIC_BUFFER_SIZE);
      char payload[10] = "\0";
      itoa(rssi, payload, 10);
      client.publish(topicBuffer, payload);
    }
    WiFipreviousMillis = WiFicurrentMillis;
  }
}

/// \brief Initialize MQTT client and connect to broker.
void MQTTinit() {
  client.setServer(mqttServer, mqttPort);
  client.setCallback(MQTTcallback);
  MQTTreconnect();
}

/// \brief test is MQTT client is connected and reconnect when not connected. 
void MQTTreconnect(){
  while (!client.connected()) {
    Serial.println("MQTT: Connecting...");
    char clientID[10] = "\0";
    itoa(chipId, clientID, 10);
    if (client.connect(clientID, mqttUser, mqttPassword )) {
      Serial.println("MQTT: Connected");
      memset(topicBuffer, 0, TOPIC_BUFFER_SIZE);
      topic.toCharArray(topicBuffer, 50);
      client.publish(topicBuffer, "Hello world");
      client.subscribe(topicBuffer);
      setState = true;     // send actual input state after MQTT reconnect
      sendState = true;     // send actual input state after MQTT reconnect
    } else {
      Serial.print("MQTT: Failed with state ");
      Serial.println(client.state());
      delay(2000);
    }
  }
}

/// \brief Setup ESP8266
void setup() {
  Serial.begin(115200);

  pinMode(OUTPUT_0_PIN, OUTPUT);
  pinMode(OUTPUT_1_PIN, OUTPUT);
  pinMode(OUTPUT_2_PIN, OUTPUT);
  pinMode(OUTPUT_3_PIN, OUTPUT);
  pinMode(OUTPUT_4_PIN, OUTPUT);
  pinMode(OUTPUT_5_PIN, OUTPUT);
  pinMode(OUTPUT_6_PIN, OUTPUT);
  pinMode(OUTPUT_7_PIN, OUTPUT);

  chipId = ESP.getChipId();
  Serial.print("\nChipID: ");
  Serial.println(chipId);
  topic = baseTopic + chipId + "/";
  Serial.println(topic);
  
  WiFiinit();
  MQTTinit();
}

/// \brief callback function when MQTT message is received. 
void MQTTcallback(char* topic, byte* payload, unsigned int length) {
  Serial.print("MQTT: Message in topic: ");
  Serial.println(topic);
  Serial.print("MQTT: Message: ");
  for (int i = 0; i < length; i++) {
    Serial.print((char)payload[i]);
  }
}

/// \brief Main loop.
void loop() {
  client.loop();
        
  WiFireconnect();
  MQTTreconnect();

  if((newOutputState != outputState) || setState){
    Serial.print("GPIO: ");
    Serial.println(newOutputState, BIN);
    
    // Test ouput pin 0
    if((newOutputState & 0x01) == 0){
      digitalWrite(OUTPUT_0_PIN, HIGH);  
    }else{
      digitalWrite(OUTPUT_0_PIN, LOW);
    }
    
    // Test ouput pin 1
    if((newOutputState & 0x02) == 0){
      digitalWrite(OUTPUT_1_PIN, HIGH);  
    }else{
      digitalWrite(OUTPUT_1_PIN, LOW);
    }
    
    // Test ouput pin 2
    if((newOutputState & 0x04) == 0){
      digitalWrite(OUTPUT_2_PIN, HIGH);  
    }else{
      digitalWrite(OUTPUT_2_PIN, LOW);
    }
    
    // Test ouput pin 3
    if((newOutputState & 0x08) == 0){
      digitalWrite(OUTPUT_3_PIN, HIGH);  
    }else{
      digitalWrite(OUTPUT_3_PIN, LOW);
    }
    
    // Test ouput pin 4
    if((newOutputState & 0x10) == 0){
      digitalWrite(OUTPUT_4_PIN, HIGH);  
    }else{
      digitalWrite(OUTPUT_4_PIN, LOW);
    }
    
    // Test ouput pin 5
    if((newOutputState & 0x20) == 0){
      digitalWrite(OUTPUT_5_PIN, HIGH);  
    }else{
      digitalWrite(OUTPUT_5_PIN, LOW);
    }
    
    // Test ouput pin 6
    if((newOutputState & 0x40) == 0){
      digitalWrite(OUTPUT_6_PIN, HIGH);  
    }else{
      digitalWrite(OUTPUT_6_PIN, LOW);
    }
    
    // Test ouput pin 7
    if((newOutputState & 0x80) == 0){
      digitalWrite(OUTPUT_7_PIN, HIGH);  
    }else{
      digitalWrite(OUTPUT_7_PIN, LOW);
    }

    outputState = newOutputState;
    if(setState){
      setState = false;
    }

    if(sendState){
      sendGPIOState();
    }
  }
}

void sendGPIOState(){
  for(int i = 0; i < 8; i++){
    memset(topicBuffer, 0, TOPIC_BUFFER_SIZE);
    String tempTopic = topic + "output/" + i + "/";
    tempTopic.toCharArray(topicBuffer, TOPIC_BUFFER_SIZE);
    
    if(((outputState >> i) & 0x01) > 0){ // send 1
      client.publish(topicBuffer, "1");
    }else{                              // send 0
      client.publish(topicBuffer, "0");
    }
  }
}
