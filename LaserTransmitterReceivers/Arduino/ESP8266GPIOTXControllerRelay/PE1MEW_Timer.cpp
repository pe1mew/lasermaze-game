/*--------------------------------------------------------------------
  This file is part of the PE1MEW TTNMapper node.
  
  The PE1MEW TTNMapper node is free software: 
  you can redistribute it and/or modify it under the terms of a Creative 
  Commons Attribution-NonCommercial 4.0 International License 
  (http://creativecommons.org/licenses/by-nc/4.0/) by 
  PE1MEW (http://pe1mew.nl) E-mail: pe1mew@pe1mew.nl

  The PE1MEW TTNMapper node is distributed in the hope that 
  it will be useful, but WITHOUT ANY WARRANTY; without even the 
  implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR 
  PURPOSE.
  --------------------------------------------------------------------*/

/// \file PE1MEW_Timer.cpp
/// \author Remko Welling (PE1MEW)

#include "PE1MEW_Timer.h"

#include "Arduino.h"

PE1MEW_Timer::PE1MEW_Timer():
  _msEndTime(0),
  _active(false)
{
}

// default destructor
PE1MEW_Timer::~PE1MEW_Timer()
{
}

bool PE1MEW_Timer::setExpiry(uint32_t msTime)
{
  // test if timer is running
  // If timer is running return false
  //    else returen true and set timer

//  if(_active)
//  {
//    return false;
//  }
//  else
//  {
    _msEndTime = millis() + msTime;
    _active = true;
    return true;
//  }
}

  
bool PE1MEW_Timer::getExpired()
{
  if(millis() < _msEndTime)
  {
    return false;
  }
  else
  {
    _active = false;
    return true;
  }
}
