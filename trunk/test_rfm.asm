;/////////////////////////////////////////////////////////////////////////////////
;// Code Generator: BoostC Compiler - http://www.sourceboost.com
;// Version       : 6.95
;// License Type  : Lite License (Unregistered)
;// Limitations   : PIC12,PIC16 max code size:2048 words, max RAM banks:2, Non commercial use only
;/////////////////////////////////////////////////////////////////////////////////

	include "P16F628A.inc"
; Heap block 0, size:71 (0x000000A9 - 0x000000EF)
__HEAP_BLOCK0_BANK               EQU	0x00000001
__HEAP_BLOCK0_START_OFFSET       EQU	0x00000029
__HEAP_BLOCK0_END_OFFSET         EQU	0x0000006F
; Heap block 1, size:0 (0x00000000 - 0x00000000)
__HEAP_BLOCK1_BANK               EQU	0x00000000
__HEAP_BLOCK1_START_OFFSET       EQU	0x00000000
__HEAP_BLOCK1_END_OFFSET         EQU	0x00000000
; Heap block 2, size:0 (0x00000000 - 0x00000000)
__HEAP_BLOCK2_BANK               EQU	0x00000000
__HEAP_BLOCK2_START_OFFSET       EQU	0x00000000
__HEAP_BLOCK2_END_OFFSET         EQU	0x00000000
; Heap block 3, size:0 (0x00000000 - 0x00000000)
__HEAP_BLOCK3_BANK               EQU	0x00000000
__HEAP_BLOCK3_START_OFFSET       EQU	0x00000000
__HEAP_BLOCK3_END_OFFSET         EQU	0x00000000
__div_32_3_00001_arg_a           EQU	0x00000073 ; bytes:4
__div_32_3_00001_arg_b           EQU	0x00000077 ; bytes:4
CompTempVarRet163                EQU	0x000000A5 ; bytes:4
__div_32_3_00001_1_r             EQU	0x000000A0 ; bytes:4
__div_32_3_00001_1_i             EQU	0x000000A4 ; bytes:1
__div_16_1_00003_arg_a           EQU	0x00000073 ; bytes:2
__div_16_1_00003_arg_b           EQU	0x00000075 ; bytes:2
CompTempVarRet167                EQU	0x000000A1 ; bytes:2
__div_16_1_00003_1_r             EQU	0x0000007D ; bytes:2
__div_16_1_00003_1_i             EQU	0x000000A0 ; bytes:1
gbl_status                       EQU	0x00000003 ; bytes:1
gbl_indf                         EQU	0x00000000 ; bytes:1
gbl_tmr0                         EQU	0x00000001 ; bytes:1
gbl_pcl                          EQU	0x00000002 ; bytes:1
gbl_fsr                          EQU	0x00000004 ; bytes:1
gbl_porta                        EQU	0x00000005 ; bytes:1
gbl_portb                        EQU	0x00000006 ; bytes:1
gbl_pclath                       EQU	0x0000000A ; bytes:1
gbl_intcon                       EQU	0x0000000B ; bytes:1
gbl_pir1                         EQU	0x0000000C ; bytes:1
gbl_tmr1l                        EQU	0x0000000E ; bytes:1
gbl_tmr1h                        EQU	0x0000000F ; bytes:1
gbl_t1con                        EQU	0x00000010 ; bytes:1
gbl_tmr2                         EQU	0x00000011 ; bytes:1
gbl_t2con                        EQU	0x00000012 ; bytes:1
gbl_ccpr1l                       EQU	0x00000015 ; bytes:1
gbl_ccpr1h                       EQU	0x00000016 ; bytes:1
gbl_ccp1con                      EQU	0x00000017 ; bytes:1
gbl_rcsta                        EQU	0x00000018 ; bytes:1
gbl_txreg                        EQU	0x00000019 ; bytes:1
gbl_rcreg                        EQU	0x0000001A ; bytes:1
gbl_cmcon                        EQU	0x0000001F ; bytes:1
gbl_option_reg                   EQU	0x00000081 ; bytes:1
gbl_trisa                        EQU	0x00000085 ; bytes:1
gbl_trisb                        EQU	0x00000086 ; bytes:1
gbl_pie1                         EQU	0x0000008C ; bytes:1
gbl_pcon                         EQU	0x0000008E ; bytes:1
gbl_pr2                          EQU	0x00000092 ; bytes:1
gbl_txsta                        EQU	0x00000098 ; bytes:1
gbl_spbrg                        EQU	0x00000099 ; bytes:1
gbl_eedata                       EQU	0x0000009A ; bytes:1
gbl_eeadr                        EQU	0x0000009B ; bytes:1
gbl_eecon1                       EQU	0x0000009C ; bytes:1
gbl_eecon2                       EQU	0x0000009D ; bytes:1
gbl_vrcon                        EQU	0x0000009F ; bytes:1
gbl_LED1                         EQU	0x00000005 ; bit:0
gbl_TRIG_IN                      EQU	0x00000006 ; bit:4
gbl_TRIG_OUT                     EQU	0x00000006 ; bit:3
gbl_LED1_TRIS                    EQU	0x00000085 ; bit:0
gbl_TRIG_IN_TRIS                 EQU	0x00000086 ; bit:4
gbl_TRIG_OUT_TRIS                EQU	0x00000086 ; bit:3
gbl_RFM12_IRQ                    EQU	0x00000006 ; bit:0
gbl_RFM12_SEL                    EQU	0x00000005 ; bit:2
gbl_SCK                          EQU	0x00000005 ; bit:3
gbl_SDO                          EQU	0x00000006 ; bit:1
gbl_SDI                          EQU	0x00000005 ; bit:1
gbl_RFM12_IRQ_TRIS               EQU	0x00000086 ; bit:0
gbl_RFM12_SEL_TRIS               EQU	0x00000085 ; bit:2
gbl_SCK_TRIS                     EQU	0x00000085 ; bit:3
gbl_SDO_TRIS                     EQU	0x00000086 ; bit:1
gbl_SDI_TRIS                     EQU	0x00000085 ; bit:1
gbl_mode                         EQU	0x00000049 ; bytes:1
gbl_rx_state                     EQU	0x0000004A ; bytes:1
gbl_flag                         EQU	0x0000004B ; bytes:1
main_1_buffer                    EQU	0x0000004C ; bytes:32
main_1_i                         EQU	0x0000006C ; bytes:1
main_1_j                         EQU	0x0000006D ; bytes:1
main_1_chksum                    EQU	0x0000006E ; bytes:1
main_1_temp                      EQU	0x0000006F ; bytes:1
main_1_datavari                  EQU	0x00000070 ; bytes:1
CompTempVar613                   EQU	0x00000071 ; bytes:1
gbl_rfm12_conf                   EQU	0x00000020 ; bytes:38
WriteCMD_00000_arg_CMD           EQU	0x0000007B ; bytes:2
CompTempVarRet614                EQU	0x000000A2 ; bytes:2
WriteCMD_00000_1_RESULT          EQU	0x0000007D ; bytes:2
WriteCMD_00000_1_n               EQU	0x000000A0 ; bytes:1
CompTempVar615                   EQU	0x000000A1 ; bytes:1
rfm12_SetB_00013_arg_baud        EQU	0x00000071 ; bytes:2
CompTempVar618                   EQU	0x00000079 ; bytes:1
CompTempVar619                   EQU	0x0000007A ; bytes:1
CompTempVar626                   EQU	0x0000007D ; bytes:1
CompTempVar627                   EQU	0x0000007E ; bytes:1
rfm12_SetF_00015_arg_freq        EQU	0x00000071 ; bytes:2
rfm12_Wait_0001C_1_READY         EQU	0x00000072 ; bit:0
rfm12_Tx_B_00020_arg_data        EQU	0x00000071 ; bytes:1
CompTempVarRet656                EQU	0x00000071 ; bytes:1
delay_ms_00000_arg_del           EQU	0x00000071 ; bytes:1
Int1Context                      EQU	0x0000007F ; bytes:1
Int1BContext                     EQU	0x00000046 ; bytes:3
	ORG 0x00000000
	GOTO	_startup
	ORG 0x00000004
	MOVWF Int1Context
	SWAPF STATUS, W
	BCF STATUS, RP0
	BCF STATUS, RP1
	MOVWF Int1BContext
	SWAPF PCLATH, W
	MOVWF Int1BContext+D'1'
	SWAPF FSR, W
	MOVWF Int1BContext+D'2'
	BCF PCLATH,3
	BCF PCLATH,4
	GOTO	interrupt
	ORG 0x00000010
delay_ms_00000
; { delay_ms ; function begin
	MOVF delay_ms_00000_arg_del, F
	BTFSS STATUS,Z
	GOTO	label1
	RETURN
label1
	MOVLW 0xF9
label2
	NOP
	NOP
	NOP
	NOP
	ADDLW 0xFF
	BTFSS STATUS,Z
	GOTO	label2
	NOP
	NOP
	NOP
	NOP
	NOP
	DECFSZ delay_ms_00000_arg_del, F
	GOTO	label1
	RETURN
; } delay_ms function end

	ORG 0x00000024
WriteCMD_00000
; { WriteCMD ; function begin
	CLRF WriteCMD_00000_1_RESULT
	CLRF WriteCMD_00000_1_RESULT+D'1'
	MOVLW 0x10
	BSF STATUS, RP0
	BCF STATUS, RP1
	MOVWF WriteCMD_00000_1_n
	BCF STATUS, RP0
	BCF gbl_RFM12_SEL,2
label3
	BSF STATUS, RP0
	MOVF WriteCMD_00000_1_n, W
	MOVWF CompTempVar615
	DECF WriteCMD_00000_1_n, F
	MOVF CompTempVar615, F
	BTFSC STATUS,Z
	GOTO	label6
	BTFSS WriteCMD_00000_arg_CMD+D'1',7
	GOTO	label4
	BCF STATUS, RP0
	BSF gbl_SDO,1
	GOTO	label5
label4
	BCF STATUS, RP0
	BCF gbl_SDO,1
label5
	BSF gbl_SCK,3
	BCF STATUS,C
	RLF WriteCMD_00000_1_RESULT, F
	RLF WriteCMD_00000_1_RESULT+D'1', F
	BTFSC gbl_SDI,1
	BSF WriteCMD_00000_1_RESULT,0
	BCF STATUS,C
	RLF WriteCMD_00000_arg_CMD, F
	RLF WriteCMD_00000_arg_CMD+D'1', F
	BCF gbl_SCK,3
	GOTO	label3
label6
	BCF STATUS, RP0
	BSF gbl_RFM12_SEL,2
	MOVF WriteCMD_00000_1_RESULT, W
	BSF STATUS, RP0
	MOVWF CompTempVarRet614
	MOVF WriteCMD_00000_1_RESULT+D'1', W
	MOVWF CompTempVarRet614+D'1'
	RETURN
; } WriteCMD function end

	ORG 0x0000004D
rfm12_Basi_00028
; { rfm12_Basic_Config ; function begin
	MOVLW 0xA0
	MOVWF WriteCMD_00000_arg_CMD
	MOVLW 0x95
	MOVWF WriteCMD_00000_arg_CMD+D'1'
	CALL WriteCMD_00000
	MOVLW 0xAC
	MOVWF WriteCMD_00000_arg_CMD
	MOVLW 0xC2
	MOVWF WriteCMD_00000_arg_CMD+D'1'
	CALL WriteCMD_00000
	CLRF WriteCMD_00000_arg_CMD
	MOVLW 0xE0
	MOVWF WriteCMD_00000_arg_CMD+D'1'
	CALL WriteCMD_00000
	CLRF WriteCMD_00000_arg_CMD
	MOVLW 0xC8
	MOVWF WriteCMD_00000_arg_CMD+D'1'
	CALL WriteCMD_00000
	MOVLW 0x4F
	MOVWF WriteCMD_00000_arg_CMD
	MOVLW 0xC4
	MOVWF WriteCMD_00000_arg_CMD+D'1'
	CALL WriteCMD_00000
	MOVLW 0x03
	MOVWF WriteCMD_00000_arg_CMD
	MOVLW 0x98
	MOVWF WriteCMD_00000_arg_CMD+D'1'
	CALL WriteCMD_00000
	MOVLW 0xE0
	MOVWF WriteCMD_00000_arg_CMD
	MOVLW 0xC0
	MOVWF WriteCMD_00000_arg_CMD+D'1'
	CALL WriteCMD_00000
	RETURN
; } rfm12_Basic_Config function end

	ORG 0x0000006F
goto_quiet_00029
; { goto_quiettime_state ; function begin
	MOVLW 0x04
	BCF STATUS, RP0
	BCF STATUS, RP1
	MOVWF gbl_rfm12_conf
	MOVLW 0x08
	MOVWF WriteCMD_00000_arg_CMD
	MOVLW 0x82
	MOVWF WriteCMD_00000_arg_CMD+D'1'
	CALL WriteCMD_00000
	RETURN
; } goto_quiettime_state function end

	ORG 0x00000079
__div_32_3_00001
; { __div_32_32 ; function begin
	BSF STATUS, RP0
	BCF STATUS, RP1
	CLRF __div_32_3_00001_1_r
	CLRF __div_32_3_00001_1_r+D'1'
	CLRF __div_32_3_00001_1_r+D'2'
	CLRF __div_32_3_00001_1_r+D'3'
	CLRF CompTempVarRet163
	CLRF CompTempVarRet163+D'1'
	CLRF CompTempVarRet163+D'2'
	CLRF CompTempVarRet163+D'3'
	CLRF __div_32_3_00001_1_i
label7
	BTFSC __div_32_3_00001_1_i,5
	RETURN
	BCF STATUS,C
	RLF CompTempVarRet163, F
	RLF CompTempVarRet163+D'1', F
	RLF CompTempVarRet163+D'2', F
	RLF CompTempVarRet163+D'3', F
	RLF __div_32_3_00001_arg_a, F
	RLF __div_32_3_00001_arg_a+D'1', F
	RLF __div_32_3_00001_arg_a+D'2', F
	RLF __div_32_3_00001_arg_a+D'3', F
	RLF __div_32_3_00001_1_r, F
	RLF __div_32_3_00001_1_r+D'1', F
	RLF __div_32_3_00001_1_r+D'2', F
	RLF __div_32_3_00001_1_r+D'3', F
	MOVF __div_32_3_00001_arg_b+D'3', W
	SUBWF __div_32_3_00001_1_r+D'3', W
	BTFSS STATUS,Z
	GOTO	label8
	MOVF __div_32_3_00001_arg_b+D'2', W
	SUBWF __div_32_3_00001_1_r+D'2', W
	BTFSS STATUS,Z
	GOTO	label8
	MOVF __div_32_3_00001_arg_b+D'1', W
	SUBWF __div_32_3_00001_1_r+D'1', W
	BTFSS STATUS,Z
	GOTO	label8
	MOVF __div_32_3_00001_arg_b, W
	SUBWF __div_32_3_00001_1_r, W
label8
	BTFSS STATUS,C
	GOTO	label9
	MOVF __div_32_3_00001_arg_b, W
	SUBWF __div_32_3_00001_1_r, F
	MOVF __div_32_3_00001_arg_b+D'1', W
	BTFSS STATUS,C
	INCFSZ __div_32_3_00001_arg_b+D'1', W
	SUBWF __div_32_3_00001_1_r+D'1', F
	MOVF __div_32_3_00001_arg_b+D'2', W
	BTFSS STATUS,C
	INCFSZ __div_32_3_00001_arg_b+D'2', W
	SUBWF __div_32_3_00001_1_r+D'2', F
	MOVF __div_32_3_00001_arg_b+D'3', W
	BTFSS STATUS,C
	INCFSZ __div_32_3_00001_arg_b+D'3', W
	SUBWF __div_32_3_00001_1_r+D'3', F
	BSF CompTempVarRet163,0
label9
	INCF __div_32_3_00001_1_i, F
	GOTO	label7
; } __div_32_32 function end

	ORG 0x000000B4
__div_16_1_00003
; { __div_16_16 ; function begin
	CLRF __div_16_1_00003_1_r
	CLRF __div_16_1_00003_1_r+D'1'
	BSF STATUS, RP0
	BCF STATUS, RP1
	CLRF CompTempVarRet167
	CLRF CompTempVarRet167+D'1'
	CLRF __div_16_1_00003_1_i
label10
	BTFSC __div_16_1_00003_1_i,4
	RETURN
	BCF STATUS,C
	RLF CompTempVarRet167, F
	RLF CompTempVarRet167+D'1', F
	RLF __div_16_1_00003_arg_a, F
	RLF __div_16_1_00003_arg_a+D'1', F
	RLF __div_16_1_00003_1_r, F
	RLF __div_16_1_00003_1_r+D'1', F
	MOVF __div_16_1_00003_arg_b+D'1', W
	SUBWF __div_16_1_00003_1_r+D'1', W
	BTFSS STATUS,Z
	GOTO	label11
	MOVF __div_16_1_00003_arg_b, W
	SUBWF __div_16_1_00003_1_r, W
label11
	BTFSS STATUS,C
	GOTO	label12
	MOVF __div_16_1_00003_arg_b, W
	SUBWF __div_16_1_00003_1_r, F
	MOVF __div_16_1_00003_arg_b+D'1', W
	BTFSS STATUS,C
	DECF __div_16_1_00003_1_r+D'1', F
	SUBWF __div_16_1_00003_1_r+D'1', F
	BSF CompTempVarRet167,0
label12
	INCF __div_16_1_00003_1_i, F
	GOTO	label10
; } __div_16_16 function end

	ORG 0x000000D5
Init_00000
; { Init ; function begin
	BSF STATUS, RP0
	BCF STATUS, RP1
	BCF gbl_RFM12_SEL_TRIS,2
	BCF STATUS, RP0
	BSF gbl_RFM12_SEL,2
	BSF STATUS, RP0
	BCF gbl_SCK_TRIS,3
	BCF STATUS, RP0
	BCF gbl_SCK,3
	BSF STATUS, RP0
	BCF gbl_SDO_TRIS,1
	BCF STATUS, RP0
	BCF gbl_SDO,1
	BSF STATUS, RP0
	BSF gbl_RFM12_IRQ_TRIS,0
	BSF gbl_SDI_TRIS,1
	BCF STATUS, RP0
	CLRF gbl_rfm12_conf+D'34'
	MOVLW 0xC8
	MOVWF delay_ms_00000_arg_del
	CALL delay_ms_00000
	RETURN
; } Init function end

	ORG 0x000000EB
rfm12_Wait_0001C
; { rfm12_WaitReady ; function begin
	BCF rfm12_Wait_0001C_1_READY,0
label13
	BTFSC rfm12_Wait_0001C_1_READY,0
	RETURN
	BCF STATUS, RP0
	BCF STATUS, RP1
	BCF gbl_RFM12_SEL,2
	BCF gbl_SDO,1
	BSF gbl_SCK,3
	BTFSC gbl_SDI,1
	BSF rfm12_Wait_0001C_1_READY,0
	BCF gbl_SCK,3
	BSF gbl_RFM12_SEL,2
	GOTO	label13
; } rfm12_WaitReady function end

	ORG 0x000000F8
rfm12_SetF_00015
; { rfm12_SetFreq ; function begin
	MOVLW 0x60
	SUBWF rfm12_SetF_00015_arg_freq, W
	MOVF rfm12_SetF_00015_arg_freq+D'1', W
	BTFSC STATUS,C
	GOTO	label14
	BTFSS STATUS,Z
	GOTO	label14
	MOVLW 0x60
	MOVWF rfm12_SetF_00015_arg_freq
	CLRF rfm12_SetF_00015_arg_freq+D'1'
	GOTO	label16
label14
	MOVF rfm12_SetF_00015_arg_freq+D'1', W
	SUBLW 0x0F
	BTFSS STATUS,Z
	GOTO	label15
	MOVF rfm12_SetF_00015_arg_freq, W
	SUBLW 0x3F
label15
	BTFSC STATUS,C
	GOTO	label16
	MOVLW 0x3F
	MOVWF rfm12_SetF_00015_arg_freq
	MOVLW 0x0F
	MOVWF rfm12_SetF_00015_arg_freq+D'1'
label16
	MOVF rfm12_SetF_00015_arg_freq, W
	IORLW 0x00
	MOVWF WriteCMD_00000_arg_CMD
	MOVF rfm12_SetF_00015_arg_freq+D'1', W
	IORLW 0xA0
	MOVWF WriteCMD_00000_arg_CMD+D'1'
	CALL WriteCMD_00000
	RETURN
; } rfm12_SetFreq function end

	ORG 0x00000117
rfm12_SetB_00013
; { rfm12_SetBaud ; function begin
	MOVLW 0x02
	SUBWF rfm12_SetB_00013_arg_baud+D'1', W
	BTFSS STATUS,Z
	GOTO	label17
	MOVLW 0x98
	SUBWF rfm12_SetB_00013_arg_baud, W
label17
	BTFSC STATUS,C
	GOTO	label18
	MOVLW 0x98
	MOVWF rfm12_SetB_00013_arg_baud
	MOVLW 0x02
	MOVWF rfm12_SetB_00013_arg_baud+D'1'
label18
	MOVLW 0x15
	SUBWF rfm12_SetB_00013_arg_baud+D'1', W
	BTFSS STATUS,Z
	GOTO	label19
	MOVLW 0x18
	SUBWF rfm12_SetB_00013_arg_baud, W
label19
	BTFSC STATUS,C
	GOTO	label20
	MOVLW 0x60
	MOVWF __div_16_1_00003_arg_a
	MOVLW 0xA8
	MOVWF __div_16_1_00003_arg_a+D'1'
	MOVF rfm12_SetB_00013_arg_baud, W
	MOVWF __div_16_1_00003_arg_b
	MOVF rfm12_SetB_00013_arg_baud+D'1', W
	MOVWF __div_16_1_00003_arg_b+D'1'
	CALL __div_16_1_00003
	MOVF CompTempVarRet167, W
	MOVWF CompTempVar618
	MOVF CompTempVarRet167+D'1', W
	MOVWF CompTempVar619
	MOVF CompTempVar618, W
	IORLW 0x80
	MOVWF WriteCMD_00000_arg_CMD
	MOVF CompTempVar619, W
	IORLW 0xC6
	MOVWF WriteCMD_00000_arg_CMD+D'1'
	CALL WriteCMD_00000
	RETURN
label20
	MOVLW 0xFC
	MOVWF __div_32_3_00001_arg_a
	MOVLW 0x42
	MOVWF __div_32_3_00001_arg_a+D'1'
	MOVLW 0x05
	MOVWF __div_32_3_00001_arg_a+D'2'
	MOVLW 0x00
	MOVWF __div_32_3_00001_arg_a+D'3'
	MOVF rfm12_SetB_00013_arg_baud, W
	MOVWF __div_32_3_00001_arg_b
	MOVF rfm12_SetB_00013_arg_baud+D'1', W
	MOVWF __div_32_3_00001_arg_b+D'1'
	CLRF __div_32_3_00001_arg_b+D'2'
	CLRF __div_32_3_00001_arg_b+D'3'
	CALL __div_32_3_00001
	MOVF CompTempVarRet163, W
	MOVWF CompTempVar626
	MOVF CompTempVarRet163+D'1', W
	MOVWF CompTempVar627
	MOVF CompTempVar626, W
	IORLW 0x00
	MOVWF WriteCMD_00000_arg_CMD
	MOVF CompTempVar627, W
	IORLW 0xC6
	MOVWF WriteCMD_00000_arg_CMD+D'1'
	CALL WriteCMD_00000
	RETURN
; } rfm12_SetBaud function end

	ORG 0x0000015B
rfm12_Init_00012
; { rfm12_Init_915 ; function begin
	CALL Init_00000
	MOVLW 0xF7
	MOVWF WriteCMD_00000_arg_CMD
	MOVLW 0x80
	MOVWF WriteCMD_00000_arg_CMD+D'1'
	CALL WriteCMD_00000
	CALL rfm12_Basi_00028
	CALL goto_quiet_00029
	RETURN
; } rfm12_Init_915 function end

	ORG 0x00000164
goto_trans_0002A
; { goto_transmitting_state ; function begin
	MOVLW 0x02
	BCF STATUS, RP0
	BCF STATUS, RP1
	MOVWF gbl_rfm12_conf
	MOVLW 0x20
	MOVWF WriteCMD_00000_arg_CMD
	MOVLW 0x82
	MOVWF WriteCMD_00000_arg_CMD+D'1'
	CALL WriteCMD_00000
	RETURN
; } goto_transmitting_state function end

	ORG 0x0000016E
goto_recei_0002B
; { goto_receiving_state ; function begin
	MOVLW 0x03
	BCF STATUS, RP0
	BCF STATUS, RP1
	MOVWF gbl_rfm12_conf
	MOVLW 0x80
	MOVWF WriteCMD_00000_arg_CMD
	MOVLW 0x82
	MOVWF WriteCMD_00000_arg_CMD+D'1'
	CALL WriteCMD_00000
	RETURN
; } goto_receiving_state function end

	ORG 0x00000178
rfm12_Tx_B_00020
; { rfm12_Tx_Byte ; function begin
	CALL rfm12_Wait_0001C
	MOVF rfm12_Tx_B_00020_arg_data, W
	IORLW 0x00
	MOVWF WriteCMD_00000_arg_CMD
	MOVLW 0xB8
	MOVWF WriteCMD_00000_arg_CMD+D'1'
	CALL WriteCMD_00000
	RETURN
; } rfm12_Tx_Byte function end

	ORG 0x00000180
rfm12_Rese_00023
; { rfm12_ResetFifo ; function begin
	MOVLW 0x01
	MOVWF WriteCMD_00000_arg_CMD
	MOVLW 0xCA
	MOVWF WriteCMD_00000_arg_CMD+D'1'
	CALL WriteCMD_00000
	MOVLW 0x83
	MOVWF WriteCMD_00000_arg_CMD
	MOVLW 0xCA
	MOVWF WriteCMD_00000_arg_CMD+D'1'
	CALL WriteCMD_00000
	RETURN
; } rfm12_ResetFifo function end

	ORG 0x0000018B
rfm12_Read_00024
; { rfm12_ReadFifo ; function begin
	CALL rfm12_Wait_0001C
	CLRF WriteCMD_00000_arg_CMD
	MOVLW 0xB0
	MOVWF WriteCMD_00000_arg_CMD+D'1'
	CALL WriteCMD_00000
	MOVF CompTempVarRet614, W
	MOVWF CompTempVarRet656
	RETURN
; } rfm12_ReadFifo function end

	ORG 0x00000193
rfm12_Enab_00018
; { rfm12_EnableRx ; function begin
	CALL goto_recei_0002B
	RETURN
; } rfm12_EnableRx function end

	ORG 0x00000195
rfm12_Enab_00017
; { rfm12_EnableTx ; function begin
	CALL goto_trans_0002A
	RETURN
; } rfm12_EnableTx function end

	ORG 0x00000197
rfm12_Disa_0001A
; { rfm12_DisableRx ; function begin
	CALL goto_quiet_00029
	RETURN
; } rfm12_DisableRx function end

	ORG 0x00000199
rfm12_Disa_00019
; { rfm12_DisableTx ; function begin
	CALL goto_quiet_00029
	RETURN
; } rfm12_DisableTx function end

	ORG 0x0000019B
init_00000
; { init ; function begin
	MOVLW 0x07
	BCF STATUS, RP0
	BCF STATUS, RP1
	MOVWF gbl_cmcon
	BSF STATUS, RP0
	BCF gbl_LED1_TRIS,0
	BCF STATUS, RP0
	BCF gbl_LED1,0
	BSF STATUS, RP0
	BCF gbl_option_reg,7
	BCF gbl_option_reg,6
	BSF gbl_intcon,4
	BSF gbl_intcon,7
	CALL rfm12_Init_00012
	MOVLW 0x80
	MOVWF rfm12_SetB_00013_arg_baud
	MOVLW 0x25
	MOVWF rfm12_SetB_00013_arg_baud+D'1'
	CALL rfm12_SetB_00013
	MOVLW 0xD0
	MOVWF rfm12_SetF_00015_arg_freq
	MOVLW 0x07
	MOVWF rfm12_SetF_00015_arg_freq+D'1'
	CALL rfm12_SetF_00015
	RETURN
; } init function end

	ORG 0x000001B4
main
; { main ; function begin
	BCF STATUS, RP0
	BCF STATUS, RP1
	CLRF main_1_i
	CLRF main_1_j
	CLRF main_1_chksum
	CLRF main_1_temp
	MOVLW 0x31
	MOVWF main_1_datavari
	MOVLW 0xB8
	MOVWF delay_ms_00000_arg_del
	CALL delay_ms_00000
	CALL init_00000
	MOVLW 0xE0
	MOVWF WriteCMD_00000_arg_CMD
	MOVLW 0xC0
	MOVWF WriteCMD_00000_arg_CMD+D'1'
	CALL WriteCMD_00000
	BCF STATUS, RP0
	BTFSS gbl_TRIG_IN,4
	GOTO	label21
	CLRF gbl_mode
	GOTO	label22
label21
	MOVLW 0x01
	MOVWF gbl_mode
label22
	MOVF gbl_mode, W
	XORLW 0x00
	BTFSC STATUS,Z
	GOTO	label23
	XORLW 0x01
	BTFSC STATUS,Z
	GOTO	label24
	GOTO	label25
label23
	CALL rfm12_Rese_00023
	CALL rfm12_Enab_00018
	BCF STATUS, RP0
	BSF gbl_LED1,0
	MOVLW 0xFA
	MOVWF delay_ms_00000_arg_del
	CALL delay_ms_00000
	BCF gbl_LED1,0
	MOVLW 0xFA
	MOVWF delay_ms_00000_arg_del
	CALL delay_ms_00000
	BSF gbl_LED1,0
	MOVLW 0xFA
	MOVWF delay_ms_00000_arg_del
	CALL delay_ms_00000
	BCF gbl_LED1,0
	GOTO	label25
label24
	BSF gbl_LED1,0
	MOVLW 0xF4
	MOVWF delay_ms_00000_arg_del
	CALL delay_ms_00000
	BCF gbl_LED1,0
label25
	BCF STATUS, RP0
	MOVF gbl_mode, W
	XORLW 0x00
	BTFSC STATUS,Z
	GOTO	label26
	XORLW 0x01
	BTFSC STATUS,Z
	GOTO	label32
	GOTO	label25
label26
	CALL rfm12_Read_00024
	MOVF CompTempVarRet656, W
	BCF STATUS, RP0
	MOVWF main_1_temp
	MOVF main_1_temp, W
	XORLW 0x30
	BTFSS STATUS,Z
	GOTO	label27
	CLRF main_1_i
	GOTO	label28
label27
	MOVLW 0x04
	SUBWF main_1_i, W
	BTFSC STATUS,C
	GOTO	label28
	BCF	STATUS,IRP
	MOVLW LOW(main_1_buffer+D'0')
	MOVWF FSR
	MOVF main_1_i, W
	INCF main_1_i, F
	ADDWF FSR, F
	MOVF main_1_temp, W
	MOVWF INDF
label28
	MOVF main_1_i, W
	XORLW 0x04
	BTFSS STATUS,Z
	GOTO	label26
	CLRF main_1_i
	CALL rfm12_Disa_0001A
	MOVLW 0x01
	MOVWF WriteCMD_00000_arg_CMD
	MOVLW 0xCA
	MOVWF WriteCMD_00000_arg_CMD+D'1'
	CALL WriteCMD_00000
	BCF STATUS, RP0
	CLRF main_1_chksum
	CLRF main_1_j
label29
	MOVLW 0x03
	SUBWF main_1_j, W
	BTFSC STATUS,C
	GOTO	label30
	BCF	STATUS,IRP
	MOVLW LOW(main_1_buffer+D'0')
	MOVWF FSR
	MOVF main_1_j, W
	ADDWF FSR, F
	MOVF INDF, W
	ADDWF main_1_chksum, F
	INCF main_1_j, F
	GOTO	label29
label30
	MOVF main_1_buffer+D'3', W
	XORWF main_1_chksum, W
	BTFSS STATUS,Z
	GOTO	label31
	MOVLW 0x05
	MOVWF delay_ms_00000_arg_del
	CALL delay_ms_00000
	BSF gbl_LED1,0
	MOVLW 0x05
	MOVWF delay_ms_00000_arg_del
	CALL delay_ms_00000
	BCF gbl_LED1,0
label31
	MOVLW 0x83
	MOVWF WriteCMD_00000_arg_CMD
	MOVLW 0xCA
	MOVWF WriteCMD_00000_arg_CMD+D'1'
	CALL WriteCMD_00000
	CALL rfm12_Enab_00018
	GOTO	label26
label32
	BSF gbl_LED1,0
	BSF gbl_LED1,0
	MOVLW 0x03
	MOVWF delay_ms_00000_arg_del
	CALL delay_ms_00000
	BCF gbl_LED1,0
	MOVLW 0x03
	MOVWF delay_ms_00000_arg_del
	CALL delay_ms_00000
	CLRF main_1_chksum
	CLRF CompTempVar613
	BTFSS gbl_LED1,0
	INCF CompTempVar613, F
	BTFSC CompTempVar613,0
	BSF gbl_LED1,0
	BTFSS CompTempVar613,0
	BCF gbl_LED1,0
	CALL rfm12_Enab_00017
	MOVLW 0xAA
	MOVWF rfm12_Tx_B_00020_arg_data
	CALL rfm12_Tx_B_00020
	MOVLW 0xAA
	MOVWF rfm12_Tx_B_00020_arg_data
	CALL rfm12_Tx_B_00020
	MOVLW 0xAA
	MOVWF rfm12_Tx_B_00020_arg_data
	CALL rfm12_Tx_B_00020
	MOVLW 0xAA
	MOVWF rfm12_Tx_B_00020_arg_data
	CALL rfm12_Tx_B_00020
	MOVLW 0x2D
	MOVWF rfm12_Tx_B_00020_arg_data
	CALL rfm12_Tx_B_00020
	MOVLW 0xD4
	MOVWF rfm12_Tx_B_00020_arg_data
	CALL rfm12_Tx_B_00020
	MOVLW 0x30
	MOVWF rfm12_Tx_B_00020_arg_data
	CALL rfm12_Tx_B_00020
	MOVLW 0x31
	MOVWF rfm12_Tx_B_00020_arg_data
	CALL rfm12_Tx_B_00020
	MOVLW 0x31
	BCF STATUS, RP0
	ADDWF main_1_chksum, F
	MOVLW 0x32
	MOVWF rfm12_Tx_B_00020_arg_data
	CALL rfm12_Tx_B_00020
	MOVLW 0x32
	BCF STATUS, RP0
	ADDWF main_1_chksum, F
	MOVLW 0x33
	MOVWF rfm12_Tx_B_00020_arg_data
	CALL rfm12_Tx_B_00020
	MOVLW 0x33
	BCF STATUS, RP0
	ADDWF main_1_chksum, F
	MOVF main_1_chksum, W
	MOVWF rfm12_Tx_B_00020_arg_data
	CALL rfm12_Tx_B_00020
	MOVLW 0x3F
	MOVWF rfm12_Tx_B_00020_arg_data
	CALL rfm12_Tx_B_00020
	MOVLW 0xAA
	MOVWF rfm12_Tx_B_00020_arg_data
	CALL rfm12_Tx_B_00020
	MOVLW 0xAA
	MOVWF rfm12_Tx_B_00020_arg_data
	CALL rfm12_Tx_B_00020
	CALL rfm12_Disa_00019
	GOTO	label25
; } main function end

	ORG 0x0000027E
_startup
	BCF STATUS, RP0
	BCF STATUS, RP1
	CLRF gbl_mode
	CLRF gbl_rx_state
	BCF PCLATH,3
	BCF PCLATH,4
	GOTO	main
	ORG 0x00000285
interrupt
; { interrupt ; function begin
	BTFSS gbl_intcon,1
	GOTO	label34
	MOVLW 0x01
	BCF STATUS, RP0
	BCF STATUS, RP1
	MOVWF gbl_flag
	BCF gbl_intcon,1
label34
	BCF STATUS, RP0
	BCF STATUS, RP1
	SWAPF Int1BContext+D'2', W
	MOVWF FSR
	SWAPF Int1BContext+D'1', W
	MOVWF PCLATH
	SWAPF Int1BContext, W
	MOVWF STATUS
	SWAPF Int1Context, F
	SWAPF Int1Context, W
	RETFIE
; } interrupt function end

	ORG 0x00002007
	DW 0x3F10
	END
