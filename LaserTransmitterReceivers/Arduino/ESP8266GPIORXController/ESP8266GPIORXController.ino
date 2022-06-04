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
 * \file ESP8266GPIORXController.ino
 * \brief Posts changes on GPIO ports on MQTT through a WiFi connection .
 * Inspired on: https://techtutorialsx.com/2017/04/09/esp8266-connecting-to-mqtt-broker/
 * \author Remko Welling (pe1mew@gmail.com)
 * 
 * # Revision history
 * 
 * Version|Date      |Note
 * --------------------------------------
 * 0.1    |7-5-2022  | Initial release
 * 0.2    |4-6-2022  | Added watchdog activity light on port 7
 * 
 */
 
#include <ESP8266WiFi.h>
#include <PubSubClient.h>

#include <string.h> // memset()

#include "credentials.h"
#include "PE1MEW_Led.h"                 // PE1MEW_Led class
#include "PE1MEW_Timer.h"

const int INPUT_0_PIN = 2;  // GPIO2  D4
const int INPUT_1_PIN = 0;  // GPIO0  D3
const int INPUT_2_PIN = 4;  // GPIO4  D2
const int INPUT_3_PIN = 5;  // GPIO5  D1
const int INPUT_4_PIN = 14; // GPIO14 D5/SCK
const int INPUT_5_PIN = 12; // GPIO12 D6/MISO
const int INPUT_6_PIN = 13; // GPIO13 D7/MOSI
const int OUTPUT_7_PIN = 15;

uint8_t inputState = 0x00;
bool sendState = false;
 
unsigned long WiFipreviousMillis = 0;           ///< Variable to hold last moment on which WiFi connection is tested. 
unsigned long WiFiinterval       = 30000;       ///< inteval in milliseconds at which WiFi connection is tested.

const String baseTopic   = "lasermaze/";        ///< Base topic for topic structure on broker
String subscribeTopic;

uint32_t chipId;                                ///< Chip ID as retrieved from ESP8266 in setup()
String topic;                                   ///< Topic to be used prefixing other publications and subscriptions
#define TOPIC_BUFFER_SIZE 50                    ///< Size of helper buffer
char topicBuffer[TOPIC_BUFFER_SIZE];            ///< helper buffer for conversions of topics in String format.
       
WiFiClient espClient;                           ///< WiFi opbject on ESP8266
PubSubClient client(espClient);                 ///< MQTT client object

PE1MEW_Timer timer;
PE1MEW_Led   led = PE1MEW_Led(OUTPUT_7_PIN);
 
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
        Serial.printf("WiFi: Connected, status: %d, RSSI: %d dBm.\n", WiFi.status(), WiFi.RSSI());
        break;
      case WL_CONNECT_FAILED:
        Serial.println("WiFi: Connection failed");
        break;
    }
    
    if(client.connected()){
      memset(topicBuffer, 0, TOPIC_BUFFER_SIZE);
      String tempTopic = topic + "wifi/rssi/";
      tempTopic.toCharArray(topicBuffer, TOPIC_BUFFER_SIZE);
      char payload[10] = "\0";
      itoa(WiFi.RSSI(), payload, 10);
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
      memset(topicBuffer, 0, TOPIC_BUFFER_SIZE);
      subscribeTopic.toCharArray(topicBuffer, 50);
      client.subscribe(topicBuffer);
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

  pinMode(INPUT_0_PIN, INPUT_PULLUP);
  pinMode(INPUT_1_PIN, INPUT_PULLUP);
  pinMode(INPUT_2_PIN, INPUT_PULLUP);
  pinMode(INPUT_3_PIN, INPUT_PULLUP);
  pinMode(INPUT_4_PIN, INPUT_PULLUP);
  pinMode(INPUT_5_PIN, INPUT_PULLUP);
  pinMode(INPUT_6_PIN, INPUT_PULLUP);

  chipId = ESP.getChipId();
  Serial.print("\nChipID: ");
  Serial.println(chipId);
  topic = baseTopic + chipId + "/";
  Serial.println(topic);
  subscribeTopic = topic + "input/#";
  Serial.println(subscribeTopic);
    
  WiFiinit();
  MQTTinit();
}

/// \brief callback function when MQTT message is received. 
void MQTTcallback(char* topic, byte* payload, unsigned int length) {
  Serial.print("MQTT: Message in topic: ");
  Serial.print(topic);
  Serial.print(", Payload: ");
  for (int i = 0; i < length; i++) {
    Serial.print((char)payload[i]);
  }
  Serial.print("\n");

  timer.setExpiry(45000); // 45 seconds
  led.startBlink(true, 1, 500);
  
  memset(topicBuffer, 0, TOPIC_BUFFER_SIZE);
  strncpy(topicBuffer, topic + 19, 5);
  
  if (strcmp(topicBuffer, "input") == 0){
    char gpio[5] = "\0";
    strncpy(gpio, topic + 25, 1);
    uint8_t port = atoi(gpio);
    char payloadBuffer[5] = "\0";
    strncpy(payloadBuffer, (char*)payload, 1);
    uint8_t state = (atoi(payloadBuffer) & 0x01);
    
    if(port < 8){ // valid port selected
      // nothing to do
    }else{
      sendState = true;
    }
  } 
}

/// \brief Main loop.
void loop() {
  client.loop();
        
  WiFireconnect();
  MQTTreconnect();

  led.process();

  if(timer.getExpired() == true){
    led.stopBlink();
  }

  uint8_t oldInputState = inputState;
  
  if(digitalRead(INPUT_0_PIN) == LOW){
    inputState |= 0x01;  
  }else{
    inputState &= 0xfe;
  }
  
  if(digitalRead(INPUT_1_PIN) == LOW){
    inputState |= 0x02;  
  }else{
    inputState &= 0xfd;
  }
  
  if(digitalRead(INPUT_2_PIN) == LOW){
    inputState |= 0x04;  
  }else{
    inputState &= 0xfb;
  }
  
  if(digitalRead(INPUT_3_PIN) == LOW){
    inputState |= 0x08;  
  }else{
    inputState &= 0xf7;
  }
  
  if(digitalRead(INPUT_4_PIN) == LOW){
    inputState |= 0x10;  
  }else{
    inputState &= 0xef;
  }
  
  if(digitalRead(INPUT_5_PIN) == LOW){
    inputState |= 0x20;  
  }else{
    inputState &= 0xdf;
  }
  
  if(digitalRead(INPUT_6_PIN) == LOW){
    inputState |= 0x40;  
  }else{
    inputState &= 0xbf;
  }
  
  if((oldInputState != inputState) || sendState){
    printGPIO(inputState);
    
    for(int i = 0; i < 7; i++){
      if((((oldInputState >> i) & 0x01) != ((inputState >> i) & 0x01)) || sendState){
        memset(topicBuffer, 0, TOPIC_BUFFER_SIZE);
        String tempTopic = topic + "input/" + i + "/";
        tempTopic.toCharArray(topicBuffer, TOPIC_BUFFER_SIZE);
        
        if(((inputState >> i) & 0x01) > 0){ // send 1
          client.publish(topicBuffer, "1");
        }else{                              // send 0
          client.publish(topicBuffer, "0");
        }
      }
    }
  }
  if(sendState){
    sendState = false;
  }
}

/// \brief print GPIO state
void printGPIO(uint8_t state){
  Serial.print("GPIO: ");
  for (int i = 0; i < 8; i++) {
    if((state >> 7-i) & 0x01 == 0x01){
      Serial.print("1");
    }else{
      Serial.print("0");
    }
  }
  Serial.print("\n");
}
