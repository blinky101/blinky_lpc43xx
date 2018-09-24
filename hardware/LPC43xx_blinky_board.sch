EESchema Schematic File Version 4
LIBS:LPC43xx_blinky_board-cache
EELAYER 26 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
Title "LPC4337 Blinky [CPU]"
Date "2018-09-24"
Rev "1"
Comp "Blinky 101"
Comment1 "Jitter"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector:Conn_ARM_JTAG_SWD_10 J?
U 1 1 5BAD962B
P 5950 6300
F 0 "J?" H 5510 6346 50  0000 R CNN
F 1 "Conn_ARM_JTAG_SWD_10" H 5510 6255 50  0000 R CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_2x05_P1.27mm_Vertical_SMD" H 6000 5750 50  0001 L TNN
F 3 "http://infocenter.arm.com/help/topic/com.arm.doc.faqs/attached/13634/cortex_debug_connectors.pdf" V 5600 5050 50  0001 C CNN
	1    5950 6300
	-1   0    0    -1  
$EndComp
$Comp
L JitterLib:LPC4337JBD144 U?
U 1 1 5BAEFD8F
P 2350 2900
F 0 "U?" H 1700 4150 50  0000 C CNN
F 1 "LPC4337JBD144" H 1450 4250 50  0000 C CNN
F 2 "Package_QFP:LQFP-144_20x20mm_P0.5mm" H 2750 4300 50  0001 C CNN
F 3 "https://www.nxp.com/docs/en/data-sheet/LPC435X_3X_2X_1X.pdf" H 3200 4200 50  0001 C CNN
	1    2350 2900
	1    0    0    -1  
$EndComp
$Comp
L JitterLib:LPC4337JBD144 U?
U 2 1 5BAEFDE9
P 5750 2900
F 0 "U?" H 5050 4150 50  0000 C CNN
F 1 "LPC4337JBD144" H 4800 4250 50  0000 C CNN
F 2 "Package_QFP:LQFP-144_20x20mm_P0.5mm" H 6150 4300 50  0001 C CNN
F 3 "https://www.nxp.com/docs/en/data-sheet/LPC435X_3X_2X_1X.pdf" H 6600 4200 50  0001 C CNN
	2    5750 2900
	1    0    0    -1  
$EndComp
$Comp
L JitterLib:LPC4337JBD144 U?
U 3 1 5BAEFE55
P 8850 3500
F 0 "U?" H 8200 4750 50  0000 C CNN
F 1 "LPC4337JBD144" H 7950 4850 50  0000 C CNN
F 2 "Package_QFP:LQFP-144_20x20mm_P0.5mm" H 9250 4900 50  0001 C CNN
F 3 "https://www.nxp.com/docs/en/data-sheet/LPC435X_3X_2X_1X.pdf" H 9700 4800 50  0001 C CNN
	3    8850 3500
	1    0    0    -1  
$EndComp
$Comp
L JitterLib:LPC4337JBD144 U?
U 4 1 5BAEFEB7
P 3150 6050
F 0 "U?" H 2500 6750 50  0000 C CNN
F 1 "LPC4337JBD144" H 3100 6100 50  0000 C CNN
F 2 "Package_QFP:LQFP-144_20x20mm_P0.5mm" H 3550 7450 50  0001 C CNN
F 3 "https://www.nxp.com/docs/en/data-sheet/LPC435X_3X_2X_1X.pdf" H 4000 7350 50  0001 C CNN
	4    3150 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 6200 4950 6200
Wire Wire Line
	5450 6300 4100 6300
Wire Wire Line
	4100 6400 5200 6400
Wire Wire Line
	5450 6500 4100 6500
Wire Wire Line
	4100 6000 4550 6000
Wire Wire Line
	4100 5900 4100 5700
$Comp
L power:+3V3 #PWR?
U 1 1 5BAF1FED
P 3300 5200
F 0 "#PWR?" H 3300 5050 50  0001 C CNN
F 1 "+3V3" H 3315 5373 50  0000 C CNN
F 2 "" H 3300 5200 50  0001 C CNN
F 3 "" H 3300 5200 50  0001 C CNN
	1    3300 5200
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 5BAF2027
P 3000 5200
F 0 "#PWR?" H 3000 5050 50  0001 C CNN
F 1 "+3V3" H 3015 5373 50  0000 C CNN
F 2 "" H 3000 5200 50  0001 C CNN
F 3 "" H 3000 5200 50  0001 C CNN
	1    3000 5200
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 5BAF2041
P 4400 5700
F 0 "#PWR?" H 4400 5550 50  0001 C CNN
F 1 "+3V3" H 4415 5873 50  0000 C CNN
F 2 "" H 4400 5700 50  0001 C CNN
F 3 "" H 4400 5700 50  0001 C CNN
	1    4400 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 5700 4100 5700
Connection ~ 4100 5700
$Comp
L Device:R R?
U 1 1 5BAF2343
P 5200 5400
F 0 "R?" H 5270 5446 50  0000 L CNN
F 1 "47k" H 5270 5355 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 5130 5400 50  0001 C CNN
F 3 "~" H 5200 5400 50  0001 C CNN
	1    5200 5400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5BAF26EC
P 4950 5400
F 0 "R?" H 5020 5446 50  0000 L CNN
F 1 "47k" H 5020 5355 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 4880 5400 50  0001 C CNN
F 3 "~" H 4950 5400 50  0001 C CNN
	1    4950 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 5550 4950 6200
Connection ~ 4950 6200
Wire Wire Line
	4950 6200 5450 6200
Wire Wire Line
	5200 5550 5200 6400
Connection ~ 5200 6400
Wire Wire Line
	5200 6400 5450 6400
$Comp
L Device:C C?
U 1 1 5BAF2A1A
P 4550 6850
F 0 "C?" H 4665 6896 50  0000 L CNN
F 1 "100nF" H 4665 6805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 4588 6700 50  0001 C CNN
F 3 "~" H 4550 6850 50  0001 C CNN
	1    4550 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 6700 4550 6000
Connection ~ 4550 6000
Wire Wire Line
	4550 6000 4700 6000
$Comp
L power:GND #PWR?
U 1 1 5BAF2B7A
P 4550 7000
F 0 "#PWR?" H 4550 6750 50  0001 C CNN
F 1 "GND" H 4555 6827 50  0000 C CNN
F 2 "" H 4550 7000 50  0001 C CNN
F 3 "" H 4550 7000 50  0001 C CNN
	1    4550 7000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5BAF2BD9
P 4700 5400
F 0 "R?" H 4770 5446 50  0000 L CNN
F 1 "47k" H 4770 5355 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 4630 5400 50  0001 C CNN
F 3 "~" H 4700 5400 50  0001 C CNN
	1    4700 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 5550 4700 6000
Connection ~ 4700 6000
Wire Wire Line
	4700 6000 5450 6000
Wire Wire Line
	4700 5250 4950 5250
Connection ~ 4950 5250
Wire Wire Line
	4950 5250 5200 5250
$Comp
L power:+3V3 #PWR?
U 1 1 5BAF2DCA
P 4950 5250
F 0 "#PWR?" H 4950 5100 50  0001 C CNN
F 1 "+3V3" H 4965 5423 50  0000 C CNN
F 2 "" H 4950 5250 50  0001 C CNN
F 3 "" H 4950 5250 50  0001 C CNN
	1    4950 5250
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 5BAF2DE7
P 5950 5250
F 0 "#PWR?" H 5950 5100 50  0001 C CNN
F 1 "+3V3" H 5965 5423 50  0000 C CNN
F 2 "" H 5950 5250 50  0001 C CNN
F 3 "" H 5950 5250 50  0001 C CNN
	1    5950 5250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5BAF2E04
P 6550 5450
F 0 "C?" H 6665 5496 50  0000 L CNN
F 1 "100nF" H 6665 5405 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 6588 5300 50  0001 C CNN
F 3 "~" H 6550 5450 50  0001 C CNN
	1    6550 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 5250 5950 5700
Wire Wire Line
	6550 5250 6550 5300
Connection ~ 5950 5250
$Comp
L power:GND #PWR?
U 1 1 5BAF3132
P 6550 5600
F 0 "#PWR?" H 6550 5350 50  0001 C CNN
F 1 "GND" H 6555 5427 50  0000 C CNN
F 2 "" H 6550 5600 50  0001 C CNN
F 3 "" H 6550 5600 50  0001 C CNN
	1    6550 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 6900 5950 6900
$Comp
L power:GND #PWR?
U 1 1 5BAF33F1
P 5950 6900
F 0 "#PWR?" H 5950 6650 50  0001 C CNN
F 1 "GND" H 5955 6727 50  0000 C CNN
F 2 "" H 5950 6900 50  0001 C CNN
F 3 "" H 5950 6900 50  0001 C CNN
	1    5950 6900
	1    0    0    -1  
$EndComp
Connection ~ 5950 6900
$Comp
L Device:Crystal Y?
U 1 1 5BAF36FF
P 1700 6050
F 0 "Y?" V 1746 5919 50  0000 R CNN
F 1 "Crystal" V 1655 5919 50  0000 R CNN
F 2 "" H 1700 6050 50  0001 C CNN
F 3 "~" H 1700 6050 50  0001 C CNN
	1    1700 6050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1700 5900 1700 5850
Wire Wire Line
	1700 5850 2200 5850
Wire Wire Line
	2200 6250 1850 6250
Wire Wire Line
	1700 6250 1700 6200
$Comp
L Device:C C?
U 1 1 5BAF3D15
P 1850 6400
F 0 "C?" H 1965 6446 50  0000 L CNN
F 1 "18pF" H 1965 6355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 1888 6250 50  0001 C CNN
F 3 "~" H 1850 6400 50  0001 C CNN
	1    1850 6400
	1    0    0    -1  
$EndComp
Connection ~ 1850 6250
Wire Wire Line
	1850 6250 1700 6250
$Comp
L Device:C C?
U 1 1 5BAF3D68
P 1400 6400
F 0 "C?" H 1515 6446 50  0000 L CNN
F 1 "18pF" H 1515 6355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 1438 6250 50  0001 C CNN
F 3 "~" H 1400 6400 50  0001 C CNN
	1    1400 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 6250 1400 5850
Wire Wire Line
	1400 5850 1700 5850
Connection ~ 1700 5850
Wire Wire Line
	1850 6550 1400 6550
$Comp
L power:GND #PWR?
U 1 1 5BAF456E
P 1400 6550
F 0 "#PWR?" H 1400 6300 50  0001 C CNN
F 1 "GND" H 1405 6377 50  0000 C CNN
F 2 "" H 1400 6550 50  0001 C CNN
F 3 "" H 1400 6550 50  0001 C CNN
	1    1400 6550
	1    0    0    -1  
$EndComp
Connection ~ 1400 6550
$Comp
L power:GND #PWR?
U 1 1 5BAF48CD
P 3150 6900
F 0 "#PWR?" H 3150 6650 50  0001 C CNN
F 1 "GND" H 3155 6727 50  0000 C CNN
F 2 "" H 3150 6900 50  0001 C CNN
F 3 "" H 3150 6900 50  0001 C CNN
	1    3150 6900
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_DIP_x04 SW?
U 1 1 5BAF56A0
P 13500 3050
F 0 "SW?" H 13500 3517 50  0000 C CNN
F 1 "SW_DIP_x04" H 13500 3426 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_DIP_SPSTx04_Slide_Omron_A6S-410x_W8.9mm_P2.54mm" H 13500 3050 50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/2340746.pdf" H 13500 3050 50  0001 C CNN
	1    13500 3050
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_DIP_x01 SW?
U 1 1 5BAF57AE
P 13500 2200
F 0 "SW?" H 13500 2467 50  0000 C CNN
F 1 "SW_DIP_x01" H 13500 2376 50  0000 C CNN
F 2 "" H 13500 2200 50  0001 C CNN
F 3 "" H 13500 2200 50  0001 C CNN
	1    13500 2200
	1    0    0    -1  
$EndComp
Text Label 3400 2650 0    50   ~ 0
BOOT0
Text Label 3400 2550 0    50   ~ 0
BOOT1
Text Label 1050 2250 0    50   ~ 0
BOOT2
Wire Wire Line
	1050 2250 1400 2250
Text Label 1050 2150 0    50   ~ 0
BOOT3
Wire Wire Line
	1050 2150 1400 2150
Wire Wire Line
	3300 2650 3400 2650
Wire Wire Line
	3300 2550 3400 2550
Text Label 11800 2850 0    50   ~ 0
BOOT0
Text Label 11800 2950 0    50   ~ 0
BOOT1
Text Label 11800 3050 0    50   ~ 0
BOOT2
Text Label 11800 3150 0    50   ~ 0
BOOT3
Wire Wire Line
	11800 2850 12300 2850
Wire Wire Line
	11800 2950 12400 2950
Wire Wire Line
	11800 3050 12500 3050
Wire Wire Line
	11800 3150 12600 3150
$Comp
L Device:R_Pack04 RN?
U 1 1 5BAFAAA0
P 12500 1850
F 0 "RN?" H 12050 1900 50  0000 L CNN
F 1 "100K" H 12050 1800 50  0000 L CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0402" V 12775 1850 50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/2085571.pdf" H 12500 1850 50  0001 C CNN
	1    12500 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	12600 1650 12500 1650
Connection ~ 12300 1650
Wire Wire Line
	12300 1650 12100 1650
Connection ~ 12400 1650
Wire Wire Line
	12400 1650 12300 1650
Connection ~ 12500 1650
Wire Wire Line
	12500 1650 12400 1650
$Comp
L power:+3V3 #PWR?
U 1 1 5BAFB4DC
P 12100 1650
F 0 "#PWR?" H 12100 1500 50  0001 C CNN
F 1 "+3V3" H 12115 1823 50  0000 C CNN
F 2 "" H 12100 1650 50  0001 C CNN
F 3 "" H 12100 1650 50  0001 C CNN
	1    12100 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	12600 2050 12600 3150
Connection ~ 12600 3150
Wire Wire Line
	12600 3150 13200 3150
Wire Wire Line
	12500 2050 12500 3050
Connection ~ 12500 3050
Wire Wire Line
	12500 3050 13200 3050
Wire Wire Line
	12400 2050 12400 2950
Connection ~ 12400 2950
Wire Wire Line
	12400 2950 13200 2950
Wire Wire Line
	12300 2050 12300 2850
Connection ~ 12300 2850
Wire Wire Line
	12300 2850 13200 2850
Wire Wire Line
	13800 3150 13950 3150
Wire Wire Line
	13950 3150 13950 3250
Wire Wire Line
	14050 3250 14050 3050
Wire Wire Line
	14050 3050 13800 3050
Wire Wire Line
	13800 2950 14150 2950
Wire Wire Line
	14150 2950 14150 3250
Wire Wire Line
	14250 3250 14250 2850
Wire Wire Line
	14250 2850 13800 2850
$Comp
L power:GND #PWR?
U 1 1 5BB04322
P 13800 3650
F 0 "#PWR?" H 13800 3400 50  0001 C CNN
F 1 "GND" H 13805 3477 50  0000 C CNN
F 2 "" H 13800 3650 50  0001 C CNN
F 3 "" H 13800 3650 50  0001 C CNN
	1    13800 3650
	1    0    0    -1  
$EndComp
Text Label 3400 2450 0    50   ~ 0
BOOT_PIN
Wire Wire Line
	3400 2450 3300 2450
Text Notes 11650 950  0    118  ~ 24
== Boot Selection ==
Text Label 11800 2200 0    50   ~ 0
BOOT_PIN
$Comp
L power:GND #PWR?
U 1 1 5BB08BD2
P 13800 2200
F 0 "#PWR?" H 13800 1950 50  0001 C CNN
F 1 "GND" H 13805 2027 50  0000 C CNN
F 2 "" H 13800 2200 50  0001 C CNN
F 3 "" H 13800 2200 50  0001 C CNN
	1    13800 2200
	1    0    0    -1  
$EndComp
Connection ~ 12600 1650
$Comp
L Device:C C?
U 1 1 5BB0F2E7
P 13000 2350
F 0 "C?" H 13115 2396 50  0000 L CNN
F 1 "100nF" H 13115 2305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 13038 2200 50  0001 C CNN
F 3 "~" H 13000 2350 50  0001 C CNN
	1    13000 2350
	1    0    0    -1  
$EndComp
Connection ~ 12900 2200
Wire Wire Line
	12900 2200 13000 2200
$Comp
L power:GND #PWR?
U 1 1 5BB10728
P 13000 2500
F 0 "#PWR?" H 13000 2250 50  0001 C CNN
F 1 "GND" H 13005 2327 50  0000 C CNN
F 2 "" H 13000 2500 50  0001 C CNN
F 3 "" H 13000 2500 50  0001 C CNN
	1    13000 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5BB176AC
P 12900 1850
F 0 "R?" H 12970 1896 50  0000 L CNN
F 1 "100k" H 12970 1805 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 12830 1850 50  0001 C CNN
F 3 "~" H 12900 1850 50  0001 C CNN
	1    12900 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	12900 2000 12900 2200
Wire Wire Line
	12900 1650 12900 1700
Wire Wire Line
	12600 1650 12900 1650
Wire Wire Line
	11800 2200 12900 2200
Connection ~ 13000 2200
Wire Wire Line
	13000 2200 13200 2200
Wire Wire Line
	5950 5250 6550 5250
$Comp
L Device:C_Small C?
U 1 1 5BB1C98E
P 8300 6000
F 0 "C?" H 8250 6200 50  0000 L CNN
F 1 "100nF" H 8150 5800 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 8300 6000 50  0001 C CNN
F 3 "~" H 8300 6000 50  0001 C CNN
	1    8300 6000
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 5BB2D792
P 9450 5900
F 0 "#PWR?" H 9450 5750 50  0001 C CNN
F 1 "+3V3" H 9465 6073 50  0000 C CNN
F 2 "" H 9450 5900 50  0001 C CNN
F 3 "" H 9450 5900 50  0001 C CNN
	1    9450 5900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5BB375AE
P 8000 6100
F 0 "#PWR?" H 8000 5850 50  0001 C CNN
F 1 "GND" H 8005 5927 50  0000 C CNN
F 2 "" H 8000 6100 50  0001 C CNN
F 3 "" H 8000 6100 50  0001 C CNN
	1    8000 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 6100 8300 6100
Connection ~ 8300 6100
Text Notes 8250 5550 0    79   ~ 16
— Decoupling —
Text Notes 3100 4750 0    79   ~ 16
— Essentials: Power, Debug, Crystal —
$Comp
L power:+3V3 #PWR?
U 1 1 5BB545DF
P 9200 1550
F 0 "#PWR?" H 9200 1400 50  0001 C CNN
F 1 "+3V3" H 9215 1723 50  0000 C CNN
F 2 "" H 9200 1550 50  0001 C CNN
F 3 "" H 9200 1550 50  0001 C CNN
	1    9200 1550
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 5BB5473E
P 8500 2100
F 0 "#PWR?" H 8500 1950 50  0001 C CNN
F 1 "+3V3" H 8515 2273 50  0000 C CNN
F 2 "" H 8500 2100 50  0001 C CNN
F 3 "" H 8500 2100 50  0001 C CNN
	1    8500 2100
	1    0    0    -1  
$EndComp
$Comp
L Device:Ferrite_Bead L?
U 1 1 5BB54D2D
P 9050 1550
F 0 "L?" V 9100 1700 50  0000 C CNN
F 1 "Ferrite_Bead" V 8950 1300 50  0000 C CNN
F 2 "" V 8980 1550 50  0001 C CNN
F 3 "~" H 9050 1550 50  0001 C CNN
	1    9050 1550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8900 1550 8750 1550
Wire Wire Line
	8900 1550 8900 2100
Connection ~ 8900 1550
Wire Wire Line
	8800 2100 8900 2100
Connection ~ 8900 2100
$Comp
L power:GND #PWR?
U 1 1 5BB6BD7E
P 8500 4900
F 0 "#PWR?" H 8500 4650 50  0001 C CNN
F 1 "GND" H 8505 4727 50  0000 C CNN
F 2 "" H 8500 4900 50  0001 C CNN
F 3 "" H 8500 4900 50  0001 C CNN
	1    8500 4900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5BB6C73D
P 8750 1850
F 0 "#PWR?" H 8750 1600 50  0001 C CNN
F 1 "GND" H 8755 1677 50  0000 C CNN
F 2 "" H 8750 1850 50  0001 C CNN
F 3 "" H 8750 1850 50  0001 C CNN
	1    8750 1850
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 5BB6C9E0
P 9100 2100
F 0 "#PWR?" H 9100 1950 50  0001 C CNN
F 1 "+3V3" H 9115 2273 50  0000 C CNN
F 2 "" H 9100 2100 50  0001 C CNN
F 3 "" H 9100 2100 50  0001 C CNN
	1    9100 2100
	1    0    0    -1  
$EndComp
$Comp
L Device:Ferrite_Bead L?
U 1 1 5BB6D077
P 9100 5100
F 0 "L?" V 8950 5200 50  0000 C CNN
F 1 "Ferrite_Bead" V 9200 4750 50  0000 C CNN
F 2 "" V 9030 5100 50  0001 C CNN
F 3 "~" H 9100 5100 50  0001 C CNN
	1    9100 5100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8950 5100 8950 4900
Wire Wire Line
	8950 4900 8900 4900
Connection ~ 8900 4900
Wire Wire Line
	8900 4900 8800 4900
$Comp
L power:GND #PWR?
U 1 1 5BB71115
P 9250 5100
F 0 "#PWR?" H 9250 4850 50  0001 C CNN
F 1 "GND" H 9255 4927 50  0000 C CNN
F 2 "" H 9250 5100 50  0001 C CNN
F 3 "" H 9250 5100 50  0001 C CNN
	1    9250 5100
	1    0    0    -1  
$EndComp
Text Notes 8000 1250 0    59   ~ 12
— USB, RTC, ADC, I2C —
$Comp
L Switch:SW_SPST SW?
U 1 1 5BB91771
P 4000 9050
F 0 "SW?" H 4000 9285 50  0000 C CNN
F 1 "SW_SPST" H 4000 9194 50  0000 C CNN
F 2 "" H 4000 9050 50  0001 C CNN
F 3 "" H 4000 9050 50  0001 C CNN
	1    4000 9050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5BB99DE2
P 4350 9300
F 0 "#PWR?" H 4350 9050 50  0001 C CNN
F 1 "GND" H 4355 9127 50  0000 C CNN
F 2 "" H 4350 9300 50  0001 C CNN
F 3 "" H 4350 9300 50  0001 C CNN
	1    4350 9300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5BBAA3DA
P 3600 8750
F 0 "R?" H 3670 8796 50  0000 L CNN
F 1 "100k" H 3670 8705 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 3530 8750 50  0001 C CNN
F 3 "~" H 3600 8750 50  0001 C CNN
	1    3600 8750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 8900 3600 9050
Wire Wire Line
	3600 9050 3800 9050
Connection ~ 3600 9050
$Comp
L Device:C C?
U 1 1 5BBC4923
P 3450 9200
F 0 "C?" H 3565 9246 50  0000 L CNN
F 1 "100nF" H 3565 9155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 3488 9050 50  0001 C CNN
F 3 "~" H 3450 9200 50  0001 C CNN
	1    3450 9200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 9050 3450 9050
Connection ~ 3450 9050
Wire Wire Line
	3450 9050 3600 9050
Text Label 4200 6000 0    39   ~ 0
~RESET
Text Label 3000 9050 0    39   ~ 0
~RESET
Wire Wire Line
	4200 9050 4350 9050
Wire Wire Line
	4350 9050 4350 9300
$Comp
L power:+3V3 #PWR?
U 1 1 5BBE0B6C
P 3600 8600
F 0 "#PWR?" H 3600 8450 50  0001 C CNN
F 1 "+3V3" H 3615 8773 50  0000 C CNN
F 2 "" H 3600 8600 50  0001 C CNN
F 3 "" H 3600 8600 50  0001 C CNN
	1    3600 8600
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_SPST SW?
U 1 1 5BBE0CF2
P 5650 9050
F 0 "SW?" H 5650 9285 50  0000 C CNN
F 1 "SW_SPST" H 5650 9194 50  0000 C CNN
F 2 "" H 5650 9050 50  0001 C CNN
F 3 "" H 5650 9050 50  0001 C CNN
	1    5650 9050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5BBE0CF9
P 6000 9300
F 0 "#PWR?" H 6000 9050 50  0001 C CNN
F 1 "GND" H 6005 9127 50  0000 C CNN
F 2 "" H 6000 9300 50  0001 C CNN
F 3 "" H 6000 9300 50  0001 C CNN
	1    6000 9300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5BBE0CFF
P 5250 8750
F 0 "R?" H 5320 8796 50  0000 L CNN
F 1 "100k" H 5320 8705 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 5180 8750 50  0001 C CNN
F 3 "~" H 5250 8750 50  0001 C CNN
	1    5250 8750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 8900 5250 9050
Wire Wire Line
	5250 9050 5450 9050
Connection ~ 5250 9050
$Comp
L Device:C C?
U 1 1 5BBE0D09
P 5100 9200
F 0 "C?" H 5215 9246 50  0000 L CNN
F 1 "100nF" H 5215 9155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 5138 9050 50  0001 C CNN
F 3 "~" H 5100 9200 50  0001 C CNN
	1    5100 9200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 9050 5100 9050
Connection ~ 5100 9050
Wire Wire Line
	5100 9050 5250 9050
Text Label 4650 9050 0    39   ~ 0
USR_SW
Wire Wire Line
	5850 9050 6000 9050
Wire Wire Line
	6000 9050 6000 9300
$Comp
L power:+3V3 #PWR?
U 1 1 5BBE0D16
P 5250 8600
F 0 "#PWR?" H 5250 8450 50  0001 C CNN
F 1 "+3V3" H 5265 8773 50  0000 C CNN
F 2 "" H 5250 8600 50  0001 C CNN
F 3 "" H 5250 8600 50  0001 C CNN
	1    5250 8600
	1    0    0    -1  
$EndComp
Text Notes 3450 8150 0    118  ~ 24
== Switches ==
Wire Wire Line
	13800 3650 13950 3650
$Comp
L Device:R_Pack04 RN?
U 1 1 5BBEEB9F
P 14150 3450
F 0 "RN?" H 13700 3500 50  0000 L CNN
F 1 "10K" H 13700 3400 50  0000 L CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0402" V 14425 3450 50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/2085571.pdf" H 14150 3450 50  0001 C CNN
	1    14150 3450
	1    0    0    -1  
$EndComp
$Comp
L JitterLib:SST26VF032B U?
U 1 1 5BA95B3D
P 12900 5500
F 0 "U?" H 12600 5950 50  0000 C CNN
F 1 "SST26VF032B" H 12700 5150 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 12450 6300 50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/2245044.pdf" H 12600 6400 50  0001 C CNN
	1    12900 5500
	1    0    0    -1  
$EndComp
Text Notes 11850 4450 0    118  ~ 24
== Spifi Flash ==
$Comp
L power:GND #PWR?
U 1 1 5BA97034
P 13050 5900
F 0 "#PWR?" H 13050 5650 50  0001 C CNN
F 1 "GND" H 13055 5727 50  0000 C CNN
F 2 "" H 13050 5900 50  0001 C CNN
F 3 "" H 13050 5900 50  0001 C CNN
	1    13050 5900
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 5BA97097
P 13050 4850
F 0 "#PWR?" H 13050 4700 50  0001 C CNN
F 1 "+3V3" H 13065 5023 50  0000 C CNN
F 2 "" H 13050 4850 50  0001 C CNN
F 3 "" H 13050 4850 50  0001 C CNN
	1    13050 4850
	1    0    0    -1  
$EndComp
Text Label 3400 3550 0    50   ~ 0
SPIFI_SCK
Text Label 3400 3650 0    50   ~ 0
SPIFI_SIO3
Text Label 3400 3750 0    50   ~ 0
SPIFI_SIO2
Text Label 3400 3850 0    50   ~ 0
SPIFI_MISO
Wire Wire Line
	3400 3550 3300 3550
Wire Wire Line
	3300 3650 3400 3650
Wire Wire Line
	3400 3750 3300 3750
Text Label 3400 3950 0    50   ~ 0
SPIFI_MOSI
Wire Wire Line
	3300 3850 3400 3850
Wire Wire Line
	3300 3950 3400 3950
Text Label 3400 4050 0    50   ~ 0
SPIFI_CS
Wire Wire Line
	3400 4050 3300 4050
Text Label 13500 5500 0    50   ~ 0
SPIFI_SCK
Text Label 11800 5600 0    50   ~ 0
SPIFI_SIO3
Text Label 11800 5500 0    50   ~ 0
SPIFI_SIO2
Text Label 11800 5400 0    50   ~ 0
SPIFI_MISO
Wire Wire Line
	13500 5500 13400 5500
Text Label 11800 5300 0    50   ~ 0
SPIFI_MOSI
Text Label 13500 5600 0    50   ~ 0
SPIFI_CS
Wire Wire Line
	13500 5600 13400 5600
Wire Wire Line
	12450 5600 11800 5600
Wire Wire Line
	11800 5300 12450 5300
Wire Wire Line
	11800 5400 12450 5400
Wire Wire Line
	11800 5500 12450 5500
$Comp
L power:GND #PWR?
U 1 1 5BAF7C82
P 13550 5150
F 0 "#PWR?" H 13550 4900 50  0001 C CNN
F 1 "GND" H 13550 5000 50  0000 C CNN
F 2 "" H 13550 5150 50  0001 C CNN
F 3 "" H 13550 5150 50  0001 C CNN
	1    13550 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	13550 4850 13050 4850
Wire Wire Line
	13050 4850 13050 5100
Connection ~ 13050 4850
$Comp
L power:GND #PWR?
U 1 1 5BAFE7E0
P 3450 9350
F 0 "#PWR?" H 3450 9100 50  0001 C CNN
F 1 "GND" H 3455 9177 50  0000 C CNN
F 2 "" H 3450 9350 50  0001 C CNN
F 3 "" H 3450 9350 50  0001 C CNN
	1    3450 9350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5BAFE845
P 5100 9350
F 0 "#PWR?" H 5100 9100 50  0001 C CNN
F 1 "GND" H 5105 9177 50  0000 C CNN
F 2 "" H 5100 9350 50  0001 C CNN
F 3 "" H 5100 9350 50  0001 C CNN
	1    5100 9350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5BAFEC98
P 8550 6000
F 0 "C?" H 8500 6200 50  0000 L CNN
F 1 "100nF" H 8400 5800 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 8550 6000 50  0001 C CNN
F 3 "~" H 8550 6000 50  0001 C CNN
	1    8550 6000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5BAFED00
P 8800 6000
F 0 "C?" H 8750 6200 50  0000 L CNN
F 1 "100nF" H 8650 5800 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 8800 6000 50  0001 C CNN
F 3 "~" H 8800 6000 50  0001 C CNN
	1    8800 6000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5BAFEDD6
P 9300 6000
F 0 "C?" H 9250 6200 50  0000 L CNN
F 1 "100nF" H 9150 5800 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 9300 6000 50  0001 C CNN
F 3 "~" H 9300 6000 50  0001 C CNN
	1    9300 6000
	1    0    0    -1  
$EndComp
Connection ~ 9300 5900
Wire Wire Line
	9300 5900 9450 5900
Connection ~ 8800 5900
Connection ~ 8800 6100
Connection ~ 8550 5900
Connection ~ 8550 6100
Wire Wire Line
	8550 5900 8800 5900
Wire Wire Line
	8550 6100 8800 6100
Wire Wire Line
	8300 5900 8550 5900
Wire Wire Line
	8300 6100 8550 6100
Wire Wire Line
	8800 6100 9050 6100
Connection ~ 9050 6100
Wire Wire Line
	9050 5900 9300 5900
Wire Wire Line
	8800 5900 9050 5900
Connection ~ 9050 5900
$Comp
L Device:C_Small C?
U 1 1 5BAFED6A
P 9050 6000
F 0 "C?" H 9000 6200 50  0000 L CNN
F 1 "100nF" H 8900 5800 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 9050 6000 50  0001 C CNN
F 3 "~" H 9050 6000 50  0001 C CNN
	1    9050 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 6100 9300 6100
$Comp
L Device:C_Small C?
U 1 1 5BB0775F
P 8300 6600
F 0 "C?" H 8250 6800 50  0000 L CNN
F 1 "100nF" H 8150 6400 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 8300 6600 50  0001 C CNN
F 3 "~" H 8300 6600 50  0001 C CNN
	1    8300 6600
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 5BB07766
P 9450 6500
F 0 "#PWR?" H 9450 6350 50  0001 C CNN
F 1 "+3V3" H 9465 6673 50  0000 C CNN
F 2 "" H 9450 6500 50  0001 C CNN
F 3 "" H 9450 6500 50  0001 C CNN
	1    9450 6500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5BB0776C
P 8000 6700
F 0 "#PWR?" H 8000 6450 50  0001 C CNN
F 1 "GND" H 8005 6527 50  0000 C CNN
F 2 "" H 8000 6700 50  0001 C CNN
F 3 "" H 8000 6700 50  0001 C CNN
	1    8000 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 6700 8300 6700
Connection ~ 8300 6700
$Comp
L Device:C_Small C?
U 1 1 5BB07774
P 8550 6600
F 0 "C?" H 8500 6800 50  0000 L CNN
F 1 "100nF" H 8400 6400 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 8550 6600 50  0001 C CNN
F 3 "~" H 8550 6600 50  0001 C CNN
	1    8550 6600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5BB0777B
P 8800 6600
F 0 "C?" H 8750 6800 50  0000 L CNN
F 1 "100nF" H 8650 6400 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 8800 6600 50  0001 C CNN
F 3 "~" H 8800 6600 50  0001 C CNN
	1    8800 6600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5BB07782
P 9300 6600
F 0 "C?" H 9250 6800 50  0000 L CNN
F 1 "100nF" H 9150 6400 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 9300 6600 50  0001 C CNN
F 3 "~" H 9300 6600 50  0001 C CNN
	1    9300 6600
	1    0    0    -1  
$EndComp
Connection ~ 9300 6500
Wire Wire Line
	9300 6500 9450 6500
Connection ~ 8800 6500
Connection ~ 8800 6700
Connection ~ 8550 6500
Connection ~ 8550 6700
Wire Wire Line
	8550 6500 8800 6500
Wire Wire Line
	8550 6700 8800 6700
Wire Wire Line
	8300 6500 8550 6500
Wire Wire Line
	8300 6700 8550 6700
Wire Wire Line
	8800 6700 9050 6700
Connection ~ 9050 6700
Wire Wire Line
	9050 6500 9300 6500
Wire Wire Line
	8800 6500 9050 6500
Connection ~ 9050 6500
$Comp
L Device:C_Small C?
U 1 1 5BB07798
P 9050 6600
F 0 "C?" H 9000 6800 50  0000 L CNN
F 1 "100nF" H 8900 6400 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 9050 6600 50  0001 C CNN
F 3 "~" H 9050 6600 50  0001 C CNN
	1    9050 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 6700 9300 6700
$Comp
L Device:C_Small C?
U 1 1 5BB0C605
P 8300 7200
F 0 "C?" H 8250 7400 50  0000 L CNN
F 1 "100nF" H 8150 7000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 8300 7200 50  0001 C CNN
F 3 "~" H 8300 7200 50  0001 C CNN
	1    8300 7200
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 5BB0C60C
P 9450 7100
F 0 "#PWR?" H 9450 6950 50  0001 C CNN
F 1 "+3V3" H 9465 7273 50  0000 C CNN
F 2 "" H 9450 7100 50  0001 C CNN
F 3 "" H 9450 7100 50  0001 C CNN
	1    9450 7100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5BB0C612
P 8000 7300
F 0 "#PWR?" H 8000 7050 50  0001 C CNN
F 1 "GND" H 8005 7127 50  0000 C CNN
F 2 "" H 8000 7300 50  0001 C CNN
F 3 "" H 8000 7300 50  0001 C CNN
	1    8000 7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 7300 8300 7300
Connection ~ 8300 7300
$Comp
L Device:C_Small C?
U 1 1 5BB0C61A
P 8550 7200
F 0 "C?" H 8500 7400 50  0000 L CNN
F 1 "100nF" H 8400 7000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 8550 7200 50  0001 C CNN
F 3 "~" H 8550 7200 50  0001 C CNN
	1    8550 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5BB0C621
P 8800 7200
F 0 "C?" H 8750 7400 50  0000 L CNN
F 1 "100nF" H 8650 7000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 8800 7200 50  0001 C CNN
F 3 "~" H 8800 7200 50  0001 C CNN
	1    8800 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5BB0C628
P 9300 7200
F 0 "C?" H 9250 7400 50  0000 L CNN
F 1 "100nF" H 9150 7000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 9300 7200 50  0001 C CNN
F 3 "~" H 9300 7200 50  0001 C CNN
	1    9300 7200
	1    0    0    -1  
$EndComp
Connection ~ 9300 7100
Wire Wire Line
	9300 7100 9450 7100
Connection ~ 8800 7100
Connection ~ 8800 7300
Connection ~ 8550 7100
Connection ~ 8550 7300
Wire Wire Line
	8550 7100 8800 7100
Wire Wire Line
	8550 7300 8800 7300
Wire Wire Line
	8300 7100 8550 7100
Wire Wire Line
	8300 7300 8550 7300
Wire Wire Line
	8800 7300 9050 7300
Connection ~ 9050 7300
Wire Wire Line
	9050 7100 9300 7100
Wire Wire Line
	8800 7100 9050 7100
Connection ~ 9050 7100
$Comp
L Device:C_Small C?
U 1 1 5BB0C63E
P 9050 7200
F 0 "C?" H 9000 7400 50  0000 L CNN
F 1 "100nF" H 8900 7000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 9050 7200 50  0001 C CNN
F 3 "~" H 9050 7200 50  0001 C CNN
	1    9050 7200
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 7300 9300 7300
$Comp
L Device:C C?
U 1 1 5BB12A4F
P 13550 5000
F 0 "C?" H 13665 5046 50  0000 L CNN
F 1 "100nF" H 13665 4955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 13588 4850 50  0001 C CNN
F 3 "~" H 13550 5000 50  0001 C CNN
	1    13550 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5BB131FC
P 8750 1700
F 0 "C?" H 8550 1750 50  0000 L CNN
F 1 "100nF" H 8400 1650 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 8788 1550 50  0001 C CNN
F 3 "~" H 8750 1700 50  0001 C CNN
	1    8750 1700
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D?
U 1 1 5BB19F81
P 1200 9700
F 0 "D?" V 1238 9582 50  0000 R CNN
F 1 "RED" V 1147 9582 50  0000 R CNN
F 2 "" H 1200 9700 50  0001 C CNN
F 3 "~" H 1200 9700 50  0001 C CNN
	1    1200 9700
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D?
U 1 1 5BB1A24B
P 1900 9700
F 0 "D?" V 1938 9583 50  0000 R CNN
F 1 "BLUE" V 1847 9583 50  0000 R CNN
F 2 "" H 1900 9700 50  0001 C CNN
F 3 "~" H 1900 9700 50  0001 C CNN
	1    1900 9700
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D?
U 1 1 5BB1A2C3
P 2200 9700
F 0 "D?" V 2238 9582 50  0000 R CNN
F 1 "YELLOW" V 2147 9582 50  0000 R CNN
F 2 "" H 2200 9700 50  0001 C CNN
F 3 "~" H 2200 9700 50  0001 C CNN
	1    2200 9700
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Pack04 RN?
U 1 1 5BB26E06
P 1750 9050
F 0 "RN?" H 1300 9100 50  0000 L CNN
F 1 "220R" H 1300 9000 50  0000 L CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0402" V 2025 9050 50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/2085571.pdf" H 1750 9050 50  0001 C CNN
	1    1750 9050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 9550 1200 9350
Wire Wire Line
	1200 9350 1550 9350
Wire Wire Line
	1550 9350 1550 9250
Wire Wire Line
	1650 9250 1650 9400
Wire Wire Line
	1650 9400 1500 9400
Wire Wire Line
	1500 9400 1500 9550
Wire Wire Line
	1750 9250 1750 9400
Wire Wire Line
	1750 9400 1900 9400
Wire Wire Line
	1900 9400 1900 9550
Wire Wire Line
	1850 9250 1850 9350
Wire Wire Line
	1850 9350 2200 9350
Wire Wire Line
	2200 9350 2200 9550
Wire Wire Line
	1550 8850 1550 8750
Wire Wire Line
	1550 8750 950  8750
Wire Wire Line
	1650 8850 1650 8650
Wire Wire Line
	1650 8650 950  8650
Wire Wire Line
	1750 8850 1750 8550
Wire Wire Line
	1750 8550 950  8550
Wire Wire Line
	1850 8850 1850 8450
Wire Wire Line
	1850 8450 950  8450
Text Label 950  8750 0    50   ~ 0
LED_RED
Text Label 950  8650 0    50   ~ 0
LED_GREEN
Text Label 950  8550 0    50   ~ 0
LED_BLUE
Text Label 950  8450 0    50   ~ 0
LED_YELLOW
$Comp
L Device:LED D?
U 1 1 5BB1A13F
P 1500 9700
F 0 "D?" V 1538 9582 50  0000 R CNN
F 1 "GREEN" V 1447 9582 50  0000 R CNN
F 2 "" H 1500 9700 50  0001 C CNN
F 3 "~" H 1500 9700 50  0001 C CNN
	1    1500 9700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1200 10000 1200 9850
Wire Wire Line
	1500 9850 1500 10000
Wire Wire Line
	1900 9850 1900 10000
Wire Wire Line
	2200 9850 2200 10000
Wire Wire Line
	2200 10000 1900 10000
Connection ~ 1500 10000
Wire Wire Line
	1500 10000 1200 10000
Connection ~ 1900 10000
Wire Wire Line
	1900 10000 1700 10000
$Comp
L power:GND #PWR?
U 1 1 5BBDF37E
P 1700 10000
F 0 "#PWR?" H 1700 9750 50  0001 C CNN
F 1 "GND" H 1705 9827 50  0000 C CNN
F 2 "" H 1700 10000 50  0001 C CNN
F 3 "" H 1700 10000 50  0001 C CNN
	1    1700 10000
	1    0    0    -1  
$EndComp
Connection ~ 1700 10000
Wire Wire Line
	1700 10000 1500 10000
Text Notes 700  8150 0    118  ~ 24
== Status LEDs ==
$Comp
L Connector:Micro_SD_Card J?
U 1 1 5BBE99D8
P 8850 9800
F 0 "J?" H 8800 10517 50  0000 C CNN
F 1 "Micro_SD_Card" H 8800 10426 50  0000 C CNN
F 2 "" H 10000 10100 50  0001 C CNN
F 3 "http://katalog.we-online.de/em/datasheet/693072010801.pdf" H 8850 9800 50  0001 C CNN
	1    8850 9800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5BBE9DE7
P 9650 10400
F 0 "#PWR?" H 9650 10150 50  0001 C CNN
F 1 "GND" H 9655 10227 50  0000 C CNN
F 2 "" H 9650 10400 50  0001 C CNN
F 3 "" H 9650 10400 50  0001 C CNN
	1    9650 10400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 10000 7550 10000
Wire Wire Line
	7550 10000 7550 10600
$Comp
L power:GND #PWR?
U 1 1 5BBF9B15
P 7550 10600
F 0 "#PWR?" H 7550 10350 50  0001 C CNN
F 1 "GND" H 7555 10427 50  0000 C CNN
F 2 "" H 7550 10600 50  0001 C CNN
F 3 "" H 7550 10600 50  0001 C CNN
	1    7550 10600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 9800 7550 9800
Wire Wire Line
	7550 9800 7550 8750
$Comp
L power:+3V3 #PWR?
U 1 1 5BC01F31
P 7550 8700
F 0 "#PWR?" H 7550 8550 50  0001 C CNN
F 1 "+3V3" H 7565 8873 50  0000 C CNN
F 2 "" H 7550 8700 50  0001 C CNN
F 3 "" H 7550 8700 50  0001 C CNN
	1    7550 8700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 9900 6500 9900
Wire Wire Line
	7550 8750 7100 8750
Connection ~ 7550 8750
Wire Wire Line
	7550 8750 7550 8700
$Comp
L Device:C C?
U 1 1 5BC12E0B
P 7100 8900
F 0 "C?" H 7215 8946 50  0000 L CNN
F 1 "100nF" H 7215 8855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 7138 8750 50  0001 C CNN
F 3 "~" H 7100 8900 50  0001 C CNN
	1    7100 8900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5BC12FA0
P 6600 8900
F 0 "C?" H 6715 8946 50  0000 L CNN
F 1 "2.2nF" H 6715 8855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 6638 8750 50  0001 C CNN
F 3 "~" H 6600 8900 50  0001 C CNN
	1    6600 8900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 8750 7100 8750
Connection ~ 7100 8750
$Comp
L power:GND #PWR?
U 1 1 5BC1B7F4
P 7100 9050
F 0 "#PWR?" H 7100 8800 50  0001 C CNN
F 1 "GND" H 7105 8877 50  0000 C CNN
F 2 "" H 7100 9050 50  0001 C CNN
F 3 "" H 7100 9050 50  0001 C CNN
	1    7100 9050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5BC1B869
P 6600 9050
F 0 "#PWR?" H 6600 8800 50  0001 C CNN
F 1 "GND" H 6605 8877 50  0000 C CNN
F 2 "" H 6600 9050 50  0001 C CNN
F 3 "" H 6600 9050 50  0001 C CNN
	1    6600 9050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 9500 6500 9500
Wire Wire Line
	7950 9600 6500 9600
Wire Wire Line
	7950 9700 6500 9700
Wire Wire Line
	7950 10100 6500 10100
Wire Wire Line
	7950 10200 6500 10200
Text Label 6500 9700 0    50   ~ 0
SD_CMD
Text Label 6500 10100 0    50   ~ 0
SD_DAT0
Text Label 6500 10200 0    50   ~ 0
SD_DAT1
Text Label 6500 9500 0    50   ~ 0
SD_DAT2
Text Label 6500 9600 0    50   ~ 0
SD_DAT3
Text Label 6500 9900 0    50   ~ 0
SD_CLK
Wire Wire Line
	7900 2600 7450 2600
Text Label 1050 2750 0    50   ~ 0
SD_CMD
Text Label 1050 2950 0    50   ~ 0
SD_DAT0
Text Label 1050 3050 0    50   ~ 0
SD_DAT1
Text Label 1050 3150 0    50   ~ 0
SD_DAT2
Text Label 1050 3250 0    50   ~ 0
SD_DAT3
Text Label 7450 2600 0    50   ~ 0
SD_CLK
Wire Wire Line
	1050 2750 1400 2750
Wire Wire Line
	1400 2950 1050 2950
Wire Wire Line
	1400 3050 1050 3050
Wire Wire Line
	1400 3150 1050 3150
Wire Wire Line
	1400 3250 1050 3250
Text Notes 7000 8150 0    118  ~ 24
== SD Card Slot ==
Wire Notes Line
	10450 500  10450 7750
Wire Notes Line
	10450 7750 500  7750
Wire Notes Line
	500  7550 500  7600
Text Notes 650  850  0    138  ~ 28
=== LPC43xx (4 parts) ===
Text Notes 1650 1300 0    59   ~ 12
— Muliplexable pins 1/2 —
Text Notes 5250 1300 0    59   ~ 12
— Muliplexable pins 2/2 —
$EndSCHEMATC
