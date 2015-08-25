/**********************************************************
* common.h
*
* Common Project definitions for strobist trigger
*
* Copyright (c) 2007 Stephen Eaton
* 	seaton@everythingrobotics.com
*
*
* ===========================================================
* License:
*
*   GPLv3 http://www.gpl.org/ 
*
* ===========================================================
*
**********************************************************/
#ifndef COMMON_H
#define COMMON_H


// comment this out under normal operation
//#define DEBUG

// Packet Definitions
#define PKT_PREAMBLE 0xAA	// Preamble
#define PKT_SYNC_HI	 0xCE	// SYNC High Byte
#define PKT_SYNC_LO	 0xD4	// SYNC Low Byte
#define PKT_GM_TRIG	 0x20	// Group mode trigger command


// define I/O
volatile bit LED1        @ PORTA.0;
volatile bit TRIG_IN     @ PORTB.4;
volatile bit TRIG_OUT    @ PORTB.3;
// RFM and SPI pins defined in rfm12.h

bit LED1_TRIS @ TRISA.0;
bit TRIG_IN_TRIS @ TRISB.4;
bit TRIG_OUT_TRIS @ TRISB.3;

#define CONF_LED1_OUT()	LED1_TRIS=0
#define CONF_TRIG_OUT()	TRIG_OUT_TRIS=0
#define CONF_TRIG_IN()	TRIG_IN_TRIS=1

#define disable_interrupts() intcon.GIE = 0
#define enable_interrupts()	 intcon.GIE = 1

typedef unsigned char uchar;
typedef unsigned int uint;

#define TRIG_CMD  0x80

typedef struct {
 uchar HighByte;
 uchar LowByte;
} FREQUENCYTABLEENTRY;

// Packet Rx States
typedef enum {
	RX_START=0,
	RX_GM_HEADER,
	RX_PP_HEADER,
	RX_CTL_BYTE,
	RX_SUBCTL_BYTE,
	RX_CHKSUM
} PACKET_STATE; 

typedef struct {
	uchar cPreamble[3];
	uchar cSyncWord[2];
	uchar cHeader[3];
} RFPACKET;

#endif //COMMON_H