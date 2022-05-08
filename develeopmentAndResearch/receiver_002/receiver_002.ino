
const int INPUT_0_PIN = 2;  // GPIO2  D4
const int INPUT_1_PIN = 0;  // GPIO0  D3
const int INPUT_2_PIN = 4;  // GPIO4  D2
const int INPUT_3_PIN = 5;  // GPIO5  D1
const int INPUT_4_PIN = 14; // GPIO14 D5/SCK
const int INPUT_5_PIN = 12; // GPIO12 D6/MISO
const int INPUT_6_PIN = 13; // GPIO13 D7/MOSI

uint8_t inputState = 0xff;

void setup() {
  Serial.begin(115200);
  
  pinMode(INPUT_0_PIN, INPUT_PULLUP);
  pinMode(INPUT_1_PIN, INPUT_PULLUP);
  pinMode(INPUT_2_PIN, INPUT_PULLUP);
  pinMode(INPUT_3_PIN, INPUT_PULLUP);
  pinMode(INPUT_4_PIN, INPUT_PULLUP);
  pinMode(INPUT_5_PIN, INPUT_PULLUP);
  pinMode(INPUT_6_PIN, INPUT_PULLUP);

  Serial.println("\nStarting...");
}

void loop() {
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
  
  if(oldInputState != inputState){
    Serial.println(inputState, BIN);
  }

}
