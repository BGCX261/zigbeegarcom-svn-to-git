;/////////////////////////////////////////////////////////////////////////////////
;// Code Generator: BoostC Compiler - http://www.sourceboost.com
;// Version       : 6.95
;// License Type  : Lite License (Unregistered)
;// Limitations   : PIC12,PIC16 max code size:2048 words, max RAM banks:2, Non commercial use only
;/////////////////////////////////////////////////////////////////////////////////

	include "P16F628A.inc"
; Heap block 0, size:96 (0x000000A0 - 0x000000FF)
__HEAP_BLOCK0_BANK               EQU	0x00000001
__HEAP_BLOCK0_START_OFFSET       EQU	0x00000020
__HEAP_BLOCK0_END_OFFSET         EQU	0x0000007F
; Heap block 1, size:48 (0x00000040 - 0x0000006F)
__HEAP_BLOCK1_BANK               EQU	0x00000000
__HEAP_BLOCK1_START_OFFSET       EQU	0x00000040
__HEAP_BLOCK1_END_OFFSET         EQU	0x0000006F
; Heap block 2, size:0 (0x00000000 - 0x00000000)
__HEAP_BLOCK2_BANK               EQU	0x00000000
__HEAP_BLOCK2_START_OFFSET       EQU	0x00000000
__HEAP_BLOCK2_END_OFFSET         EQU	0x00000000
; Heap block 3, size:0 (0x00000000 - 0x00000000)
__HEAP_BLOCK3_BANK               EQU	0x00000000
__HEAP_BLOCK3_START_OFFSET       EQU	0x00000000
__HEAP_BLOCK3_END_OFFSET         EQU	0x00000000
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
gbl_RFM12_CS                     EQU	0x00000005 ; bit:2
gbl_SCK                          EQU	0x00000005 ; bit:3
gbl_SDO                          EQU	0x00000006 ; bit:1
gbl_SDI                          EQU	0x00000005 ; bit:1
gbl_RFM12_nIRQ_TRIS              EQU	0x00000086 ; bit:0
gbl_RFM12_CS_TRIS                EQU	0x00000085 ; bit:2
gbl_SCK_TRIS                     EQU	0x00000085 ; bit:3
gbl_SDO_TRIS                     EQU	0x00000086 ; bit:1
gbl_SDI_TRIS                     EQU	0x00000085 ; bit:1
gbl_t                            EQU	0x00000020 ; bytes:2
WriteCMD_00000_arg_CMD           EQU	0x00000038 ; bytes:2
CompTempVarRet579                EQU	0x0000003E ; bytes:2
WriteCMD_00000_1_RESULT          EQU	0x0000003A ; bytes:2
WriteCMD_00000_1_n               EQU	0x0000003C ; bytes:1
CompTempVar580                   EQU	0x0000003D ; bytes:1
WaitReady_00000_1_timeout        EQU	0x00000038 ; bytes:4
WaitReady_00000_1_READY          EQU	0x0000003C ; bit:0
CompTempVarRet581                EQU	0x00000038 ; bytes:1
main_1_i                         EQU	0x00000022 ; bytes:1
main_1_j                         EQU	0x00000023 ; bytes:1
main_1_chksum                    EQU	0x00000024 ; bytes:2
main_1_buffer                    EQU	0x00000026 ; bytes:17
main_1_temp                      EQU	0x00000037 ; bytes:1
delay_ms_00000_arg_del           EQU	0x00000038 ; bytes:1
	ORG 0x00000000
	GOTO	_startup
	ORG 0x00000004
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

	ORG 0x00000018
Write1_00000
; { Write1 ; function begin
	BCF STATUS, RP0
	BCF STATUS, RP1
	BSF gbl_SDO,1
	BCF gbl_SCK,3
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	BSF gbl_SCK,3
	NOP
	RETURN
; } Write1 function end

	ORG 0x0000002F
Write0_00000
; { Write0 ; function begin
	BCF STATUS, RP0
	BCF STATUS, RP1
	BCF gbl_SDO,1
	BCF gbl_SCK,3
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	BSF gbl_SCK,3
	NOP
	RETURN
; } Write0 function end

	ORG 0x00000046
WriteCMD_00000
; { WriteCMD ; function begin
	CLRF WriteCMD_00000_1_RESULT
	CLRF WriteCMD_00000_1_RESULT+D'1'
	MOVLW 0x10
	MOVWF WriteCMD_00000_1_n
	BCF gbl_SCK,3
	BCF gbl_RFM12_CS,2
label3
	MOVF WriteCMD_00000_1_n, W
	MOVWF CompTempVar580
	DECF WriteCMD_00000_1_n, F
	MOVF CompTempVar580, F
	BTFSC STATUS,Z
	GOTO	label6
	BTFSS WriteCMD_00000_arg_CMD+D'1',7
	GOTO	label4
	CALL Write1_00000
	GOTO	label5
label4
	CALL Write0_00000
label5
	BCF STATUS,C
	RLF WriteCMD_00000_1_RESULT, F
	RLF WriteCMD_00000_1_RESULT+D'1', F
	BTFSC gbl_SDI,1
	BSF WriteCMD_00000_1_RESULT,0
	BCF STATUS,C
	RLF WriteCMD_00000_arg_CMD, F
	RLF WriteCMD_00000_arg_CMD+D'1', F
	GOTO	label3
label6
	BCF gbl_SCK,3
	BSF gbl_RFM12_CS,2
	MOVF WriteCMD_00000_1_RESULT, W
	MOVWF CompTempVarRet579
	MOVF WriteCMD_00000_1_RESULT+D'1', W
	MOVWF CompTempVarRet579+D'1'
	RETURN
; } WriteCMD function end

	ORG 0x00000067
WaitReady_00000
; { WaitReady ; function begin
	BCF STATUS, RP0
	BCF STATUS, RP1
	CLRF WaitReady_00000_1_timeout
	CLRF WaitReady_00000_1_timeout+D'1'
	CLRF WaitReady_00000_1_timeout+D'2'
	CLRF WaitReady_00000_1_timeout+D'3'
	BCF WaitReady_00000_1_READY,0
label7
	BTFSC WaitReady_00000_1_READY,0
	RETURN
	BCF gbl_SCK,3
	BCF gbl_RFM12_CS,2
	CALL Write0_00000
	BTFSC gbl_SDI,1
	BSF WaitReady_00000_1_READY,0
	BCF gbl_SCK,3
	BCF gbl_SDO,1
	BSF gbl_RFM12_CS,2
	GOTO	label7
; } WaitReady function end

	ORG 0x00000079
init_00000
; { init ; function begin
	MOVLW 0x07
	BCF STATUS, RP0
	BCF STATUS, RP1
	MOVWF gbl_cmcon
	BSF STATUS, RP0
	BCF gbl_option_reg,7
	BCF gbl_option_reg,6
	BCF gbl_LED1_TRIS,0
	BCF STATUS, RP0
	BCF gbl_LED1,0
	BSF STATUS, RP0
	BCF gbl_RFM12_CS_TRIS,2
	BCF STATUS, RP0
	BSF gbl_RFM12_CS,2
	BSF STATUS, RP0
	BCF gbl_SCK_TRIS,3
	BCF STATUS, RP0
	BCF gbl_SCK,3
	BSF STATUS, RP0
	BCF gbl_SDO_TRIS,1
	BCF STATUS, RP0
	BCF gbl_SDO,1
	BSF STATUS, RP0
	BSF gbl_RFM12_nIRQ_TRIS,0
	BSF gbl_SDI_TRIS,1
	MOVLW 0xF4
	BCF STATUS, RP0
	MOVWF delay_ms_00000_arg_del
	CALL delay_ms_00000
	MOVLW 0xF7
	MOVWF WriteCMD_00000_arg_CMD
	MOVLW 0x80
	MOVWF WriteCMD_00000_arg_CMD+D'1'
	CALL WriteCMD_00000
	MOVLW 0xD0
	MOVWF WriteCMD_00000_arg_CMD
	MOVLW 0xA7
	MOVWF WriteCMD_00000_arg_CMD+D'1'
	CALL WriteCMD_00000
	MOVLW 0x23
	MOVWF WriteCMD_00000_arg_CMD
	MOVLW 0xC6
	MOVWF WriteCMD_00000_arg_CMD+D'1'
	CALL WriteCMD_00000
	MOVLW 0x2C
	MOVWF WriteCMD_00000_arg_CMD
	MOVLW 0xC2
	MOVWF WriteCMD_00000_arg_CMD+D'1'
	CALL WriteCMD_00000
	MOVLW 0xF7
	MOVWF WriteCMD_00000_arg_CMD
	MOVLW 0xC4
	MOVWF WriteCMD_00000_arg_CMD+D'1'
	CALL WriteCMD_00000
	MOVLW 0xA0
	MOVWF WriteCMD_00000_arg_CMD
	MOVLW 0x96
	MOVWF WriteCMD_00000_arg_CMD+D'1'
	CALL WriteCMD_00000
	MOVLW 0x81
	MOVWF WriteCMD_00000_arg_CMD
	MOVLW 0xCA
	MOVWF WriteCMD_00000_arg_CMD+D'1'
	CALL WriteCMD_00000
	CLRF WriteCMD_00000_arg_CMD
	MOVLW 0xE0
	MOVWF WriteCMD_00000_arg_CMD+D'1'
	CALL WriteCMD_00000
	MOVLW 0x0E
	MOVWF WriteCMD_00000_arg_CMD
	MOVLW 0xC8
	MOVWF WriteCMD_00000_arg_CMD+D'1'
	CALL WriteCMD_00000
	CLRF WriteCMD_00000_arg_CMD
	MOVLW 0xC0
	MOVWF WriteCMD_00000_arg_CMD+D'1'
	CALL WriteCMD_00000
	MOVLW 0x80
	MOVWF WriteCMD_00000_arg_CMD
	MOVLW 0x82
	MOVWF WriteCMD_00000_arg_CMD+D'1'
	CALL WriteCMD_00000
	RETURN
; } init function end

	ORG 0x000000CC
ReadFifo_00000
; { ReadFifo ; function begin
	CALL WaitReady_00000
	CLRF WriteCMD_00000_arg_CMD
	MOVLW 0xB0
	MOVWF WriteCMD_00000_arg_CMD+D'1'
	CALL WriteCMD_00000
	MOVF CompTempVarRet579, W
	MOVWF CompTempVarRet581
	RETURN
; } ReadFifo function end

	ORG 0x000000D4
main
; { main ; function begin
	BCF STATUS, RP0
	BCF STATUS, RP1
	CLRF main_1_i
	CLRF main_1_j
	CLRF main_1_chksum
	CLRF main_1_chksum+D'1'
	CLRF main_1_temp
	CALL init_00000
	BSF gbl_LED1,0
	MOVLW 0xF4
	MOVWF delay_ms_00000_arg_del
	CALL delay_ms_00000
	BCF gbl_LED1,0
	MOVLW 0xF4
	MOVWF delay_ms_00000_arg_del
	CALL delay_ms_00000
	BSF gbl_LED1,0
	MOVLW 0xF4
	MOVWF delay_ms_00000_arg_del
	CALL delay_ms_00000
	BCF gbl_LED1,0
	MOVLW 0x81
	MOVWF WriteCMD_00000_arg_CMD
	MOVLW 0xCA
	MOVWF WriteCMD_00000_arg_CMD+D'1'
	CALL WriteCMD_00000
	MOVLW 0x83
	MOVWF WriteCMD_00000_arg_CMD
	MOVLW 0xCA
	MOVWF WriteCMD_00000_arg_CMD+D'1'
	CALL WriteCMD_00000
label8
	BTFSC gbl_RFM12_IRQ,0
	GOTO	label8
	CALL ReadFifo_00000
	MOVF CompTempVarRet581, W
	MOVWF main_1_temp
	BCF	STATUS,IRP
	MOVLW LOW(main_1_buffer+D'0')
	MOVWF FSR
	MOVF main_1_i, W
	INCF main_1_i, F
	ADDWF FSR, F
	MOVF main_1_temp, W
	MOVWF INDF
	MOVF main_1_temp, F
	BTFSC STATUS,Z
	GOTO	label12
	CLRF gbl_t
	CLRF gbl_t+D'1'
label9
	MOVLW 0x04
	SUBWF gbl_t, W
	MOVF gbl_t+D'1', W
	BTFSC STATUS,C
	GOTO	label10
	BTFSC STATUS,Z
	GOTO	label11
label10
	BTFSS gbl_t+D'1',7
	GOTO	label12
label11
	BSF gbl_LED1,0
	MOVLW 0x19
	MOVWF delay_ms_00000_arg_del
	CALL delay_ms_00000
	BCF gbl_LED1,0
	MOVLW 0x19
	MOVWF delay_ms_00000_arg_del
	CALL delay_ms_00000
	INCF gbl_t, F
	BTFSC STATUS,Z
	INCF gbl_t+D'1', F
	GOTO	label9
label12
	MOVF main_1_i, W
	XORLW 0x11
	BTFSS STATUS,Z
	GOTO	label8
	CLRF main_1_i
	MOVLW 0x81
	MOVWF WriteCMD_00000_arg_CMD
	MOVLW 0xCA
	MOVWF WriteCMD_00000_arg_CMD+D'1'
	CALL WriteCMD_00000
	CLRF main_1_chksum
	CLRF main_1_chksum+D'1'
	CLRF main_1_j
label13
	MOVLW 0x10
	SUBWF main_1_j, W
	BTFSC STATUS,C
	GOTO	label14
	BCF	STATUS,IRP
	MOVLW LOW(main_1_buffer+D'0')
	MOVWF FSR
	MOVF main_1_j, W
	ADDWF FSR, F
	MOVF INDF, W
	ADDWF main_1_chksum, F
	BTFSC STATUS,C
	INCF main_1_chksum+D'1', F
	INCF main_1_j, F
	GOTO	label13
label14
	CLRF main_1_chksum+D'1'
	MOVF main_1_buffer+D'16', W
	XORWF main_1_chksum, W
	BTFSC STATUS,Z
	MOVF main_1_chksum+D'1', W
	BTFSS STATUS,Z
	GOTO	label18
	MOVF main_1_buffer+D'16', F
	BTFSC STATUS,Z
	GOTO	label18
	CLRF gbl_t
	CLRF gbl_t+D'1'
label15
	MOVLW 0x04
	SUBWF gbl_t, W
	MOVF gbl_t+D'1', W
	BTFSC STATUS,C
	GOTO	label16
	BTFSC STATUS,Z
	GOTO	label17
label16
	BTFSS gbl_t+D'1',7
	GOTO	label18
label17
	BSF gbl_LED1,0
	MOVLW 0x19
	MOVWF delay_ms_00000_arg_del
	CALL delay_ms_00000
	BCF gbl_LED1,0
	MOVLW 0x19
	MOVWF delay_ms_00000_arg_del
	CALL delay_ms_00000
	INCF gbl_t, F
	BTFSC STATUS,Z
	INCF gbl_t+D'1', F
	GOTO	label15
label18
	MOVLW 0x81
	MOVWF WriteCMD_00000_arg_CMD
	MOVLW 0xCA
	MOVWF WriteCMD_00000_arg_CMD+D'1'
	CALL WriteCMD_00000
	MOVLW 0x83
	MOVWF WriteCMD_00000_arg_CMD
	MOVLW 0xCA
	MOVWF WriteCMD_00000_arg_CMD+D'1'
	CALL WriteCMD_00000
	GOTO	label8
; } main function end

	ORG 0x00000162
_startup
	BCF STATUS, RP0
	BCF STATUS, RP1
	CLRF gbl_t
	CLRF gbl_t+D'1'
	BCF PCLATH,3
	BCF PCLATH,4
	GOTO	main
	ORG 0x00002007
	DW 0x3F10
	END
