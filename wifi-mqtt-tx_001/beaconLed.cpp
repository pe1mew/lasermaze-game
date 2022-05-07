/*--------------------------------------------------------------------
  This file is part of the PE1MEW TTN LoRa Beacon.
  
  The PE1MEW TTN LoRa Beacon is free software: 
  you can redistribute it and/or modify it under the terms of a Creative 
  Commons Attribution-NonCommercial 4.0 International License 
  (http://creativecommons.org/licenses/by-nc/4.0/) by 
  PE1MEW (http://pe1mew.nl) E-mail: pe1mew@pe1mew.nl

  The PE1MEW TTN LoRa Beacon is distributed in the hope that 
  it will be useful, but WITHOUT ANY WARRANTY; without even the 
  implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR 
  PURPOSE.
  --------------------------------------------------------------------*/

/// \file beaconLed.cpp
/// \brief LED class to control a single LED connected to a pin o the Arduino board
/// \date 12-2-2017
/// \author Remko Welling (PE1MEW)
/// \version 1.0	Initial version
///                 \todo add functions that will not occupy the microprocessor in delay functions

#include "beaconLed.h"

#include "Arduino.h"

// default constructor
beaconLed::beaconLed():
	_ledPin(LED_BUILTIN)	// set output pin to built in led
{
	// initialize digital pin as an output.
	pinMode(_ledPin, OUTPUT);
} //beaconLed

beaconLed::beaconLed(uint8_t ledPin):
	_ledPin(ledPin)
{
	// initialize digital pin as an output.
	pinMode(_ledPin, OUTPUT);
} //beaconLed

// default destructor
beaconLed::~beaconLed()
{
} //~beaconLed

void beaconLed::setOn(void)
{
	on();   // turn the LED on (HIGH is the voltage level)
}

void beaconLed::setOff(void)
{
	off();    // turn the LED off by making the voltage LOW
}

void beaconLed::blink(uint8_t n)
{
	blink(n, DEFAULT_DELAY);
}

void beaconLed::blink(uint8_t n, uint16_t pulsPauseDuration)
{
	
	//reverse();	// alter led state to finish previous state
	//delay(pulsPauseDuration);	// add complete pause to separate from previous state
	
	for (int i = 0; i < n; i++)
	{
		reverse();
		delay(pulsPauseDuration/2);	// At last blink do not delay
		reverse();
		delay(pulsPauseDuration/2);	// add normal delay between blinks
	}
	delay(pulsPauseDuration/2);	// add complete pause to finish blinking
	//reverse();	// set previous state before blinking
}

void beaconLed::reverse(void)
{
	if ( digitalRead(_ledPin) == HIGH)
	{
		off();
	}
	else
	{
		on();
	}
}

void beaconLed::on(void)
{
	digitalWrite(_ledPin, HIGH);   // turn the LED on (HIGH is the voltage level)
}

void beaconLed::off(void)
{
	digitalWrite(_ledPin, LOW);    // turn the LED off by making the voltage LOW
}
