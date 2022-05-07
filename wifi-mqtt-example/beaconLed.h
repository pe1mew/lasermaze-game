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

/// \file beaconLed.h
/// \brief LED class to control a single LED connected to a pin o the Arduino board
/// \date 12-2-2017
/// \author Remko Welling (PE1MEW)
/// \version 1.0	Initial version
///                 \todo add functions that will not occupy the microprocessor in delay functions


#ifndef __BEACONLED_H__
#define __BEACONLED_H__

#include <stdint.h>

static uint16_t  DEFAULT_DELAY	= 150;	///< Default delay of 250 ms


class beaconLed
{
//variables
public:
protected:
private:
	uint8_t _ledPin;

//functions
public:
	/// \brief default constructor.
	/// This default constructor cannot be used when SPI is used. 
	/// SPI is using SCK that is connected at pin 13 where the LED_BUILTIN is also connected.
	beaconLed();
	
	/// \brief overloaded constructor to configure hardware pin
	/// \param[in] hardware pin at Arduino at which led is connected.
	beaconLed(uint8_t ledPin);	// \todo add overloaded constructor to allow other led pins to be used.
	
	~beaconLed();
	
	/// \brief switch led on
	void setOn(void);
	
	/// \brief switch led off
	void setOff(void);
	
	/// \brief blink n times with a 150 ms duration per blink
	/// If the led was ON it is left in a OFF state after blinking
	/// \param[in] count that the led shall blink
	void blink(uint8_t n);
	
	/// \brief blink n times with duration per blink as specified
	/// If the led was ON it is left in a OFF state after blinking
	/// \param[in] count that the led shall blink
	/// \param[in] duration of the pulse while duty cycle is 50%
	void blink(uint8_t n, uint16_t pulsPauseDuration);
	
protected:
private:
	//beaconLed( const beaconLed &c );
	//beaconLed& operator=( const beaconLed &c );
	
	/// \brief Switch on LED
	void on(void);
	
	/// \brief switch off LED
	void off(void);
	
	/// \brief reverse LED state
	void reverse(void);

}; //beaconLed

#endif //__BEACONLED_H__
