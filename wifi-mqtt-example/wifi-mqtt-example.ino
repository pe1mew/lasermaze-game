// From: https://techtutorialsx.com/2017/04/09/esp8266-connecting-to-mqtt-broker/

#include <ESP8266WiFi.h>
#include <PubSubClient.h>

#include <string.h> // memset()

const char*   WiFissid           = "laserbase"; ///< SSID of WiFi access point
const char*   WiFipassword       = "laserbase"; ///< passwordt for WiFi accesspoint
unsigned long WiFipreviousMillis = 0;           ///< Variable to hold last moment on which WiFi connection is tested. 
unsigned long WiFiinterval       = 30000;       ///< inteval in milliseconds at which WiFi connection is tested.

const char* mqttServer   = "172.31.0.10";       ///< MQTT broker address or IP
const int   mqttPort     = 1883;                ///< MQTT broker portnumber
const char* mqttUser     = "remko";             ///< MQTT username for access to broker
const char* mqttPassword = "remko";             ///< MQTT password for access to broker

const String baseTopic   = "lasermaze/";        ///< Base topic for topic structure on broker
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
//    char clientID[TOPIC_BUFFER_SIZE] = "\0";
//    chipId.toCharArray(clientID, 50);
//    if (client.connect(clientID, mqttUser, mqttPassword )) {
    if (client.connect("001", mqttUser, mqttPassword )) {
      Serial.println("MQTT: Connected");
      memset(topicBuffer, 0, TOPIC_BUFFER_SIZE);
      topic.toCharArray(topicBuffer, 50);
      client.publish(topicBuffer, "Hello world");
      client.subscribe(topicBuffer);
    } else {
      Serial.print("MQTT: Failed with state ");
      Serial.println(client.state());
      delay(2000);
    }
  }
}

/// \brief Setup ESP8266
void setup() {
  //  led.setOff();
  Serial.begin(115200);

  uint32_t chipId = ESP.getChipId();
  Serial.print("\nChipID: ");
  Serial.println(chipId);
  topic = baseTopic + chipId + "/";
  
//  String devAddress = WiFi.macAddress();
//  Serial.print("\ndevAddress: ");
//  Serial.println(chipId);
//  topic = baseTopic + devAddress + "/";
  
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
  
}
