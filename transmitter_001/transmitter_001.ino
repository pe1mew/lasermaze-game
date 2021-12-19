
const int OUTPUT_0_PIN = 2;
const int OUTPUT_1_PIN = 0;
const int OUTPUT_2_PIN = 4;
const int OUTPUT_3_PIN = 5;
const int OUTPUT_4_PIN = 14;
const int OUTPUT_5_PIN = 12;
const int OUTPUT_6_PIN = 13;
const int OUTPUT_7_PIN = 15;

uint8_t outputState = 0x01;

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

  Serial.println("\nStarting...");
}

void loop() {
  
  if (outputState == 0x80){
    outputState = 0x01;
  }else{
    outputState = outputState << 1;
  }
  
  Serial.println(outputState, BIN);
  delay(500);

  // Test ouput pin 0
  if((outputState & 0x01) == 0){
    digitalWrite(OUTPUT_0_PIN, HIGH);  
  }else{
    digitalWrite(OUTPUT_0_PIN, LOW);
  }
  
  // Test ouput pin 1
  if((outputState & 0x02) == 0){
    digitalWrite(OUTPUT_1_PIN, HIGH);  
  }else{
    digitalWrite(OUTPUT_1_PIN, LOW);
  }
  
  // Test ouput pin 2
  if((outputState & 0x04) == 0){
    digitalWrite(OUTPUT_2_PIN, HIGH);  
  }else{
    digitalWrite(OUTPUT_2_PIN, LOW);
  }
  
  // Test ouput pin 3
  if((outputState & 0x08) == 0){
    digitalWrite(OUTPUT_3_PIN, HIGH);  
  }else{
    digitalWrite(OUTPUT_3_PIN, LOW);
  }
  
  // Test ouput pin 4
  if((outputState & 0x10) == 0){
    digitalWrite(OUTPUT_4_PIN, HIGH);  
  }else{
    digitalWrite(OUTPUT_4_PIN, LOW);
  }
  
  // Test ouput pin 5
  if((outputState & 0x20) == 0){
    digitalWrite(OUTPUT_5_PIN, HIGH);  
  }else{
    digitalWrite(OUTPUT_5_PIN, LOW);
  }
  
  // Test ouput pin 6
  if((outputState & 0x40) == 0){
    digitalWrite(OUTPUT_6_PIN, HIGH);  
  }else{
    digitalWrite(OUTPUT_6_PIN, LOW);
  }
  
  // Test ouput pin 7
  if((outputState & 0x80) == 0){
    digitalWrite(OUTPUT_7_PIN, HIGH);  
  }else{
    digitalWrite(OUTPUT_7_PIN, LOW);
  }

}
