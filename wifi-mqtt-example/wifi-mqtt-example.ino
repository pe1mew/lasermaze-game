// From: https://techtutorialsx.com/2017/04/09/esp8266-connecting-to-mqtt-broker/

#include <ESP8266WiFi.h>
#include <PubSubClient.h>

#include <string.h>
 
const char*   WiFissid           = "laserbase";
const char*   WiFipassword       = "laserbase";
unsigned long WiFipreviousMillis = 0;
unsigned long WiFiinterval       = 30000;
const char* mqttServer   = "172.31.0.10";
const int   mqttPort     = 1883;
const char* mqttUser     = "remko";
const char* mqttPassword = "7321jh36";

const String baseTopic   = "lasermaze/"; 
String chipId;
String topic; 
char Buf[50] = "\0";
#define TOPIC_BUFFER_SIZE 50
char topicBuffer[TOPIC_BUFFER_SIZE];
       
WiFiClient espClient;
PubSubClient client(espClient);
 
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

void WiFireconnect(){
  //print the Wi-Fi status every 30 seconds
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

void MQTTinit() {
  client.setServer(mqttServer, mqttPort);
  client.setCallback(MQTTcallback);
  MQTTreconnect();
}

void MQTTreconnect(){
  while (!client.connected()) {
    Serial.println("MQTT: Connecting...");
    char clientID[TOPIC_BUFFER_SIZE] = "\0";
    chipId.toCharArray(clientID, 50);
    if (client.connect(clientID, mqttUser, mqttPassword )) {
//    if (client.connect("ESP8266Client", mqttUser, mqttPassword )) {
      Serial.println("MQTT: Connected");

      memset(topicBuffer, 0, TOPIC_BUFFER_SIZE);
      topic.toCharArray(topicBuffer, 50);
      client.publish(topicBuffer, "Hello world");
      client.subscribe(topicBuffer);
    } else {
      Serial.print("MQTT: Failed with state ");
      Serial.print(client.state());
      delay(2000);
    }
  }
}

void setup() {
  Serial.begin(115200);
  Serial.flush();

  chipId = ESP.getChipId();
  Serial.print("\nChipID: ");
  Serial.println(chipId);
  topic = baseTopic + chipId + "/";
  Serial.println(topic);
  
  WiFiinit();
  MQTTinit();
}
 
void MQTTcallback(char* topic, byte* payload, unsigned int length) {
  Serial.print("MQTT: Message in topic: ");
  Serial.println(topic);
  Serial.print("MQTT: Message: ");
  for (int i = 0; i < length; i++) {
    Serial.print((char)payload[i]);
  }
}
 
void loop() {
  client.loop();

  WiFireconnect();
  MQTTreconnect();
  
}
