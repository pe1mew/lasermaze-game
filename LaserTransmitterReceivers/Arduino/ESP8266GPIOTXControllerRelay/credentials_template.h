/*--------------------------------------------------------------------
  This code is free software:
  you can redistribute it and/or modify it under the terms of a Creative
  Commons Attribution-NonCommercial 4.0 International License
  (http://creativecommons.org/licenses/by-nc/4.0/) by
  Remko Welling (http://pe1mew.nl) E-mail: pe1mew@gmail.com

  The program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
  --------------------------------------------------------------------*/

/*!
 * \file credentials_template.h
 * \brief Credentials and settings for lasermaze TX contrller.
 * \author Remko Welling (pe1mew@gmail.com)
 * 
 * # Revision history
 * 
 * Version|Date      |Note
 * --------------------------------------
 * 0.1    |4-6-2022  | Initial release
 * 
 * # Usage
 * 
 * Copy this file or rename it to "credentials.h" and configure settings as required.
 */
 
#ifndef __CREDENTIALS_H_
#define __CREDENTIALS_H_

const char* WiFissid     = "laserbase";   ///< SSID of WiFi access point
const char* WiFipassword = "laserbase";   ///< passwordt for WiFi accesspoint

const char* mqttServer   = "172.31.0.10"; ///< MQTT broker address or IP
const int   mqttPort     = 1883;          ///< MQTT broker portnumber
const char* mqttUser     = "username";    ///< MQTT username for access to broker
const char* mqttPassword = "password";    ///< MQTT password for access to broker

#endif //__CREDENTIALS_H_
