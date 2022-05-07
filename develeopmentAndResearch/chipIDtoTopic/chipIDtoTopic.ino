String baseTopic = "lasermaze/"; 
String chipId;
String topic; 
char Buf[50] = "\0";

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  chipId = ESP.getChipId();
  Serial.print("\nChipID: ");
  Serial.println(chipId);
  topic = baseTopic + chipId +"/";
  Serial.println(topic);
//  String
}

void loop() {
  // put your main code here, to run repeatedly:

}
