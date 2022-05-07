const int led_pin = 14;
const int sensor_pin = 13;

void ICACHE_RAM_ATTR IntCallback(){
 Serial.print("Stamp(ms): ");
 Serial.println(millis());
}

void setup() {
 Serial.begin(115200);
 attachInterrupt(digitalPinToInterrupt(sensor_pin), IntCallback, RISING);
}

void loop() {
}


//const long interval = 5000;
//unsigned long current_time = millis();
//unsigned long last_trigger = 0;
//boolean timer_on = false;
//
//ICACHE_RAM_ATTR void movement_detection() {
//  Serial.println("Motion was detected");
//  digitalWrite(led_pin, HIGH);
//  timer_on = true;
//  last_trigger = millis();
//}
//
//void setup() {
// 
//  Serial.begin(115200);
// 
//  pinMode(sensor_pin, INPUT_PULLUP);
//  attachInterrupt(digitalPinToInterrupt(sensor_pin), movement_detection, RISING);
//  pinMode(led_pin, OUTPUT);
//  digitalWrite(led_pin, LOW);
//}
//
//void loop() {
//
//  current_time = millis();
//  if(timer_on && (current_time - last_trigger > interval)) {
//    Serial.println("Motion has stopped");
//    digitalWrite(led_pin, LOW);
//    timer_on = false;
//  }
//}

//const int led_pin =  13;   
//int state = LOW;          
//
//unsigned long previous_time = 0;        
//const long interval = 2000;           
//
//void setup() {
//
//  pinMode(led_pin, OUTPUT);
//}
//
//void loop() {
//  unsigned long current_time = millis();
//
//  if (current_time - previous_time >= interval) {
//    
//    previous_time = current_time;
//    if (state == LOW) {
//      state = HIGH;
//    } else {
//      state = LOW;
//    }
//
//    digitalWrite(led_pin, state);
//  }
//}
