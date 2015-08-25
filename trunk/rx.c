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
uchar ReadFifo();
int t=0;
void main()
{		
			uchar i=0, j=0;
			uint chksum=0;
			uchar buffer[17];
			uchar temp=0;
			init();	
			LED1 = 1;								// Blink LED twice - slave
			delay_ms(500);			
			LED1 = 0;
			delay_ms(500);
			LED1 = 1;								// Blink LED twice - slave
			delay_ms(500);
			LED1 = 0;
			
			WriteCMD(0xCA81);
			WriteCMD(0xCA83);						// Enable FIFO	
		
			while(1)
			{
				while(RFM12_IRQ==0)
				{	
					temp=	ReadFifo();		// read in next Rx byte					
					buffer[i++] = temp;
					if(temp!=0){
						for(t=0;t<4;t++){
							LED1=1;						// turn on led
							delay_ms(25);
							LED1=0;						// turn on led
							delay_ms(25);
							}
					}
					
					if (i==17)							// received data + checksum = 17 bytes
					{
						i=0;
						WriteCMD(0xCA81);				// disable FIFO
	
						
						chksum=0;
						for(j=0 ; j<16 ; j++)			// calc checksum
							chksum+=buffer[j];
						chksum&=0x0FF;
						if(chksum==buffer[16]&&buffer[16]!=0)			// if checksum ok
						{
							for(t=0;t<4;t++){
							LED1=1;						// turn on led
							delay_ms(25);
							LED1=0;						// turn on led
							delay_ms(25);
							}
							
						}
					///	LED1=0;
						WriteCMD(0xCA81);				// disable FIFO
						WriteCMD(0xCA83);				// enable FIFO, re-Sync
					}//if
				}//while

			} //while
}

void init(void)
{
	//osccon = 0x70;				// 8Mhz internal OSC
	cmcon = 0x07;
	//ansel = 0;					// all is digital i/o on PortA
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
	WriteCMD(0xA7D0);	// 915=A7D0 904.50MHZ = A258	
	
	WriteCMD(0xC623);	// c608=38400 c611=19200 c623= 9600bps	
	
	WriteCMD(0xC22C);	// Data Filter: AL, !ML, digital filter,  4 dqd	
	WriteCMD(0xC4F7);	// AFC Autotune, -10khz..+7.5Khz, !st, !fi, OE, EN	
	WriteCMD(0x96A0);	// P16, VDI, FAST, 65khz, 0dBm, -103dBm
	WriteCMD(0xCA81);	// FIFO8, SYNC, !ff, DR
	
	//TX Config
	//WriteCMD(0x9850);	// !mp, 9810=30Khz, MAX out
	
	
	WriteCMD(0xE000);	// NOT USE
	WriteCMD(0xC80E);	// NOT USE
	WriteCMD(0xC000);	// CLK 1mhz, 2.2v 
	
	WriteCMD(0x8280);	// ER, EBB, !ET, ES, EX, !EB, !EW, !DC	


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
	HI_SEL();									// CS HIGH - Finished Sending Command
	return RESULT;
}

void rf_SendByte(uchar data)
{
	uchar cmd = 0xB800 | data;
	WaitReady();//while(RFM12_IRQ==1);
	WriteCMD(cmd);

}

/* 
  Waits for RFM 12 to become ready by checking first bit of status register
  Before we can Tx or Rx data the RFM12 needs to be ready, 
  i.e. not in the middle of transmitting a previous byte
  
  This function is blocking and will only return when it is ready to Tx or Rx
*/
void WaitReady(void)
{	
//#ifdef DEBUG							// always return for simulator
//		return;
//#endif
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


uchar ReadFifo(void)
{
	WaitReady();
	return (WriteCMD(0xB000) & 0xFF);
}