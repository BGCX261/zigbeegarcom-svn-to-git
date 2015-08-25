#include <system.h>
#include "common.h"

#pragma CLOCK_FREQ 8000000

#pragma DATA _CONFIG, _WDT_OFF & _PWRTE_ON & _INTOSC_OSC_NOCLKOUT & _MCLRE_OFF & _BODEN_OFF & _LVP_OFF

// Required Ports
#define RFM12_nIRQ_PORT		PORTB
#define RFM12_CS_PORT		PORTA
#define SCK_PORT			PORTA
#define SDO_PORT			PORTB
#define	SDI_PORT			PORTA

// TRIS Register
#define RFM12_nIRQ_TRISP	TRISB
#define RFM12_CS_TRISP		TRISA
#define SCK_TRISP			TRISA
#define SDO_TRISP			TRISB
#define	SDI_TRISP			TRISA

// Define pins
#define RFM12_nIRQ_PIN		0
#define RFM12_CS_PIN		2
#define	SCK_PIN				3
#define	SDO_PIN				1
#define	SDI_PIN				1

////////////////////////////////////////////////////////////
// DO NOT CHANGE BELOW THIS LINE
////////////////////////////////////////////////////////////
volatile bit RFM12_IRQ      @ RFM12_nIRQ_PORT   . RFM12_nIRQ_PIN;
volatile bit RFM12_CS		@ RFM12_CS_PORT     . RFM12_CS_PIN;
volatile bit SCK			@ SCK_PORT     		. SCK_PIN;
volatile bit SDO			@ SDO_PORT		    . SDO_PIN;
volatile bit SDI			@ SDI_PORT     		. SDI_PIN;

bit RFM12_nIRQ_TRIS @ RFM12_nIRQ_TRISP . RFM12_nIRQ_PIN;
bit RFM12_CS_TRIS @ RFM12_CS_TRISP . RFM12_CS_PIN;
bit SCK_TRIS @ SCK_TRISP . SCK_PIN;
bit SDO_TRIS @ SDO_TRISP . SDO_PIN;
bit SDI_TRIS @ SDI_TRISP . SDI_PIN;

//outputs
#define RFM12_CS_OUT()	RFM12_CS_TRIS=0
#define SCK_OUT()		SCK_TRIS=0
#define SDO_OUT()		SDO_TRIS=0	

// inputs
#define RFM12_nIRQ_IN()	RFM12_nIRQ_TRIS=1
#define SDI_IN()		SDI_TRIS=1

#define HI_SCK()  SCK=1
#define LOW_SCK() SCK=0
#define HI_SDO()  SDO=1
#define LOW_SDO() SDO=0
#define HI_SEL()  RFM12_CS=1
#define LOW_SEL() RFM12_CS=0

// prototypes
void init(void);
uint WriteCMD(uint);
void rf_SendByte(uchar);
void WaitReady(void);

void main()
{		
			uint chksum=0;
			
			init();	
			LED1 = 1;								// Blink LED once - long
			delay_ms(500);			
			LED1 = 0;		
			while(1)
			{
				chksum = 0;
				
				LED1=!LED1;
				//rfm12_EnableTx();			//TODO: turn on transmitter

				WriteCMD(0x8238);		// Turn on Transmitter
				delay_ms(1);			// turn on delay

				rf_SendByte(0xAA);		// PreAmble
				
				rf_SendByte(0x2D);		// Sync
				rf_SendByte(0xD4);
				
				rf_SendByte(0x30);		// Start data
				chksum += 0x30;
				rf_SendByte(0x31);		
				chksum +=0x31;
				rf_SendByte(0x32);		
				chksum += 0x32;
				rf_SendByte(0x33);		
				chksum += 0x33;
				rf_SendByte(0x34);		
				chksum += 0x34;
				rf_SendByte(0x35);		
				chksum += 0x35;
				rf_SendByte(0x36);		
				chksum += 0x36;
				rf_SendByte(0x37);		
				chksum += 0x37;
				rf_SendByte(0x38);		
				chksum += 0x38;
				rf_SendByte(0x39);		
				chksum += 0x39;
				rf_SendByte(0x3A);		
				chksum += 0x3A;
				rf_SendByte(0x3B);		
				chksum += 0x3B;
				rf_SendByte(0x3C);		
				chksum += 0x3C;
				rf_SendByte(0x3D);		
				chksum += 0x3D;
				rf_SendByte(0x3E);		
				chksum += 0x3E;
				rf_SendByte(0x3F);		
				chksum += 0x3F;
				chksum &= 0x0ff;
				rf_SendByte(chksum);
				rf_SendByte(0xAA);
				rf_SendByte(0xAA);
				
				WriteCMD(0x8208);			// tx off
				//rfm12_DisableTx();			//TODO: turn off Tx
				delay_ms(50);

	} //while
}

void init(void)
{
	cmcon = 0x07;
	//osccon = 0x70;				// 8Mhz internal OSC
//	ansel = 0;					// all is digital i/o on PortA
	option_reg.NOT_RBPU = 0;	// enable pullup resistors on PB
	option_reg.INTEDG = 0;		// falling edge interrupt	

	CONF_LED1_OUT();
	LED1=0;
	
	// setup SPI
	// outputs
	RFM12_CS_OUT();								// Module Chip Select 
	HI_SEL();									// RF CS is Active Low so set High
	
	SCK_OUT();									// SPI SCK as Output
	LOW_SCK();
	
	SDO_OUT();									// SPI SDO as Output
	LOW_SDO();
		
	// inputs
	RFM12_nIRQ_IN();							// nIRQ
	SDI_IN();									// SPI SDI
	
	delay_ms(500);								// Wait for RFM12 POR 

	
	WriteCMD(0x80F7);	// 915 EL, EF, 12.0pf
	WriteCMD(0xA7D0);	// A7d0=915 A258=904.5MHZ
	WriteCMD(0xc623);	// 9600bps=c623 19200=c611 38400=c608
	WriteCMD(0x9850);	// !mp, 9810=30Khz, MAX out	
	
	WriteCMD(0x9680);	// P16
	
	WriteCMD(0x8208);	// !ER, !EBB, !ET, ES, EX, !EB, !EW, !DC
	
}


// Bitbang binary 1 via SPI
void Write1(void)
{
	SDO=1;
	SCK=0;
	nop();
	nop();
	nop();
	nop();
	nop();
	nop();
	nop();
	nop();
	nop();
	nop();
	nop();
	nop();
	nop();
	nop();
	nop();
	nop();
	SCK=1;
	nop();
}

// bitbang binary 0 via SPI
void Write0(void)
{
	SDO=0;
	SCK=0;
	nop();
	nop();
	nop();
	nop();
	nop();
	nop();
	nop();
	nop();
	nop();
	nop();
	nop();
	nop();
	nop();
	nop();
	nop();
	nop();
	SCK=1;
	nop();
}
/*

  Write a Command to the RFM Module using SPI
  
  Requires: 16bit valid command
  Returns:  16bit result from transaction
  
  This is a bi-directional transfer.  
  A command is clocked out to the RFM a bit at a time.  
  At the same time a result is clocked back in a bit at a time.
   
*/
uint WriteCMD(uint CMD)
{
	
	uint RESULT = 0;							// Holds the received SDI
	uchar n=16;									// number of bits in SPI Command we need to send
	LOW_SCK();									// SCK LOW
	LOW_SDO();
	LOW_SEL();									// CS LOW
	while(n--)									// Send All 16 Bits MSB First
	{
		if (CMD&0x8000)
		{
			Write1();							// Write 1 via SDI		
		}
		else
		{
			Write0();							// Write 0 via SPI
		}
		
		RESULT<<=1;								// Shift left for next bit to receive
		if(SDI)									// Check if we received a high on SDI
			RESULT |= 0x0001;					// RESULT LSB = 1		
		CMD<<=1;								// Shift left for next bit to send
	}
	LOW_SCK();									// SCK LOW
	LOW_SDO();
	HI_SEL();									// CS HIGH - Finished Sending Command
	return RESULT;
}

void rf_SendByte(uchar data)
{
	//uchar cmd = 0xB800 | data;
	WaitReady();//while(RFM12_IRQ==1);
	WriteCMD(0xB800 | data);

}

/* 
  Waits for RFM 12 to become ready by checking first bit of status register
  Before we can Tx or Rx data the RFM12 needs to be ready, 
  i.e. not in the middle of transmitting a previous byte
  
  This function is blocking and will only return when it is ready to Tx or Rx
*/
void WaitReady(void)
{	
#ifdef DEBUG							// always return for simulator
		return;
#endif
	unsigned long timeout = 0;
	bit READY = 0;
	while(READY == 0)						
	{
		LOW_SCK();						// SCK LOW
		LOW_SEL();						// CS LOW
		Write0();
		if(SDI==1)						// check RGIT bit of status (first bit)
		{ 								// If HIGH then Tx/RX is ready to accept the next byte
			READY = 1;
		}	
		LOW_SCK();						// SCK LOW
		LOW_SDO();
		HI_SEL();						// CS HIGH - Finished Sending Command
	}
}
