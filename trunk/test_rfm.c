/**********************************************************
* test_rfm.c
*
* Tests functionality of RFM12 module by testing master and slave modes
*
* Pressing the trgger button on powerup will put it in MASTER mode 
*	and will blink the LED once
*
* slave mode will blink twice on powerup - no button needs to be pressed
*
* Master continually transmits 16bytes + checksum at the configured datarate and frequency
*
* Slave Mode will continually Receive data and if the checksum is ok will blink the LED
*  
*
* Copyright (c) 2007 Stephen Eaton 
* 	seaton@everythingrobotics.com
*
* ===========================================================
* License:
*
*   GPLv3 http://www.gpl.org/ 
*
* ===========================================================
*
**********************************************************/
#include <system.h>
#include "..\common.h"
#include "..\lib\rfm12.h"


#pragma CLOCK_FREQ 8000000

#pragma DATA _CONFIG, _WDT_OFF & _PWRTE_ON & _INTOSC_OSC_NOCLKOUT & _MCLRE_OFF & _BODEN_OFF & _LVP_OFF

// & _IESO_OFF  &     & _CPD_ON

// Local RF Variables
#define BAUD 9600
#define FREQ 0x7D0   // 915.00Mhz

typedef enum {
	START=0,
	PACKET,
	CHECKSUM,
	TX
} STATE_MACHINE;

typedef enum {
	SLAVE=0,
	MASTER
} MODE;

MODE mode=SLAVE;
STATE_MACHINE rx_state=START;
uchar flag;
//uchar temp=0;
//  Function declarations
void init(void);

// handles interrupt
void interrupt()
{
	if(intcon.INTF)					// b0 interrupt falling edge
    {
    	flag=1;
    	intcon.INTF = 0;			// clear interrupt
	}	
}

void main()
{
	uchar buffer[32];
	uchar i=0,j=0;
	uchar chksum=0;
	uchar temp=0;
	uchar datavari=0x31;
	delay_ms(3000);
	init();
	WriteCMD(RFM12_CMD_LOWBAT_CLK | RFM12_XTAL_1000 | RFM12_LOWBAT_22);			// CLK: 10MHz, 2.2V		
	/*WriteCMD(RFM12_CMD_LOWBAT_CLK | RFM12_XTAL_1000 | RFM12_LOWBAT_22);			// CLK: 10MHz, 2.2V	
	WriteCMD(RFM12_CMD_LOWBAT_CLK | RFM12_XTAL_1000 | RFM12_LOWBAT_22);			// CLK: 10MHz, 2.2V	
	WriteCMD(RFM12_CMD_LOWBAT_CLK | RFM12_XTAL_1000 | RFM12_LOWBAT_22);			// CLK: 10MHz, 2.2V	
WriteCMD(RFM12_CMD_LOWBAT_CLK | RFM12_XTAL_1000 | RFM12_LOWBAT_22);			// CLK: 10MHz, 2.2V	
WriteCMD(RFM12_CMD_LOWBAT_CLK | RFM12_XTAL_1000 | RFM12_LOWBAT_22);			// CLK: 10MHz, 2.2V	
WriteCMD(RFM12_CMD_LOWBAT_CLK | RFM12_XTAL_1000 | RFM12_LOWBAT_22);			// CLK: 10MHz, 2.2V	
WriteCMD(RFM12_CMD_LOWBAT_CLK | RFM12_XTAL_1000 | RFM12_LOWBAT_22);			// CLK: 10MHz, 2.2V	
WriteCMD(RFM12_CMD_LOWBAT_CLK | RFM12_XTAL_1000 | RFM12_LOWBAT_22);			// CLK: 10MHz, 2.2V	
*/
	//rfm12_Basic_Config();
	
//	while(1){
//	WriteCMD(RFM12_CMD_LOWBAT_CLK | RFM12_XTAL_100 | RFM12_LOWBAT_22);			// CLK: 10MHz, 2.2V		
//	}
	// quick way of setting master/slave....push manual trigger button while powering on
	// TODO: save mode in FLASH so don't have to keep doing this on powerup
	if(TRIG_IN == 1)
		mode=SLAVE;			// not pushed so leave as slave - default
	else
		mode=MASTER;		// button pushed so now is master
	
	switch(mode)
	{
		case SLAVE:				
			rfm12_ResetFifo();						// Reset Fifo ready to receive
			rfm12_EnableRx();						// enable Rx		
			LED1 = 1;								// Blink LED twice - short
			delay_ms(250);		
			LED1 = 0;
			delay_ms(250);
			LED1 = 1;
			delay_ms(250);
			LED1 = 0;
		break;
		
		case MASTER:
			//rfm12_ResetFifo();
			//rfm12_EnableTx();						// enable Tx
			LED1 = 1;								// Blink LED once - long
			delay_ms(500);			
			LED1 = 0;
		break;
	} // switch
//	while(1){
	//	WriteCMD(RFM12_CMD_LOWBAT_CLK | RFM12_XTAL_1000 | RFM12_LOWBAT_22);			// CLK: 10MHz, 2.2V	
//	C0E0
//	}
	
	while(1)
	{
		switch(mode)
		{
			case SLAVE:		
										
				while(1)						// !nIRQ
				{	
					
					
					temp= rfm12_ReadFifo();		// read in next Rx byte
					if(temp==0x30){
						i=0;
						
					}else{
						if(i<4){
							buffer[i++]=temp;
						}
					
					}				
						
					
					if (i==4)							// received data + checksum = 17 bytes
					{	
					//	delay_ms(50);
				//			LED1=1;						// turn on led
				//		delay_ms(50);
				//		LED1=0;
			
							
						i=0;
						rfm12_DisableRx();
						rfm12_DisableFifo();			// disables fifo 
						chksum=0;
						for(j=0 ; j<3 ; j++)			// calc checksum
							chksum+=buffer[j];
							
							
					//	chksum&=0x0FF;
						
						/*
						if(buffer[0]==0x31&&buffer[1]==0x32&&buffer[2]==0x33){
						delay_ms(30);
							LED1=1;						// turn on led
							delay_ms(30);
							LED1=0;
						}*/
						/*
						if(0x96==buffer[3])			// if checksum ok
						{
							
						}*/
						if(chksum==buffer[3])			// if checksum ok
						{
							delay_ms(5);
							LED1=1;						// turn on led
							delay_ms(5);
							LED1=0;
						}
						
					//	delay_ms(250);
					//	LED1=0;
						rfm12_EnableFifo();				// enable FIFO
						rfm12_EnableRx();				// enable Rx
					//		LED1=1;	
				//		delay_ms(40);
					//	LED1=0;	
				//		delay_ms(40);
				 	}//if
				}//while
			break; // SLAVE
			
			case MASTER:
				LED1=1;
				LED1=1;
				delay_ms(3);
				LED1=0;
					delay_ms(3);
				chksum = 0;
				//rfm12_Init_Buffer();
				//build packet
				//rfm12_SetPower(RFM12_TXCTL_POWER_0, RFM12_TXCTL_MODULATION_90);
				LED1=!LED1;
				rfm12_EnableTx();			//TODO: turn on transmitter
 
				rfm12_Tx_Byte(0xAA);		// Preamble
				rfm12_Tx_Byte(0xAA);
				rfm12_Tx_Byte(0xAA);
				rfm12_Tx_Byte(0xAA);
				rfm12_Tx_Byte(0x2D);  		// Sync Hi - 0x2DD4
				rfm12_Tx_Byte(0xD4);		// Sync Lo
				
				rfm12_Tx_Byte(0x30);		// Start data
				//chksum +=0x30;
				//rfm12_Tx_Byte(0x31);		chksum +=0x31;
				rfm12_Tx_Byte(0x31);		
				chksum +=0x31;
				
				rfm12_Tx_Byte(0x32);		
				chksum +=0x32;
				
				rfm12_Tx_Byte(0x33);		
				chksum +=0x33;
				
			/*	
				rfm12_Tx_Byte(0x32);		
				chksum += 0x32;
				rfm12_Tx_Byte(0x33);		
				chksum += 0x33;
				rfm12_Tx_Byte(0x34);		
				chksum += 0x34;
				rfm12_Tx_Byte(0x35);		
				chksum += 0x35;
				rfm12_Tx_Byte(0x36);		
				chksum += 0x36;
				rfm12_Tx_Byte(0x37);		
				chksum += 0x37;
				rfm12_Tx_Byte(0x38);		
				chksum += 0x38;
				rfm12_Tx_Byte(0x39);		
				chksum += 0x39;
				rfm12_Tx_Byte(0x3A);		
				chksum += 0x3A;
				rfm12_Tx_Byte(0x3B);		
				chksum += 0x3B;
				rfm12_Tx_Byte(0x3C);		
				chksum += 0x3C;
				rfm12_Tx_Byte(0x3D);		
				chksum += 0x3D;
				rfm12_Tx_Byte(0x3E);		
				chksum += 0x3E;
				rfm12_Tx_Byte(0x3F);		
				chksum += 0x3F;
			*/
				//chksum &= 0x0ff;
				rfm12_Tx_Byte(chksum);
				rfm12_Tx_Byte(0x3F);		//final
				
				
				rfm12_Tx_Byte(0xAA);
				rfm12_Tx_Byte(0xAA);
				rfm12_DisableTx();				//TODO: turn off Tx
			
			
				
			break; // MASTER
		} // switch
		
	}//while
}


void init(void)
{	
	//osccon = 0x70;				// 8Mhz internal OSC
	//ansel = 0;					// all is digital i/o on PortA
	cmcon=0x07;
	CONF_LED1_OUT();
	LED1=0;
	
	/**************************************************************************
	* OPTION REGISTER
	* 
	* bit 7     RBPU: PORTB Pull-up Enable bit
	*			1 = PORTB pull-ups are disabled
	*			0 = PORTB pull-ups are enabled by individual port latch values
	*
	* bit 6 	INTEDG: Interrupt Edge Select bit
	*			1 = Interrupt on rising edge of RB0/INT pin
	*			0 = Interrupt on falling edge of RB0/INT pin
	*
	* bit 5 	T0CS: TMR0 Clock Source Select bit
	*			1 = Transition on RA4/T0CKI/C2OUT pin
	*			0 = Internal instruction cycle clock (CLKO)
	*
	* bit 4 	T0SE: TMR0 Source Edge Select bit
	*			1 = Increment on high-to-low transition on RA4/T0CKI/C2OUT pin
	*			0 = Increment on low-to-high transition on RA4/T0CKI/C2OUT pin
	*
	* bit 3 	PSA: Prescaler Assignment bit
	*			1 = Prescaler is assigned to the WDT
	*			0 = Prescaler is assigned to the Timer0 module
	*
	* bit 2-0   PS<2:0>: Prescaler Rate Select bits
	*			Bit Value TMR0 Rate WDT Rate
	*				000 	1:2 	1:1
	*				001 	1:4 	1:2
	*				010 	1:8 	1:4
	*				011 	1:16 	1:8
	*				100 	1:32 	1:16
	*				101 	1:64 	1:32
	*				110 	1:128 	1:64
	*				111 	1:256 	1:128
	**************************************************************************/
	// configure PortB
	
	
	option_reg.NOT_RBPU = 0;	// enable pullup resistors on PB
	option_reg.INTEDG = 0;	// falling edge interrupt
    // configure Timer0    
    //option_reg.T0CS = 0; 	// use internal clock
    //option_reg.PSA = 0; 	// use prescaler from timer 0   
    // so we get an interrupt around every 205.2us with 10MHz Clock
    // set prescaller to divide by 2
    //option_reg.PS0 = 0;
    //option_reg.PS1 = 0;
    //option_reg.PS2 = 0;
    
    /**************************************************************************
	* T1CON: TIMER1 CONTROL REGISTER
	*
	* bit 7     Unimplemented
	*
	* bit 6     T1RUN: Timer1 System Clock Status bit
	*           1 = System clock is derived from Timer1 oscillator
	*           0 = System clock is derived from another source
	*
	* bit 5-4   T1CKPS<1:0>: Timer1 Input Clock Prescale Select bits
	*           11 = 1:8 Prescale value
	*           10 = 1:4 Prescale value
	*           01 = 1:2 Prescale value
	*           00 = 1:1 Prescale value
	*
	* bit 3     T1OSCEN: Timer1 Oscillator Enable Control bit
	*           1 = Oscillator is enabled
	*           0 = Oscillator is shut off
	*
	* bit 2     T1SYNC: Timer1 External Clock Input Sychronization Control bit
	*           TMR1CS = 1:
	*           1 = Do not synchronize the external clock input
	*           0 = Synchronize external clock input
	*           TMR1CS = 0:
	*           This bit is ignored.
	*
	* bit 1     TMR1CS: Timer1 Clock Source Select bit
	*           1 = External clock from pin ...
	*           0 = Internal clock (Fosc/4)
	*
	* bit 0     TMR1ON: Timer1 On bit
	*           1 = Enables Timer1
	*           0 = Stops Timer1
	**************************************************************************/

    /**************************************************************************
	* ANSEL REGISTER PIC16F88 DEVICES ONLY
	*
	* bit 7     Unimplemented
	*
	* bit 6-0   ANS<6:0>: Analog Input Select bits
	*           1 = Analog I/O
	*           0 = Digital I/O
	**************************************************************************/
            
    
    /**************************************************************************
	* INTCON: INTERRUPT CONTROL REGISTER
	*
	* bit 7     GIE: Global Interrupt Enable bit
	*           1 = Enables all unmasked interrupts
	*           0 = Disables all interrupts
	*
	* bit 6     PEIE: Peripheral Enable Interrupt Enable bit
	*           1 = Enables all unmasked peripheral interrupts
	*           0 = Disables all peripheral interrupts
	*
	* bit 5     TMR0IE: TMR0 Overflow Interrupt Enable bit
	*           1 = Enables the TMR0 interrupt
	*           0 = Disables the TMR0 interrupt
	*
	* bit 4     INTE: RB0/INT External Interrupt Enable bit
	*           1 = Enables the RB0/INT external interrupt
	*           0 = Disables the RB0/INT external interrupt
	*
	* bit 3     RBIE: RB Port Change Interrupt Enable bit
	*           1 = Enables the RB port change interrrupt
	*           0 = Disables the RB port change interrrupt
	*
	* bit 2     TMR0IF: TMR0 Overflow Interrupt Flag bit
	*           1 = TMR0 register has overflowed (must be cleared in software)
	*           0 = TMR0 register did not overfow
	*
	* bit 1     INTF: RB0/INT External Interrupt Flag bit
	*           1 = The RB0/INT external interrupt occurred (must be cleared in
	*               software)
	*           0 = The RB0/INT external interrupt did not occur
	*
	* bit 0     RBIF: RB Port Change Interrupt Flag bit
	*           A mismatch condition will continue to set flag bit RBIF. Reading
	*           PORTB will end the mismatch condition and allow the flag bit
	*           RBIF to be cleared.
	*           1 = At least one of the RB7:RB4 pins changed state (must be
	*               cleared in software)
	*           0 = None of the RB7:RB4 pins have changed state.
	**************************************************************************/
    //intcon.PEIE = 1;     	//enable peripheral interrupts
    //intcon.TMR0IE = 1;     //enable TMR0 overflow bit    
	intcon.INTE = 1;		//enable RB0/INT Interrupt
	//intcon.RBIE = 1;		//enable PortB change Interrupt 
    intcon.GIE = 1;     	//enable global interrupts
    
    /**************************************************************************
	* PIE1: PERIPHERAL INTERRUPT ENABLE REGISTER 1
	*
	* bit 7     Unimplemented:
	*
	* bit 6     ADIE: A/D Converter Interrupt Enable bit
	*           1 = Enabled
	*           0 = Disabled
	*
	* bit 5     RCIE: USART Receive Interrupt Enable bit
	*           1 = Enabled
	*           0 = Disabled
	*
	* bit 4     TXIE: USART Transmit Interrupt Enable bit
	*           1 = Enabled
	*           0 = Disabled
	*
	* bit 3     SSPIE: Synchronous Serial Port (SSP) Interrupt Enable bit
	*           1 = Enabled
	*           0 = Disabled
	*
	* bit 2     CCP1IE: CCP1 Interrupt Enable bit
	*           1 = Enabled
	*           0 = Disabled
	*
	* bit 1     TMR2IE: TMR2 to PR2 Match Interrupt Enable bit
	*           1 = Enabled
	*           0 = Disabled
	*
	* bit 0     TMR1IE: TMR1 Overflow Interrupt Enable bit
	*           1 = Enabled
	*           0 = Disabled
	**************************************************************************/
	//pie1.ADIE = 1;         	//enable ADC interrupt
	
	/**************************************************************************
	* PIR1: PERIPHERAL INTERRUPT STATUS REGISTER 1
	*
	* bit 7     Unimplemented:
	*
	* bit 6     ADIF: A/D Converter Interrupt Flag bit
	*           1 = A/D conversion completed (must be cleared in software)
	*           0 = A/D conversion is not complete
	*
	* bit 5     RCIF: USART Receive Interrupt Flag bit
	*           1 = The USART receive buffer is full (cleared by reading RCREG)
	*           0 = The USART receive buffer is not full
	*
	* bit 4     TXIF: USART Transmit Interrupt Flag bit
	*           1 = The USART transmit buffer is empty (cleared by writing to
	*               TXREG)
	*           0 = The USART transmit buffer is not empty
	*
	* bit 3     SSPIF: Synchronous Serial Port (SSP) Interrupt Flag bit
	*           1 = The transmission/reception is complete (must be cleared in
	*               software)
	*           0 = Waiting to transmit/receive
	*
	* bit 2     CCP1IF: CCP1 Interrupt Flag bit
	*           Capture Mode
	*           1 = A TMR1 register capture occurred (must be cleared in
	*               software)
	*           0 = No TMR1 register capture occurred
	*           Compare Mode
	*           1 = A TMR1 register compare match occurred (must be cleared in
	*               software)
	*           0 = No TMR1 register ccompare match occurred
	*
	* bit 1     TMR2IF: TMR2 to PR2 Match Interrupt Flag bit
	*           1 = A TMR2 to PR2 match occurred (must be cleared in software)
	*           0 = No TMR2 to PR2 match occurred
	*
	* bit 0     TMR1IF: TMR1 Overflow Interrupt Flag bit
	*           1 = The TMR1 register overflowed (must be cleared in software)
	*           0 = The TMR1 register did not overflow
	**************************************************************************/
	//pir1.ADIF = 0;        	//clear ADC flag
	
	// configure the RF
	//rfm12_Init_433();
	rfm12_Init_915();			// I have a 915Mhz installed
	rfm12_SetBaud(BAUD);		
	rfm12_SetFreq(FREQ);  		// set frequency
	//WriteCMD(0xA7D0);			// 915Mhz
	
}

