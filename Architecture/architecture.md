# Architecture

The lasermaze is build upon a Raspberry-Pi with Node-red and is visualised in the following component diagram: 

[componentDiagramArchitecture.png](componentDiagramArchitecture.png)

The lasers and receivers are connected to a concentrator who control the transmitters and read the receivers. The concentrators connect to the WiFi network so that the MQTT client in the concentrator can connect to the MQTT broker for command and control. 

The Node-red instance is running flows that will implement the game logic. Nod-red is connected to the MQTT broker for command and control of the concentrators.

Lasers are swithed on and off with a messgage in the associated MQTT topic. Receivers report their status on change (detect light or not) with a messgage in the associated MQTT topic. 

At a regular interval the concentrators are polled by the game logic in Node-red. This will allow detection of missed messages as well as a an indication that a concentrator is connected. A connected concentrator that is polled regularly will have a red- blinking led.

## Software
The software required for the Lasermaze is: 

 - Node-red (hart of the system)
 - mosquitto MQTT broker (to interconnect all components of the lasermaze)
 - Arduino (to program the ESP8266)
 - Programcode for the TX- and RX-concentrators. (Avialable in this repository)

## Hardware
The following hardware is required:

 - A computer that can run the software specified above (I used a Raspberry-Pi 4 with a touch screen)
 - Any Wifi-accesspoint with a router that has a DHCP-server. 
 - ESP8266 D1 mini for each TX- and RX-concentrator (fits on the concentrator boards in this repository) 
 - Laser emitters (see [components specified here..](..LaserTransmitterReceivers/readme.md))
 - LDR light detectors (see [components specified here..](..LaserTransmitterReceivers/readme.md))
 - Magnets are optional (see [components specified here..](..LaserTransmitterReceivers/readme.md)
 - PLA to print the laser transmitter and receiver mounts. 
