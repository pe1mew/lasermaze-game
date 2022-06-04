EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Module:WeMos_D1_mini U1
U 1 1 6277B2D7
P 1950 2050
F 0 "U1" H 1950 1161 50  0000 C CNN
F 1 "WeMos_D1_mini" H 1950 1070 50  0000 C CNN
F 2 "Module:WEMOS_D1_mini_light" H 1950 900 50  0001 C CNN
F 3 "https://wiki.wemos.cc/products:d1:d1_mini#documentation" H 100 900 50  0001 C CNN
	1    1950 2050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R10
U 1 1 6277C326
P 8200 1450
F 0 "R10" V 8000 1450 50  0000 C CNN
F 1 "1k" V 8100 1450 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 8130 1450 50  0001 C CNN
F 3 "~" H 8200 1450 50  0001 C CNN
	1    8200 1450
	0    1    -1   0   
$EndComp
$Comp
L Device:R R14
U 1 1 6277CBF0
P 9400 950
F 0 "R14" V 9193 950 50  0000 C CNN
F 1 "150" V 9284 950 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 9330 950 50  0001 C CNN
F 3 "~" H 9400 950 50  0001 C CNN
	1    9400 950 
	0    1    1    0   
$EndComp
$Comp
L Device:LED D10
U 1 1 6277D358
P 9000 950
F 0 "D10" H 8993 1167 50  0000 C CNN
F 1 "LED" H 8993 1076 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9000 950 50  0001 C CNN
F 3 "~" H 9000 950 50  0001 C CNN
	1    9000 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 1250 1850 1000
Wire Wire Line
	1050 1000 1850 1000
Text Label 1150 1000 0    50   ~ 0
5V
Wire Wire Line
	2050 1250 2050 900 
Wire Wire Line
	2050 900  1050 900 
Text Label 1150 900  0    50   ~ 0
3V3
Wire Wire Line
	1950 2850 1950 3100
Wire Wire Line
	1950 3100 1050 3100
Text Label 1150 3100 0    50   ~ 0
GND
Wire Wire Line
	8750 1650 8750 1850
Wire Wire Line
	8350 1450 8450 1450
Wire Wire Line
	9150 950  9250 950 
Wire Wire Line
	8750 950  8850 950 
$Comp
L Device:C_Small C15
U 1 1 6279462C
P 7900 1650
F 0 "C15" H 7808 1604 50  0000 R CNN
F 1 "1n" H 7808 1695 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 7900 1650 50  0001 C CNN
F 3 "~" H 7900 1650 50  0001 C CNN
	1    7900 1650
	-1   0    0    1   
$EndComp
Wire Wire Line
	8050 1450 7900 1450
Wire Wire Line
	7900 1450 7900 1550
Wire Wire Line
	7900 1850 8750 1850
Wire Wire Line
	7900 1750 7900 1850
Connection ~ 8750 1850
Connection ~ 7900 1450
Wire Wire Line
	7450 1450 7900 1450
Text Label 10800 950  0    50   ~ 0
5V
Text Label 10800 1850 0    50   ~ 0
GND
$Comp
L Device:R R11
U 1 1 627B9F18
P 8250 2800
F 0 "R11" V 8050 2800 50  0000 C CNN
F 1 "1k" V 8150 2800 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 8180 2800 50  0001 C CNN
F 3 "~" H 8250 2800 50  0001 C CNN
	1    8250 2800
	0    1    -1   0   
$EndComp
$Comp
L Device:R R15
U 1 1 627B9F1E
P 9450 2300
F 0 "R15" V 9243 2300 50  0000 C CNN
F 1 "150" V 9334 2300 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 9380 2300 50  0001 C CNN
F 3 "~" H 9450 2300 50  0001 C CNN
	1    9450 2300
	0    1    1    0   
$EndComp
$Comp
L Device:LED D11
U 1 1 627B9F24
P 9050 2300
F 0 "D11" H 9043 2517 50  0000 C CNN
F 1 "LED" H 9043 2426 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9050 2300 50  0001 C CNN
F 3 "~" H 9050 2300 50  0001 C CNN
	1    9050 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NMOS_GDS Q6
U 1 1 627B9F2A
P 8700 2800
F 0 "Q6" H 8904 2846 50  0000 L CNN
F 1 "85N3LHS" H 8904 2755 50  0000 L CNN
F 2 "Package_TO_SOT_THT:SIPAK_Vertical" H 8900 2900 50  0001 C CNN
F 3 "~" H 8700 2800 50  0001 C CNN
	1    8700 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 3000 8800 3200
Wire Wire Line
	8400 2800 8500 2800
Wire Wire Line
	8800 2300 8800 2550
Wire Wire Line
	9200 2300 9300 2300
Wire Wire Line
	8800 2300 8900 2300
$Comp
L Device:C_Small C16
U 1 1 627B9F63
P 7950 3000
F 0 "C16" H 7858 2954 50  0000 R CNN
F 1 "1n" H 7858 3045 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 7950 3000 50  0001 C CNN
F 3 "~" H 7950 3000 50  0001 C CNN
	1    7950 3000
	-1   0    0    1   
$EndComp
Wire Wire Line
	8100 2800 7950 2800
Wire Wire Line
	7950 2800 7950 2900
Wire Wire Line
	7950 3200 8800 3200
Wire Wire Line
	7950 3100 7950 3200
Connection ~ 8800 3200
Connection ~ 7950 2800
Wire Wire Line
	7500 2800 7950 2800
Text Label 10850 2300 0    50   ~ 0
5V
Text Label 10850 3200 0    50   ~ 0
GND
Text Label 10850 5900 0    50   ~ 0
GND
Text Label 10850 5000 0    50   ~ 0
5V
Wire Wire Line
	7500 5500 7950 5500
Connection ~ 7950 5500
Connection ~ 8800 5900
Wire Wire Line
	7950 5800 7950 5900
Wire Wire Line
	7950 5900 8800 5900
Wire Wire Line
	7950 5500 7950 5600
Wire Wire Line
	8100 5500 7950 5500
$Comp
L Device:C_Small C18
U 1 1 627CC2CC
P 7950 5700
F 0 "C18" H 7858 5654 50  0000 R CNN
F 1 "1n" H 7858 5745 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 7950 5700 50  0001 C CNN
F 3 "~" H 7950 5700 50  0001 C CNN
	1    7950 5700
	-1   0    0    1   
$EndComp
Wire Wire Line
	8800 5000 8900 5000
Wire Wire Line
	9200 5000 9300 5000
Wire Wire Line
	8800 5000 8800 5250
Wire Wire Line
	8400 5500 8500 5500
Wire Wire Line
	8800 5700 8800 5900
$Comp
L Device:Q_NMOS_GDS Q8
U 1 1 627CC293
P 8700 5500
F 0 "Q8" H 8904 5546 50  0000 L CNN
F 1 "85N3LHS" H 8904 5455 50  0000 L CNN
F 2 "Package_TO_SOT_THT:SIPAK_Vertical" H 8900 5600 50  0001 C CNN
F 3 "~" H 8700 5500 50  0001 C CNN
	1    8700 5500
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D13
U 1 1 627CC28D
P 9050 5000
F 0 "D13" H 9043 5217 50  0000 C CNN
F 1 "LED" H 9043 5126 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9050 5000 50  0001 C CNN
F 3 "~" H 9050 5000 50  0001 C CNN
	1    9050 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R17
U 1 1 627CC287
P 9450 5000
F 0 "R17" V 9243 5000 50  0000 C CNN
F 1 "150" V 9334 5000 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 9380 5000 50  0001 C CNN
F 3 "~" H 9450 5000 50  0001 C CNN
	1    9450 5000
	0    1    1    0   
$EndComp
$Comp
L Device:R R13
U 1 1 627CC281
P 8250 5500
F 0 "R13" V 8050 5500 50  0000 C CNN
F 1 "1k" V 8150 5500 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 8180 5500 50  0001 C CNN
F 3 "~" H 8250 5500 50  0001 C CNN
	1    8250 5500
	0    1    -1   0   
$EndComp
Text Label 10850 4550 0    50   ~ 0
GND
Text Label 10850 3650 0    50   ~ 0
5V
Wire Wire Line
	7500 4150 7950 4150
Connection ~ 7950 4150
Connection ~ 8800 4550
Wire Wire Line
	7950 4450 7950 4550
Wire Wire Line
	7950 4550 8800 4550
Wire Wire Line
	7950 4150 7950 4250
Wire Wire Line
	8100 4150 7950 4150
$Comp
L Device:C_Small C17
U 1 1 627C43CF
P 7950 4350
F 0 "C17" H 7858 4304 50  0000 R CNN
F 1 "1n" H 7858 4395 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 7950 4350 50  0001 C CNN
F 3 "~" H 7950 4350 50  0001 C CNN
	1    7950 4350
	-1   0    0    1   
$EndComp
Wire Wire Line
	8800 3650 8900 3650
Wire Wire Line
	9200 3650 9300 3650
Wire Wire Line
	8800 3650 8800 3900
Wire Wire Line
	8400 4150 8500 4150
Wire Wire Line
	8800 4350 8800 4550
$Comp
L Device:LED D12
U 1 1 627C4390
P 9050 3650
F 0 "D12" H 9043 3867 50  0000 C CNN
F 1 "LED" H 9043 3776 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9050 3650 50  0001 C CNN
F 3 "~" H 9050 3650 50  0001 C CNN
	1    9050 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R16
U 1 1 627C438A
P 9450 3650
F 0 "R16" V 9243 3650 50  0000 C CNN
F 1 "150" V 9334 3650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 9380 3650 50  0001 C CNN
F 3 "~" H 9450 3650 50  0001 C CNN
	1    9450 3650
	0    1    1    0   
$EndComp
$Comp
L Device:R R12
U 1 1 627C4384
P 8250 4150
F 0 "R12" V 8050 4150 50  0000 C CNN
F 1 "1k" V 8150 4150 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 8180 4150 50  0001 C CNN
F 3 "~" H 8250 4150 50  0001 C CNN
	1    8250 4150
	0    1    -1   0   
$EndComp
$Comp
L Device:R R2
U 1 1 6280D9DD
P 4400 1450
F 0 "R2" V 4200 1450 50  0000 C CNN
F 1 "1k" V 4300 1450 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4330 1450 50  0001 C CNN
F 3 "~" H 4400 1450 50  0001 C CNN
	1    4400 1450
	0    1    -1   0   
$EndComp
$Comp
L Device:R R6
U 1 1 6280D9E3
P 5600 950
F 0 "R6" V 5393 950 50  0000 C CNN
F 1 "150" V 5484 950 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 5530 950 50  0001 C CNN
F 3 "~" H 5600 950 50  0001 C CNN
	1    5600 950 
	0    1    1    0   
$EndComp
$Comp
L Device:LED D3
U 1 1 6280D9E9
P 5200 950
F 0 "D3" H 5193 1167 50  0000 C CNN
F 1 "LED" H 5193 1076 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5200 950 50  0001 C CNN
F 3 "~" H 5200 950 50  0001 C CNN
	1    5200 950 
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NMOS_GDS Q1
U 1 1 6280D9EF
P 4850 1450
F 0 "Q1" H 5054 1496 50  0000 L CNN
F 1 "85N3LHS" H 5054 1405 50  0000 L CNN
F 2 "Package_TO_SOT_THT:SIPAK_Vertical" H 5050 1550 50  0001 C CNN
F 3 "~" H 4850 1450 50  0001 C CNN
	1    4850 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 1650 4950 1850
Wire Wire Line
	4550 1450 4650 1450
Wire Wire Line
	4950 950  4950 1200
Wire Wire Line
	5350 950  5450 950 
Wire Wire Line
	4950 950  5050 950 
$Comp
L Device:C_Small C3
U 1 1 6280DA28
P 4100 1650
F 0 "C3" H 4008 1604 50  0000 R CNN
F 1 "1n" H 4008 1695 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 4100 1650 50  0001 C CNN
F 3 "~" H 4100 1650 50  0001 C CNN
	1    4100 1650
	-1   0    0    1   
$EndComp
Wire Wire Line
	4250 1450 4100 1450
Wire Wire Line
	4100 1450 4100 1550
Wire Wire Line
	4100 1850 4950 1850
Wire Wire Line
	4100 1750 4100 1850
Connection ~ 4950 1850
Connection ~ 4100 1450
Wire Wire Line
	3650 1450 4100 1450
Text Label 7000 950  0    50   ~ 0
5V
Text Label 7000 1850 0    50   ~ 0
GND
$Comp
L Device:R R3
U 1 1 6280DA4A
P 4450 2800
F 0 "R3" V 4250 2800 50  0000 C CNN
F 1 "1k" V 4350 2800 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4380 2800 50  0001 C CNN
F 3 "~" H 4450 2800 50  0001 C CNN
	1    4450 2800
	0    1    -1   0   
$EndComp
$Comp
L Device:R R7
U 1 1 6280DA50
P 5650 2300
F 0 "R7" V 5443 2300 50  0000 C CNN
F 1 "150" V 5534 2300 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 5580 2300 50  0001 C CNN
F 3 "~" H 5650 2300 50  0001 C CNN
	1    5650 2300
	0    1    1    0   
$EndComp
$Comp
L Device:LED D4
U 1 1 6280DA56
P 5250 2300
F 0 "D4" H 5243 2517 50  0000 C CNN
F 1 "LED" H 5243 2426 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5250 2300 50  0001 C CNN
F 3 "~" H 5250 2300 50  0001 C CNN
	1    5250 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NMOS_GDS Q2
U 1 1 6280DA5C
P 4900 2800
F 0 "Q2" H 5104 2846 50  0000 L CNN
F 1 "85N3LHS" H 5104 2755 50  0000 L CNN
F 2 "Package_TO_SOT_THT:SIPAK_Vertical" H 5100 2900 50  0001 C CNN
F 3 "~" H 4900 2800 50  0001 C CNN
	1    4900 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 3000 5000 3200
Wire Wire Line
	4600 2800 4700 2800
Wire Wire Line
	5000 2300 5000 2550
Wire Wire Line
	5400 2300 5500 2300
Wire Wire Line
	5000 2300 5100 2300
$Comp
L Device:C_Small C4
U 1 1 6280DA94
P 4150 3000
F 0 "C4" H 4058 2954 50  0000 R CNN
F 1 "1n" H 4058 3045 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 4150 3000 50  0001 C CNN
F 3 "~" H 4150 3000 50  0001 C CNN
	1    4150 3000
	-1   0    0    1   
$EndComp
Wire Wire Line
	4300 2800 4150 2800
Wire Wire Line
	4150 2800 4150 2900
Wire Wire Line
	4150 3200 5000 3200
Wire Wire Line
	4150 3100 4150 3200
Connection ~ 5000 3200
Connection ~ 4150 2800
Wire Wire Line
	3700 2800 4150 2800
Text Label 7050 2300 0    50   ~ 0
5V
Text Label 7050 3200 0    50   ~ 0
GND
Text Label 7050 5900 0    50   ~ 0
GND
Text Label 7050 5000 0    50   ~ 0
5V
Wire Wire Line
	3700 5500 4150 5500
Connection ~ 4150 5500
Connection ~ 5000 5900
Wire Wire Line
	4150 5800 4150 5900
Wire Wire Line
	4150 5900 5000 5900
Wire Wire Line
	4150 5500 4150 5600
Wire Wire Line
	4300 5500 4150 5500
$Comp
L Device:C_Small C6
U 1 1 6280DAD3
P 4150 5700
F 0 "C6" H 4058 5654 50  0000 R CNN
F 1 "1n" H 4058 5745 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 4150 5700 50  0001 C CNN
F 3 "~" H 4150 5700 50  0001 C CNN
	1    4150 5700
	-1   0    0    1   
$EndComp
Wire Wire Line
	5000 5000 5100 5000
Wire Wire Line
	5400 5000 5500 5000
Wire Wire Line
	5000 5000 5000 5250
Wire Wire Line
	4600 5500 4700 5500
Wire Wire Line
	5000 5700 5000 5900
$Comp
L Device:Q_NMOS_GDS Q4
U 1 1 6280DB0C
P 4900 5500
F 0 "Q4" H 5104 5546 50  0000 L CNN
F 1 "85N3LHS" H 5104 5455 50  0000 L CNN
F 2 "Package_TO_SOT_THT:SIPAK_Vertical" H 5100 5600 50  0001 C CNN
F 3 "~" H 4900 5500 50  0001 C CNN
	1    4900 5500
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D6
U 1 1 6280DB12
P 5250 5000
F 0 "D6" H 5243 5217 50  0000 C CNN
F 1 "LED" H 5243 5126 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5250 5000 50  0001 C CNN
F 3 "~" H 5250 5000 50  0001 C CNN
	1    5250 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R9
U 1 1 6280DB18
P 5650 5000
F 0 "R9" V 5443 5000 50  0000 C CNN
F 1 "150" V 5534 5000 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 5580 5000 50  0001 C CNN
F 3 "~" H 5650 5000 50  0001 C CNN
	1    5650 5000
	0    1    1    0   
$EndComp
$Comp
L Device:R R5
U 1 1 6280DB1E
P 4450 5500
F 0 "R5" V 4250 5500 50  0000 C CNN
F 1 "1k" V 4350 5500 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4380 5500 50  0001 C CNN
F 3 "~" H 4450 5500 50  0001 C CNN
	1    4450 5500
	0    1    -1   0   
$EndComp
Text Label 7050 4550 0    50   ~ 0
GND
Text Label 7050 3650 0    50   ~ 0
5V
Wire Wire Line
	3700 4150 4150 4150
Connection ~ 4150 4150
Connection ~ 5000 4550
Wire Wire Line
	4150 4450 4150 4550
Wire Wire Line
	4150 4550 5000 4550
Wire Wire Line
	4150 4150 4150 4250
Wire Wire Line
	4300 4150 4150 4150
$Comp
L Device:C_Small C5
U 1 1 6280DB40
P 4150 4350
F 0 "C5" H 4058 4304 50  0000 R CNN
F 1 "1n" H 4058 4395 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 4150 4350 50  0001 C CNN
F 3 "~" H 4150 4350 50  0001 C CNN
	1    4150 4350
	-1   0    0    1   
$EndComp
Wire Wire Line
	5000 3650 5100 3650
Wire Wire Line
	5400 3650 5500 3650
Wire Wire Line
	5000 3650 5000 3900
Wire Wire Line
	4600 4150 4700 4150
Wire Wire Line
	5000 4350 5000 4550
$Comp
L Connector:Screw_Terminal_01x03 J4
U 1 1 6280DB6D
P 7100 4150
F 0 "J4" H 7180 4192 50  0000 L CNN
F 1 "6" H 7180 4101 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_Altech_AK300-3_P5.00mm" H 7100 4150 50  0001 C CNN
F 3 "~" H 7100 4150 50  0001 C CNN
	1    7100 4150
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NMOS_GDS Q3
U 1 1 6280DB79
P 4900 4150
F 0 "Q3" H 5104 4196 50  0000 L CNN
F 1 "85N3LHS" H 5104 4105 50  0000 L CNN
F 2 "Package_TO_SOT_THT:SIPAK_Vertical" H 5100 4250 50  0001 C CNN
F 3 "~" H 4900 4150 50  0001 C CNN
	1    4900 4150
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D5
U 1 1 6280DB7F
P 5250 3650
F 0 "D5" H 5243 3867 50  0000 C CNN
F 1 "LED" H 5243 3776 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5250 3650 50  0001 C CNN
F 3 "~" H 5250 3650 50  0001 C CNN
	1    5250 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R8
U 1 1 6280DB85
P 5650 3650
F 0 "R8" V 5443 3650 50  0000 C CNN
F 1 "150" V 5534 3650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 5580 3650 50  0001 C CNN
F 3 "~" H 5650 3650 50  0001 C CNN
	1    5650 3650
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 6280DB8B
P 4450 4150
F 0 "R4" V 4250 4150 50  0000 C CNN
F 1 "1k" V 4350 4150 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4380 4150 50  0001 C CNN
F 3 "~" H 4450 4150 50  0001 C CNN
	1    4450 4150
	0    1    -1   0   
$EndComp
Text Label 7500 1450 0    50   ~ 0
PORT0
Text Label 7550 2800 0    50   ~ 0
PORT1
Text Label 7550 4150 0    50   ~ 0
PORT2
Text Label 7550 5500 0    50   ~ 0
PORT3
Text Label 3700 1450 0    50   ~ 0
PORT4
Text Label 3750 2800 0    50   ~ 0
PORT5
Text Label 3750 4150 0    50   ~ 0
PORT6
Text Label 3750 5500 0    50   ~ 0
PORT7
Wire Wire Line
	2350 2150 3200 2150
Wire Wire Line
	2350 2250 3200 2250
Wire Wire Line
	2350 2350 3200 2350
Wire Wire Line
	2350 2450 3200 2450
Text Label 3100 2150 2    50   ~ 0
PORT4
Text Label 3100 2250 2    50   ~ 0
PORT5
Text Label 3100 2350 2    50   ~ 0
PORT6
Text Label 3100 2450 2    50   ~ 0
PORT7
Wire Wire Line
	2350 2050 3200 2050
Wire Wire Line
	2350 1950 3200 1950
Wire Wire Line
	2350 1850 3200 1850
Wire Wire Line
	2350 1750 3200 1750
Text Label 3100 2050 2    50   ~ 0
PORT0
Text Label 3100 1950 2    50   ~ 0
PORT1
Text Label 3100 1850 2    50   ~ 0
PORT2
Text Label 3100 1750 2    50   ~ 0
PORT3
$Comp
L Device:Q_NMOS_GDS Q5
U 1 1 6277F3B2
P 8650 1450
F 0 "Q5" H 8854 1496 50  0000 L CNN
F 1 "85N3LHS" H 8854 1405 50  0000 L CNN
F 2 "Package_TO_SOT_THT:SIPAK_Vertical" H 8850 1550 50  0001 C CNN
F 3 "~" H 8650 1450 50  0001 C CNN
	1    8650 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NMOS_GDS Q7
U 1 1 627C4396
P 8700 4150
F 0 "Q7" H 8904 4196 50  0000 L CNN
F 1 "85N3LHS" H 8904 4105 50  0000 L CNN
F 2 "Package_TO_SOT_THT:SIPAK_Vertical" H 8900 4250 50  0001 C CNN
F 3 "~" H 8700 4150 50  0001 C CNN
	1    8700 4150
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:L7805 U2
U 1 1 62D47309
P 3100 6650
F 0 "U2" H 3100 6892 50  0000 C CNN
F 1 "L7805" H 3100 6801 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Horizontal_TabDown" H 3125 6500 50  0001 L CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 3100 6600 50  0001 C CNN
	1    3100 6650
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C1
U 1 1 62D4A39D
P 2550 6850
F 0 "C1" H 2638 6896 50  0000 L CNN
F 1 "0,22uF" H 2638 6805 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 2550 6850 50  0001 C CNN
F 3 "~" H 2550 6850 50  0001 C CNN
	1    2550 6850
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C2
U 1 1 62D4B0FF
P 3600 6850
F 0 "C2" H 3688 6896 50  0000 L CNN
F 1 "0,1uF" H 3688 6805 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 3600 6850 50  0001 C CNN
F 3 "~" H 3600 6850 50  0001 C CNN
	1    3600 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 6950 2550 7100
Wire Wire Line
	2550 7100 3100 7100
Wire Wire Line
	3600 7100 3600 6950
Wire Wire Line
	3100 6950 3100 7100
Connection ~ 3100 7100
Wire Wire Line
	3100 7100 3600 7100
Wire Wire Line
	2800 6650 2550 6650
Wire Wire Line
	2550 6650 2550 6750
Wire Wire Line
	3400 6650 3600 6650
Wire Wire Line
	3600 6650 3600 6750
Wire Wire Line
	3600 6650 4000 6650
Connection ~ 3600 6650
Wire Wire Line
	3600 7100 4750 7100
Connection ~ 3600 7100
Text Label 4950 6650 2    50   ~ 0
5V
Text Label 4950 7100 2    50   ~ 0
GND
$Comp
L Diode:1N4007 D1
U 1 1 62E0FE1D
P 2250 6650
F 0 "D1" H 2250 6433 50  0000 C CNN
F 1 "1N4007" H 2250 6524 50  0000 C CNN
F 2 "Diode_THT:D_DO-41_SOD81_P12.70mm_Horizontal" H 2250 6475 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 2250 6650 50  0001 C CNN
	1    2250 6650
	-1   0    0    1   
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J1
U 1 1 62E12A6C
P 1650 6750
F 0 "J1" H 1568 6425 50  0000 C CNN
F 1 "V-IN" H 1568 6516 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_Altech_AK300-2_P5.00mm" H 1650 6750 50  0001 C CNN
F 3 "~" H 1650 6750 50  0001 C CNN
	1    1650 6750
	-1   0    0    1   
$EndComp
Wire Wire Line
	1850 6650 2100 6650
Wire Wire Line
	2400 6650 2550 6650
Connection ~ 2550 6650
Wire Wire Line
	1850 6750 2000 6750
Wire Wire Line
	2000 6750 2000 7100
Wire Wire Line
	2000 7100 2550 7100
Connection ~ 2550 7100
$Comp
L Device:LED D2
U 1 1 62EA5283
P 4550 6900
F 0 "D2" H 4543 6645 50  0000 C CNN
F 1 "GREEN" H 4543 6736 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4550 6900 50  0001 C CNN
F 3 "~" H 4550 6900 50  0001 C CNN
	1    4550 6900
	-1   0    0    1   
$EndComp
$Comp
L Device:R R1
U 1 1 62EA6063
P 4150 6900
F 0 "R1" V 3950 6900 50  0000 C CNN
F 1 "150" V 4050 6900 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4080 6900 50  0001 C CNN
F 3 "~" H 4150 6900 50  0001 C CNN
	1    4150 6900
	0    1    -1   0   
$EndComp
Wire Wire Line
	4000 6900 4000 6650
Connection ~ 4000 6650
Wire Wire Line
	4000 6650 5100 6650
Wire Wire Line
	4300 6900 4400 6900
Wire Wire Line
	4700 6900 4750 6900
Wire Wire Line
	4750 6900 4750 7100
Connection ~ 4750 7100
Wire Wire Line
	4750 7100 5100 7100
$Comp
L Mechanical:MountingHole H1
U 1 1 627B6DCB
P 1600 4500
F 0 "H1" H 1700 4546 50  0000 L CNN
F 1 "MountingHole" H 1700 4455 50  0000 L CNN
F 2 "MountingHole:MountingHole_6mm" H 1600 4500 50  0001 C CNN
F 3 "~" H 1600 4500 50  0001 C CNN
	1    1600 4500
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 627B7188
P 1600 4800
F 0 "H2" H 1700 4846 50  0000 L CNN
F 1 "MountingHole" H 1700 4755 50  0000 L CNN
F 2 "MountingHole:MountingHole_6mm" H 1600 4800 50  0001 C CNN
F 3 "~" H 1600 4800 50  0001 C CNN
	1    1600 4800
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 627B7E11
P 1600 5100
F 0 "H3" H 1700 5146 50  0000 L CNN
F 1 "MountingHole" H 1700 5055 50  0000 L CNN
F 2 "MountingHole:MountingHole_6mm" H 1600 5100 50  0001 C CNN
F 3 "~" H 1600 5100 50  0001 C CNN
	1    1600 5100
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x03 J5
U 1 1 6280DB00
P 7100 5500
F 0 "J5" H 7180 5542 50  0000 L CNN
F 1 "7" H 7180 5451 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_Altech_AK300-3_P5.00mm" H 7100 5500 50  0001 C CNN
F 3 "~" H 7100 5500 50  0001 C CNN
	1    7100 5500
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x03 J9
U 1 1 627CC29F
P 10900 5500
F 0 "J9" H 10980 5542 50  0000 L CNN
F 1 "3" H 10980 5451 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_Altech_AK300-3_P5.00mm" H 10900 5500 50  0001 C CNN
F 3 "~" H 10900 5500 50  0001 C CNN
	1    10900 5500
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x03 J8
U 1 1 627C43A2
P 10900 4150
F 0 "J8" H 10980 4192 50  0000 L CNN
F 1 "2" H 10980 4101 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_Altech_AK300-3_P5.00mm" H 10900 4150 50  0001 C CNN
F 3 "~" H 10900 4150 50  0001 C CNN
	1    10900 4150
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x03 J7
U 1 1 627B9F36
P 10900 2800
F 0 "J7" H 10980 2842 50  0000 L CNN
F 1 "1" H 10980 2751 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_Altech_AK300-3_P5.00mm" H 10900 2800 50  0001 C CNN
F 3 "~" H 10900 2800 50  0001 C CNN
	1    10900 2800
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x03 J6
U 1 1 62782057
P 10850 1450
F 0 "J6" H 10930 1492 50  0000 L CNN
F 1 "0" H 10930 1401 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_Altech_AK300-3_P5.00mm" H 10850 1450 50  0001 C CNN
F 3 "~" H 10850 1450 50  0001 C CNN
	1    10850 1450
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x03 J3
U 1 1 6280DA68
P 7100 2800
F 0 "J3" H 7180 2842 50  0000 L CNN
F 1 "5" H 7180 2751 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_Altech_AK300-3_P5.00mm" H 7100 2800 50  0001 C CNN
F 3 "~" H 7100 2800 50  0001 C CNN
	1    7100 2800
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x03 J2
U 1 1 6280D9FB
P 7050 1450
F 0 "J2" H 7130 1492 50  0000 L CNN
F 1 "4" H 7130 1401 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_Altech_AK300-3_P5.00mm" H 7050 1450 50  0001 C CNN
F 3 "~" H 7050 1450 50  0001 C CNN
	1    7050 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 950  5850 950 
Wire Wire Line
	4950 1850 7100 1850
Wire Wire Line
	8800 3200 10950 3200
Wire Wire Line
	8750 1850 10900 1850
Wire Wire Line
	8800 4550 10950 4550
Wire Wire Line
	9550 950  9700 950 
Wire Wire Line
	9600 2300 9700 2300
Wire Wire Line
	9600 3650 9700 3650
Wire Wire Line
	8800 5900 10950 5900
Wire Wire Line
	9600 5000 9700 5000
Wire Wire Line
	5800 5000 5850 5000
Wire Wire Line
	5000 5900 7150 5900
Wire Wire Line
	5000 4550 7150 4550
Wire Wire Line
	5800 3650 5900 3650
Wire Wire Line
	5800 2300 5900 2300
Wire Wire Line
	5000 3200 7150 3200
$Comp
L components:SRD-05VDC-SL-C R25
U 1 1 62A93918
P 10050 5500
F 0 "R25" H 10050 5915 50  0000 C CNN
F 1 "SRD-05VDC-SL-C" H 10050 5824 50  0000 C CNN
F 2 "components:SRD-05VDC-SL-C" H 10050 5500 50  0001 C CNN
F 3 "" H 10050 5500 50  0001 C CNN
	1    10050 5500
	1    0    0    -1  
$EndComp
$Comp
L components:SRD-05VDC-SL-C R24
U 1 1 62A94FEC
P 10050 4150
F 0 "R24" H 10050 4565 50  0000 C CNN
F 1 "SRD-05VDC-SL-C" H 10050 4474 50  0000 C CNN
F 2 "components:SRD-05VDC-SL-C" H 10050 4150 50  0001 C CNN
F 3 "" H 10050 4150 50  0001 C CNN
	1    10050 4150
	1    0    0    -1  
$EndComp
$Comp
L components:SRD-05VDC-SL-C R23
U 1 1 62A96113
P 10050 2800
F 0 "R23" H 10050 3215 50  0000 C CNN
F 1 "SRD-05VDC-SL-C" H 10050 3124 50  0000 C CNN
F 2 "components:SRD-05VDC-SL-C" H 10050 2800 50  0001 C CNN
F 3 "" H 10050 2800 50  0001 C CNN
	1    10050 2800
	1    0    0    -1  
$EndComp
$Comp
L components:SRD-05VDC-SL-C R22
U 1 1 62A972D3
P 10050 1450
F 0 "R22" H 10050 1865 50  0000 C CNN
F 1 "SRD-05VDC-SL-C" H 10050 1774 50  0000 C CNN
F 2 "components:SRD-05VDC-SL-C" H 10050 1450 50  0001 C CNN
F 3 "" H 10050 1450 50  0001 C CNN
	1    10050 1450
	1    0    0    -1  
$EndComp
$Comp
L components:SRD-05VDC-SL-C R18
U 1 1 62A98AA0
P 6200 1450
F 0 "R18" H 6200 1865 50  0000 C CNN
F 1 "SRD-05VDC-SL-C" H 6200 1774 50  0000 C CNN
F 2 "components:SRD-05VDC-SL-C" H 6200 1450 50  0001 C CNN
F 3 "" H 6200 1450 50  0001 C CNN
	1    6200 1450
	1    0    0    -1  
$EndComp
$Comp
L components:SRD-05VDC-SL-C R19
U 1 1 62A99EE5
P 6200 2800
F 0 "R19" H 6200 3215 50  0000 C CNN
F 1 "SRD-05VDC-SL-C" H 6200 3124 50  0000 C CNN
F 2 "components:SRD-05VDC-SL-C" H 6200 2800 50  0001 C CNN
F 3 "" H 6200 2800 50  0001 C CNN
	1    6200 2800
	1    0    0    -1  
$EndComp
$Comp
L components:SRD-05VDC-SL-C R20
U 1 1 62A9A57A
P 6200 4150
F 0 "R20" H 6200 4565 50  0000 C CNN
F 1 "SRD-05VDC-SL-C" H 6200 4474 50  0000 C CNN
F 2 "components:SRD-05VDC-SL-C" H 6200 4150 50  0001 C CNN
F 3 "" H 6200 4150 50  0001 C CNN
	1    6200 4150
	1    0    0    -1  
$EndComp
$Comp
L components:SRD-05VDC-SL-C R21
U 1 1 62A9AA9D
P 6200 5500
F 0 "R21" H 6200 5915 50  0000 C CNN
F 1 "SRD-05VDC-SL-C" H 6200 5824 50  0000 C CNN
F 2 "components:SRD-05VDC-SL-C" H 6200 5500 50  0001 C CNN
F 3 "" H 6200 5500 50  0001 C CNN
	1    6200 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 950  9700 1050
Wire Wire Line
	9700 1050 9500 1050
Wire Wire Line
	9500 1050 9500 1200
Wire Wire Line
	9500 1350 9550 1350
Connection ~ 9700 950 
Wire Wire Line
	9700 950  10900 950 
Wire Wire Line
	8750 950  8750 1200
$Comp
L Diode:1N4148 D15
U 1 1 62AB124F
P 9250 1200
F 0 "D15" H 9250 983 50  0000 C CNN
F 1 "1N4148" H 9250 1074 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 9250 1025 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 9250 1200 50  0001 C CNN
	1    9250 1200
	-1   0    0    1   
$EndComp
$Comp
L Diode:1N4148 D16
U 1 1 62AB26B0
P 9250 2550
F 0 "D16" H 9250 2333 50  0000 C CNN
F 1 "1N4148" H 9250 2424 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 9250 2375 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 9250 2550 50  0001 C CNN
	1    9250 2550
	-1   0    0    1   
$EndComp
Wire Wire Line
	9400 1200 9500 1200
Connection ~ 9500 1200
Wire Wire Line
	9500 1200 9500 1350
Wire Wire Line
	9550 1550 9100 1550
Wire Wire Line
	9100 1550 9100 1200
Wire Wire Line
	9100 1200 8750 1200
Connection ~ 9100 1200
Connection ~ 8750 1200
Wire Wire Line
	8750 1200 8750 1250
Wire Wire Line
	9550 2700 9500 2700
Wire Wire Line
	9500 2700 9500 2550
Wire Wire Line
	9500 2400 9700 2400
Wire Wire Line
	9700 2400 9700 2300
Connection ~ 9700 2300
Wire Wire Line
	9700 2300 10950 2300
Wire Wire Line
	9400 2550 9500 2550
Connection ~ 9500 2550
Wire Wire Line
	9500 2550 9500 2400
Wire Wire Line
	9100 2900 9100 2550
Wire Wire Line
	9100 2900 9550 2900
Wire Wire Line
	9100 2550 8800 2550
Connection ~ 9100 2550
Connection ~ 8800 2550
Wire Wire Line
	8800 2550 8800 2600
Wire Wire Line
	10550 1300 10650 1300
Wire Wire Line
	10650 1300 10650 1350
Wire Wire Line
	10550 1450 10650 1450
Wire Wire Line
	10550 1600 10650 1600
Wire Wire Line
	10650 1600 10650 1550
Wire Wire Line
	10550 2650 10700 2650
Wire Wire Line
	10700 2650 10700 2700
Wire Wire Line
	10550 2800 10700 2800
Wire Wire Line
	10550 2950 10700 2950
Wire Wire Line
	10700 2950 10700 2900
Wire Wire Line
	10550 4000 10700 4000
Wire Wire Line
	10700 4000 10700 4050
Wire Wire Line
	10550 4300 10700 4300
Wire Wire Line
	10700 4300 10700 4250
Wire Wire Line
	10550 4150 10700 4150
Wire Wire Line
	10550 5350 10700 5350
Wire Wire Line
	10700 5350 10700 5400
Wire Wire Line
	10550 5650 10700 5650
Wire Wire Line
	10700 5650 10700 5600
Wire Wire Line
	10550 5500 10700 5500
Wire Wire Line
	9700 3650 9700 3750
Wire Wire Line
	9700 3750 9500 3750
Wire Wire Line
	9500 3750 9500 3900
Wire Wire Line
	9500 4050 9550 4050
Connection ~ 9700 3650
Wire Wire Line
	9700 3650 10950 3650
Wire Wire Line
	9700 5000 9700 5100
Wire Wire Line
	9700 5100 9500 5100
Wire Wire Line
	9500 5100 9500 5250
Wire Wire Line
	9500 5400 9550 5400
Connection ~ 9700 5000
Wire Wire Line
	9700 5000 10950 5000
$Comp
L Diode:1N4148 D17
U 1 1 62B6042F
P 9300 3900
F 0 "D17" H 9300 3683 50  0000 C CNN
F 1 "1N4148" H 9300 3774 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 9300 3725 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 9300 3900 50  0001 C CNN
	1    9300 3900
	-1   0    0    1   
$EndComp
$Comp
L Diode:1N4148 D18
U 1 1 62B612E4
P 9300 5250
F 0 "D18" H 9300 5033 50  0000 C CNN
F 1 "1N4148" H 9300 5124 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 9300 5075 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 9300 5250 50  0001 C CNN
	1    9300 5250
	-1   0    0    1   
$EndComp
Wire Wire Line
	9450 3900 9500 3900
Connection ~ 9500 3900
Wire Wire Line
	9500 3900 9500 4050
Wire Wire Line
	9450 5250 9500 5250
Connection ~ 9500 5250
Wire Wire Line
	9500 5250 9500 5400
Wire Wire Line
	9550 5600 9150 5600
Wire Wire Line
	9150 5600 9150 5250
Wire Wire Line
	8800 5250 9150 5250
Connection ~ 8800 5250
Wire Wire Line
	8800 5250 8800 5300
Connection ~ 9150 5250
Wire Wire Line
	9150 4250 9150 3900
Wire Wire Line
	9150 4250 9550 4250
Wire Wire Line
	9150 3900 8800 3900
Connection ~ 9150 3900
Connection ~ 8800 3900
Wire Wire Line
	8800 3900 8800 3950
Wire Wire Line
	6700 5350 6900 5350
Wire Wire Line
	6900 5350 6900 5400
Wire Wire Line
	6700 5500 6900 5500
Wire Wire Line
	6700 5650 6900 5650
Wire Wire Line
	6900 5650 6900 5600
Wire Wire Line
	6700 4000 6900 4000
Wire Wire Line
	6900 4000 6900 4050
Wire Wire Line
	6700 4150 6900 4150
Wire Wire Line
	6700 4300 6900 4300
Wire Wire Line
	6900 4300 6900 4250
Wire Wire Line
	6700 2650 6900 2650
Wire Wire Line
	6900 2650 6900 2700
Wire Wire Line
	6700 2950 6900 2950
Wire Wire Line
	6900 2950 6900 2900
Wire Wire Line
	6700 2800 6900 2800
Wire Wire Line
	6700 1300 6850 1300
Wire Wire Line
	6850 1300 6850 1350
Wire Wire Line
	6700 1450 6850 1450
Wire Wire Line
	6700 1600 6850 1600
Wire Wire Line
	6850 1600 6850 1550
$Comp
L Diode:1N4148 D7
U 1 1 62C2F971
P 5450 1200
F 0 "D7" H 5450 983 50  0000 C CNN
F 1 "1N4148" H 5450 1074 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 5450 1025 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 5450 1200 50  0001 C CNN
	1    5450 1200
	-1   0    0    1   
$EndComp
$Comp
L Diode:1N4148 D8
U 1 1 62C30CBC
P 5450 2550
F 0 "D8" H 5450 2333 50  0000 C CNN
F 1 "1N4148" H 5450 2424 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 5450 2375 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 5450 2550 50  0001 C CNN
	1    5450 2550
	-1   0    0    1   
$EndComp
$Comp
L Diode:1N4148 D9
U 1 1 62C318D1
P 5450 3900
F 0 "D9" H 5450 3683 50  0000 C CNN
F 1 "1N4148" H 5450 3774 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 5450 3725 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 5450 3900 50  0001 C CNN
	1    5450 3900
	-1   0    0    1   
$EndComp
$Comp
L Diode:1N4148 D14
U 1 1 62C35447
P 5450 5250
F 0 "D14" H 5450 5033 50  0000 C CNN
F 1 "1N4148" H 5450 5124 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 5450 5075 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 5450 5250 50  0001 C CNN
	1    5450 5250
	-1   0    0    1   
$EndComp
Wire Wire Line
	5700 2700 5600 2700
Wire Wire Line
	5600 2700 5600 2550
Wire Wire Line
	5600 2400 5900 2400
Wire Wire Line
	5900 2400 5900 2300
Connection ~ 5900 2300
Wire Wire Line
	5900 2300 7150 2300
Wire Wire Line
	5600 2400 5600 2550
Connection ~ 5600 2550
Wire Wire Line
	5300 2550 5000 2550
Connection ~ 5000 2550
Wire Wire Line
	5000 2550 5000 2600
Wire Wire Line
	5300 2550 5300 2900
Wire Wire Line
	5300 2900 5700 2900
Connection ~ 5300 2550
Wire Wire Line
	5000 3900 5300 3900
Connection ~ 5000 3900
Wire Wire Line
	5000 3900 5000 3950
Wire Wire Line
	5700 4050 5600 4050
Wire Wire Line
	5600 4050 5600 3900
Wire Wire Line
	5600 3750 5900 3750
Wire Wire Line
	5900 3750 5900 3650
Connection ~ 5900 3650
Wire Wire Line
	5900 3650 7150 3650
Wire Wire Line
	5600 3750 5600 3900
Connection ~ 5600 3900
Wire Wire Line
	5000 5250 5300 5250
Connection ~ 5000 5250
Wire Wire Line
	5000 5250 5000 5300
Wire Wire Line
	5300 5250 5300 5600
Wire Wire Line
	5300 5600 5700 5600
Connection ~ 5300 5250
Wire Wire Line
	5700 5400 5600 5400
Wire Wire Line
	5600 5400 5600 5250
Wire Wire Line
	5600 5250 5600 5100
Wire Wire Line
	5600 5100 5850 5100
Wire Wire Line
	5850 5100 5850 5000
Connection ~ 5600 5250
Connection ~ 5850 5000
Wire Wire Line
	5850 5000 7150 5000
Wire Wire Line
	5700 4250 5300 4250
Wire Wire Line
	5300 4250 5300 3900
Connection ~ 5300 3900
Wire Wire Line
	5850 950  5850 1050
Wire Wire Line
	5850 1050 5600 1050
Wire Wire Line
	5600 1050 5600 1200
Connection ~ 5850 950 
Wire Wire Line
	5850 950  7100 950 
Wire Wire Line
	5600 1200 5600 1350
Wire Wire Line
	5600 1350 5700 1350
Connection ~ 5600 1200
Wire Wire Line
	5700 1550 5300 1550
Wire Wire Line
	5300 1550 5300 1200
Wire Wire Line
	4950 1200 5300 1200
Connection ~ 4950 1200
Wire Wire Line
	4950 1200 4950 1250
Connection ~ 5300 1200
$EndSCHEMATC
