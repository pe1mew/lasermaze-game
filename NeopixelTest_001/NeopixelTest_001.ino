#include <Adafruit_NeoPixel.h>
 
#define PIN D8
#define LED_COUNT 4
 
//the Wemos WS2812B RGB shield has 1 LED connected to pin 2
Adafruit_NeoPixel pixels = Adafruit_NeoPixel(8, PIN, NEO_GRB + NEO_KHZ800);
 
 
void setup() 
{
  pixels.begin(); // This initializes the NeoPixel library.
}
 
void loop() 
{
  int led;
  for(led=0; led <=LED_COUNT; led++)
  {
    setColor(led,255,0,0,100); //red
  }
  for(led=0; led <=LED_COUNT; led++)
  {
    setColor(led,0,255,255,100); //
  }
    for(led=0; led <=LED_COUNT; led++)
  {
    setColor(led,255,0,255,100); //
  }
}
 
//simple function which takes values for the red, green and blue led and also
//a delay
void setColor(int led, int redValue, int greenValue, int blueValue, int delayValue)
{
  pixels.setPixelColor(led, pixels.Color(redValue, greenValue, blueValue)); 
  pixels.show();
  delay(delayValue);
}
