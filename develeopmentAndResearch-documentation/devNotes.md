# Development notes
These notes contain all information about the architecture and implementation details of the lasermaze. 


# information

## painlessMesh
This a mesh at layer 3 of the OSI-model that implements a network layer. It is connectionless and without confirmation. (See: https://gitlab.com/painlessMesh/painlessMesh/-/wikis/home) Messages are not acknowledged. This should be implemented at application level. 




# LaserMaze requirements

- Detection of events shall not be missed.
- Events shall be transported "fast" to the cental processing unit. (what "fast enough" is shall be determinated)



# Lasermaze architecture.

laser maze is build of the following units:

1. Laser transmitter-detector pairs.
2. transmitter and detector controllers.
3. Auxillary devices like sirens, stobe lights, buttons, PIR-detectors.
3. Auxillary controllers for input and output devices. 
4. controller to MQTT bridge.
5. central game contoller. 



## Laser transmitter-detector pairs. 
These pairs consist of a laser transmitter and a laser detector. Both are installed oposite of each other and controlled by a concentrator that serves a group of lasers and detectors.

## transmitter and detector controllers.
A controller serves only inputs or outputs transmitters or detectors. The maximum number of transmitters or detectors is 8 per concentrator

## Auxillary devices
Auxillary devices are devices that add elements to the game other than the laser transmitters or detectors. 
These can be: 

- outputs: 
	- sirens, 
	- stobe lights, 
- Inputs: 
	- buttons, 
	- PIR-detectors,
- etc.


## Auxillary controllers

## controller to MQTT bridge

## central game contoller. 
