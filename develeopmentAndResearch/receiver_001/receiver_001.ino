#include <WEMOS_Matrix_LED.h>

const int INPUT_0_PIN = 2;
const int INPUT_1_PIN = 0;
const int INPUT_2_PIN = 4;
const int INPUT_3_PIN = 5;


const int x = 0;
MLED mled(5); //set intensity=5

uint8_t inputState = 0xff;

void updateDisplay(uint8_t state = 0x00){
  for( uint8_t i=0; i<8; i++){
    if( ((state >> i) & 0x01) == 0x01){
      mled.dot(x,i); // draw dot
    }else{
      mled.dot(x,i,0);//clear dot
    }
  }
  mled.display();
}

void setup() {
  Serial.begin(115200);
  
  pinMode(INPUT_0_PIN, INPUT);
  pinMode(INPUT_1_PIN, INPUT);
  pinMode(INPUT_2_PIN, INPUT);
  pinMode(INPUT_3_PIN, INPUT);

  
//  mled.clear();
//  mled.display();
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
  
  if(oldInputState != inputState){
    Serial.println(inputState, BIN);
    updateDisplay(inputState);
  }
//  delay(500);
}
