#define opc_nop		0x00
#define opc_aconst_null		0x01
#define opc_iconst_m1		0x02
#define opc_iconst_0		0x03
#define opc_iconst_1		0x04
#define opc_iconst_2		0x05
#define opc_iconst_3		0x06
#define opc_iconst_4		0x07
#define opc_iconst_5		0x08
#define opc_lconst_0		0x09
#define opc_lconst_1		0x0a
#define opc_fconst_0		0x0b
#define opc_fconst_1		0x0c
#define opc_fconst_2		0x0d
#define opc_dconst_0		0x0e
#define opc_dconst_1		0x0f
#define opc_bipush		0x10
#define opc_sipush		0x11
#define opc_ldc		0x12
#define opc_ldc_w		0x13
#define opc_ldc2_w		0x14
#define opc_iload		0x15
#define opc_lload		0x16
#define opc_fload		0x17
#define opc_dload		0x18
#define opc_aload		0x19
#define opc_iload_0		0x1a
#define opc_iload_1		0x1b
#define opc_iload_2		0x1c
#define opc_iload_3		0x1d
#define opc_lload_0		0x1e
#define opc_lload_1		0x1f
#define opc_lload_2		0x20
#define opc_lload_3		0x21
#define opc_fload_0		0x22
#define opc_fload_1		0x23
#define opc_fload_2		0x24
#define opc_fload_3		0x25
#define opc_dload_0		0x26
#define opc_dload_1		0x27
#define opc_dload_2		0x28
#define opc_dload_3		0x29
#define opc_aload_0		0x2a
#define opc_aload_1		0x2b
#define opc_aload_2		0x2c
#define opc_aload_3		0x2d
#define opc_iaload		0x2e
#define opc_laload		0x2f
#define opc_faload		0x30
#define opc_daload		0x31
#define opc_aaload		0x32
#define opc_baload		0x33
#define opc_caload		0x34
#define opc_saload		0x35
#define opc_istore		0x36
#define opc_lstore		0x37
#define opc_fstore		0x38
#define opc_dstore		0x39
#define opc_astore		0x3a
#define opc_istore_0		0x3b
#define opc_istore_1		0x3c
#define opc_istore_2		0x3d
#define opc_istore_3		0x3e
#define opc_lstore_0		0x3f
#define opc_lstore_1		0x40
#define opc_lstore_2		0x41
#define opc_lstore_3		0x42
#define opc_fstore_0		0x43
#define opc_fstore_1		0x44
#define opc_fstore_2		0x45
#define opc_fstore_3		0x46
#define opc_dstore_0		0x47
#define opc_dstore_1		0x48
#define opc_dstore_2		0x49
#define opc_dstore_3		0x4a
#define opc_astore_0		0x4b
#define opc_astore_1		0x4c
#define opc_astore_2		0x4d
#define opc_astore_3		0x4e
#define opc_iastore		0x4f
#define opc_lastore		0x50
#define opc_fastore		0x51
#define opc_dastore		0x52
#define opc_aastore		0x53
#define opc_bastore		0x54
#define opc_castore		0x55
#define opc_sastore		0x56
#define opc_pop		0x57
#define opc_pop2		0x58
#define opc_dup		0x59
#define opc_dup_x1		0x5a
#define opc_dup_x2		0x5b
#define opc_dup2		0x5c
#define opc_dup2_x1		0x5d
#define opc_dup2_x2		0x5e
#define opc_swap		0x5f
#define opc_iadd		0x60
#define opc_ladd		0x61
#define opc_fadd		0x62
#define opc_dadd		0x63
#define opc_isub		0x64
#define opc_lsub		0x65
#define opc_fsub		0x66
#define opc_dsub		0x67
#define opc_imul		0x68
#define opc_lmul		0x69
#define opc_fmul		0x6a
#define opc_dmul		0x6b
#define opc_idiv		0x6c
#define opc_ldiv		0x6d
#define opc_fdiv		0x6e
#define opc_ddiv		0x6f
#define opc_irem		0x70
#define opc_lrem		0x71
#define opc_frem		0x72
#define opc_drem		0x73
#define opc_ineg		0x74
#define opc_lneg		0x75
#define opc_fneg		0x76
#define opc_dneg		0x77
#define opc_ishl		0x78
#define opc_lshl		0x79
#define opc_ishr		0x7a
#define opc_lshr		0x7b
#define opc_iushr		0x7c
#define opc_lushr		0x7d
#define opc_iand		0x7e
#define opc_land		0x7f
#define opc_ior		0x80
#define opc_lor		0x81
#define opc_ixor		0x82
#define opc_lxor		0x83
#define opc_iinc		0x84
#define opc_i2l		0x85
#define opc_i2f		0x86
#define opc_i2d		0x87
#define opc_l2i		0x88
#define opc_l2f		0x89
#define opc_l2d		0x8a
#define opc_f2i		0x8b
#define opc_f2l		0x8c
#define opc_f2d		0x8d
#define opc_d2i		0x8e
#define opc_d2l		0x8f
#define opc_d2f		0x90
#define opc_i2b		0x91
#define opc_i2c		0x92
#define opc_i2s		0x93
#define opc_lcmp		0x94
#define opc_fcmpl		0x95
#define opc_fcmpg		0x96
#define opc_dcmpl		0x97
#define opc_dcmpg		0x98
#define opc_ifeq		0x99
#define opc_ifne		0x9a
#define opc_iflt		0x9b
#define opc_ifge		0x9c
#define opc_ifgt		0x9d
#define opc_ifle		0x9e
#define opc_if_icmpeq		0x9f
#define opc_if_icmpne		0xa0
#define opc_if_icmplt		0xa1
#define opc_if_icmpge		0xa2
#define opc_if_icmpgt		0xa3
#define opc_if_icmple		0xa4
#define opc_if_acmpeq		0xa5
#define opc_if_acmpne		0xa6
#define opc_goto		0xa7
#define opc_jsr		0xa8
#define opc_ret		0xa9
#define opc_tableswitch		0xaa
#define opc_lookupswitch		0xab
#define opc_ireturn		0xac
#define opc_lreturn		0xad
#define opc_freturn		0xae
#define opc_dreturn		0xaf
#define opc_areturn		0xb0
#define opc_return		0xb1
#define opc_getstatic		0xb2
#define opc_putstatic		0xb3
#define opc_getfield		0xb4
#define opc_putfield		0xb5
#define opc_invokevirtual		0xb6
#define opc_invokespecial		0xb7
#define opc_invokestatic		0xb8
#define opc_invokeinterface		0xb9
#define opc_new		0xbb
#define opc_newarray		0xbc
#define opc_anewarray		0xbd
#define opc_arraylength		0xbe
#define opc_athrow		0xbf
#define opc_checkcast		0xc0
#define opc_instanceof		0xc1
#define opc_monitorenter		0xc2
#define opc_monitorexit		0xc3
#define opc_wide		0xc4
#define opc_multianewarray		0xc5
#define opc_ifnull		0xc6
#define opc_ifnonnull		0xc7
#define opc_goto_w		0xc8
#define opc_jsr_w		0xc9
#define opc_breakpoint		0xca
#define opc_bgetfield		0xcc
#define opc_cgetfield		0xcd
#define opc_igetfield		0xd0
#define opc_lgetfield		0xd1
#define opc_sgetfield		0xd2
#define opc_aputfield		0xd3
#define opc_bputfield		0xd4
#define opc_cputfield		0xd5
#define opc_iputfield		0xd8
#define opc_lputfield		0xd9
#define opc_iaccess_0		0xdb
#define opc_iaccess_1		0xdc
#define opc_iaccess_2		0xdd
#define opc_iaccess_3		0xde
#define opc_invokevfinal		0xe2
#define opc_return_register_finalizer		0xe5
#define opc_iload_0_iconst_N		0xe7
#define opc_iload_1_iconst_N		0xe8
#define opc_iload_2_iconst_N		0xe9
#define opc_iload_3_iconst_N		0xea
#define opc_iload_iconst_N		0xeb
#define opc_invokeresolved		0xec
#define opc_iadd_istore_N		0xed
#define opc_isub_istore_N		0xee
#define opc_iand_istore_N		0xef
#define opc_ior_istore_N		0xf0
#define opc_ixor_istore_N		0xf1
#define opc_iadd_u4store		0xf2
#define opc_isub_u4store		0xf3
#define opc_iand_u4store		0xf4
#define opc_ior_u4store		0xf5
#define opc_ixor_u4store		0xf6
#define opc_invokespecialresolved		0xf7
#define opc_invokestaticresolved		0xf8

@-----------------------------------------------------------------------------
	.macro	nop	jpc_off=0, seq_len=1
	DISPATCH	\seq_len
	.endm

	Opcode	nop
	nop
@-----------------------------------------------------------------------------
	.macro	u4const_0	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
        mov     lr, #0
	DISPATCH_NEXT
	PUSH	lr
	DISPATCH_FINISH
	.endm

	Opcode	u4const_0
	u4const_0
@-----------------------------------------------------------------------------
	.macro	iconst_N	jpc_off=0, seq_len=1
	sub	lr, r0, #opc_iconst_0
	DISPATCH_START	\seq_len
	PUSH	lr
	DISPATCH_FINISH
	.endm

	Opcode	iconst_N
	iconst_N
@-----------------------------------------------------------------------------
	.macro	u8const_0	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
        mov     tmp1, #0
	DISPATCH_NEXT
	PUSH	tmp1
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	tmp1
	DISPATCH_FINISH
	.endm

	Opcode	u8const_0
	u8const_0
@-----------------------------------------------------------------------------
	.macro	lconst_1	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
        mov     tmp2, #1
	DISPATCH_NEXT
        mov     tmp1, #0
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH2	tmp2, tmp1
	DISPATCH_FINISH
	.endm

	Opcode	lconst_1
	lconst_1
@-----------------------------------------------------------------------------
	.macro	fconst_1	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
        mov     tmp1, #0x3f800000
	DISPATCH_NEXT
	PUSH	tmp1
	DISPATCH_FINISH
	.endm

	Opcode	fconst_1
	fconst_1
@-----------------------------------------------------------------------------
	.macro	fconst_2	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
        mov     r2, #0x40000000
	DISPATCH_NEXT
	PUSH	r2
	DISPATCH_FINISH
	.endm

	Opcode	fconst_2
	fconst_2
@-----------------------------------------------------------------------------
	.macro	dconst_1	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
        mov     tmp1, #0x3f000000
	DISPATCH_NEXT
        orr     tmp1, tmp1, #0x00f00000
	DISPATCH_NEXT
        mov     tmp2, #0
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH2	tmp2, tmp1
	DISPATCH_FINISH
	.endm

	Opcode	dconst_1
	dconst_1
@-----------------------------------------------------------------------------
	.macro	bipush	jpc_off=0, seq_len=2
	DISPATCH_START	\seq_len
	mov	tmp1, r2, lsl #24
	DISPATCH_NEXT
	mov	tmp1, tmp1, asr #24
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	tmp1
	DISPATCH_FINISH
	.endm

	Opcode	bipush
	bipush
@-----------------------------------------------------------------------------
	.macro	sipush	jpc_off=0, seq_len=3
	DISPATCH_START	\seq_len
	mov	tmp1, r1
	DISPATCH_NEXT
	mov	r2, r2, lsl #24
	DISPATCH_NEXT
        orr     tmp1, tmp1, r2, asr #16
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	tmp1
	DISPATCH_FINISH
	.endm

	Opcode	sipush
	sipush
@-----------------------------------------------------------------------------
	.macro	u4load	jpc_off=0, seq_len=2
	DISPATCH_START	\seq_len
	rsb	tmp1, r2, #0
	DISPATCH_NEXT
        ldr     tmp1, [locals, tmp1, lsl #2]
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	tmp1
	DISPATCH_FINISH
	.endm

	Opcode	u4load
	u4load
@-----------------------------------------------------------------------------
	.macro	u8load	jpc_off=0, seq_len=2
	DISPATCH_START	\seq_len
	sub	r3, locals, r2, lsl #2
	DISPATCH_NEXT
	ldmda	r3, {tmp2, tmp1}
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH2	tmp2, tmp1
	DISPATCH_FINISH
	.endm

	Opcode	u8load
	u8load
@-----------------------------------------------------------------------------
	.macro	aload_0	jpc_off=0, seq_len=1
	rsb	tmp1, r0, #opc_aload_0
	DISPATCH_START	\seq_len
	DISPATCH_NEXT
	ldr	tmp1, [locals, tmp1, lsl #2]
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	tmp1
	DISPATCH_FINISH
	.endm

	Opcode	aload_0
	aload_0
@-----------------------------------------------------------------------------
	.macro	iload_0	jpc_off=0, seq_len=1
	rsb	tmp1, r0, #opc_iload_0
	DISPATCH_START	\seq_len
	DISPATCH_NEXT
	ldr	tmp1, [locals, tmp1, lsl #2]
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	tmp1
	DISPATCH_FINISH
	.endm

	Opcode	iload_0
	iload_0
@-----------------------------------------------------------------------------
	.macro	fload_0	jpc_off=0, seq_len=1
	rsb	tmp1, r0, #opc_fload_0
	DISPATCH_START	\seq_len
	DISPATCH_NEXT
	ldr	tmp1, [locals, tmp1, lsl #2]
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	tmp1
	DISPATCH_FINISH
	.endm

	Opcode	fload_0
	fload_0
@-----------------------------------------------------------------------------
	.macro	u8load_0	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
        ldmda   locals, {tmp2-tmp1}
	DISPATCH_NEXT
	PUSH	tmp1
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
	.endm

	Opcode	u8load_0
	u8load_0
@-----------------------------------------------------------------------------
	.macro	u8load_1	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
        ldmdb   locals, {tmp2-tmp1}
	DISPATCH_NEXT
	PUSH	tmp1
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
	.endm

	Opcode	u8load_1
	u8load_1
@-----------------------------------------------------------------------------
	.macro	u8load_2	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
	ldr	tmp2, [locals, #-12]
	DISPATCH_NEXT
	ldr	tmp1, [locals, #-8]
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH2	tmp2, tmp1
	DISPATCH_FINISH
	.endm

	Opcode	u8load_2
	u8load_2
@-----------------------------------------------------------------------------
	.macro	u8load_3	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
	ldr	tmp2, [locals, #-16]
	DISPATCH_NEXT
	ldr	tmp1, [locals, #-12]
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH2	tmp2, tmp1
	DISPATCH_FINISH
	.endm

	Opcode	u8load_3
	u8load_3
@-----------------------------------------------------------------------------
	.macro	u4aload	jpc_off=0, seq_len=1
	POP2	r2, r3			@ r2 = index, r3 = arrayref
	DISPATCH_START	\seq_len
#ifndef HW_NULL_PTR_CHECK
	cmp	r3, #0
	beq	null_ptr_exception_jpc_1
#endif
.abortentry5:
	ldr	lr, [r3, #8]		@ lr = length
	DISPATCH_NEXT
	cmp	r2, lr
	bcs	array_bound_exception_jpc_1
	DISPATCH_NEXT
	add	r3, r3, r2, lsl #2
	DISPATCH_NEXT
	ldr	tmp1, [r3, #12]
	DISPATCH_NEXT
	PUSH	tmp1
	DISPATCH_FINISH
	.endm

	Opcode	u4aload
	u4aload
@-----------------------------------------------------------------------------
	.macro	u8aload	jpc_off=0, seq_len=1
	POP2	r2, r3
	DISPATCH_START	\seq_len
#ifndef HW_NULL_PTR_CHECK
	cmp	r3, #0
	beq	null_ptr_exception_jpc_1
#endif
.abortentry6:
	ldr	lr, [r3, #8]		@ lr = length
	DISPATCH_NEXT
	cmp	r2, lr
	bcs	array_bound_exception_jpc_1
	DISPATCH_NEXT
	add	r3, r3, r2, lsl #3
	ldr	tmp2, [r3, #16]
	DISPATCH_NEXT
	ldr	tmp1, [r3, #20]
	DISPATCH_NEXT
	PUSH2	tmp2, tmp1
	DISPATCH_FINISH
	.endm

	Opcode	u8aload
	u8aload
@-----------------------------------------------------------------------------
	.macro	baload	jpc_off=0, seq_len=1
	POP2	r2, r3			@ r2 = index, r3 = arrayref
	DISPATCH_START	\seq_len
#ifndef HW_NULL_PTR_CHECK
	cmp	r3, #0
	beq	null_ptr_exception_jpc_1
#endif
.abortentry7:
	ldr	lr, [r3, #8]		@ lr = length
	DISPATCH_NEXT
	cmp	r2, lr
	bcs	array_bound_exception_jpc_1
	DISPATCH_NEXT
	add	r3, r3, r2
	DISPATCH_NEXT
	ldrsb	tmp1, [r3, #12]
	DISPATCH_NEXT
	PUSH	tmp1
	DISPATCH_FINISH
	.endm

	Opcode	baload
	baload
@-----------------------------------------------------------------------------
	.macro	caload	jpc_off=0, seq_len=1
	POP2	r2, r3			@ r2 = index, r3 = arrayref
	DISPATCH_START	\seq_len
#ifndef HW_NULL_PTR_CHECK
	cmp	r3, #0
	beq	null_ptr_exception_jpc_1
#endif
.abortentry8:
	ldr	lr, [r3, #8]		@ lr = length
	DISPATCH_NEXT
	cmp	r2, lr
	bcs	array_bound_exception_jpc_1
	DISPATCH_NEXT
	add	r3, r3, r2, lsl #1
	DISPATCH_NEXT
	ldrh	tmp1, [r3, #12]
	DISPATCH_NEXT
	PUSH	tmp1
	DISPATCH_FINISH
	.endm

	Opcode	caload
	caload
@-----------------------------------------------------------------------------
	.macro	saload	jpc_off=0, seq_len=1
	POP2	r2, r3			@ r2 = index, r3 = arrayref
	DISPATCH_START	\seq_len
#ifndef HW_NULL_PTR_CHECK
	cmp	r3, #0
	beq	null_ptr_exception_jpc_1
#endif
.abortentry9:
	ldr	lr, [r3, #8]		@ lr = length
	DISPATCH_NEXT
	cmp	r2, lr
	bcs	array_bound_exception_jpc_1
	DISPATCH_NEXT
	add	r3, r3, r2, lsl #1
	DISPATCH_NEXT
	ldrsh	tmp1, [r3, #12]
	DISPATCH_NEXT
	PUSH	tmp1
	DISPATCH_FINISH
	.endm

	Opcode	saload
	saload
@-----------------------------------------------------------------------------
	.macro	u4store	jpc_off=0, seq_len=2
	DISPATCH_START	\seq_len
	rsb	tmp1, r2, #0
	DISPATCH_NEXT
	POP	r3
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	str	r3, [locals, tmp1, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	u4store
	u4store
@-----------------------------------------------------------------------------
	.macro	u8store	jpc_off=0, seq_len=2
	DISPATCH_START	\seq_len
	POP2	tmp2, tmp1
	DISPATCH_NEXT
	sub	r3, locals, r2, lsl #2
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	stmda	r3, {tmp2, tmp1}
	DISPATCH_FINISH
	.endm

	Opcode	u8store
	u8store
@-----------------------------------------------------------------------------
	.macro	u4store_0	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
	DISPATCH_NEXT
	POP	tmp1
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
        str     tmp1, [locals, #0]
	DISPATCH_FINISH
	.endm

	Opcode	u4store_0
	u4store_0
@-----------------------------------------------------------------------------
	.macro	u4store_1	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
	DISPATCH_NEXT
	POP	tmp1
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
        str     tmp1, [locals, #-4]
	DISPATCH_FINISH
	.endm

	Opcode	u4store_1
	u4store_1
@-----------------------------------------------------------------------------
	.macro	u4store_2	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
	DISPATCH_NEXT
	POP	tmp1
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
        str     tmp1, [locals, #-8]
	DISPATCH_FINISH
	.endm

	Opcode	u4store_2
	u4store_2
@-----------------------------------------------------------------------------
	.macro	u4store_3	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
	DISPATCH_NEXT
	POP	tmp1
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
        str     tmp1, [locals, #-12]
	DISPATCH_FINISH
	.endm

	Opcode	u4store_3
	u4store_3
@-----------------------------------------------------------------------------
	.macro	u8store_0	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
	DISPATCH_NEXT
	POP2	tmp2, tmp1
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
        stmda   locals, {tmp2, tmp1}
	DISPATCH_FINISH
	.endm

	Opcode	u8store_0
	u8store_0
@-----------------------------------------------------------------------------
	.macro	u8store_1	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
	DISPATCH_NEXT
	POP2	tmp2, tmp1
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
        stmdb   locals, {tmp2, tmp1}
	DISPATCH_FINISH
	.endm

	Opcode	u8store_1
	u8store_1
@-----------------------------------------------------------------------------
	.macro	u8store_2	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
	POP2	tmp2, tmp1
	DISPATCH_NEXT
        str     tmp2, [locals, #-12]
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
        str     tmp1, [locals, #-8]
	DISPATCH_FINISH
	.endm

	Opcode	u8store_2
	u8store_2
@-----------------------------------------------------------------------------
	.macro	u8store_3	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
	POP2	tmp2, tmp1
	DISPATCH_NEXT
        str     tmp2, [locals, #-16]
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
        str     tmp1, [locals, #-12]
	DISPATCH_FINISH
	.endm

	Opcode	u8store_3
	u8store_3
@-----------------------------------------------------------------------------
	.macro	u4astore	jpc_off=0, seq_len=1
	POP3	r3, tmp2, tmp1		@ r3 = value, tmp2 = index, tmp1 = arrayref
	DISPATCH_START	\seq_len
#ifndef HW_NULL_PTR_CHECK
	cmp	tmp1, #0
	beq	null_ptr_exception_jpc_1
#endif
.abortentry10:
	ldr	lr, [tmp1, #8]		@ lr = limit
	DISPATCH_NEXT
	cmp	tmp2, lr
	bcs	array_bound_exception_jpc_1_tmp2
	DISPATCH_NEXT
	add	tmp1, tmp1, tmp2, lsl #2
	DISPATCH_NEXT
	str	r3, [tmp1, #12]
	DISPATCH_FINISH
	.endm

	Opcode	u4astore
	u4astore
@-----------------------------------------------------------------------------
	.macro	u8astore	jpc_off=0, seq_len=1
	POP4	r2, r3, tmp2, tmp1		@ r2,r3 = value, tmp2 = index, tmp1 = arrayref
	DISPATCH_START	\seq_len
#ifndef HW_NULL_PTR_CHECK
	cmp	tmp1, #0
	beq	null_ptr_exception_jpc_1
#endif
.abortentry11:
	ldr	ip, [tmp1, #8]		@ ip = limit
	cmp	tmp2, ip
	DISPATCH_NEXT
	bcs	array_bound_exception_jpc_1_tmp2
	DISPATCH_NEXT
	add	tmp2, tmp1, tmp2, lsl #3
	str	r2, [tmp2, #16]
	DISPATCH_NEXT
	DISPATCH_NEXT
	str	r3, [tmp2, #20]
	DISPATCH_FINISH
	.endm

	Opcode	u8astore
	u8astore
@-----------------------------------------------------------------------------
	.macro	bastore	jpc_off=0, seq_len=1
	POP3	r3, tmp2, tmp1		@ r3 = value, tmp2 = index, tmp1 = arrayref
	DISPATCH_START	\seq_len
#ifndef HW_NULL_PTR_CHECK
	cmp	tmp1, #0
	beq	null_ptr_exception_jpc_1
#endif
.abortentry12:
	ldr	lr, [tmp1, #8]		@ lr = limit
	DISPATCH_NEXT
	cmp	tmp2, lr
	bcs	array_bound_exception_jpc_1_tmp2
	DISPATCH_NEXT
	add	tmp1, tmp1, tmp2
	DISPATCH_NEXT
	strb	r3, [tmp1, #12]
	DISPATCH_FINISH
	.endm

	Opcode	bastore
	bastore
@-----------------------------------------------------------------------------
	.macro	u2astore	jpc_off=0, seq_len=1
	POP3	r3, tmp2, tmp1		@ r3 = value, tmp2 = index, tmp1 = arrayref
	DISPATCH_START	\seq_len
#ifndef HW_NULL_PTR_CHECK
	cmp	tmp1, #0
	beq	null_ptr_exception_jpc_1
#endif
.abortentry13:
	ldr	lr, [tmp1, #8]		@ lr = limit
	DISPATCH_NEXT
	cmp	tmp2, lr
	bcs	array_bound_exception_jpc_1_tmp2
	DISPATCH_NEXT
	add	tmp1, tmp1, tmp2, lsl #1
	DISPATCH_NEXT
	strh	r3, [tmp1, #12]
	DISPATCH_FINISH
	.endm

	Opcode	u2astore
	u2astore
@-----------------------------------------------------------------------------
	.macro	jpop	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
        add     stack, stack, #4
	DISPATCH_FINISH
	.endm

	Opcode	jpop
	jpop
@-----------------------------------------------------------------------------
	.macro	jpop2	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
        add     stack, stack, #8
	DISPATCH_FINISH
	.endm

	Opcode	jpop2
	jpop2
@-----------------------------------------------------------------------------
	.macro	dup	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
	ldr	lr, [stack, #4]
	DISPATCH_NEXT
	PUSH	lr
	DISPATCH_FINISH
	.endm

	Opcode	dup
	dup
@-----------------------------------------------------------------------------
	.macro	dup_x1	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
	POP2	r2, r3
	DISPATCH_NEXT
	PUSH	r2
	DISPATCH_NEXT
	PUSH2	r2, r3
	DISPATCH_FINISH
	.endm

	Opcode	dup_x1
	dup_x1
@-----------------------------------------------------------------------------
	.macro	dup_x2	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
	POP3	r2, r3, lr
	DISPATCH_NEXT
	PUSH	r2
	DISPATCH_NEXT
	PUSH3	r2, r3, lr
	DISPATCH_FINISH
	.endm

	Opcode	dup_x2
	dup_x2
@-----------------------------------------------------------------------------
	.macro	dup2	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
	ldmib	stack, {r2, r3}
	DISPATCH_NEXT
	PUSH2	r2, r3
	DISPATCH_FINISH
	.endm

	Opcode	dup2
	dup2
@-----------------------------------------------------------------------------
	.macro	dup2_x1	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
	POP3	r2, r3, lr
	DISPATCH_NEXT
	PUSH2	r2, r3
	DISPATCH_NEXT
	PUSH3	r2, r3, lr
	DISPATCH_FINISH
	.endm

	Opcode	dup2_x1
	dup2_x1
@-----------------------------------------------------------------------------
	.macro	dup2_x2	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
	POP4	r2, r3, tmp1, lr
	DISPATCH_NEXT
	PUSH2	r2, r3
	PUSH4	r2, r3, tmp1, lr
	DISPATCH_FINISH
	.endm

	Opcode	dup2_x2
	dup2_x2
@-----------------------------------------------------------------------------
	.macro	swap	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
	POP2	r2, r3
	DISPATCH_NEXT
	PUSH	r2
	DISPATCH_NEXT
	PUSH	r3
	DISPATCH_FINISH
	.endm

	Opcode	swap
	swap
@-----------------------------------------------------------------------------
	.macro	iadd	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
	POP2	tmp2, tmp1
	DISPATCH_NEXT
	add	tmp2, tmp2, tmp1
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
	.endm

	Opcode	iadd
	iadd
@-----------------------------------------------------------------------------
	.macro	ladd	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
	POP4	r2, r3, tmp1, lr
	DISPATCH_NEXT
	adds	r2, r2, tmp1
	adc	r3, r3, lr
	DISPATCH_NEXT
	PUSH2	r2, r3
	DISPATCH_FINISH
	.endm

	Opcode	ladd
	ladd
@-----------------------------------------------------------------------------
	.macro	fadd	jpc_off=0, seq_len=1
	POP2	r0, r1
        bl      __aeabi_fadd
	PUSH	r0
	DISPATCH	\seq_len
	.endm

	Opcode	fadd
	fadd
@-----------------------------------------------------------------------------
	.macro	isub	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
	POP2	tmp2, tmp1
	DISPATCH_NEXT
	sub	tmp2, tmp1, tmp2
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
	.endm

	Opcode	isub
	isub
@-----------------------------------------------------------------------------
	.macro	lsub	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
	POP4	r2, r3, tmp1, lr
	DISPATCH_NEXT
	subs	r2, tmp1, r2
	sbc	r3, lr, r3
	DISPATCH_NEXT
	PUSH2	r2, r3
	DISPATCH_FINISH
	.endm

	Opcode	lsub
	lsub
@-----------------------------------------------------------------------------
	.macro	fsub	jpc_off=0, seq_len=1
	POP	r1
	POP	r0
        bl      __aeabi_fsub
	PUSH	r0
	DISPATCH	\seq_len
	.endm

	Opcode	fsub
	fsub
@-----------------------------------------------------------------------------
	.macro	imul	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
	POP2	r2, tmp1
	DISPATCH_NEXT
	mul	tmp2, r2, tmp1
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
	.endm

	Opcode	imul
	imul
@-----------------------------------------------------------------------------
	.macro	lmul	jpc_off=0, seq_len=1
	POP4	r2, tmp1, ip, lr
        umull   r3, r0, ip, r2
        mla     tmp1, ip, tmp1, r0
	DISPATCH_START	\seq_len
        mla     tmp1, lr, r2, tmp1
	DISPATCH_NEXT
	PUSH2	r3, tmp1
	DISPATCH_FINISH
	.endm

	Opcode	lmul
	lmul
@-----------------------------------------------------------------------------
	.macro	fmul	jpc_off=0, seq_len=1
	POP2	r0, r1
        bl      __aeabi_fmul
	PUSH	r0
	DISPATCH	\seq_len
	.endm

	Opcode	fmul
	fmul
@-----------------------------------------------------------------------------
	.macro	ldiv	jpc_off=0, seq_len=1
	POP2	r2, r3
	POP2	r0, r1
	orrs	lr, r2, r3
	beq	.ldiv_0
	bl	__aeabi_ldivmod
	PUSH2	r0, r1
	DISPATCH	\seq_len
	.endm

	Opcode	ldiv
	ldiv
@-----------------------------------------------------------------------------
	.macro	fdiv	jpc_off=0, seq_len=1
	POP	r1
	POP	r0
        bl      __aeabi_fdiv
	PUSH	r0
	DISPATCH	\seq_len
	.endm

	Opcode	fdiv
	fdiv
@-----------------------------------------------------------------------------
	.macro	ddiv	jpc_off=0, seq_len=1
	POP2	r2, r3
	POP2	r0, r1
        bl      __aeabi_ddiv
	PUSH2	r0, r1
	DISPATCH	\seq_len
	.endm

	Opcode	ddiv
	ddiv
@-----------------------------------------------------------------------------
	.macro	lrem	jpc_off=0, seq_len=1
	POP2	r2, r3
	POP2	r0, r1
	orrs	lr, r2, r3
	beq	.lrem_0
	bl	__aeabi_ldivmod
	PUSH2	r2, r3
	DISPATCH	\seq_len
	.endm

	Opcode	lrem
	lrem
@-----------------------------------------------------------------------------
	.macro	frem	jpc_off=0, seq_len=1
@ ECN: It must be possible to do better than this
	POP	r0
        bl      __aeabi_f2d
	PUSH2	r0, r1
	GET_STACK	2, r0
        bl      __aeabi_f2d
	POP2	r2, r3
        bl      fmod
        bl      __aeabi_d2f
	PUT_STACK	0, r0
	DISPATCH	\seq_len
	.endm

	Opcode	frem
	frem
@-----------------------------------------------------------------------------
	.macro	drem	jpc_off=0, seq_len=1
	POP2	r2, r3
	POP2	r0, r1
        bl      fmod
	PUSH2	r0, r1
	DISPATCH	\seq_len
	.endm

	Opcode	drem
	drem
@-----------------------------------------------------------------------------
	.macro	ineg	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
	POP	tmp1
	DISPATCH_NEXT
        rsb     tmp1, tmp1, #0
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	tmp1
	DISPATCH_FINISH
	.endm

	Opcode	ineg
	ineg
@-----------------------------------------------------------------------------
	.macro	lneg	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
	POP2	r2, r3
	DISPATCH_NEXT
	rsbs	r2, r2, #0
	rsc	r3, r3, #0
	DISPATCH_NEXT
	PUSH2	r2, r3
	DISPATCH_FINISH
	.endm

	Opcode	lneg
	lneg
@-----------------------------------------------------------------------------
	.macro	fneg	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
	POP	r2
	DISPATCH_NEXT
	eor	r2, r2, #0x80000000
	DISPATCH_NEXT
	PUSH	r2
	DISPATCH_FINISH
	.endm

	Opcode	fneg
	fneg
@-----------------------------------------------------------------------------
	.macro	dneg	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
	GET_STACK	1, r2
	DISPATCH_NEXT
	eor	r2, r2, #0x80000000
	DISPATCH_NEXT
	PUT_STACK	1, r2
	DISPATCH_FINISH
	.endm

	Opcode	dneg
	dneg
@-----------------------------------------------------------------------------
	.macro	ishl	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
	POP2	r2, r3
	DISPATCH_NEXT
	and	r2, r2, #31
	mov	r2, r3, lsl r2
	DISPATCH_NEXT
	PUSH	r2
	DISPATCH_FINISH
	.endm

	Opcode	ishl
	ishl
@-----------------------------------------------------------------------------
	.macro	lshl	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
	POP3	r2, r3, lr
	DISPATCH_NEXT
	tst	r2, #32
	and	r2, r2, #31
	movne	tmp1, #0
	movne	lr, r3, lsl r2
	moveq	tmp1, r3, lsl r2
	moveq	lr, lr, lsl r2
	rsbeq	r2, r2, #32
	orreq	lr, lr, r3, lsr r2
	PUSH2	tmp1, lr
	DISPATCH_FINISH
	.endm

	Opcode	lshl
	lshl
@-----------------------------------------------------------------------------
	.macro	ishr	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
	POP2	r2, r3
	DISPATCH_NEXT
	and	r2, r2, #31
	mov	r2, r3, asr r2
	DISPATCH_NEXT
	PUSH	r2
	DISPATCH_FINISH
	.endm

	Opcode	ishr
	ishr
@-----------------------------------------------------------------------------
	.macro	lshr	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
	POP3	r2, r3, tmp1
	DISPATCH_NEXT
	tst	r2, #32
	and	r2, r2, #31
	movne	lr, tmp1, asr #31
	movne	r3, tmp1, asr r2
	moveq	lr, tmp1, asr r2
	moveq	r3, r3, lsr r2
	rsbeq	r2, r2, #32
	orreq	r3, r3, tmp1, lsl r2
	PUSH2	r3, lr
	DISPATCH_FINISH
	.endm

	Opcode	lshr
	lshr
@-----------------------------------------------------------------------------
	.macro	iushr	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
	POP2	r2, r3
	DISPATCH_NEXT
	and	r2, r2, #31
	mov	r2, r3, lsr r2
	DISPATCH_NEXT
	PUSH	r2
	DISPATCH_FINISH
	.endm

	Opcode	iushr
	iushr
@-----------------------------------------------------------------------------
	.macro	lushr	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
	POP3	r2, r3, tmp1
	DISPATCH_NEXT
	tst	r2, #32
	and	r2, r2, #31
	movne	lr, #0
	movne	r3, tmp1, lsr r2
	moveq	lr, tmp1, lsr r2
	moveq	r3, r3, lsr r2
	rsbeq	r2, r2, #32
	orreq	r3, r3, tmp1, lsl r2
	PUSH2	r3, lr
	DISPATCH_FINISH
	.endm

	Opcode	lushr
	lushr
@-----------------------------------------------------------------------------
	.macro	iand	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
	POP2	tmp2, tmp1
	DISPATCH_NEXT
	and	tmp2, tmp1, tmp2
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
	.endm

	Opcode	iand
	iand
@-----------------------------------------------------------------------------
	.macro	land	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
	POP4	r2, r3, tmp1, lr
	DISPATCH_NEXT
	and	r2, tmp1, r2
	and	r3, lr, r3
	DISPATCH_NEXT
	PUSH2	r2, r3
	DISPATCH_FINISH
	.endm

	Opcode	land
	land
@-----------------------------------------------------------------------------
	.macro	ior	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
	POP2	tmp2, tmp1
	DISPATCH_NEXT
	orr	tmp2, tmp1, tmp2
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
	.endm

	Opcode	ior
	ior
@-----------------------------------------------------------------------------
	.macro	lor	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
	POP4	r2, r3, tmp1, lr
	DISPATCH_NEXT
	orr	r2, tmp1, r2
	orr	r3, lr, r3
	DISPATCH_NEXT
	PUSH2	r2, r3
	DISPATCH_FINISH
	.endm

	Opcode	lor
	lor
@-----------------------------------------------------------------------------
	.macro	ixor	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
	POP2	tmp2, tmp1
	DISPATCH_NEXT
	eor	tmp2, tmp1, tmp2
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
	.endm

	Opcode	ixor
	ixor
@-----------------------------------------------------------------------------
	.macro	lxor	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
	POP4	r2, r3, tmp1, lr
	DISPATCH_NEXT
	eor	r2, tmp1, r2
	eor	r3, lr, r3
	DISPATCH_NEXT
	PUSH2	r2, r3
	DISPATCH_FINISH
	.endm

	Opcode	lxor
	lxor
@-----------------------------------------------------------------------------
	.macro	iinc	jpc_off=0, seq_len=3
	ldrsb	lr, [jpc, #2]
	DISPATCH_START	\seq_len
	rsb	tmp1, r2, #0
	DISPATCH_NEXT
	ldr	r3, [locals, tmp1, lsl #2]
	DISPATCH_NEXT
	add	r3, r3, lr
	DISPATCH_NEXT
	DISPATCH_NEXT
	str	r3, [locals, tmp1, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	iinc
	iinc
@-----------------------------------------------------------------------------
	.macro	i2l	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
	POP	r2
	DISPATCH_NEXT
	mov	r3, r2, asr #31
	DISPATCH_NEXT
	PUSH2	r2, r3
	DISPATCH_FINISH
	.endm

	Opcode	i2l
	i2l
@-----------------------------------------------------------------------------
	.macro	i2f	jpc_off=0, seq_len=1
	POP	r0
        bl      __aeabi_i2f
	PUSH	r0
	DISPATCH	\seq_len
	.endm

	Opcode	i2f
	i2f
@-----------------------------------------------------------------------------
	.macro	i2d	jpc_off=0, seq_len=1
	POP	r0
        bl      __aeabi_i2d
	PUSH2	r0, r1
	DISPATCH	\seq_len
	.endm

	Opcode	i2d
	i2d
@-----------------------------------------------------------------------------
	.macro	l2i	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
	POP	r3
	DISPATCH_NEXT
	PUT_STACK	0, r3
	DISPATCH_FINISH
	.endm

	Opcode	l2i
	l2i
@-----------------------------------------------------------------------------
	.macro	l2f	jpc_off=0, seq_len=1
	POP2	r0, r1
        bl      __aeabi_l2f
	PUSH	r0
	DISPATCH	\seq_len
	.endm

	Opcode	l2f
	l2f
@-----------------------------------------------------------------------------
	.macro	l2d	jpc_off=0, seq_len=1
	POP2	r0, r1
        bl      __aeabi_l2d
	PUSH2	r0, r1
	DISPATCH	\seq_len
	.endm

	Opcode	l2d
	l2d
@-----------------------------------------------------------------------------
	.macro	f2i	jpc_off=0, seq_len=1
	POP	r0
        bl      _ZN13SharedRuntime3f2iEf
	PUSH	r0
	DISPATCH	\seq_len
	.endm

	Opcode	f2i
	f2i
@-----------------------------------------------------------------------------
	.macro	f2l	jpc_off=0, seq_len=1
	POP	r0
        bl      _ZN13SharedRuntime3f2lEf
	PUSH2	r0, r1
	DISPATCH	\seq_len
	.endm

	Opcode	f2l
	f2l
@-----------------------------------------------------------------------------
	.macro	f2d	jpc_off=0, seq_len=1
	POP	r0
        bl      __aeabi_f2d
	PUSH2	r0, r1
	DISPATCH	\seq_len
	.endm

	Opcode	f2d
	f2d
@-----------------------------------------------------------------------------
	.macro	d2i	jpc_off=0, seq_len=1
	POP2	r0, r1
        bl      _ZN13SharedRuntime3d2iEd
	PUSH	r0
	DISPATCH	\seq_len
	.endm

	Opcode	d2i
	d2i
@-----------------------------------------------------------------------------
	.macro	d2l	jpc_off=0, seq_len=1
	POP2	r0, r1
        bl      _ZN13SharedRuntime3d2lEd
	PUSH2	r0, r1
	DISPATCH	\seq_len
	.endm

	Opcode	d2l
	d2l
@-----------------------------------------------------------------------------
	.macro	d2f	jpc_off=0, seq_len=1
	POP2	r0, r1
        bl      __aeabi_d2f
	PUSH	r0
	DISPATCH	\seq_len
	.endm

	Opcode	d2f
	d2f
@-----------------------------------------------------------------------------
	.macro	i2b	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
	POP	r3
	DISPATCH_NEXT
        mov     r3, r3, asl #24
        mov     r3, r3, asr #24
	DISPATCH_NEXT
	PUSH	r3
	DISPATCH_FINISH
	.endm

	Opcode	i2b
	i2b
@-----------------------------------------------------------------------------
	.macro	i2c	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
	POP	r3
	DISPATCH_NEXT
        mov     r3, r3, asl #16
        mov     r3, r3, lsr #16
	DISPATCH_NEXT
	PUSH	r3
	DISPATCH_FINISH
	.endm

	Opcode	i2c
	i2c
@-----------------------------------------------------------------------------
	.macro	i2s	jpc_off=0, seq_len=1
	DISPATCH_START	\seq_len
	POP	r3
	DISPATCH_NEXT
        mov     r3, r3, asl #16
        mov     r3, r3, asr #16
	DISPATCH_NEXT
	PUSH	r3
	DISPATCH_FINISH
	.endm

	Opcode	i2s
	i2s
@-----------------------------------------------------------------------------
	.macro	lcmp	jpc_off=0, seq_len=1
	POP4	r2, r3, tmp1, lr
	DISPATCH_START	\seq_len
	subs	r2, tmp1, r2
	movne	r2, #1
	sbcs	lr, lr, r3
	DISPATCH_NEXT
	movne	r2, #1
	rsblt	r2, r2, #0
	DISPATCH_NEXT
	PUSH	r2
	DISPATCH_FINISH
	.endm

	Opcode	lcmp
	lcmp
@-----------------------------------------------------------------------------
	.macro	fcmpl	jpc_off=0, seq_len=1
        ldmib   stack, {r0, r1}
        bl      __aeabi_fcmpgt
        cmp     r0, #0
        movne   r3, #-1
        bne     3f
        ldmib   stack, {r0, r1}
        bl      __aeabi_fcmplt
        cmp     r0, #0
        movne   r3, #1
        bne     3f
        ldmib   stack, {r0, r1}
        bl      __aeabi_fcmpeq
        cmp     r0, #0
        movne   r3, #0
        moveq   r3, #-1
3:
	DISPATCH_START	\seq_len
	add	stack, stack, #8
	DISPATCH_NEXT
	PUSH	r3
	DISPATCH_FINISH
	.endm

	Opcode	fcmpl
	fcmpl
@-----------------------------------------------------------------------------
	.macro	fcmpg	jpc_off=0, seq_len=1
        ldmib   stack, {r0, r1}
        bl      __aeabi_fcmpgt
        cmp     r0, #0
        movne   r3, #-1
        bne     4f
        ldmib   stack, {r0, r1}
        bl      __aeabi_fcmplt
        cmp     r0, #0
        movne   r3, #1
        bne     4f
        ldmib   stack, {r0, r1}
        bl      __aeabi_fcmpeq
        cmp     r0, #0
        movne   r3, #0
        moveq   r3, #1
4:
	DISPATCH_START	\seq_len
	add	stack, stack, #8
	DISPATCH_NEXT
	PUSH	r3
	DISPATCH_FINISH
	.endm

	Opcode	fcmpg
	fcmpg
@-----------------------------------------------------------------------------
	.macro	dcmpl	jpc_off=0, seq_len=1
        ldmib   stack, {r0, r1, r2, r3}
        bl      __aeabi_dcmpgt
        cmp     r0, #0
        movne   r3, #-1
        bne     5f
        ldmib   stack, {r0, r1, r2, r3}
        bl      __aeabi_dcmplt
        cmp     r0, #0
        movne   r3, #1
        bne     5f
        ldmib   stack, {r0, r1, r2, r3}
        bl      __aeabi_dcmpeq
        cmp     r0, #0
        movne   r3, #0
        moveq   r3, #-1
5:
	DISPATCH_START	\seq_len
	add	stack, stack, #16
	DISPATCH_NEXT
	PUSH	r3
	DISPATCH_FINISH
	.endm

	Opcode	dcmpl
	dcmpl
@-----------------------------------------------------------------------------
	.macro	dcmpg	jpc_off=0, seq_len=1
        ldmib   stack, {r0, r1, r2, r3}
        bl      __aeabi_dcmpgt
        cmp     r0, #0
        movne   r3, #-1
        bne     6f
        ldmib   stack, {r0, r1, r2, r3}
        bl      __aeabi_dcmplt
        cmp     r0, #0
        movne   r3, #1
        bne     6f
        ldmib   stack, {r0, r1, r2, r3}
        bl      __aeabi_dcmpeq
        cmp     r0, #0
        movne   r3, #0
        moveq   r3, #1
6:
	DISPATCH_START	\seq_len
	add	stack, stack, #16
	DISPATCH_NEXT
	PUSH	r3
	DISPATCH_FINISH
	.endm

	Opcode	dcmpg
	dcmpg
@-----------------------------------------------------------------------------
	.macro	ifeq_unsafe	jpc_off=0, seq_len=0
	POP	r3
	mov	r2, r2, lsl #24
        cmp     r3, #0
        orr     ip, r1, r2, asr #16
	beq	1f
	mov	ip, #3
1:
        ldrb  r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	ifeq_unsafe
	ifeq_unsafe
@-----------------------------------------------------------------------------
	.macro	ifne_unsafe	jpc_off=0, seq_len=0
	POP	r3
	mov	r2, r2, lsl #24
        cmp     r3, #0
        orr     ip, r1, r2, asr #16
	bne	1f
	mov	ip, #3
1:
        ldrb  r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	ifne_unsafe
	ifne_unsafe
@-----------------------------------------------------------------------------
	.macro	iflt_unsafe	jpc_off=0, seq_len=0
	POP	r3
	mov	r2, r2, lsl #24
        cmp     r3, #0
        orr     ip, r1, r2, asr #16
	blt	1f
	mov	ip, #3
1:
        ldrb  r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iflt_unsafe
	iflt_unsafe
@-----------------------------------------------------------------------------
	.macro	ifge_unsafe	jpc_off=0, seq_len=0
	POP	r3
	mov	r2, r2, lsl #24
        cmp     r3, #0
        orr     ip, r1, r2, asr #16
	bge	1f
	mov	ip, #3
1:
        ldrb  r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	ifge_unsafe
	ifge_unsafe
@-----------------------------------------------------------------------------
	.macro	ifgt_unsafe	jpc_off=0, seq_len=0
	POP	r3
	mov	r2, r2, lsl #24
        cmp     r3, #0
        orr     ip, r1, r2, asr #16
	bgt	1f
	mov	ip, #3
1:
        ldrb  r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	ifgt_unsafe
	ifgt_unsafe
@-----------------------------------------------------------------------------
	.macro	ifle_unsafe	jpc_off=0, seq_len=0
	POP	r3
	mov	r2, r2, lsl #24
        cmp     r3, #0
        orr     ip, r1, r2, asr #16
	ble	1f
	mov	ip, #3
1:
        ldrb  r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	ifle_unsafe
	ifle_unsafe
@-----------------------------------------------------------------------------
	.macro	if_icmpeq_unsafe	jpc_off=0, seq_len=0
	POP2	r3, tmp1
	mov	r2, r2, lsl #24
        cmp     tmp1, r3
	orr	ip, r1, r2, asr #16
	beq	1f
	mov	ip, #3
1:
        ldrb  r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	if_icmpeq_unsafe
	if_icmpeq_unsafe
@-----------------------------------------------------------------------------
	.macro	if_icmpne_unsafe	jpc_off=0, seq_len=0
	POP2	r3, tmp1
	mov	r2, r2, lsl #24
        cmp     tmp1, r3
	orr	ip, r1, r2, asr #16
	bne	1f
	mov	ip, #3
1:
        ldrb  r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	if_icmpne_unsafe
	if_icmpne_unsafe
@-----------------------------------------------------------------------------
	.macro	if_icmplt_unsafe	jpc_off=0, seq_len=0
	POP2	r3, tmp1
	mov	r2, r2, lsl #24
        cmp     tmp1, r3
	orr	ip, r1, r2, asr #16
	blt	1f
	mov	ip, #3
1:
        ldrb  r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	if_icmplt_unsafe
	if_icmplt_unsafe
@-----------------------------------------------------------------------------
	.macro	if_icmpge_unsafe	jpc_off=0, seq_len=0
	POP2	r3, tmp1
	mov	r2, r2, lsl #24
        cmp     tmp1, r3
	orr	ip, r1, r2, asr #16
	bge	1f
	mov	ip, #3
1:
        ldrb  r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	if_icmpge_unsafe
	if_icmpge_unsafe
@-----------------------------------------------------------------------------
	.macro	if_icmpgt_unsafe	jpc_off=0, seq_len=0
	POP2	r3, tmp1
	mov	r2, r2, lsl #24
        cmp     tmp1, r3
	orr	ip, r1, r2, asr #16
	bgt	1f
	mov	ip, #3
1:
        ldrb  r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	if_icmpgt_unsafe
	if_icmpgt_unsafe
@-----------------------------------------------------------------------------
	.macro	if_icmple_unsafe	jpc_off=0, seq_len=0
	POP2	r3, tmp1
	mov	r2, r2, lsl #24
        cmp     tmp1, r3
	orr	ip, r1, r2, asr #16
	ble	1f
	mov	ip, #3
1:
        ldrb  r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	if_icmple_unsafe
	if_icmple_unsafe
@-----------------------------------------------------------------------------
	.macro	goto_unsafe	jpc_off=0, seq_len=0
	mov	r2, r2, lsl #24
        orr     ip, r1, r2, asr #16
        DISPATCH_START_REG	ip
	DISPATCH_BYTECODE
	.endm

	Opcode	goto_unsafe
	goto_unsafe
@-----------------------------------------------------------------------------
	.macro	jsr	jpc_off=0, seq_len=0
	ldr	r3, [istate, #ISTATE_METHOD]
	ldr	r1, [r3, #8]
	rsb	r2, r1, jpc
	sub	r2, r2, #45
	PUSH	r2
	b	do_goto_safe
	.endm

	Opcode	jsr
	jsr
@-----------------------------------------------------------------------------
	.macro	ret	jpc_off=0, seq_len=0
	ldr	r0, [istate, #ISTATE_METHOD]
	ldr	r3, [r0, #8]
	ldr	r1, [locals, -r2, lsl #2]
	add	jpc, r3, r1
	DISPATCH	48
	.endm

	Opcode	ret
	ret
@-----------------------------------------------------------------------------
	.macro	tableswitch	jpc_off=0, seq_len=0
	POP	a2
        bic     a1, jpc, #3
        ldr     a4,[a1,#8]
@       BYTESEX_REVERSE a3, a4, a3

        eor     a3, a4, a4, ror #16
        bic     a3, a3, #0xff0000
        mov     a4, a4, ror #8
        eor     a3, a4, a3, lsr #8

        ldr     a4,[a1,#12]
@       BYTESEX_REVERSE a4, a4, ip

        eor     ip, a4, a4, ror #16
        bic     ip, ip, #0xff0000
        mov     a4, a4, ror #8
        eor     a4, a4, ip, lsr #8

        sub     a2,a2,a3
        sub     a4,a4,a3
        cmp     a4,a2
        ldrcc   a1,[a1,#4]
        addcs   a1,a1,a2,LSL #2
        ldrcs   a1,[a1,#16]
@       BYTESEX_REVERSE a1, a1, a4

        eor     a4, a1, a1, ror #16
        bic     a4, a4, #0xff0000
        mov     a1, a1, ror #8
        eors    ip, a1, a4, lsr #8

        DISPATCH_START_REG	ip
	DISPATCH_BYTECODE
	.endm

	Opcode	tableswitch
	tableswitch
@-----------------------------------------------------------------------------
	.macro	lookupswitch	jpc_off=0, seq_len=0
	POP	a2
        bic     a1, jpc, #3
@       BYTESEX_REVERSE a2, a2, ip

        eor     ip, a2, a2, ror #16
        bic     ip, ip, #0xff0000
        mov     a2, a2, ror #8
        eor     a2, a2, ip, lsr #8

        ldr     a3,[a1,#8]
@       BYTESEX_REVERSE a3, a3, ip

        eor     ip, a3, a3, ror #16
        bic     ip, ip, #0xff0000
        mov     a3, a3, ror #8
        eor     a3, a3, ip, lsr #8

        subs    a4,a3,#1
        bmi     1f
        add     a1, a1, #4
0:
        ldr      a3,[a1,#8]!
        cmp     a3,a2
        beq     2f
        subs    a4,a4,#1
        bpl     0b
1:
        bic     a1, jpc, #3
2:
        ldr      a2,[a1,#4]
@       BYTESEX_REVERSE a2, a2, ip

        eor     ip, a2, a2, ror #16
        bic     ip, ip, #0xff0000
        mov     a2, a2, ror #8
        eors    ip, a2, ip, lsr #8

        DISPATCH_START_REG	ip
	DISPATCH_BYTECODE
	.endm

	Opcode	lookupswitch
	lookupswitch
@-----------------------------------------------------------------------------
	.macro	igetfield	jpc_off=0, seq_len=3
	DISPATCH_START	3
        add     tmp2, constpool, r1, lsl #12
	POP	tmp1
	add	tmp2, tmp2, r2, lsl #4
	DISPATCH_NEXT
#ifndef HW_NULL_PTR_CHECK
	cmp	tmp1, #0
	beq	null_ptr_exception_jpc_3
#endif
	ldr	tmp2, [tmp2, #8]
	DISPATCH_NEXT
.abortentry78:
	ldr	tmp2, [tmp1, tmp2]
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
	.endm

	Opcode	igetfield
	igetfield
@-----------------------------------------------------------------------------
	.macro	bgetfield	jpc_off=0, seq_len=3
	DISPATCH_START	3
        add     tmp2, constpool, r1, lsl #12
	POP	tmp1
	add	tmp2, tmp2, r2, lsl #4
	DISPATCH_NEXT
#ifndef HW_NULL_PTR_CHECK
	cmp	tmp1, #0
	beq	null_ptr_exception_jpc_3
#endif
	ldr	tmp2, [tmp2, #8]
	DISPATCH_NEXT
.abortentry79:
	ldrsb	tmp2, [tmp1, tmp2]
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
	.endm

	Opcode	bgetfield
	bgetfield
@-----------------------------------------------------------------------------
	.macro	cgetfield	jpc_off=0, seq_len=3
	DISPATCH_START	3
        add     tmp2, constpool, r1, lsl #12
	POP	tmp1
	add	tmp2, tmp2, r2, lsl #4
	DISPATCH_NEXT
#ifndef HW_NULL_PTR_CHECK
	cmp	tmp1, #0
	beq	null_ptr_exception_jpc_3
#endif
	ldr	tmp2, [tmp2, #8]
	DISPATCH_NEXT
.abortentry80:
	ldrh	tmp2, [tmp1, tmp2]
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
	.endm

	Opcode	cgetfield
	cgetfield
@-----------------------------------------------------------------------------
	.macro	sgetfield	jpc_off=0, seq_len=3
	DISPATCH_START	3
        add     tmp2, constpool, r1, lsl #12
	POP	tmp1
	add	tmp2, tmp2, r2, lsl #4
	DISPATCH_NEXT
#ifndef HW_NULL_PTR_CHECK
	cmp	tmp1, #0
	beq	null_ptr_exception_jpc_3
#endif
	ldr	tmp2, [tmp2, #8]
	DISPATCH_NEXT
.abortentry81:
	ldrsh	tmp2, [tmp1, tmp2]
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
	.endm

	Opcode	sgetfield
	sgetfield
@-----------------------------------------------------------------------------
	.macro	lgetfield	jpc_off=0, seq_len=3
	DISPATCH_START	3
        add     tmp2, constpool, r1, lsl #12
	POP	tmp1
	add	tmp2, tmp2, r2, lsl #4
	DISPATCH_NEXT
#ifndef HW_NULL_PTR_CHECK
	cmp	tmp1, #0
	beq	null_ptr_exception_jpc_3
#endif
	ldr	tmp2, [tmp2, #8]
	DISPATCH_NEXT
	add	tmp2, tmp1, tmp2
	DISPATCH_NEXT
.abortentry82:
	ldmia	tmp2, {tmp2, tmp1}
	DISPATCH_NEXT
	PUSH2	tmp2, tmp1
	DISPATCH_FINISH
	.endm

	Opcode	lgetfield
	lgetfield
@-----------------------------------------------------------------------------
	.macro	iputfield	jpc_off=0, seq_len=3
	DISPATCH_START	3
        add     tmp2, constpool, r1, lsl #12
	POP2	r3, tmp1		@ r3 = value, tmp1 = object
	add	tmp2, tmp2, r2, lsl #4
	DISPATCH_NEXT
#ifndef HW_NULL_PTR_CHECK
	cmp	tmp1, #0
	beq	null_ptr_exception_jpc_3
#endif
	ldr	tmp2, [tmp2, #8]
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
.abortentry83:
	str	r3, [tmp1, tmp2]
	DISPATCH_FINISH
	.endm

	Opcode	iputfield
	iputfield
@-----------------------------------------------------------------------------
	.macro	cputfield	jpc_off=0, seq_len=3
	DISPATCH_START	3
        add     tmp2, constpool, r1, lsl #12
	POP2	r3, tmp1		@ r3 = value, tmp1 = object
	add	tmp2, tmp2, r2, lsl #4
	DISPATCH_NEXT
#ifndef HW_NULL_PTR_CHECK
	cmp	tmp1, #0
	beq	null_ptr_exception_jpc_3
#endif
	ldr	tmp2, [tmp2, #8]
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
.abortentry84:
	strh	r3, [tmp1, tmp2]
	DISPATCH_FINISH
	.endm

	Opcode	cputfield
	cputfield
@-----------------------------------------------------------------------------
	.macro	bputfield	jpc_off=0, seq_len=3
	DISPATCH_START	3
        add     tmp2, constpool, r1, lsl #12
	POP2	r3, tmp1		@ r3 = value, tmp1 = object
	add	tmp2, tmp2, r2, lsl #4
	DISPATCH_NEXT
#ifndef HW_NULL_PTR_CHECK
	cmp	tmp1, #0
	beq	null_ptr_exception_jpc_3
#endif
	ldr	tmp2, [tmp2, #8]
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
.abortentry85:
	strb	r3, [tmp1, tmp2]
	DISPATCH_FINISH
	.endm

	Opcode	bputfield
	bputfield
@-----------------------------------------------------------------------------
	.macro	aputfield	jpc_off=0, seq_len=3
	GET_STACK	1, r0		@ r0 = object
        add     tmp2, constpool, r1, lsl #12
	POP	r1			@ r1 = value
	add	tmp2, tmp2, r2, lsl #4
	ldr	tmp2, [tmp2, #8]
	cmp	r0, #0
	beq	null_ptr_exception
	add	r0, r0, tmp2
	bl	oop_store
    ldr	r3, [dispatch, #Universe_collectedHeap_Address-XXX]
        DISPATCH_START  3
        POP     r2
    ldr r3, [r3, #0]
        DISPATCH_NEXT
    ldr r3, [r3, #12]
        DISPATCH_NEXT
    ldr r3, [r3, #76]
        mov     tmp2, #0
        strb    tmp2, [r3, r2, lsr #9]
        DISPATCH_FINISH
	.endm

	Opcode	aputfield
	aputfield
@-----------------------------------------------------------------------------
	.macro	lputfield	jpc_off=0, seq_len=3
	DISPATCH_START	3
        add     tmp2, constpool, r1, lsl #12
	POP3	r3, tmp1, lr		@ r3, tmp1 = value, lr = object
	add	tmp2, tmp2, r2, lsl #4
	DISPATCH_NEXT
#ifndef HW_NULL_PTR_CHECK
	cmp	lr, #0
	beq	null_ptr_exception_jpc_3
#endif
	ldr	tmp2, [tmp2, #8]
	DISPATCH_NEXT
	add	tmp2, lr, tmp2
	DISPATCH_NEXT
	DISPATCH_NEXT
.abortentry86:
	stm	tmp2, {r3, tmp1}
	DISPATCH_FINISH
	.endm

	Opcode	lputfield
	lputfield
@-----------------------------------------------------------------------------
	.macro	getstatic	jpc_off=0, seq_len=3
        DISPATCH_START  \seq_len
        add     tmp2, constpool, r1, lsl #12
        ldr     r3, [tmp2, r2, lsl #4]! @ tmp2 = cache, r3 = flags
        DISPATCH_NEXT
	and	r3, r3, #0x00ff0000
	cmp	r3, #178 << 16
	bne	resolve_getstatic
	ldr	r3, [tmp2, #4]
	ldr	r2, [tmp2, #12]
        ldr     lr, [tmp2, #8]
        movs    r2, r2, lsr #29
	bhi	getstatic_w		@ C = 1, Z = 0 => R2 == 3, 5, 7
	bcs	getstatic_h		@ C = 1 => R2 = 1
	beq	getstatic_sb		@ Z = 1 => R2 = 0
	tst	r2, #2
	bne	getstatic_dw
	b	getstatic_sh
	.endm

	Opcode	getstatic
	getstatic
@-----------------------------------------------------------------------------
	.macro	putstatic	jpc_off=0, seq_len=3
        DISPATCH_START  \seq_len
        add     tmp2, constpool, r1, lsl #12
        ldr     r3, [tmp2, r2, lsl #4]! @ tmp2 = cache, r3 = flags
        DISPATCH_NEXT
        and     r3, r3, #0xff000000
        cmp     r3, #179 << 24
	bne	resolve_putstatic
	ldr	r3, [tmp2, #4]		@ r3 = object
        ldr     lr, [tmp2, #12]           @ lr = tos_type
        ldr     r2, [tmp2, #8]            @ r2 = offset
	movs	lr, lr, lsr #29
	bhi	putstatic_w		@ C = 1, Z = 0 => R2 == 3, 5, 7
	bcs	putstatic_h		@ C = 1 => R2 = 1
	beq	putstatic_sb		@ Z = 1 => R2 = 0
	tst	lr, #2
	bne	putstatic_dw
	b	putstatic_sh
	.endm

	Opcode	putstatic
	putstatic
@-----------------------------------------------------------------------------
	.macro	return_unsafe	jpc_off=0, seq_len=0

	ldr	tmp2, [istate, #ISTATE_MONITOR_BASE]	@ tmp2 = base
	ldr	tmp1, [istate, #ISTATE_STACK_BASE]	@ tmp1 = end
	ldr	tmp_xxx, [istate, #ISTATE_THREAD]

	cmp	tmp1, tmp2
	bcc	1f
2:
	mov	r3, #0

	ldr	r2, [tmp_xxx, #THREAD_TOP_ZERO_FRAME]
	str	r3, [tmp_xxx, #THREAD_LAST_JAVA_SP]
	ldr	r0, [istate, #ISTATE_METHOD]
	ldr	r3, [r2, #0]
	ldrh	r0, [r0, #40]
	add	r1, r2, #4
	str	r3, [tmp_xxx, #THREAD_TOP_ZERO_FRAME]

	ldr	istate, [istate, #ISTATE_SAVED_ISTATE]
	add	stack, r1, r0, lsl #2
	cmp	istate, #0
	beq	normal_return

        ldr     jpc, [istate, #ISTATE_BCP]
        ldr     r2, [istate, #ISTATE_STACK_LIMIT]
        DISPATCH_START  3
        sub     stack, stack, #4
        ldr     r3, [tmp_xxx, #THREAD_TOP_ZERO_FRAME]
        DISPATCH_NEXT
        add     r2, r2, #4
        DISPATCH_NEXT
        str     r2, [tmp_xxx, #THREAD_JAVA_SP]
        DISPATCH_NEXT
        str     r3, [tmp_xxx, #THREAD_LAST_JAVA_SP]
        ldr     constpool, [istate, #ISTATE_CONSTANTS]
        ldr     locals, [istate, #ISTATE_LOCALS]
        DISPATCH_NEXT
	add	constpool, constpool, #CONST_POOL_OFFSET
        DISPATCH_FINISH
1:
	bl	return_check_monitors
	b	2b
	.endm

	Opcode	return_unsafe
	return_unsafe
@-----------------------------------------------------------------------------
	.macro	ireturn_unsafe	jpc_off=0, seq_len=0

	ldr	tmp2, [istate, #ISTATE_MONITOR_BASE]	@ tmp2 = base
	ldr	tmp1, [istate, #ISTATE_STACK_BASE]	@ tmp1 = end
	ldr	tmp_xxx, [istate, #ISTATE_THREAD]

	cmp	tmp1, tmp2
	bcc	1f
2:
	mov	r3, #0

	POP	r1					@ pop result before we lose stack

	ldr	stack, [tmp_xxx, #THREAD_TOP_ZERO_FRAME]
	str	r3, [tmp_xxx, #THREAD_LAST_JAVA_SP]
	ldr	r0, [istate, #ISTATE_METHOD]
	ldr	r3, [stack, #0]
	ldrh	r0, [r0, #40]

	ldr	istate, [istate, #ISTATE_SAVED_ISTATE]
	str	r3, [tmp_xxx, #THREAD_TOP_ZERO_FRAME]
	str	r1, [stack, r0, lsl #2]!
	cmp	istate, #0
	beq	normal_return

        ldr     jpc, [istate, #ISTATE_BCP]
        ldr     r2, [istate, #ISTATE_STACK_LIMIT]
	DISPATCH_START	3				@ ldrb	r0, [jpc, #3]!
        sub     stack, stack, #4
        ldr     r3, [tmp_xxx, #THREAD_TOP_ZERO_FRAME]
	DISPATCH_NEXT					@ ldrb	r1, [jpc, #2]
        add     r2, r2, #4
	DISPATCH_NEXT					@ ldr	ip, [dispatch, r0, lsl #2]
        str     r2, [tmp_xxx, #THREAD_JAVA_SP]
	DISPATCH_NEXT					@ ldrb	r2, [jpc, #1]
        str     r3, [tmp_xxx, #THREAD_LAST_JAVA_SP]
        ldr     constpool, [istate, #ISTATE_CONSTANTS]
        ldr     locals, [istate, #ISTATE_LOCALS]
	DISPATCH_NEXT					@ ands	lr, ip, lr
	add	constpool, constpool, #CONST_POOL_OFFSET
        DISPATCH_FINISH
1:
	bl	return_check_monitors
	b	2b
	.endm

	Opcode	ireturn_unsafe
	ireturn_unsafe
@-----------------------------------------------------------------------------
	.macro	lreturn_unsafe	jpc_off=0, seq_len=0

	ldr	tmp2, [istate, #ISTATE_MONITOR_BASE]	@ tmp2 = base
	ldr	tmp1, [istate, #ISTATE_STACK_BASE]	@ tmp1 = end
	ldr	tmp_xxx, [istate, #ISTATE_THREAD]
	cmp	tmp1, tmp2
	bcc	1f
2:
	mov	r3, #0

	ldr	r2, [tmp_xxx, #THREAD_TOP_ZERO_FRAME]
	str	r3, [tmp_xxx, #THREAD_LAST_JAVA_SP]
	ldr	r0, [istate, #ISTATE_METHOD]
	ldr	r3, [r2, #0]
	ldrh	r0, [r0, #40]
	add	r1, r2, #4
	str	r3, [tmp_xxx, #THREAD_TOP_ZERO_FRAME]

	ldr	istate, [istate, #ISTATE_SAVED_ISTATE]

	POP2	r2, r3

	add	stack, r1, r0, lsl #2
	stmdb	stack!, {r2, r3}
	cmp	istate, #0
	beq	normal_return

        ldr     jpc, [istate, #ISTATE_BCP]
        ldr     r2, [istate, #ISTATE_STACK_LIMIT]
        DISPATCH_START  3
        sub     stack, stack, #4
        ldr     r3, [tmp_xxx, #THREAD_TOP_ZERO_FRAME]
        DISPATCH_NEXT
        add     r2, r2, #4
        DISPATCH_NEXT
        str     r2, [tmp_xxx, #THREAD_JAVA_SP]
        DISPATCH_NEXT
        str     r3, [tmp_xxx, #THREAD_LAST_JAVA_SP]
        ldr     constpool, [istate, #ISTATE_CONSTANTS]
        ldr     locals, [istate, #ISTATE_LOCALS]
        DISPATCH_NEXT
	add	constpool, constpool, #CONST_POOL_OFFSET
        DISPATCH_FINISH
1:
	bl	return_check_monitors
	b	2b
	.endm

	Opcode	lreturn_unsafe
	lreturn_unsafe
@-----------------------------------------------------------------------------
	.macro	ldc	jpc_off=0, seq_len=2
	ldrb	lr, [jpc, #1]
	ldr	r3, [istate, #ISTATE_METHOD]			@ method

	DISPATCH_START	\seq_len

	ldr	r2, [r3, #12]			@ constants
	ldr	r3, [r2, #8]
	add	r3, r3, #12
	ldrb	r3, [r3, lr]

	DISPATCH_NEXT

	cmp	r3, #JVM_CONSTANT_Integer
	cmpne	r3, #JVM_CONSTANT_Float
	cmpne	r3, #JVM_CONSTANT_String
	bne	1f

	DISPATCH_NEXT

	add	r3, r2, lr, lsl #2
	ldr	lr, [r3, #32]
	PUSH	lr
	DISPATCH_FINISH
1:
	cmp	r3, #JVM_CONSTANT_Class
	bne	2f
	add	r0, r2, #32
	ldr	r0, [r0, lr, lsl #2]
	ldr	r1, [r0, #60]
	PUSH	r1
	DISPATCH	0
2:
	sub	jpc, jpc, #\seq_len
	ldr	r0, [istate, #ISTATE_THREAD]
        str     jpc, [istate, #ISTATE_BCP]
        str     stack, [istate, #ISTATE_STACK]
	mov	r1, #0
        bl      _ZN18InterpreterRuntime3ldcEP10JavaThreadb
	ldr	r0, [istate, #ISTATE_THREAD]			@ thread
	ldr	stack, [istate, #ISTATE_STACK]
	ldr	constpool, [istate, #ISTATE_CONSTANTS]
	ldr	r1, [r0, #THREAD_PENDING_EXC]
	ldr	jpc, [istate, #ISTATE_BCP]
	add	constpool, constpool, #CONST_POOL_OFFSET
	cmp	r1, #0
	ldr	locals, [istate, #ISTATE_LOCALS]
	bne	handle_exception
	ldr	r3, [r0, #THREAD_VM_RESULT]
	mov	r2, #0
	PUSH	r3
	str	r2, [r0, #THREAD_VM_RESULT]
	DISPATCH	\seq_len
	.endm

	Opcode	ldc
	ldc
@-----------------------------------------------------------------------------
	.macro	ldc_w	jpc_off=0, seq_len=3
	ldrb	lr, [jpc, #1]

	ldr	r3, [istate, #ISTATE_METHOD]			@ method
	ldrb	ip, [jpc, #2]
	ldr	r2, [r3, #12]			@ constants

	DISPATCH_START	\seq_len

	ldr	r3, [r2, #8]
	orr	lr, ip, lr, lsl #8
	add	r3, r3, #12
	ldrb	r3, [r3, lr]

	DISPATCH_NEXT

	cmp	r3, #JVM_CONSTANT_Integer
	cmpne	r3, #JVM_CONSTANT_Float
	cmpne	r3, #JVM_CONSTANT_String
	bne	1f

	DISPATCH_NEXT

	add	r3, r2, lr, lsl #2
	ldr	lr, [r3, #32]
	PUSH	lr
	DISPATCH_FINISH
1:
	cmp	r3, #JVM_CONSTANT_Class
	bne	2f
	add	r0, r2, #32
	ldr	r0, [r0, lr, lsl #2]
	ldr	r1, [r0, #60]
	PUSH	r1
	DISPATCH	0
2:
	sub	jpc, jpc, #\seq_len
	ldr	r0, [istate, #ISTATE_THREAD]
        str     jpc, [istate, #ISTATE_BCP]
        str     stack, [istate, #ISTATE_STACK]
	mov	r1, #1
        bl      _ZN18InterpreterRuntime3ldcEP10JavaThreadb
	ldr	r0, [istate, #ISTATE_THREAD]			@ thread
	ldr	stack, [istate, #ISTATE_STACK]
	ldr	constpool, [istate, #ISTATE_CONSTANTS]
	ldr	r1, [r0, #THREAD_PENDING_EXC]
	ldr	jpc, [istate, #ISTATE_BCP]
	add	constpool, constpool, #CONST_POOL_OFFSET
	cmp	r1, #0
	ldr	locals, [istate, #ISTATE_LOCALS]
	bne	handle_exception
	ldr	r3, [r0, #THREAD_VM_RESULT]
	mov	r2, #0
	PUSH	r3
	str	r2, [r0, #THREAD_VM_RESULT]
	DISPATCH	\seq_len
	.endm

	Opcode	ldc_w
	ldc_w
@-----------------------------------------------------------------------------
	.macro	ldc2_w	jpc_off=0, seq_len=3
	ldrb	r3, [jpc, #1]

	ldr	tmp1, [istate, #ISTATE_METHOD]			@ method
	ldrb	lr, [jpc, #2]
	ldr	r2, [tmp1, #12]			@ constants

	DISPATCH_START	\seq_len

	ldr	tmp1, [r2, #8]
	orr	r3, lr, r3, lsl #8
	add	tmp1, tmp1, #12
	ldrb	tmp1, [tmp1, r3]

	DISPATCH_NEXT

	cmp	tmp1, #JVM_CONSTANT_Long
	cmpne	tmp1, #JVM_CONSTANT_Double
	bne	vm_fatal_error

	DISPATCH_NEXT
	add	tmp1, r2, r3, lsl #2
	add	tmp1, tmp1, #32
	ldmia	tmp1, {r3, tmp1}
	PUSH2	r3, tmp1
	DISPATCH_FINISH
	.endm

	Opcode	ldc2_w
	ldc2_w
@-----------------------------------------------------------------------------
	.macro	iadd_u4store	jpc_off=0, seq_len=3
	ldrb	r3, [jpc, #2]
	DISPATCH_START	\seq_len
	POP2	tmp2, tmp1
	DISPATCH_NEXT
	add	tmp2, tmp1, tmp2
	DISPATCH_NEXT
	rsb	r3, r3, #0
	DISPATCH_NEXT
	DISPATCH_NEXT
	str	tmp2, [locals, r3, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	iadd_u4store
	iadd_u4store
@-----------------------------------------------------------------------------
	.macro	isub_u4store	jpc_off=0, seq_len=3
	ldrb	r3, [jpc, #2]
	DISPATCH_START	\seq_len
	POP2	tmp2, tmp1
	DISPATCH_NEXT
	sub	tmp2, tmp1, tmp2
	DISPATCH_NEXT
	rsb	r3, r3, #0
	DISPATCH_NEXT
	DISPATCH_NEXT
	str	tmp2, [locals, r3, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	isub_u4store
	isub_u4store
@-----------------------------------------------------------------------------
	.macro	iand_u4store	jpc_off=0, seq_len=3
	ldrb	r3, [jpc, #2]
	DISPATCH_START	\seq_len
	POP2	tmp2, tmp1
	DISPATCH_NEXT
	and	tmp2, tmp1, tmp2
	DISPATCH_NEXT
	rsb	r3, r3, #0
	DISPATCH_NEXT
	DISPATCH_NEXT
	str	tmp2, [locals, r3, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	iand_u4store
	iand_u4store
@-----------------------------------------------------------------------------
	.macro	ior_u4store	jpc_off=0, seq_len=3
	ldrb	r3, [jpc, #2]
	DISPATCH_START	\seq_len
	POP2	tmp2, tmp1
	DISPATCH_NEXT
	orr	tmp2, tmp1, tmp2
	DISPATCH_NEXT
	rsb	r3, r3, #0
	DISPATCH_NEXT
	DISPATCH_NEXT
	str	tmp2, [locals, r3, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	ior_u4store
	ior_u4store
@-----------------------------------------------------------------------------
	.macro	ixor_u4store	jpc_off=0, seq_len=3
	ldrb	r3, [jpc, #2]
	DISPATCH_START	\seq_len
	POP2	tmp2, tmp1
	DISPATCH_NEXT
	eor	tmp2, tmp1, tmp2
	DISPATCH_NEXT
	rsb	r3, r3, #0
	DISPATCH_NEXT
	DISPATCH_NEXT
	str	tmp2, [locals, r3, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	ixor_u4store
	ixor_u4store
@-----------------------------------------------------------------------------
	.macro	iadd_istore_N	jpc_off=0, seq_len=2
	ldrb	lr, [jpc, #1]
	DISPATCH_START	\seq_len
	DISPATCH_NEXT
	rsb	r3, lr, #opc_istore_0
	POP2	tmp2, tmp1
	DISPATCH_NEXT
	add	tmp2, tmp1, tmp2
	DISPATCH_NEXT
	DISPATCH_NEXT
	str	tmp2, [locals, r3, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	iadd_istore_N
	iadd_istore_N
@-----------------------------------------------------------------------------
	.macro	isub_istore_N	jpc_off=0, seq_len=2
	ldrb	lr, [jpc, #1]
	DISPATCH_START	\seq_len
	DISPATCH_NEXT
	rsb	r3, lr, #opc_istore_0
	POP2	tmp2, tmp1
	DISPATCH_NEXT
	sub	tmp2, tmp1, tmp2
	DISPATCH_NEXT
	DISPATCH_NEXT
	str	tmp2, [locals, r3, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	isub_istore_N
	isub_istore_N
@-----------------------------------------------------------------------------
	.macro	iand_istore_N	jpc_off=0, seq_len=2
	ldrb	lr, [jpc, #1]
	DISPATCH_START	\seq_len
	DISPATCH_NEXT
	rsb	r3, lr, #opc_istore_0
	POP2	tmp2, tmp1
	DISPATCH_NEXT
	and	tmp2, tmp1, tmp2
	DISPATCH_NEXT
	DISPATCH_NEXT
	str	tmp2, [locals, r3, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	iand_istore_N
	iand_istore_N
@-----------------------------------------------------------------------------
	.macro	ior_istore_N	jpc_off=0, seq_len=2
	ldrb	lr, [jpc, #1]
	DISPATCH_START	\seq_len
	DISPATCH_NEXT
	rsb	r3, lr, #opc_istore_0
	POP2	tmp2, tmp1
	DISPATCH_NEXT
	orr	tmp2, tmp1, tmp2
	DISPATCH_NEXT
	DISPATCH_NEXT
	str	tmp2, [locals, r3, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	ior_istore_N
	ior_istore_N
@-----------------------------------------------------------------------------
	.macro	ixor_istore_N	jpc_off=0, seq_len=2
	ldrb	lr, [jpc, #1]
	DISPATCH_START	\seq_len
	DISPATCH_NEXT
	rsb	r3, lr, #opc_istore_0
	POP2	tmp2, tmp1
	DISPATCH_NEXT
	eor	tmp2, tmp1, tmp2
	DISPATCH_NEXT
	DISPATCH_NEXT
	str	tmp2, [locals, r3, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	ixor_istore_N
	ixor_istore_N
@-----------------------------------------------------------------------------
	.macro	iload_iconst_N	jpc_off=0, seq_len=3
        ldrb    r3, [jpc, #2]
        DISPATCH_START  \seq_len
	rsb	r2, r2, #0
        DISPATCH_NEXT
        sub     r3, r3, #opc_iconst_0
        ldr     tmp1, [locals, r2, lsl #2]
        DISPATCH_NEXT
        DISPATCH_NEXT
        DISPATCH_NEXT
        PUSH2   r3, tmp1
        DISPATCH_FINISH
	.endm

	Opcode	iload_iconst_N
	iload_iconst_N
@-----------------------------------------------------------------------------
	.macro	iload_0_iconst_N	jpc_off=0, seq_len=2
        rsb     r3, r0, #opc_iload_0_iconst_N
        DISPATCH_START  \seq_len
        ldrb    r2, [jpc, #1-\seq_len]
        DISPATCH_NEXT
        ldr     tmp1, [locals, r3, lsl #2]
        DISPATCH_NEXT
        sub     tmp2, r2, #opc_iconst_0
        DISPATCH_NEXT
        DISPATCH_NEXT
        PUSH2   tmp2, tmp1
        DISPATCH_FINISH
	.endm

	Opcode	iload_0_iconst_N
	iload_0_iconst_N
@-----------------------------------------------------------------------------
	.macro	iaccess_0	jpc_off=0, seq_len=4
	ldrb	r2, [jpc, #3]
	rsb	tmp1, r0, #opc_iaccess_0
	ldrb	r3, [jpc, #2]
	add	tmp2, constpool, r2, lsl #12
	DISPATCH_START	4
	ldr	tmp1, [locals, tmp1, lsl #2]
	add	tmp2, r3, lsl #4
	DISPATCH_NEXT
#ifndef HW_NULL_PTR_CHECK
	cmp	tmp1, #0
	beq	null_ptr_exception_jpc_3
#endif
	DISPATCH_NEXT
        ldr     tmp2, [tmp2, #8]
	DISPATCH_NEXT
.abortentry87:
	ldr	tmp2, [tmp1, tmp2]
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
	.endm

	Opcode	iaccess_0
	iaccess_0
@-----------------------------------------------------------------------------
	.macro	aload_0_aload_0	jpc_off=0, seq_len=2
	rsb	tmp1, r0, #opc_aload_0
	DISPATCH_START	\seq_len
	rsb	tmp2, r1, #opc_aload_0
	DISPATCH_NEXT
	ldr	tmp1, [locals, tmp1, lsl #2]
	ldr	tmp2, [locals, tmp2, lsl #2]
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH2	tmp2, tmp1
	DISPATCH_FINISH
	.endm

	Opcode	aload_0_aload_0
	aload_0_aload_0
@-----------------------------------------------------------------------------
	.macro	aload_0_iload_0	jpc_off=0, seq_len=2
	rsb	tmp1, r0, #opc_aload_0
	DISPATCH_START	\seq_len
	rsb	tmp2, r1, #opc_iload_0
	DISPATCH_NEXT
	ldr	tmp1, [locals, tmp1, lsl #2]
	ldr	tmp2, [locals, tmp2, lsl #2]
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH2	tmp2, tmp1
	DISPATCH_FINISH
	.endm

	Opcode	aload_0_iload_0
	aload_0_iload_0
@-----------------------------------------------------------------------------
	.macro	iload_0_aload_0	jpc_off=0, seq_len=2
	rsb	tmp1, r0, #opc_iload_0
	DISPATCH_START	\seq_len
	rsb	tmp2, r1, #opc_aload_0
	DISPATCH_NEXT
	ldr	tmp1, [locals, tmp1, lsl #2]
	ldr	tmp2, [locals, tmp2, lsl #2]
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH2	tmp2, tmp1
	DISPATCH_FINISH
	.endm

	Opcode	iload_0_aload_0
	iload_0_aload_0
@-----------------------------------------------------------------------------
	.macro	iload_0_iload_0	jpc_off=0, seq_len=2
	rsb	tmp1, r0, #opc_iload_0
	DISPATCH_START	\seq_len
	rsb	tmp2, r1, #opc_iload_0
	DISPATCH_NEXT
	ldr	tmp1, [locals, tmp1, lsl #2]
	ldr	tmp2, [locals, tmp2, lsl #2]
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH2	tmp2, tmp1
	DISPATCH_FINISH
	.endm

	Opcode	iload_0_iload_0
	iload_0_iload_0
@-----------------------------------------------------------------------------
	.macro	aload_0_iload	jpc_off=0, seq_len=3
	ldrb	r3, [jpc, #2]
	rsb	tmp1, r0, #opc_aload_0
	DISPATCH_START	\seq_len
	ldr	tmp1, [locals, tmp1, lsl #2]
	rsb	r3, r3, #0
	DISPATCH_NEXT
	ldr	r3, [locals, r3, lsl #2]
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH2	r3, tmp1
	DISPATCH_FINISH
	.endm

	Opcode	aload_0_iload
	aload_0_iload
@-----------------------------------------------------------------------------
	.macro	iload_0_iload	jpc_off=0, seq_len=3
	ldrb	r3, [jpc, #2]
	rsb	tmp1, r0, #opc_iload_0
	DISPATCH_START	\seq_len
	ldr	tmp1, [locals, tmp1, lsl #2]
	rsb	r3, r3, #0
	DISPATCH_NEXT
	ldr	r3, [locals, r3, lsl #2]
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH2	r3, tmp1
	DISPATCH_FINISH
	.endm

	Opcode	iload_0_iload
	iload_0_iload
@-----------------------------------------------------------------------------
	.macro	iload_aload_0	jpc_off=0, seq_len=3
	DISPATCH_START	\seq_len
	rsb	tmp2, r1, #opc_aload_0
	DISPATCH_NEXT
	rsb	tmp1, r2, #0
	ldr	tmp2, [locals, tmp2, lsl #2]
	DISPATCH_NEXT
	ldr	tmp1, [locals, tmp1, lsl #2]
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH2	tmp2, tmp1
	DISPATCH_FINISH
	.endm

	Opcode	iload_aload_0
	iload_aload_0
@-----------------------------------------------------------------------------
	.macro	iload_iload_0	jpc_off=0, seq_len=3
	DISPATCH_START	\seq_len
	rsb	tmp2, r1, #opc_iload_0
	DISPATCH_NEXT
	rsb	tmp1, r2, #0
	ldr	tmp2, [locals, tmp2, lsl #2]
	DISPATCH_NEXT
	ldr	tmp1, [locals, tmp1, lsl #2]
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH2	tmp2, tmp1
	DISPATCH_FINISH
	.endm

	Opcode	iload_iload_0
	iload_iload_0
@-----------------------------------------------------------------------------
	.macro	iload_iload	jpc_off=0, seq_len=4
	ldrb	tmp2, [jpc, #3]
	rsb	tmp1, r2, #0
	DISPATCH_START	\seq_len
	rsb	tmp2, tmp2, #0
	ldr	tmp1, [locals, tmp1, lsl #2]
	DISPATCH_NEXT
	ldr	tmp2, [locals, tmp2, lsl #2]
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH2	tmp2, tmp1
	DISPATCH_FINISH
	.endm

	Opcode	iload_iload
	iload_iload
@-----------------------------------------------------------------------------
	.macro	aload_0_astore_0	jpc_off=0, seq_len=2
	rsb	tmp1, r0, #opc_aload_0
	DISPATCH_START	\seq_len
	rsb	tmp2, r1, #opc_astore_0
	DISPATCH_NEXT
	ldr	tmp1, [locals, tmp1, lsl #2]
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	str	tmp1, [locals, tmp2, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	aload_0_astore_0
	aload_0_astore_0
@-----------------------------------------------------------------------------
	.macro	iload_0_istore_0	jpc_off=0, seq_len=2
	rsb	tmp1, r0, #opc_iload_0
	DISPATCH_START	\seq_len
	rsb	tmp2, r1, #opc_istore_0
	DISPATCH_NEXT
	ldr	tmp1, [locals, tmp1, lsl #2]
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	str	tmp1, [locals, tmp2, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	iload_0_istore_0
	iload_0_istore_0
@-----------------------------------------------------------------------------
	.macro	aload_0_astore	jpc_off=0, seq_len=3
	ldrb	tmp2, [jpc, #2]
	rsb	tmp1, r0, #opc_aload_0
	DISPATCH_START	\seq_len
	rsb	tmp2, tmp2, #0
	DISPATCH_NEXT
	ldr	tmp1, [locals, tmp1, lsl #2]
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	str	tmp1, [locals, tmp2, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	aload_0_astore
	aload_0_astore
@-----------------------------------------------------------------------------
	.macro	iload_0_astore	jpc_off=0, seq_len=3
	ldrb	tmp2, [jpc, #2]
	rsb	tmp1, r0, #opc_iload_0
	DISPATCH_START	\seq_len
	rsb	tmp2, tmp2, #0
	DISPATCH_NEXT
	ldr	tmp1, [locals, tmp1, lsl #2]
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	str	tmp1, [locals, tmp2, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	iload_0_astore
	iload_0_astore
@-----------------------------------------------------------------------------
	.macro	iload_astore_0	jpc_off=0, seq_len=3
	DISPATCH_START	\seq_len
	rsb	tmp1, r1, #opc_astore_0
	DISPATCH_NEXT
	rsb	tmp2, r2, #0
	ldr	tmp2, [locals, tmp2, lsl #2]
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	str	tmp2, [locals, tmp1, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	iload_astore_0
	iload_astore_0
@-----------------------------------------------------------------------------
	.macro	iload_istore_0	jpc_off=0, seq_len=3
	DISPATCH_START	\seq_len
	rsb	tmp1, r1, #opc_istore_0
	DISPATCH_NEXT
	rsb	tmp2, r2, #0
	ldr	tmp2, [locals, tmp2, lsl #2]
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	str	tmp2, [locals, tmp1, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	iload_istore_0
	iload_istore_0
@-----------------------------------------------------------------------------
	.macro	iload_astore	jpc_off=0, seq_len=4
	ldrb	tmp1, [jpc, #3]
	rsb	tmp2, r2, #0
	DISPATCH_START	\seq_len
	rsb	tmp1, tmp1, #0
	DISPATCH_NEXT
	ldr	tmp2, [locals, tmp2, lsl #2]
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	str	tmp2, [locals, tmp1, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	iload_astore
	iload_astore
@-----------------------------------------------------------------------------
	.macro	aload_0_iconst_m1	jpc_off=0, seq_len=2
	rsb	tmp1, r0, #opc_aload_0
	DISPATCH_START	\seq_len
	sub	tmp2, r1, #opc_iconst_0
	DISPATCH_NEXT
	ldr	tmp1, [locals, tmp1, lsl #2]
	DISPATCH_NEXT
	PUSH	tmp1
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
	.endm

	Opcode	aload_0_iconst_m1
	aload_0_iconst_m1
@-----------------------------------------------------------------------------
	.macro	iload_0_iconst_m1	jpc_off=0, seq_len=2
        add     r0, r0, #opc_iload_0_iconst_N-opc_iload_0
        strb    r0, [jpc]
	b	do_iload_0_iconst_N
	.endm

	Opcode	iload_0_iconst_m1
	iload_0_iconst_m1
@-----------------------------------------------------------------------------
	.macro	iload_iconst_m1	jpc_off=0, seq_len=3
        cmp     r0, #opc_iload
        DISPATCH_START  \seq_len
        sub     r3, r1, #opc_iconst_0
        DISPATCH_NEXT
        ldr     tmp2, [locals, -r2, lsl #2]
        DISPATCH_NEXT
        beq     1f
        DISPATCH_NEXT
        DISPATCH_NEXT
        PUSH2   r3, tmp2
        DISPATCH_FINISH
1:
        mov     tmp1, #opc_iload_iconst_N
        strb    tmp1, [jpc, #-\seq_len]!
	b	do_iload_iconst_N
	.endm

	Opcode	iload_iconst_m1
	iload_iconst_m1
@-----------------------------------------------------------------------------
	.macro	aload_0_bipush	jpc_off=0, seq_len=3
	ldrsb	r2, [jpc, #2]
	rsb	r3, r0, #opc_aload_0
	DISPATCH_START	\seq_len
	ldr	r3, [locals, r3, lsl #2]
	DISPATCH_NEXT
	PUSH2	r2, r3
	DISPATCH_FINISH
	.endm

	Opcode	aload_0_bipush
	aload_0_bipush
@-----------------------------------------------------------------------------
	.macro	iload_0_bipush	jpc_off=0, seq_len=3
	ldrsb	r2, [jpc, #2]
	rsb	r3, r0, #opc_iload_0
	DISPATCH_START	\seq_len
	ldr	r3, [locals, r3, lsl #2]
	DISPATCH_NEXT
	PUSH2	r2, r3
	DISPATCH_FINISH
	.endm

	Opcode	iload_0_bipush
	iload_0_bipush
@-----------------------------------------------------------------------------
	.macro	aload_0_sipush	jpc_off=0, seq_len=4
        ldrsb   r2, [jpc, #2]   @ zero_extendqisi2
        ldrb    lr, [jpc, #3]   @ zero_extendqisi2
	rsb	r3, r0, #opc_aload_0
	DISPATCH_START	\seq_len
	ldr	r3, [locals, r3, lsl #2]
	DISPATCH_NEXT
        orr     r2, lr, r2, asl #8
	DISPATCH_NEXT
	PUSH2	r2, r3
	DISPATCH_FINISH
	.endm

	Opcode	aload_0_sipush
	aload_0_sipush
@-----------------------------------------------------------------------------
	.macro	iload_0_sipush	jpc_off=0, seq_len=4
        ldrsb   r2, [jpc, #2]   @ zero_extendqisi2
        ldrb    lr, [jpc, #3]   @ zero_extendqisi2
	rsb	r3, r0, #opc_iload_0
	DISPATCH_START	\seq_len
	ldr	r3, [locals, r3, lsl #2]
	DISPATCH_NEXT
        orr     r2, lr, r2, asl #8
	DISPATCH_NEXT
	PUSH2	r2, r3
	DISPATCH_FINISH
	.endm

	Opcode	iload_0_sipush
	iload_0_sipush
@-----------------------------------------------------------------------------
	.macro	iload_bipush	jpc_off=0, seq_len=4
	ldrsb	r3, [jpc, #3]
	DISPATCH_START	\seq_len
	ldr	lr, [locals, -r2, lsl #2]
	DISPATCH_NEXT
	PUSH2	r3, lr
	DISPATCH_FINISH
	.endm

	Opcode	iload_bipush
	iload_bipush
@-----------------------------------------------------------------------------
	.macro	iload_sipush	jpc_off=0, seq_len=5
	ldrsb	r3, [jpc, #3]
	ldrb	lr, [jpc, #4]
	DISPATCH_START	\seq_len
	ldr	tmp1, [locals, -r2, lsl #2]
        orr     r3, lr, r3, asl #8
	DISPATCH_NEXT
	PUSH2	r3, tmp1
	DISPATCH_FINISH
	.endm

	Opcode	iload_sipush
	iload_sipush
@-----------------------------------------------------------------------------
	.macro	iload_0_iaload	jpc_off=0, seq_len=2
	POP	r3
	rsb	r2, r0, #opc_iload_0
	DISPATCH_START	\seq_len
	ldr	r2, [locals, r2, lsl #2]
#ifndef HW_NULL_PTR_CHECK
	cmp	r3, #0
	beq	null_ptr_exception_jpc_1
#endif
.abortentry19:
	ldr	lr, [r3, #8]		@ lr = length
	DISPATCH_NEXT
	cmp	r2, lr
	bcs	array_bound_exception_jpc_1
	add	r3, r3, r2, lsl #2
	ldr	lr, [r3, #12]
	DISPATCH_NEXT
	PUSH	lr
	DISPATCH_FINISH
	.endm

	Opcode	iload_0_iaload
	iload_0_iaload
@-----------------------------------------------------------------------------
	.macro	iload_iaload	jpc_off=0, seq_len=3
	POP	r3
	ldr	r2, [locals, -r2, lsl #2]
	DISPATCH_START	\seq_len
#ifndef HW_NULL_PTR_CHECK
	cmp	r3, #0
	beq	null_ptr_exception_jpc_1
#endif
.abortentry20:
	ldr	lr, [r3, #8]		@ lr = length
	DISPATCH_NEXT
	cmp	r2, lr
	bcs	array_bound_exception_jpc_1
	add	r3, r3, r2, lsl #2
	ldr	lr, [r3, #12]
	DISPATCH_NEXT
	PUSH	lr
	DISPATCH_FINISH
	.endm

	Opcode	iload_iaload
	iload_iaload
@-----------------------------------------------------------------------------
	.macro	iload_0_baload	jpc_off=0, seq_len=2
	POP	r3
	rsb	r2, r0, #opc_iload_0
	DISPATCH_START	\seq_len
	ldr	r2, [locals, r2, lsl #2]
#ifndef HW_NULL_PTR_CHECK
	cmp	r3, #0
	beq	null_ptr_exception_jpc_1
#endif
.abortentry21:
	ldr	lr, [r3, #8]		@ lr = length
	DISPATCH_NEXT
	cmp	r2, lr
	bcs	array_bound_exception_jpc_1
	add	r3, r3, r2
	ldrsb	lr, [r3, #12]
	DISPATCH_NEXT
	PUSH	lr
	DISPATCH_FINISH
	.endm

	Opcode	iload_0_baload
	iload_0_baload
@-----------------------------------------------------------------------------
	.macro	iload_0_caload	jpc_off=0, seq_len=2
	POP	r3
	rsb	r2, r0, #opc_iload_0
	DISPATCH_START	\seq_len
	ldr	r2, [locals, r2, lsl #2]
#ifndef HW_NULL_PTR_CHECK
	cmp	r3, #0
	beq	null_ptr_exception_jpc_1
#endif
.abortentry22:
	ldr	lr, [r3, #8]		@ lr = length
	DISPATCH_NEXT
	cmp	r2, lr
	bcs	array_bound_exception_jpc_1
	add	r3, r3, r2, lsl #1
	ldrh	lr, [r3, #12]
	DISPATCH_NEXT
	PUSH	lr
	DISPATCH_FINISH
	.endm

	Opcode	iload_0_caload
	iload_0_caload
@-----------------------------------------------------------------------------
	.macro	iload_0_saload	jpc_off=0, seq_len=2
	POP	r3
	rsb	r2, r0, #opc_iload_0
	DISPATCH_START	\seq_len
	ldr	r2, [locals, r2, lsl #2]
#ifndef HW_NULL_PTR_CHECK
	cmp	r3, #0
	beq	null_ptr_exception_jpc_1
#endif
.abortentry23:
	ldr	lr, [r3, #8]		@ lr = length
	DISPATCH_NEXT
	cmp	r2, lr
	bcs	array_bound_exception_jpc_1
	add	r3, r3, r2, lsl #1
	ldrsh	lr, [r3, #12]
	DISPATCH_NEXT
	PUSH	lr
	DISPATCH_FINISH
	.endm

	Opcode	iload_0_saload
	iload_0_saload
@-----------------------------------------------------------------------------
	.macro	iload_baload	jpc_off=0, seq_len=3
	POP	r3
	ldr	r2, [locals, -r2, lsl #2]
	DISPATCH_START	\seq_len
#ifndef HW_NULL_PTR_CHECK
	cmp	r3, #0
	beq	null_ptr_exception_jpc_1
#endif
.abortentry24:
	ldr	lr, [r3, #8]		@ lr = length
	DISPATCH_NEXT
	cmp	r2, lr
	bcs	array_bound_exception_jpc_1
	add	r3, r3, r2
	ldrsb	lr, [r3, #12]
	DISPATCH_NEXT
	PUSH	lr
	DISPATCH_FINISH
	.endm

	Opcode	iload_baload
	iload_baload
@-----------------------------------------------------------------------------
	.macro	iload_caload	jpc_off=0, seq_len=3
	POP	r3
	ldr	r2, [locals, -r2, lsl #2]
	DISPATCH_START	\seq_len
#ifndef HW_NULL_PTR_CHECK
	cmp	r3, #0
	beq	null_ptr_exception_jpc_1
#endif
.abortentry25:
	ldr	lr, [r3, #8]		@ lr = length
	DISPATCH_NEXT
	cmp	r2, lr
	bcs	array_bound_exception_jpc_1
	add	r3, r3, r2, lsl #1
	ldrh	lr, [r3, #12]
	DISPATCH_NEXT
	PUSH	lr
	DISPATCH_FINISH
	.endm

	Opcode	iload_caload
	iload_caload
@-----------------------------------------------------------------------------
	.macro	iload_saload	jpc_off=0, seq_len=3
	POP	r3
	ldr	r2, [locals, -r2, lsl #2]
	DISPATCH_START	\seq_len
#ifndef HW_NULL_PTR_CHECK
	cmp	r3, #0
	beq	null_ptr_exception_jpc_1
#endif
.abortentry26:
	ldr	lr, [r3, #8]		@ lr = length
	DISPATCH_NEXT
	cmp	r2, lr
	bcs	array_bound_exception_jpc_1
	add	r3, r3, r2, lsl #1
	ldrsh	lr, [r3, #12]
	DISPATCH_NEXT
	PUSH	lr
	DISPATCH_FINISH
	.endm

	Opcode	iload_saload
	iload_saload
@-----------------------------------------------------------------------------
	.macro	iload_0_iastore	jpc_off=0, seq_len=2
	POP2	r2, r3
	rsb	tmp1, r0, #opc_iload_0
	DISPATCH_START	\seq_len
	ldr	tmp1, [locals, tmp1, lsl #2]
#ifndef HW_NULL_PTR_CHECK
	cmp	r3, #0
	beq	null_ptr_exception_jpc_1
#endif
.abortentry27:
	ldr	lr, [r3, #8]		@ lr = limit
	DISPATCH_NEXT
	cmp	r2, lr
	bcs	array_bound_exception_jpc_1
	DISPATCH_NEXT
	add	r3, r3, r2, lsl #2
	str	tmp1, [r3, #12]
	DISPATCH_FINISH
	.endm

	Opcode	iload_0_iastore
	iload_0_iastore
@-----------------------------------------------------------------------------
	.macro	iload_0_bastore	jpc_off=0, seq_len=2
	POP2	r2, r3
	rsb	tmp1, r0, #opc_iload_0
	DISPATCH_START	\seq_len
	ldr	tmp1, [locals, tmp1, lsl #2]
#ifndef HW_NULL_PTR_CHECK
	cmp	r3, #0
	beq	null_ptr_exception_jpc_1
#endif
.abortentry28:
	ldr	lr, [r3, #8]		@ lr = limit
	DISPATCH_NEXT
	cmp	r2, lr
	bcs	array_bound_exception_jpc_1
	DISPATCH_NEXT
	add	r3, r3, r2
	strb	tmp1, [r3, #12]
	DISPATCH_FINISH
	.endm

	Opcode	iload_0_bastore
	iload_0_bastore
@-----------------------------------------------------------------------------
	.macro	iload_0_castore	jpc_off=0, seq_len=2
	POP2	r2, r3
	rsb	tmp1, r0, #opc_iload_0
	DISPATCH_START	\seq_len
	ldr	tmp1, [locals, tmp1, lsl #2]
#ifndef HW_NULL_PTR_CHECK
	cmp	r3, #0
	beq	null_ptr_exception_jpc_1
#endif
.abortentry29:
	ldr	lr, [r3, #8]		@ lr = limit
	DISPATCH_NEXT
	cmp	r2, lr
	bcs	array_bound_exception_jpc_1
	DISPATCH_NEXT
	add	r3, r3, r2, lsl #1
	strh	tmp1, [r3, #12]
	DISPATCH_FINISH
	.endm

	Opcode	iload_0_castore
	iload_0_castore
@-----------------------------------------------------------------------------
	.macro	iload_iastore	jpc_off=0, seq_len=3
	POP2	r3, tmp1
	DISPATCH_START	\seq_len
	ldr	r2, [locals, -r2, lsl #2]
#ifndef HW_NULL_PTR_CHECK
	cmp	tmp1, #0
	beq	null_ptr_exception_jpc_1
#endif
.abortentry30:
	ldr	lr, [tmp1, #8]		@ lr = limit
	DISPATCH_NEXT
	cmp	r3, lr
	bcs	array_bound_exception_jpc_1_r3
	DISPATCH_NEXT
	add	tmp1, tmp1, r3, lsl #2
	str	r2, [tmp1, #12]
	DISPATCH_FINISH
	.endm

	Opcode	iload_iastore
	iload_iastore
@-----------------------------------------------------------------------------
	.macro	iload_bastore	jpc_off=0, seq_len=3
	POP2	r3, tmp1
	DISPATCH_START	\seq_len
	ldr	r2, [locals, -r2, lsl #2]
#ifndef HW_NULL_PTR_CHECK
	cmp	tmp1, #0
	beq	null_ptr_exception_jpc_1
#endif
.abortentry31:
	ldr	lr, [tmp1, #8]		@ lr = limit
	DISPATCH_NEXT
	cmp	r3, lr
	bcs	array_bound_exception_jpc_1_r3
	DISPATCH_NEXT
	add	tmp1, tmp1, r3
	strb	r2, [tmp1, #12]
	DISPATCH_FINISH
	.endm

	Opcode	iload_bastore
	iload_bastore
@-----------------------------------------------------------------------------
	.macro	iload_castore	jpc_off=0, seq_len=3
	POP2	r3, tmp1
	DISPATCH_START	\seq_len
	ldr	r2, [locals, -r2, lsl #2]
#ifndef HW_NULL_PTR_CHECK
	cmp	tmp1, #0
	beq	null_ptr_exception_jpc_1
#endif
.abortentry32:
	ldr	lr, [tmp1, #8]		@ lr = limit
	DISPATCH_NEXT
	cmp	r3, lr
	bcs	array_bound_exception_jpc_1_r3
	DISPATCH_NEXT
	add	tmp1, tmp1, r3, lsl #1
	strh	r2, [tmp1, #12]
	DISPATCH_FINISH
	.endm

	Opcode	iload_castore
	iload_castore
@-----------------------------------------------------------------------------
	.macro	iload_0_iadd	jpc_off=0, seq_len=2
	POP	tmp2
	rsb	tmp1, r0, #opc_iload_0
	DISPATCH_START	\seq_len
	ldr	tmp1, [locals, tmp1, lsl #2]
	DISPATCH_NEXT
	add	tmp1, tmp2, tmp1
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	tmp1
	DISPATCH_FINISH
	.endm

	Opcode	iload_0_iadd
	iload_0_iadd
@-----------------------------------------------------------------------------
	.macro	iload_iadd	jpc_off=0, seq_len=3
	DISPATCH_START	\seq_len
	rsb	tmp2, r2, #0
	POP	tmp1
	DISPATCH_NEXT
	ldr	tmp2, [locals, tmp2, lsl #2]
	DISPATCH_NEXT
	add	tmp2, tmp1, tmp2
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
	.endm

	Opcode	iload_iadd
	iload_iadd
@-----------------------------------------------------------------------------
	.macro	iload_0_isub	jpc_off=0, seq_len=2
	POP	tmp2
	rsb	tmp1, r0, #opc_iload_0
	DISPATCH_START	\seq_len
	ldr	tmp1, [locals, tmp1, lsl #2]
	DISPATCH_NEXT
	sub	tmp1, tmp2, tmp1
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	tmp1
	DISPATCH_FINISH
	.endm

	Opcode	iload_0_isub
	iload_0_isub
@-----------------------------------------------------------------------------
	.macro	iload_isub	jpc_off=0, seq_len=3
	DISPATCH_START	\seq_len
	rsb	tmp2, r2, #0
	POP	tmp1
	DISPATCH_NEXT
	ldr	tmp2, [locals, tmp2, lsl #2]
	DISPATCH_NEXT
	sub	tmp2, tmp1, tmp2
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
	.endm

	Opcode	iload_isub
	iload_isub
@-----------------------------------------------------------------------------
	.macro	iload_0_imul	jpc_off=0, seq_len=2
	POP	r2
	rsb	lr, r0, #opc_iload_0
	DISPATCH_START	\seq_len
	ldr	lr, [locals, lr, lsl #2]
	DISPATCH_NEXT
	mul	r3, r2, lr
	DISPATCH_NEXT
	PUSH	r3
	DISPATCH_FINISH
	.endm

	Opcode	iload_0_imul
	iload_0_imul
@-----------------------------------------------------------------------------
	.macro	iload_imul	jpc_off=0, seq_len=3
	DISPATCH_START	\seq_len
	POP	r3
	ldr	r2, [locals, -r2, lsl #2]
	DISPATCH_NEXT
	mul	lr, r3, r2
	DISPATCH_NEXT
	PUSH	lr
	DISPATCH_FINISH
	.endm

	Opcode	iload_imul
	iload_imul
@-----------------------------------------------------------------------------
	.macro	iload_0_idiv	jpc_off=0, seq_len=2
	rsb	r0, r0, #opc_iload_0
	ldr	r0, [locals, r0, lsl #2]
	add	jpc, jpc, #1
	POP	r1
	b	int_div
	.endm

	Opcode	iload_0_idiv
	iload_0_idiv
@-----------------------------------------------------------------------------
	.macro	iload_idiv	jpc_off=0, seq_len=3
	add	jpc, jpc, #2
	POP	r1
	ldr	r0, [locals, -r2, lsl #2]
	b	int_div
	.endm

	Opcode	iload_idiv
	iload_idiv
@-----------------------------------------------------------------------------
	.macro	iload_0_irem	jpc_off=0, seq_len=2
	rsb	r0, r0, #opc_iload_0
	ldr	r0, [locals, r0, lsl #2]
	add	jpc, jpc, #1
	POP	r1
	b	int_rem
	.endm

	Opcode	iload_0_irem
	iload_0_irem
@-----------------------------------------------------------------------------
	.macro	iload_irem	jpc_off=0, seq_len=3
	ldr	r0, [locals, -r2, lsl #2]
	add	jpc, jpc, #2
	POP	r1
	b	int_rem
	.endm

	Opcode	iload_irem
	iload_irem
@-----------------------------------------------------------------------------
	.macro	iload_0_ineg	jpc_off=0, seq_len=2
	rsb	lr, r0, #opc_iload_0
	DISPATCH_START	\seq_len
	ldr	lr, [locals, lr, lsl #2]
	DISPATCH_NEXT
	rsb	lr, lr, #0
	PUSH	lr
	DISPATCH_FINISH
	.endm

	Opcode	iload_0_ineg
	iload_0_ineg
@-----------------------------------------------------------------------------
	.macro	iload_ineg	jpc_off=0, seq_len=3
	DISPATCH_START	\seq_len
	ldr	r2, [locals, -r2, lsl #2]
	DISPATCH_NEXT
	rsb	r2, r2, #0
	PUSH	r2
	DISPATCH_FINISH
	.endm

	Opcode	iload_ineg
	iload_ineg
@-----------------------------------------------------------------------------
	.macro	iload_0_ishl	jpc_off=0, seq_len=2
	POP	r2
	rsb	lr, r0, #opc_iload_0
	DISPATCH_START	\seq_len
	ldr	lr, [locals, lr, lsl #2]
	DISPATCH_NEXT
	mov	lr, r2, lsl lr
	DISPATCH_NEXT
	PUSH	lr
	DISPATCH_FINISH
	.endm

	Opcode	iload_0_ishl
	iload_0_ishl
@-----------------------------------------------------------------------------
	.macro	iload_ishl	jpc_off=0, seq_len=3
	DISPATCH_START	\seq_len
	POP	r3
	ldr	r2, [locals, -r2, lsl #2]
	DISPATCH_NEXT
	mov	r2, r3, lsl r2
	DISPATCH_NEXT
	PUSH	r2
	DISPATCH_FINISH
	.endm

	Opcode	iload_ishl
	iload_ishl
@-----------------------------------------------------------------------------
	.macro	iload_0_ishr	jpc_off=0, seq_len=2
	POP	r2
	rsb	lr, r0, #opc_iload_0
	DISPATCH_START	\seq_len
	ldr	lr, [locals, lr, lsl #2]
	DISPATCH_NEXT
	mov	lr, r2, asr lr
	DISPATCH_NEXT
	PUSH	lr
	DISPATCH_FINISH
	.endm

	Opcode	iload_0_ishr
	iload_0_ishr
@-----------------------------------------------------------------------------
	.macro	iload_ishr	jpc_off=0, seq_len=3
	DISPATCH_START	\seq_len
	POP	r3
	ldr	r2, [locals, -r2, lsl #2]
	DISPATCH_NEXT
	mov	r2, r3, asr r2
	DISPATCH_NEXT
	PUSH	r2
	DISPATCH_FINISH
	.endm

	Opcode	iload_ishr
	iload_ishr
@-----------------------------------------------------------------------------
	.macro	iload_0_iushr	jpc_off=0, seq_len=2
	POP	r2
	rsb	lr, r0, #opc_iload_0
	DISPATCH_START	\seq_len
	ldr	lr, [locals, lr, lsl #2]
	DISPATCH_NEXT
	mov	lr, r2, lsr lr
	DISPATCH_NEXT
	PUSH	lr
	DISPATCH_FINISH
	.endm

	Opcode	iload_0_iushr
	iload_0_iushr
@-----------------------------------------------------------------------------
	.macro	iload_iushr	jpc_off=0, seq_len=3
	ldrb	r2, [jpc, #1]
	DISPATCH_START	\seq_len
	POP	r3
	ldr	r2, [locals, -r2, lsl #2]
	DISPATCH_NEXT
	mov	r2, r3, lsr r2
	DISPATCH_NEXT
	PUSH	r2
	DISPATCH_FINISH
	.endm

	Opcode	iload_iushr
	iload_iushr
@-----------------------------------------------------------------------------
	.macro	iload_0_iand	jpc_off=0, seq_len=2
	POP	tmp2
	rsb	tmp1, r0, #opc_iload_0
	DISPATCH_START	\seq_len
	ldr	tmp1, [locals, tmp1, lsl #2]
	DISPATCH_NEXT
	and	tmp1, tmp2, tmp1
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	tmp1
	DISPATCH_FINISH
	.endm

	Opcode	iload_0_iand
	iload_0_iand
@-----------------------------------------------------------------------------
	.macro	iload_iand	jpc_off=0, seq_len=3
	DISPATCH_START	\seq_len
	rsb	tmp2, r2, #0
	POP	tmp1
	DISPATCH_NEXT
	ldr	tmp2, [locals, tmp2, lsl #2]
	DISPATCH_NEXT
	and	tmp2, tmp1, tmp2
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
	.endm

	Opcode	iload_iand
	iload_iand
@-----------------------------------------------------------------------------
	.macro	iload_0_ior	jpc_off=0, seq_len=2
	POP	tmp2
	rsb	tmp1, r0, #opc_iload_0
	DISPATCH_START	\seq_len
	ldr	tmp1, [locals, tmp1, lsl #2]
	DISPATCH_NEXT
	orr	tmp1, tmp2, tmp1
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	tmp1
	DISPATCH_FINISH
	.endm

	Opcode	iload_0_ior
	iload_0_ior
@-----------------------------------------------------------------------------
	.macro	iload_ior	jpc_off=0, seq_len=3
	DISPATCH_START	\seq_len
	rsb	tmp2, r2, #0
	POP	tmp1
	DISPATCH_NEXT
	ldr	tmp2, [locals, tmp2, lsl #2]
	DISPATCH_NEXT
	orr	tmp2, tmp1, tmp2
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
	.endm

	Opcode	iload_ior
	iload_ior
@-----------------------------------------------------------------------------
	.macro	iload_0_ixor	jpc_off=0, seq_len=2
	POP	tmp2
	rsb	tmp1, r0, #opc_iload_0
	DISPATCH_START	\seq_len
	ldr	tmp1, [locals, tmp1, lsl #2]
	DISPATCH_NEXT
	eor	tmp1, tmp2, tmp1
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	tmp1
	DISPATCH_FINISH
	.endm

	Opcode	iload_0_ixor
	iload_0_ixor
@-----------------------------------------------------------------------------
	.macro	iload_ixor	jpc_off=0, seq_len=3
	DISPATCH_START	\seq_len
	rsb	tmp2, r2, #0
	POP	tmp1
	DISPATCH_NEXT
	ldr	tmp2, [locals, tmp2, lsl #2]
	DISPATCH_NEXT
	eor	tmp2, tmp1, tmp2
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
	.endm

	Opcode	iload_ixor
	iload_ixor
@-----------------------------------------------------------------------------
	.macro	iload_0_i2c	jpc_off=0, seq_len=2
	rsb	lr, r0, #opc_iload_0
	DISPATCH_START	\seq_len
	ldr	lr, [locals, lr, lsl #2]
	DISPATCH_NEXT
        mov     lr, lr, asl #16
        mov     lr, lr, lsr #16
	PUSH	lr
	DISPATCH_FINISH
	.endm

	Opcode	iload_0_i2c
	iload_0_i2c
@-----------------------------------------------------------------------------
	.macro	iload_i2c	jpc_off=0, seq_len=3
	DISPATCH_START	\seq_len
	ldr	r2, [locals, -r2, lsl #2]
	DISPATCH_NEXT
        mov     r2, r2, asl #16
        mov     r2, r2, lsr #16
	PUSH	r2
	DISPATCH_FINISH
	.endm

	Opcode	iload_i2c
	iload_i2c
@-----------------------------------------------------------------------------
	.macro	iload_0_ifeq	jpc_off=0, seq_len=1
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	rsb	r3, r0, #opc_iload_0
	add	jpc, jpc, #1
	ldr	r3, [locals, r3, lsl #2]
        cmp     r3, #0
	orr	ip, ip, r1, lsl #8
	beq	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iload_0_ifeq
	iload_0_ifeq
@-----------------------------------------------------------------------------
	.macro	iload_ifeq	jpc_off=0, seq_len=2
        ldrsb   r1, [jpc, #3]
        ldrb    ip, [jpc, #4]
	add	jpc, jpc, #2
	ldr	r3, [locals, -r2, lsl #2]
        cmp     r3, #0
        orr     ip, ip, r1, lsl #8
	beq	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iload_ifeq
	iload_ifeq
@-----------------------------------------------------------------------------
	.macro	iload_0_ifne	jpc_off=0, seq_len=1
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	rsb	r3, r0, #opc_iload_0
	add	jpc, jpc, #1
	ldr	r3, [locals, r3, lsl #2]
        cmp     r3, #0
	orr	ip, ip, r1, lsl #8
	bne	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iload_0_ifne
	iload_0_ifne
@-----------------------------------------------------------------------------
	.macro	iload_ifne	jpc_off=0, seq_len=2
        ldrsb   r1, [jpc, #3]
        ldrb    ip, [jpc, #4]
	add	jpc, jpc, #2
	ldr	r3, [locals, -r2, lsl #2]
        cmp     r3, #0
        orr     ip, ip, r1, lsl #8
	bne	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iload_ifne
	iload_ifne
@-----------------------------------------------------------------------------
	.macro	iload_0_iflt	jpc_off=0, seq_len=1
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	rsb	r3, r0, #opc_iload_0
	add	jpc, jpc, #1
	ldr	r3, [locals, r3, lsl #2]
        cmp     r3, #0
	orr	ip, ip, r1, lsl #8
	blt	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iload_0_iflt
	iload_0_iflt
@-----------------------------------------------------------------------------
	.macro	iload_iflt	jpc_off=0, seq_len=2
        ldrsb   r1, [jpc, #3]
        ldrb    ip, [jpc, #4]
	add	jpc, jpc, #2
	ldr	r3, [locals, -r2, lsl #2]
        cmp     r3, #0
        orr     ip, ip, r1, lsl #8
	blt	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iload_iflt
	iload_iflt
@-----------------------------------------------------------------------------
	.macro	iload_0_ifge	jpc_off=0, seq_len=1
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	rsb	r3, r0, #opc_iload_0
	add	jpc, jpc, #1
	ldr	r3, [locals, r3, lsl #2]
        cmp     r3, #0
	orr	ip, ip, r1, lsl #8
	bge	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iload_0_ifge
	iload_0_ifge
@-----------------------------------------------------------------------------
	.macro	iload_ifge	jpc_off=0, seq_len=2
        ldrsb   r1, [jpc, #3]
        ldrb    ip, [jpc, #4]
	add	jpc, jpc, #2
	ldr	r3, [locals, -r2, lsl #2]
        cmp     r3, #0
        orr     ip, ip, r1, lsl #8
	bge	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iload_ifge
	iload_ifge
@-----------------------------------------------------------------------------
	.macro	iload_0_ifgt	jpc_off=0, seq_len=1
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	rsb	r3, r0, #opc_iload_0
	add	jpc, jpc, #1
	ldr	r3, [locals, r3, lsl #2]
        cmp     r3, #0
	orr	ip, ip, r1, lsl #8
	bgt	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iload_0_ifgt
	iload_0_ifgt
@-----------------------------------------------------------------------------
	.macro	iload_ifgt	jpc_off=0, seq_len=2
        ldrsb   r1, [jpc, #3]
        ldrb    ip, [jpc, #4]
	add	jpc, jpc, #2
	ldr	r3, [locals, -r2, lsl #2]
        cmp     r3, #0
        orr     ip, ip, r1, lsl #8
	bgt	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iload_ifgt
	iload_ifgt
@-----------------------------------------------------------------------------
	.macro	iload_0_ifle	jpc_off=0, seq_len=1
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	rsb	r3, r0, #opc_iload_0
	add	jpc, jpc, #1
	ldr	r3, [locals, r3, lsl #2]
        cmp     r3, #0
	orr	ip, ip, r1, lsl #8
	ble	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iload_0_ifle
	iload_0_ifle
@-----------------------------------------------------------------------------
	.macro	iload_ifle	jpc_off=0, seq_len=2
        ldrsb   r1, [jpc, #3]
        ldrb    ip, [jpc, #4]
	add	jpc, jpc, #2
	ldr	r3, [locals, -r2, lsl #2]
        cmp     r3, #0
        orr     ip, ip, r1, lsl #8
	ble	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iload_ifle
	iload_ifle
@-----------------------------------------------------------------------------
	.macro	iload_0_if_icmpeq	jpc_off=0, seq_len=1
	POP	r3
	rsb	r2, r0, #opc_iload_0
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	ldr	r2, [locals, r2, lsl #2]
	add	jpc, jpc, #1
        cmp     r3, r2
	orr	ip, ip, r1, lsl #8
	beq	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iload_0_if_icmpeq
	iload_0_if_icmpeq
@-----------------------------------------------------------------------------
	.macro	iload_if_icmpeq	jpc_off=0, seq_len=2
	POP	r3
        ldrsb   r1, [jpc, #3]
        ldrb    ip, [jpc, #4]
	ldr	r2, [locals, -r2, lsl #2]
	add	jpc, jpc, #2
        cmp     r3, r2
        orr     ip, ip, r1, lsl #8
	beq	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iload_if_icmpeq
	iload_if_icmpeq
@-----------------------------------------------------------------------------
	.macro	iload_0_if_icmpne	jpc_off=0, seq_len=1
	POP	r3
	rsb	r2, r0, #opc_iload_0
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	ldr	r2, [locals, r2, lsl #2]
	add	jpc, jpc, #1
        cmp     r3, r2
	orr	ip, ip, r1, lsl #8
	bne	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iload_0_if_icmpne
	iload_0_if_icmpne
@-----------------------------------------------------------------------------
	.macro	iload_if_icmpne	jpc_off=0, seq_len=2
	POP	r3
        ldrsb   r1, [jpc, #3]
        ldrb    ip, [jpc, #4]
	ldr	r2, [locals, -r2, lsl #2]
	add	jpc, jpc, #2
        cmp     r3, r2
        orr     ip, ip, r1, lsl #8
	bne	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iload_if_icmpne
	iload_if_icmpne
@-----------------------------------------------------------------------------
	.macro	iload_0_if_icmplt	jpc_off=0, seq_len=1
	POP	r3
	rsb	r2, r0, #opc_iload_0
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	ldr	r2, [locals, r2, lsl #2]
	add	jpc, jpc, #1
        cmp     r3, r2
	orr	ip, ip, r1, lsl #8
	blt	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iload_0_if_icmplt
	iload_0_if_icmplt
@-----------------------------------------------------------------------------
	.macro	iload_if_icmplt	jpc_off=0, seq_len=2
	POP	r3
        ldrsb   r1, [jpc, #3]
        ldrb    ip, [jpc, #4]
	ldr	r2, [locals, -r2, lsl #2]
	add	jpc, jpc, #2
        cmp     r3, r2
        orr     ip, ip, r1, lsl #8
	blt	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iload_if_icmplt
	iload_if_icmplt
@-----------------------------------------------------------------------------
	.macro	iload_0_if_icmpge	jpc_off=0, seq_len=1
	POP	r3
	rsb	r2, r0, #opc_iload_0
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	ldr	r2, [locals, r2, lsl #2]
	add	jpc, jpc, #1
        cmp     r3, r2
	orr	ip, ip, r1, lsl #8
	bge	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iload_0_if_icmpge
	iload_0_if_icmpge
@-----------------------------------------------------------------------------
	.macro	iload_if_icmpge	jpc_off=0, seq_len=2
	POP	r3
        ldrsb   r1, [jpc, #3]
        ldrb    ip, [jpc, #4]
	ldr	r2, [locals, -r2, lsl #2]
	add	jpc, jpc, #2
        cmp     r3, r2
        orr     ip, ip, r1, lsl #8
	bge	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iload_if_icmpge
	iload_if_icmpge
@-----------------------------------------------------------------------------
	.macro	iload_0_if_icmpgt	jpc_off=0, seq_len=1
	POP	r3
	rsb	r2, r0, #opc_iload_0
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	ldr	r2, [locals, r2, lsl #2]
	add	jpc, jpc, #1
        cmp     r3, r2
	orr	ip, ip, r1, lsl #8
	bgt	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iload_0_if_icmpgt
	iload_0_if_icmpgt
@-----------------------------------------------------------------------------
	.macro	iload_if_icmpgt	jpc_off=0, seq_len=2
	POP	r3
        ldrsb   r1, [jpc, #3]
        ldrb    ip, [jpc, #4]
	ldr	r2, [locals, -r2, lsl #2]
	add	jpc, jpc, #2
        cmp     r3, r2
        orr     ip, ip, r1, lsl #8
	bgt	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iload_if_icmpgt
	iload_if_icmpgt
@-----------------------------------------------------------------------------
	.macro	iload_0_if_icmple	jpc_off=0, seq_len=1
	POP	r3
	rsb	r2, r0, #opc_iload_0
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	ldr	r2, [locals, r2, lsl #2]
	add	jpc, jpc, #1
        cmp     r3, r2
	orr	ip, ip, r1, lsl #8
	ble	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iload_0_if_icmple
	iload_0_if_icmple
@-----------------------------------------------------------------------------
	.macro	iload_if_icmple	jpc_off=0, seq_len=2
	POP	r3
        ldrsb   r1, [jpc, #3]
        ldrb    ip, [jpc, #4]
	ldr	r2, [locals, -r2, lsl #2]
	add	jpc, jpc, #2
        cmp     r3, r2
        orr     ip, ip, r1, lsl #8
	ble	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iload_if_icmple
	iload_if_icmple
@-----------------------------------------------------------------------------
	.macro	iload_0_ireturn	jpc_off=0, seq_len=1
	rsb	r0, r0, #opc_iload_0
	ldr	tmp2, [istate, #ISTATE_MONITOR_BASE]	@ tmp2 = base
	ldr	tmp1, [istate, #ISTATE_STACK_BASE]	@ tmp1 = end
	ldr	r1, [locals, r0, lsl #2]
	ldr	tmp_xxx, [istate, #ISTATE_THREAD]
	cmp	tmp1, tmp2
	bcc	1f
2:
	mov	r3, #0
	ldr	stack, [tmp_xxx, #THREAD_TOP_ZERO_FRAME]
	str	r3, [tmp_xxx, #THREAD_LAST_JAVA_SP]
	ldr	r0, [istate, #ISTATE_METHOD]
	ldr	r3, [stack, #0]
	ldrh	r0, [r0, #40]
	ldr	istate, [istate, #ISTATE_SAVED_ISTATE]
	str	r3, [tmp_xxx, #THREAD_TOP_ZERO_FRAME]
	str	r1, [stack, r0, lsl #2]!
	cmp	istate, #0
	beq	normal_return
        ldr     jpc, [istate, #ISTATE_BCP]
        ldr     r2, [istate, #ISTATE_STACK_LIMIT]
	DISPATCH_START	3				@ ldrb	r0, [jpc, #3]!
        sub     stack, stack, #4
        ldr     r3, [tmp_xxx, #THREAD_TOP_ZERO_FRAME]
	DISPATCH_NEXT					@ ldrb	r1, [jpc, #2]
        add     r2, r2, #4
	DISPATCH_NEXT					@ ldr	ip, [dispatch, r0, lsl #2]
        str     r2, [tmp_xxx, #THREAD_JAVA_SP]
	DISPATCH_NEXT					@ ldrb	r2, [jpc, #1]
        str     r3, [tmp_xxx, #THREAD_LAST_JAVA_SP]
        ldr     constpool, [istate, #ISTATE_CONSTANTS]
        ldr     locals, [istate, #ISTATE_LOCALS]
	DISPATCH_NEXT					@ ands	lr, ip, lr
	add	constpool, constpool, #CONST_POOL_OFFSET
        DISPATCH_FINISH
1:
	PUSH	r1
	add	jpc, jpc, #1
	bl	return_check_monitors
	POP	r1
	b	2b
	.endm

	Opcode	iload_0_ireturn
	iload_0_ireturn
@-----------------------------------------------------------------------------
	.macro	iload_ireturn	jpc_off=0, seq_len=2

	ldr	tmp2, [istate, #ISTATE_MONITOR_BASE]	@ tmp2 = base
	ldr	tmp1, [istate, #ISTATE_STACK_BASE]	@ tmp1 = end
	ldr	r1, [locals, -r2, lsl #2]
	ldr	tmp_xxx, [istate, #ISTATE_THREAD]
	cmp	tmp1, tmp2
	bcc	1f
2:
	mov	r3, #0
	ldr	stack, [tmp_xxx, #THREAD_TOP_ZERO_FRAME]
	str	r3, [tmp_xxx, #THREAD_LAST_JAVA_SP]
	ldr	r0, [istate, #ISTATE_METHOD]
	ldr	r3, [stack, #0]
	ldrh	r0, [r0, #40]
	ldr	istate, [istate, #ISTATE_SAVED_ISTATE]
	str	r3, [tmp_xxx, #THREAD_TOP_ZERO_FRAME]
	str	r1, [stack, r0, lsl #2]!
	cmp	istate, #0
	beq	normal_return
        ldr     jpc, [istate, #ISTATE_BCP]
        ldr     r2, [istate, #ISTATE_STACK_LIMIT]
	DISPATCH_START	3				@ ldrb	r0, [jpc, #3]!
        sub     stack, stack, #4
        ldr     r3, [tmp_xxx, #THREAD_TOP_ZERO_FRAME]
	DISPATCH_NEXT					@ ldrb	r1, [jpc, #2]
        add     r2, r2, #4
	DISPATCH_NEXT					@ ldr	ip, [dispatch, r0, lsl #2]
        str     r2, [tmp_xxx, #THREAD_JAVA_SP]
	DISPATCH_NEXT					@ ldrb	r2, [jpc, #1]
        str     r3, [tmp_xxx, #THREAD_LAST_JAVA_SP]
        ldr     constpool, [istate, #ISTATE_CONSTANTS]
        ldr     locals, [istate, #ISTATE_LOCALS]
	DISPATCH_NEXT					@ ands	lr, ip, lr
	add	constpool, constpool, #CONST_POOL_OFFSET
        DISPATCH_FINISH
1:
	PUSH	r1
	add	jpc, jpc, #2
	bl	return_check_monitors
	POP	r1
	b	2b
	.endm

	Opcode	iload_ireturn
	iload_ireturn
@-----------------------------------------------------------------------------
	.macro	iload_0_invokeresolved	jpc_off=0, seq_len=4
	add	jpc, jpc, #1
	rsb	r0, r0, #opc_iload_0
	ldr	r0, [locals, r0, lsl #2]
	ldrb	r2, [jpc, #1]
	ldrb	r1, [jpc, #2]
	PUSH	r0
	b	do_invokeresolved
	.endm

	Opcode	iload_0_invokeresolved
	iload_0_invokeresolved
@-----------------------------------------------------------------------------
	.macro	aload_0_invokeresolved	jpc_off=0, seq_len=4
	add	jpc, jpc, #1
	rsb	r0, r0, #opc_aload_0
	ldr	r0, [locals, r0, lsl #2]
	ldrb	r2, [jpc, #1]
	ldrb	r1, [jpc, #2]
	PUSH	r0
	b	do_invokeresolved
	.endm

	Opcode	aload_0_invokeresolved
	aload_0_invokeresolved
@-----------------------------------------------------------------------------
	.macro	iload_invokeresolved	jpc_off=0, seq_len=5
	ldr	r0, [locals, -r2, lsl #2]
	add	jpc, jpc, #2
        ldrb     r2, [jpc, #1]
        ldrb     r1, [jpc, #2]
	PUSH	r0
	b	do_invokeresolved
	.endm

	Opcode	iload_invokeresolved
	iload_invokeresolved
@-----------------------------------------------------------------------------
	.macro	iload_0_invokevfinal	jpc_off=0, seq_len=4
	add	jpc, jpc, #1
	rsb	r0, r0, #opc_iload_0
	ldr	r0, [locals, r0, lsl #2]
	ldrb	r2, [jpc, #1]
	ldrb	r1, [jpc, #2]
	PUSH	r0
	b	do_invokevfinal
	.endm

	Opcode	iload_0_invokevfinal
	iload_0_invokevfinal
@-----------------------------------------------------------------------------
	.macro	aload_0_invokevfinal	jpc_off=0, seq_len=4
	add	jpc, jpc, #1
	rsb	r0, r0, #opc_aload_0
	ldr	r0, [locals, r0, lsl #2]
	ldrb	r2, [jpc, #1]
	ldrb	r1, [jpc, #2]
	PUSH	r0
	b	do_invokevfinal
	.endm

	Opcode	aload_0_invokevfinal
	aload_0_invokevfinal
@-----------------------------------------------------------------------------
	.macro	iload_invokevfinal	jpc_off=0, seq_len=5
	ldr	r0, [locals, -r2, lsl #2]
	add	jpc, jpc, #2
        ldrb     r2, [jpc, #1]
        ldrb     r1, [jpc, #2]
	PUSH	r0
	b	do_invokevfinal
	.endm

	Opcode	iload_invokevfinal
	iload_invokevfinal
@-----------------------------------------------------------------------------
	.macro	iload_0_invokespecialresolved	jpc_off=0, seq_len=4
	add	jpc, jpc, #1
	rsb	r0, r0, #opc_iload_0
	ldr	r0, [locals, r0, lsl #2]
	ldrb	r2, [jpc, #1]
	ldrb	r1, [jpc, #2]
	PUSH	r0
	b	do_invokespecialresolved
	.endm

	Opcode	iload_0_invokespecialresolved
	iload_0_invokespecialresolved
@-----------------------------------------------------------------------------
	.macro	aload_0_invokespecialresolved	jpc_off=0, seq_len=4
	add	jpc, jpc, #1
	rsb	r0, r0, #opc_aload_0
	ldr	r0, [locals, r0, lsl #2]
	ldrb	r2, [jpc, #1]
	ldrb	r1, [jpc, #2]
	PUSH	r0
	b	do_invokespecialresolved
	.endm

	Opcode	aload_0_invokespecialresolved
	aload_0_invokespecialresolved
@-----------------------------------------------------------------------------
	.macro	iload_invokespecialresolved	jpc_off=0, seq_len=5
	ldr	r0, [locals, -r2, lsl #2]
	add	jpc, jpc, #2
        ldrb     r2, [jpc, #1]
        ldrb     r1, [jpc, #2]
	PUSH	r0
	b	do_invokespecialresolved
	.endm

	Opcode	iload_invokespecialresolved
	iload_invokespecialresolved
@-----------------------------------------------------------------------------
	.macro	iload_0_invokestaticresolved	jpc_off=0, seq_len=4
	add	jpc, jpc, #1
	rsb	r0, r0, #opc_iload_0
	ldr	r0, [locals, r0, lsl #2]
	ldrb	r2, [jpc, #1]
	ldrb	r1, [jpc, #2]
	PUSH	r0
	b	do_invokestaticresolved
	.endm

	Opcode	iload_0_invokestaticresolved
	iload_0_invokestaticresolved
@-----------------------------------------------------------------------------
	.macro	aload_0_invokestaticresolved	jpc_off=0, seq_len=4
	add	jpc, jpc, #1
	rsb	r0, r0, #opc_aload_0
	ldr	r0, [locals, r0, lsl #2]
	ldrb	r2, [jpc, #1]
	ldrb	r1, [jpc, #2]
	PUSH	r0
	b	do_invokestaticresolved
	.endm

	Opcode	aload_0_invokestaticresolved
	aload_0_invokestaticresolved
@-----------------------------------------------------------------------------
	.macro	iload_invokestaticresolved	jpc_off=0, seq_len=5
	ldr	r0, [locals, -r2, lsl #2]
	add	jpc, jpc, #2
        ldrb     r2, [jpc, #1]
        ldrb     r1, [jpc, #2]
	PUSH	r0
	b	do_invokestaticresolved
	.endm

	Opcode	iload_invokestaticresolved
	iload_invokestaticresolved
@-----------------------------------------------------------------------------
	.macro	iload_0_invokeinterface	jpc_off=0, seq_len=1
	add	jpc, jpc, #1
	rsb	r0, r0, #opc_iload_0
	ldr	r0, [locals, r0, lsl #2]
	PUSH	r0
	b	do_invokeinterface
	.endm

	Opcode	iload_0_invokeinterface
	iload_0_invokeinterface
@-----------------------------------------------------------------------------
	.macro	aload_0_invokeinterface	jpc_off=0, seq_len=1
	add	jpc, jpc, #1
	rsb	r0, r0, #opc_aload_0
	ldr	r0, [locals, r0, lsl #2]
	PUSH	r0
	b	do_invokeinterface
	.endm

	Opcode	aload_0_invokeinterface
	aload_0_invokeinterface
@-----------------------------------------------------------------------------
	.macro	iload_invokeinterface	jpc_off=0, seq_len=2
	ldr	r0, [locals, -r2, lsl #2]
	add	jpc, jpc, #2
	PUSH	r0
	b	do_invokeinterface
	.endm

	Opcode	iload_invokeinterface
	iload_invokeinterface
@-----------------------------------------------------------------------------
	.macro	aload_0_igetfield	jpc_off=0, seq_len=4
	add	r0, r0, #opc_iaccess_0-opc_aload_0
	strb	r0, [jpc]
	DISPATCH_BYTECODE
	.endm

	Opcode	aload_0_igetfield
	aload_0_igetfield
@-----------------------------------------------------------------------------
	.macro	iload_igetfield	jpc_off=0, seq_len=5
	ldrb	ip, [jpc, #4]
	rsb	tmp1, r2, #0
	ldrb	r3, [jpc, #3]
	add	tmp2, constpool, ip, lsl #12
	DISPATCH_START	5
	ldr	tmp1, [locals, tmp1, lsl #2]
	add	tmp2, r3, lsl #4
	DISPATCH_NEXT
#ifndef HW_NULL_PTR_CHECK
	cmp	tmp1, #0
	beq	null_ptr_exception_jpc_3
#endif
	DISPATCH_NEXT
        ldr     tmp2, [tmp2, #8]
	DISPATCH_NEXT
.abortentry88:
	ldr	tmp2, [tmp1, tmp2]
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
	.endm

	Opcode	iload_igetfield
	iload_igetfield
@-----------------------------------------------------------------------------
	.macro	iconst_m1_istore_0	jpc_off=0, seq_len=2
	sub	r3, r0, #opc_iconst_0
	DISPATCH_START	\seq_len
	rsb	r2, r1, #opc_istore_0
	str	r3, [locals, r2, lsl #2]
	DISPATCH_BYTECODE
	.endm

	Opcode	iconst_m1_istore_0
	iconst_m1_istore_0
@-----------------------------------------------------------------------------
	.macro	iconst_m1_astore	jpc_off=0, seq_len=3
	ldrb	r2, [jpc, #2]
	sub	r3, r0, #opc_iconst_0
	DISPATCH_START	\seq_len
	str	r3, [locals, -r2, lsl #2]
	DISPATCH_BYTECODE
	.endm

	Opcode	iconst_m1_astore
	iconst_m1_astore
@-----------------------------------------------------------------------------
	.macro	iconst_m1_iadd	jpc_off=0, seq_len=2
	sub	tmp1, r0, #opc_iconst_0
	DISPATCH_START	\seq_len
	POP	tmp2
	DISPATCH_NEXT
	add	tmp1, tmp2, tmp1
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	tmp1
	DISPATCH_FINISH
	.endm

	Opcode	iconst_m1_iadd
	iconst_m1_iadd
@-----------------------------------------------------------------------------
	.macro	iconst_m1_isub	jpc_off=0, seq_len=2
	sub	tmp1, r0, #opc_iconst_0
	DISPATCH_START	\seq_len
	POP	tmp2
	DISPATCH_NEXT
	sub	tmp1, tmp2, tmp1
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	tmp1
	DISPATCH_FINISH
	.endm

	Opcode	iconst_m1_isub
	iconst_m1_isub
@-----------------------------------------------------------------------------
	.macro	iconst_m1_idiv	jpc_off=0, seq_len=2
	subs	lr, r0, #opc_iconst_2
	DISPATCH_START	\seq_len
	POP	tmp1
	DISPATCH_NEXT
	beq	5f
	bcc	3f
	cmp	lr, #(opc_iconst_4-opc_iconst_2)
	beq	4f
	bcc	2f
@ divide by 5
1:
	mvn	lr, #0x198		@ Form 0x66666667 in lr
	bic	lr, lr, #0x9800
	add	lr, lr, lr, lsl #16
	smull	a3, a4, tmp1, lr
	mov	a3, tmp1, asr #31
	rsb	tmp1, a3, a4, asr #1
	b	6f
@ divide by 3
2:
	mvn	lr, #0xa9		@ Form 0x55555556 in lr
	bic	lr, lr, #0xaa00
	add	lr, lr, lr, lsl #16
        smull   a3, a4, tmp1, lr
        sub     tmp1, a4, tmp1, asr #31
	b	6f
3:
	cmp	lr, #(opc_iconst_0-opc_iconst_2)
	beq	.iconst_div_rem_0
	rsbcc	tmp1, tmp1, #0		@ Divide by -1 or 1
	b	6f
@ divide by 4
4:	movs	a4, tmp1
	addmi	a4, a4, #3
	mov	tmp1, a4, asr #2
	b	6f
@ divide by 2
5:
	add	tmp1, tmp1, tmp1, lsr #31
	mov	tmp1, tmp1, asr #1
6:
	DISPATCH_NEXT
	PUSH	tmp1
	DISPATCH_FINISH
	.endm

	Opcode	iconst_m1_idiv
	iconst_m1_idiv
@-----------------------------------------------------------------------------
	.macro	iconst_m1_ishl	jpc_off=0, seq_len=2
	sub	tmp1, r0, #opc_iconst_0
	DISPATCH_START	\seq_len
	POP	r2
	DISPATCH_NEXT
	mov	tmp1, r2, lsl tmp1
	DISPATCH_NEXT
	PUSH	tmp1
	DISPATCH_FINISH
	.endm

	Opcode	iconst_m1_ishl
	iconst_m1_ishl
@-----------------------------------------------------------------------------
	.macro	iconst_m1_if_icmpeq	jpc_off=0, seq_len=1
	POP	r3
	sub	r2, r0, #opc_iconst_0
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	add	jpc, jpc, #1
        cmp     r3, r2
        orr     ip, ip, r1, lsl #8
	beq	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iconst_m1_if_icmpeq
	iconst_m1_if_icmpeq
@-----------------------------------------------------------------------------
	.macro	iconst_m1_if_icmpne	jpc_off=0, seq_len=1
	POP	r3
	sub	r2, r0, #opc_iconst_0
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	add	jpc, jpc, #1
        cmp     r3, r2
        orr     ip, ip, r1, lsl #8
	bne	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iconst_m1_if_icmpne
	iconst_m1_if_icmpne
@-----------------------------------------------------------------------------
	.macro	iconst_m1_if_icmplt	jpc_off=0, seq_len=1
	POP	r3
	sub	r2, r0, #opc_iconst_0
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	add	jpc, jpc, #1
        cmp     r3, r2
        orr     ip, ip, r1, lsl #8
	blt	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iconst_m1_if_icmplt
	iconst_m1_if_icmplt
@-----------------------------------------------------------------------------
	.macro	iconst_m1_if_icmpge	jpc_off=0, seq_len=1
	POP	r3
	sub	r2, r0, #opc_iconst_0
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	add	jpc, jpc, #1
        cmp     r3, r2
        orr     ip, ip, r1, lsl #8
	bge	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iconst_m1_if_icmpge
	iconst_m1_if_icmpge
@-----------------------------------------------------------------------------
	.macro	iconst_m1_if_icmpgt	jpc_off=0, seq_len=1
	POP	r3
	sub	r2, r0, #opc_iconst_0
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	add	jpc, jpc, #1
        cmp     r3, r2
        orr     ip, ip, r1, lsl #8
	bgt	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iconst_m1_if_icmpgt
	iconst_m1_if_icmpgt
@-----------------------------------------------------------------------------
	.macro	iconst_m1_if_icmple	jpc_off=0, seq_len=1
	POP	r3
	sub	r2, r0, #opc_iconst_0
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	add	jpc, jpc, #1
        cmp     r3, r2
        orr     ip, ip, r1, lsl #8
	ble	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iconst_m1_if_icmple
	iconst_m1_if_icmple
@-----------------------------------------------------------------------------
	.macro	iconst_m1_ireturn	jpc_off=0, seq_len=1
	ldr	tmp2, [istate, #ISTATE_MONITOR_BASE]	@ tmp2 = base
	ldr	tmp1, [istate, #ISTATE_STACK_BASE]	@ tmp1 = end
	sub	r1, r0, #opc_iconst_0
	ldr	tmp_xxx, [istate, #ISTATE_THREAD]
	cmp	tmp1, tmp2
	bcc	1f
2:
	mov	r3, #0
	ldr	stack, [tmp_xxx, #THREAD_TOP_ZERO_FRAME]
	str	r3, [tmp_xxx, #THREAD_LAST_JAVA_SP]
	ldr	r0, [istate, #ISTATE_METHOD]
	ldr	r3, [stack, #0]
	ldrh	r0, [r0, #40]
	ldr	istate, [istate, #ISTATE_SAVED_ISTATE]
	str	r3, [tmp_xxx, #THREAD_TOP_ZERO_FRAME]
	str	r1, [stack, r0, lsl #2]!
	cmp	istate, #0
	beq	normal_return
        ldr     jpc, [istate, #ISTATE_BCP]
        ldr     r2, [istate, #ISTATE_STACK_LIMIT]
	DISPATCH_START	3				@ ldrb	r0, [jpc, #3]!
        sub     stack, stack, #4
        ldr     r3, [tmp_xxx, #THREAD_TOP_ZERO_FRAME]
	DISPATCH_NEXT					@ ldrb	r1, [jpc, #2]
        add     r2, r2, #4
	DISPATCH_NEXT					@ ldr	ip, [dispatch, r0, lsl #2]
        str     r2, [tmp_xxx, #THREAD_JAVA_SP]
	DISPATCH_NEXT					@ ldrb	r2, [jpc, #1]
        str     r3, [tmp_xxx, #THREAD_LAST_JAVA_SP]
        ldr     constpool, [istate, #ISTATE_CONSTANTS]
        ldr     locals, [istate, #ISTATE_LOCALS]
	DISPATCH_NEXT					@ ands	lr, ip, lr
	add	constpool, constpool, #CONST_POOL_OFFSET
        DISPATCH_FINISH
1:
	PUSH	r1
	add	jpc, jpc, #1
	bl	return_check_monitors
	POP	r1
	b	2b
	.endm

	Opcode	iconst_m1_ireturn
	iconst_m1_ireturn
@-----------------------------------------------------------------------------
	.macro	iconst_m1_invokeresolved	jpc_off=0, seq_len=4
	add	jpc, jpc, #1
	sub	r0, r0, #opc_iconst_0
	ldrb	r2, [jpc, #1]
	ldrb	r1, [jpc, #2]
	PUSH	r0
	b	do_invokeresolved
	.endm

	Opcode	iconst_m1_invokeresolved
	iconst_m1_invokeresolved
@-----------------------------------------------------------------------------
	.macro	iconst_m1_invokevfinal	jpc_off=0, seq_len=4
	add	jpc, jpc, #1
	sub	r0, r0, #opc_iconst_0
	ldrb	r2, [jpc, #1]
	ldrb	r1, [jpc, #2]
	PUSH	r0
	b	do_invokevfinal
	.endm

	Opcode	iconst_m1_invokevfinal
	iconst_m1_invokevfinal
@-----------------------------------------------------------------------------
	.macro	iconst_m1_invokestaticresolved	jpc_off=0, seq_len=4
	add	jpc, jpc, #1
	sub	r0, r0, #opc_iconst_0
	ldrb	r2, [jpc, #1]
	ldrb	r1, [jpc, #2]
	PUSH	r0
	b	do_invokestaticresolved
	.endm

	Opcode	iconst_m1_invokestaticresolved
	iconst_m1_invokestaticresolved
@-----------------------------------------------------------------------------
	.macro	iconst_m1_invokespecialresolved	jpc_off=0, seq_len=4
	add	jpc, jpc, #1
	sub	r0, r0, #opc_iconst_0
	ldrb	r2, [jpc, #1]
	ldrb	r1, [jpc, #2]
	PUSH	r0
	b	do_invokespecialresolved
	.endm

	Opcode	iconst_m1_invokespecialresolved
	iconst_m1_invokespecialresolved
@-----------------------------------------------------------------------------
	.macro	iaload_iconst_m1	jpc_off=0, seq_len=2
	sub	r2, r1, #opc_iconst_0
	POP2	r3, lr			@ r3 = index, lr = arrayref
	DISPATCH_START	\seq_len
#ifndef HW_NULL_PTR_CHECK
	cmp	lr, #0
	beq	null_ptr_exception_jpc_2
#endif
.abortentry38:
	ldr	tmp1, [lr, #8]		@ tmp1 = length
	DISPATCH_NEXT
	cmp	r3, tmp1
	bcs	array_bound_exception_jpc_2_r3
	add	lr, lr, r3, lsl #2
	ldr	r3, [lr, #12]
	DISPATCH_NEXT
	PUSH2	r2, r3
	DISPATCH_FINISH
	.endm

	Opcode	iaload_iconst_m1
	iaload_iconst_m1
@-----------------------------------------------------------------------------
	.macro	iaload_bipush	jpc_off=0, seq_len=3
	ldrsb	r2, [jpc, #2]
	POP2	r3, lr			@ r3 = index, lr = arrayref
	DISPATCH_START	\seq_len
#ifndef HW_NULL_PTR_CHECK
	cmp	lr, #0
	beq	null_ptr_exception_jpc_3
#endif
.abortentry39:
	ldr	tmp1, [lr, #8]		@ tmp1 = length
	DISPATCH_NEXT
	cmp	r3, tmp1
	bcs	array_bound_exception_jpc_3_r3
	add	lr, lr, r3, lsl #2
	ldr	r3, [lr, #12]
	DISPATCH_NEXT
	PUSH2	r2, r3
	DISPATCH_FINISH
	.endm

	Opcode	iaload_bipush
	iaload_bipush
@-----------------------------------------------------------------------------
	.macro	iaload_sipush	jpc_off=0, seq_len=4
	ldrsb	r2, [jpc, #2]
	ldrb	tmp1, [jpc, #3]
	POP2	r3, lr			@ r3 = index, lr = arrayref
	DISPATCH_START	\seq_len
	orr	r2, tmp1, r2, lsl #8
#ifndef HW_NULL_PTR_CHECK
	cmp	lr, #0
	beq	null_ptr_exception_jpc_4
#endif
.abortentry40:
	ldr	tmp1, [lr, #8]		@ tmp1 = length
	DISPATCH_NEXT
	cmp	r3, tmp1
	bcs	array_bound_exception_jpc_4_r3
	add	lr, lr, r3, lsl #2
	ldr	r3, [lr, #12]
	DISPATCH_NEXT
	PUSH2	r2, r3
	DISPATCH_FINISH
	.endm

	Opcode	iaload_sipush
	iaload_sipush
@-----------------------------------------------------------------------------
	.macro	iaload_iload	jpc_off=0, seq_len=3
	ldrb	r2, [jpc, #2]
	POP2	r3, lr			@ r3 = index, lr = arrayref
	DISPATCH_START	\seq_len
	ldr	r2, [locals, -r2, lsl #2]
#ifndef HW_NULL_PTR_CHECK
	cmp	lr, #0
	beq	null_ptr_exception_jpc_3
#endif
.abortentry41:
	ldr	tmp1, [lr, #8]		@ tmp1 = length
	DISPATCH_NEXT
	cmp	r3, tmp1
	bcs	array_bound_exception_jpc_3_r3
	add	lr, lr, r3, lsl #2
	ldr	r3, [lr, #12]
	DISPATCH_NEXT
	PUSH2	r2, r3
	DISPATCH_FINISH
	.endm

	Opcode	iaload_iload
	iaload_iload
@-----------------------------------------------------------------------------
	.macro	iaload_iload_0	jpc_off=0, seq_len=2
	rsb	r2, r1, #opc_iload_0
	POP2	r3, lr			@ r3 = index, lr = arrayref
	DISPATCH_START	\seq_len
	ldr	r2, [locals, r2, lsl #2]
#ifndef HW_NULL_PTR_CHECK
	cmp	lr, #0
	beq	null_ptr_exception_jpc_2
#endif
.abortentry42:
	ldr	tmp1, [lr, #8]		@ tmp1 = length
	DISPATCH_NEXT
	cmp	r3, tmp1
	bcs	array_bound_exception_jpc_2_r3
	add	lr, lr, r3, lsl #2
	ldr	r3, [lr, #12]
	DISPATCH_NEXT
	PUSH2	r2, r3
	DISPATCH_FINISH
	.endm

	Opcode	iaload_iload_0
	iaload_iload_0
@-----------------------------------------------------------------------------
	.macro	iaload_aload_0	jpc_off=0, seq_len=2
	rsb	r2, r1, #opc_aload_0
	POP2	r3, lr			@ r3 = index, lr = arrayref
	DISPATCH_START	\seq_len
	ldr	r2, [locals, r2, lsl #2]
#ifndef HW_NULL_PTR_CHECK
	cmp	lr, #0
	beq	null_ptr_exception_jpc_2
#endif
.abortentry42_1:
	ldr	tmp1, [lr, #8]		@ tmp1 = length
	DISPATCH_NEXT
	cmp	r3, tmp1
	bcs	array_bound_exception_jpc_2_r3
	add	lr, lr, r3, lsl #2
	ldr	r3, [lr, #12]
	DISPATCH_NEXT
	PUSH2	r2, r3
	DISPATCH_FINISH
	.endm

	Opcode	iaload_aload_0
	iaload_aload_0
@-----------------------------------------------------------------------------
	.macro	iaload_iaload	jpc_off=0, seq_len=2
	POP2	r2, r3			@ r2 = index, r3 = arrayref
#ifndef HW_NULL_PTR_CHECK
	cmp	r3, #0
	beq	null_ptr_exception_jpc_0
#endif
.abortentry43:
	ldr	tmp1, [r3, #8]		@ tmp1 = length
	DISPATCH_START	\seq_len
	cmp	r2, tmp1
	bcs	array_bound_exception_jpc_2
	add	r3, r3, r2, lsl #2
	POP	lr			@ r2 = index, lr = arrayref
	ldr	r2, [r3, #12]
#ifndef HW_NULL_PTR_CHECK
	cmp	lr, #0
	beq	null_ptr_exception_jpc_1
#endif
.abortentry44:
	ldr	tmp1, [lr, #8]		@ tmp1 = length
	DISPATCH_NEXT
	cmp	r2, tmp1
	bcs	array_bound_exception_jpc_1
	add	lr, lr, r2, lsl #2
	ldr	r2, [lr, #12]
	DISPATCH_NEXT
	PUSH	r2
	DISPATCH_FINISH
	.endm

	Opcode	iaload_iaload
	iaload_iaload
@-----------------------------------------------------------------------------
	.macro	iaload_astore	jpc_off=0, seq_len=3
	ldrb	r2, [jpc, #2]
	POP2	r3, lr			@ r3 = index, lr = arrayref
	DISPATCH_START	\seq_len
#ifndef HW_NULL_PTR_CHECK
	cmp	lr, #0
	beq	null_ptr_exception_jpc_3
#endif
.abortentry45:
	ldr	tmp1, [lr, #8]		@ tmp1 = length
	DISPATCH_NEXT
	cmp	r3, tmp1
	bcs	array_bound_exception_jpc_3_r3
	add	lr, lr, r3, lsl #2
	ldr	r3, [lr, #12]
	DISPATCH_NEXT
	str	r3, [locals, -r2, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	iaload_astore
	iaload_astore
@-----------------------------------------------------------------------------
	.macro	iaload_istore_0	jpc_off=0, seq_len=2
	rsb	r2, r1, #opc_istore_0
	POP2	r3, lr			@ r3 = index, lr = arrayref
	DISPATCH_START	\seq_len
#ifndef HW_NULL_PTR_CHECK
	cmp	lr, #0
	beq	null_ptr_exception_jpc_2
#endif
.abortentry46:
	ldr	tmp1, [lr, #8]		@ tmp1 = length
	DISPATCH_NEXT
	cmp	r3, tmp1
	bcs	array_bound_exception_jpc_2_r3
	add	lr, lr, r3, lsl #2
	ldr	r3, [lr, #12]
	DISPATCH_NEXT
	str	r3, [locals, r2, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	iaload_istore_0
	iaload_istore_0
@-----------------------------------------------------------------------------
	.macro	iaload_iastore	jpc_off=0, seq_len=2
	POP2	r3, lr			@ r3 = index, lr = arrayref
#ifndef HW_NULL_PTR_CHECK
	cmp	lr, #0
	beq	null_ptr_exception_jpc_0
#endif
.abortentry47:
	ldr	tmp1, [lr, #8]		@ tmp1 = length
	DISPATCH_START	\seq_len
	cmp	r3, tmp1
	bcs	array_bound_exception_jpc_2_r3
	add	lr, lr, r3, lsl #2
	ldr	tmp1, [lr, #12]

	POP2	r2, r3		@ tmp1 = value, r2 = index, r3 = arrayref
#ifndef HW_NULL_PTR_CHECK
	cmp	r3, #0
	beq	null_ptr_exception_jpc_1
#endif
.abortentry48:
	ldr	lr, [r3, #8]		@ lr = limit
	DISPATCH_NEXT
	cmp	r2, lr
	bcs	array_bound_exception_jpc_1
	DISPATCH_NEXT
	add	r3, r3, r2, lsl #2
	str	tmp1, [r3, #12]
	DISPATCH_FINISH
	.endm

	Opcode	iaload_iastore
	iaload_iastore
@-----------------------------------------------------------------------------
	.macro	iaload_bastore	jpc_off=0, seq_len=2
	POP2	r3, lr			@ r3 = index, lr = arrayref
#ifndef HW_NULL_PTR_CHECK
	cmp	lr, #0
	beq	null_ptr_exception_jpc_0
#endif
.abortentry49:
	ldr	tmp1, [lr, #8]		@ tmp1 = length
	DISPATCH_START	\seq_len
	cmp	r3, tmp1
	bcs	array_bound_exception_jpc_2_r3
	add	lr, lr, r3, lsl #2
	ldr	tmp1, [lr, #12]

	POP2	r2, r3		@ tmp1 = value, r2 = index, r3 = arrayref
#ifndef HW_NULL_PTR_CHECK
	cmp	r3, #0
	beq	null_ptr_exception_jpc_1
#endif
.abortentry50:
	ldr	lr, [r3, #8]		@ lr = limit
	DISPATCH_NEXT
	cmp	r2, lr
	bcs	array_bound_exception_jpc_1
	DISPATCH_NEXT
	add	r3, r3, r2
	strb	tmp1, [r3, #12]
	DISPATCH_FINISH
	.endm

	Opcode	iaload_bastore
	iaload_bastore
@-----------------------------------------------------------------------------
	.macro	iaload_castore	jpc_off=0, seq_len=2
	POP2	r3, lr			@ r3 = index, lr = arrayref
#ifndef HW_NULL_PTR_CHECK
	cmp	lr, #0
	beq	null_ptr_exception_jpc_0
#endif
.abortentry51:
	ldr	tmp1, [lr, #8]		@ tmp1 = length
	DISPATCH_START	\seq_len
	cmp	r3, tmp1
	bcs	array_bound_exception_jpc_2_r3
	add	lr, lr, r3, lsl #2
	ldr	tmp1, [lr, #12]

	POP2	r2, r3		@ tmp1 = value, r2 = index, r3 = arrayref
#ifndef HW_NULL_PTR_CHECK
	cmp	r3, #0
	beq	null_ptr_exception_jpc_1
#endif
.abortentry52:
	ldr	lr, [r3, #8]		@ lr = limit
	DISPATCH_NEXT
	cmp	r2, lr
	bcs	array_bound_exception_jpc_1
	DISPATCH_NEXT
	add	r3, r3, r2, lsl #1
	strh	tmp1, [r3, #12]
	DISPATCH_FINISH
	.endm

	Opcode	iaload_castore
	iaload_castore
@-----------------------------------------------------------------------------
	.macro	iaload_iand	jpc_off=0, seq_len=2
	POP2	r2, r3			@ r2 = index, r3 = arrayref
	DISPATCH_START	\seq_len
#ifndef HW_NULL_PTR_CHECK
	cmp	r3, #0
	beq	null_ptr_exception_jpc_2
#endif
.abortentry58:
	ldr	tmp1, [r3, #8]		@ tmp1 = length
	DISPATCH_NEXT
	cmp	r2, tmp1
	bcs	array_bound_exception_jpc_2
	add	r3, r3, r2, lsl #2
	ldr	tmp1, [r3, #12]		@ tmp1 = tos
	POP	r2			@ r2 = tosm1
	DISPATCH_NEXT
	and	tmp1, r2, tmp1		@ tosm1 <dop> tos
	PUSH	tmp1
	DISPATCH_FINISH
	.endm

	Opcode	iaload_iand
	iaload_iand
@-----------------------------------------------------------------------------
	.macro	iaload_ior	jpc_off=0, seq_len=2
	POP2	r2, r3			@ r2 = index, r3 = arrayref
	DISPATCH_START	\seq_len
#ifndef HW_NULL_PTR_CHECK
	cmp	r3, #0
	beq	null_ptr_exception_jpc_2
#endif
.abortentry59:
	ldr	tmp1, [r3, #8]		@ tmp1 = length
	DISPATCH_NEXT
	cmp	r2, tmp1
	bcs	array_bound_exception_jpc_2
	add	r3, r3, r2, lsl #2
	ldr	tmp1, [r3, #12]		@ tmp1 = tos
	POP	r2			@ r2 = tosm1
	DISPATCH_NEXT
	orr	tmp1, r2, tmp1		@ tosm1 <dop> tos
	PUSH	tmp1
	DISPATCH_FINISH
	.endm

	Opcode	iaload_ior
	iaload_ior
@-----------------------------------------------------------------------------
	.macro	iaload_ixor	jpc_off=0, seq_len=2
	POP2	r2, r3			@ r2 = index, r3 = arrayref
	DISPATCH_START	\seq_len
#ifndef HW_NULL_PTR_CHECK
	cmp	r3, #0
	beq	null_ptr_exception_jpc_2
#endif
.abortentry60:
	ldr	tmp1, [r3, #8]		@ tmp1 = length
	DISPATCH_NEXT
	cmp	r2, tmp1
	bcs	array_bound_exception_jpc_2
	add	r3, r3, r2, lsl #2
	ldr	tmp1, [r3, #12]		@ tmp1 = tos
	POP	r2			@ r2 = tosm1
	DISPATCH_NEXT
	eor	tmp1, r2, tmp1		@ tosm1 <dop> tos
	PUSH	tmp1
	DISPATCH_FINISH
	.endm

	Opcode	iaload_ixor
	iaload_ixor
@-----------------------------------------------------------------------------
	.macro	iaload_ifeq	jpc_off=0, seq_len=1
	POP2	r2, r3			@ r2 = index, r3 = arrayref
#ifndef HW_NULL_PTR_CHECK
	cmp	r3, #0
	beq	null_ptr_exception_jpc_0
#endif
.abortentry61:
	ldr	r1, [r3, #8]		@ r1 = length
	cmp	r2, r1
	bcs	array_bound_exception_jpc_0
	add	r3, r3, r2, lsl #2
	ldr	r3, [r3, #12]		@ r1 = tos

        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	add	jpc, jpc, #1
        cmp     r3, #0
        orr     ip, ip, r1, lsl #8
	beq	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iaload_ifeq
	iaload_ifeq
@-----------------------------------------------------------------------------
	.macro	iaload_ifne	jpc_off=0, seq_len=1
	POP2	r2, r3			@ r2 = index, r3 = arrayref
#ifndef HW_NULL_PTR_CHECK
	cmp	r3, #0
	beq	null_ptr_exception_jpc_0
#endif
.abortentry62:
	ldr	r1, [r3, #8]		@ r1 = length
	cmp	r2, r1
	bcs	array_bound_exception_jpc_0
	add	r3, r3, r2, lsl #2
	ldr	r3, [r3, #12]		@ r1 = tos

        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	add	jpc, jpc, #1
        cmp     r3, #0
        orr     ip, ip, r1, lsl #8
	bne	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iaload_ifne
	iaload_ifne
@-----------------------------------------------------------------------------
	.macro	iaload_iflt	jpc_off=0, seq_len=1
	POP2	r2, r3			@ r2 = index, r3 = arrayref
#ifndef HW_NULL_PTR_CHECK
	cmp	r3, #0
	beq	null_ptr_exception_jpc_0
#endif
.abortentry63:
	ldr	r1, [r3, #8]		@ r1 = length
	cmp	r2, r1
	bcs	array_bound_exception_jpc_0
	add	r3, r3, r2, lsl #2
	ldr	r3, [r3, #12]		@ r1 = tos

        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	add	jpc, jpc, #1
        cmp     r3, #0
        orr     ip, ip, r1, lsl #8
	blt	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iaload_iflt
	iaload_iflt
@-----------------------------------------------------------------------------
	.macro	iaload_ifge	jpc_off=0, seq_len=1
	POP2	r2, r3			@ r2 = index, r3 = arrayref
#ifndef HW_NULL_PTR_CHECK
	cmp	r3, #0
	beq	null_ptr_exception_jpc_0
#endif
.abortentry64:
	ldr	r1, [r3, #8]		@ r1 = length
	cmp	r2, r1
	bcs	array_bound_exception_jpc_0
	add	r3, r3, r2, lsl #2
	ldr	r3, [r3, #12]		@ r1 = tos

        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	add	jpc, jpc, #1
        cmp     r3, #0
        orr     ip, ip, r1, lsl #8
	bge	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iaload_ifge
	iaload_ifge
@-----------------------------------------------------------------------------
	.macro	iaload_ifgt	jpc_off=0, seq_len=1
	POP2	r2, r3			@ r2 = index, r3 = arrayref
#ifndef HW_NULL_PTR_CHECK
	cmp	r3, #0
	beq	null_ptr_exception_jpc_0
#endif
.abortentry65:
	ldr	r1, [r3, #8]		@ r1 = length
	cmp	r2, r1
	bcs	array_bound_exception_jpc_0
	add	r3, r3, r2, lsl #2
	ldr	r3, [r3, #12]		@ r1 = tos

        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	add	jpc, jpc, #1
        cmp     r3, #0
        orr     ip, ip, r1, lsl #8
	bgt	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iaload_ifgt
	iaload_ifgt
@-----------------------------------------------------------------------------
	.macro	iaload_ifle	jpc_off=0, seq_len=1
	POP2	r2, r3			@ r2 = index, r3 = arrayref
#ifndef HW_NULL_PTR_CHECK
	cmp	r3, #0
	beq	null_ptr_exception_jpc_0
#endif
.abortentry66:
	ldr	r1, [r3, #8]		@ r1 = length
	cmp	r2, r1
	bcs	array_bound_exception_jpc_0
	add	r3, r3, r2, lsl #2
	ldr	r3, [r3, #12]		@ r1 = tos

        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	add	jpc, jpc, #1
        cmp     r3, #0
        orr     ip, ip, r1, lsl #8
	ble	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iaload_ifle
	iaload_ifle
@-----------------------------------------------------------------------------
	.macro	iaload_if_icmpeq	jpc_off=0, seq_len=1
	POP2	r2, r3			@ r2 = index, r3 = arrayref
#ifndef HW_NULL_PTR_CHECK
	cmp	r3, #0
	beq	null_ptr_exception_jpc_0
#endif
.abortentry67:
	ldr	r1, [r3, #8]		@ r1 = length
	cmp	r2, r1
	bcs	array_bound_exception_jpc_0
	add	r3, r3, r2, lsl #2
	ldr	r2, [r3, #12]		@ r1 = tos

	POP	r3
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	add	jpc, jpc, #1
        cmp     r3, r2
        orr     ip, ip, r1, lsl #8
	beq	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iaload_if_icmpeq
	iaload_if_icmpeq
@-----------------------------------------------------------------------------
	.macro	iaload_if_icmpne	jpc_off=0, seq_len=1
	POP2	r2, r3			@ r2 = index, r3 = arrayref
#ifndef HW_NULL_PTR_CHECK
	cmp	r3, #0
	beq	null_ptr_exception_jpc_0
#endif
.abortentry68:
	ldr	r1, [r3, #8]		@ r1 = length
	cmp	r2, r1
	bcs	array_bound_exception_jpc_0
	add	r3, r3, r2, lsl #2
	ldr	r2, [r3, #12]		@ r1 = tos

	POP	r3
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	add	jpc, jpc, #1
        cmp     r3, r2
        orr     ip, ip, r1, lsl #8
	bne	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iaload_if_icmpne
	iaload_if_icmpne
@-----------------------------------------------------------------------------
	.macro	iaload_if_icmplt	jpc_off=0, seq_len=1
	POP2	r2, r3			@ r2 = index, r3 = arrayref
#ifndef HW_NULL_PTR_CHECK
	cmp	r3, #0
	beq	null_ptr_exception_jpc_0
#endif
.abortentry69:
	ldr	r1, [r3, #8]		@ r1 = length
	cmp	r2, r1
	bcs	array_bound_exception_jpc_0
	add	r3, r3, r2, lsl #2
	ldr	r2, [r3, #12]		@ r1 = tos

	POP	r3
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	add	jpc, jpc, #1
        cmp     r3, r2
        orr     ip, ip, r1, lsl #8
	blt	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iaload_if_icmplt
	iaload_if_icmplt
@-----------------------------------------------------------------------------
	.macro	iaload_if_icmpge	jpc_off=0, seq_len=1
	POP2	r2, r3			@ r2 = index, r3 = arrayref
#ifndef HW_NULL_PTR_CHECK
	cmp	r3, #0
	beq	null_ptr_exception_jpc_0
#endif
.abortentry70:
	ldr	r1, [r3, #8]		@ r1 = length
	cmp	r2, r1
	bcs	array_bound_exception_jpc_0
	add	r3, r3, r2, lsl #2
	ldr	r2, [r3, #12]		@ r1 = tos

	POP	r3
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	add	jpc, jpc, #1
        cmp     r3, r2
        orr     ip, ip, r1, lsl #8
	bge	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iaload_if_icmpge
	iaload_if_icmpge
@-----------------------------------------------------------------------------
	.macro	iaload_if_icmpgt	jpc_off=0, seq_len=1
	POP2	r2, r3			@ r2 = index, r3 = arrayref
#ifndef HW_NULL_PTR_CHECK
	cmp	r3, #0
	beq	null_ptr_exception_jpc_0
#endif
.abortentry71:
	ldr	r1, [r3, #8]		@ r1 = length
	cmp	r2, r1
	bcs	array_bound_exception_jpc_0
	add	r3, r3, r2, lsl #2
	ldr	r2, [r3, #12]		@ r1 = tos

	POP	r3
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	add	jpc, jpc, #1
        cmp     r3, r2
        orr     ip, ip, r1, lsl #8
	bgt	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iaload_if_icmpgt
	iaload_if_icmpgt
@-----------------------------------------------------------------------------
	.macro	iaload_if_icmple	jpc_off=0, seq_len=1
	POP2	r2, r3			@ r2 = index, r3 = arrayref
#ifndef HW_NULL_PTR_CHECK
	cmp	r3, #0
	beq	null_ptr_exception_jpc_0
#endif
.abortentry72:
	ldr	r1, [r3, #8]		@ r1 = length
	cmp	r2, r1
	bcs	array_bound_exception_jpc_0
	add	r3, r3, r2, lsl #2
	ldr	r2, [r3, #12]		@ r1 = tos

	POP	r3
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	add	jpc, jpc, #1
        cmp     r3, r2
        orr     ip, ip, r1, lsl #8
	ble	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iaload_if_icmple
	iaload_if_icmple
@-----------------------------------------------------------------------------
	.macro	iadd_iload	jpc_off=0, seq_len=3
	ldrb	r3, [jpc, #2]
	DISPATCH_START	\seq_len
	POP2	tmp2, tmp1
	DISPATCH_NEXT
	rsb	r3, r3, #0
	DISPATCH_NEXT
	ldr	r3, [locals, r3, lsl #2]
	DISPATCH_NEXT
	add	tmp2, tmp1, tmp2
	DISPATCH_NEXT
	PUSH2	r3, tmp2
	DISPATCH_FINISH
	.endm

	Opcode	iadd_iload
	iadd_iload
@-----------------------------------------------------------------------------
	.macro	iadd_iload_0	jpc_off=0, seq_len=2
	DISPATCH_START	\seq_len
	rsb	r3, r1, #opc_iload_0
	POP2	tmp2, tmp1
	DISPATCH_NEXT
	ldr	r3, [locals, r3, lsl #2]
	add	tmp2, tmp1, tmp2
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH2	r3, tmp2
	DISPATCH_FINISH
	.endm

	Opcode	iadd_iload_0
	iadd_iload_0
@-----------------------------------------------------------------------------
	.macro	iadd_iaload	jpc_off=0, seq_len=2
	POP3	r2, r3, lr		@ lr = ref
	DISPATCH_START	\seq_len
	add	r2, r3, r2		@ r2 = index
#ifndef HW_NULL_PTR_CHECK
	cmp	lr, #0
	beq	null_ptr_exception_jpc_1
#endif
.abortentry73:
	ldr	tmp1, [lr, #8]		@ tmp1 = length
	DISPATCH_NEXT
	cmp	r2, tmp1
	bcs	array_bound_exception_jpc_1
	add	lr, lr, r2, lsl #2
	ldr	tmp1, [lr, #12]
	DISPATCH_NEXT
	PUSH	tmp1
	DISPATCH_FINISH
	.endm

	Opcode	iadd_iaload
	iadd_iaload
@-----------------------------------------------------------------------------
	.macro	iadd_istore	jpc_off=0, seq_len=3
	mov	r0, #opc_iadd_u4store
	strb	r0, [jpc]
	b	do_iadd_u4store
	.endm

	Opcode	iadd_istore
	iadd_istore
@-----------------------------------------------------------------------------
	.macro	iadd_istore_0	jpc_off=0, seq_len=2
	mov	r0, #opc_iadd_istore_N
	strb	r0, [jpc]
	b	do_iadd_istore_N
	.endm

	Opcode	iadd_istore_0
	iadd_istore_0
@-----------------------------------------------------------------------------
	.macro	iadd_iastore	jpc_off=0, seq_len=2
	POP2	r2, r3
	DISPATCH_START	\seq_len
	add	tmp1, r3, r2		@ tmp1 = value
	POP2	r2, r3			@ r2, index, r3 = ref
#ifndef HW_NULL_PTR_CHECK
	cmp	r3, #0
	beq	null_ptr_exception_jpc_1
#endif
.abortentry106:
	ldr	lr, [r3, #8]		@ lr = limit
	DISPATCH_NEXT
	cmp	r2, lr
	bcs	array_bound_exception_jpc_1
	DISPATCH_NEXT
	add	r3, r3, r2, lsl #2
	str	tmp1, [r3, #12]
	DISPATCH_FINISH
	.endm

	Opcode	iadd_iastore
	iadd_iastore
@-----------------------------------------------------------------------------
	.macro	iadd_iadd	jpc_off=0, seq_len=2
	DISPATCH_START	\seq_len
	POP3	r2, r3, tmp1
	DISPATCH_NEXT
	add	tmp2, r3, r2
	DISPATCH_NEXT
	add	tmp2, tmp1, tmp2
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
	.endm

	Opcode	iadd_iadd
	iadd_iadd
@-----------------------------------------------------------------------------
	.macro	iadd_isub	jpc_off=0, seq_len=2
	DISPATCH_START	\seq_len
	POP3	r2, r3, tmp1
	DISPATCH_NEXT
	add	tmp2, r3, r2
	DISPATCH_NEXT
	sub	tmp2, tmp1, tmp2
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
	.endm

	Opcode	iadd_isub
	iadd_isub
@-----------------------------------------------------------------------------
	.macro	iadd_ifeq	jpc_off=0, seq_len=1
	POP2	r2, r3
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	add	r3, r3, r2
	add	jpc, jpc, #1
        cmp     r3, #0
        orr     ip, ip, r1, lsl #8
	beq	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iadd_ifeq
	iadd_ifeq
@-----------------------------------------------------------------------------
	.macro	iadd_ifne	jpc_off=0, seq_len=1
	POP2	r2, r3
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	add	r3, r3, r2
	add	jpc, jpc, #1
        cmp     r3, #0
        orr     ip, ip, r1, lsl #8
	bne	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iadd_ifne
	iadd_ifne
@-----------------------------------------------------------------------------
	.macro	iadd_iflt	jpc_off=0, seq_len=1
	POP2	r2, r3
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	add	r3, r3, r2
	add	jpc, jpc, #1
        cmp     r3, #0
        orr     ip, ip, r1, lsl #8
	blt	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iadd_iflt
	iadd_iflt
@-----------------------------------------------------------------------------
	.macro	iadd_ifge	jpc_off=0, seq_len=1
	POP2	r2, r3
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	add	r3, r3, r2
	add	jpc, jpc, #1
        cmp     r3, #0
        orr     ip, ip, r1, lsl #8
	bge	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iadd_ifge
	iadd_ifge
@-----------------------------------------------------------------------------
	.macro	iadd_ifgt	jpc_off=0, seq_len=1
	POP2	r2, r3
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	add	r3, r3, r2
	add	jpc, jpc, #1
        cmp     r3, #0
        orr     ip, ip, r1, lsl #8
	bgt	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iadd_ifgt
	iadd_ifgt
@-----------------------------------------------------------------------------
	.macro	iadd_ifle	jpc_off=0, seq_len=1
	POP2	r2, r3
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	add	r3, r3, r2
	add	jpc, jpc, #1
        cmp     r3, #0
        orr     ip, ip, r1, lsl #8
	ble	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iadd_ifle
	iadd_ifle
@-----------------------------------------------------------------------------
	.macro	iadd_if_icmpeq	jpc_off=0, seq_len=1
	POP3	r2, r3, lr
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	add	r2, r3, r2
	add	jpc, jpc, #1
        cmp     lr, r2
        orr     ip, ip, r1, lsl #8
	beq	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iadd_if_icmpeq
	iadd_if_icmpeq
@-----------------------------------------------------------------------------
	.macro	iadd_if_icmpne	jpc_off=0, seq_len=1
	POP3	r2, r3, lr
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	add	r2, r3, r2
	add	jpc, jpc, #1
        cmp     lr, r2
        orr     ip, ip, r1, lsl #8
	bne	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iadd_if_icmpne
	iadd_if_icmpne
@-----------------------------------------------------------------------------
	.macro	iadd_if_icmplt	jpc_off=0, seq_len=1
	POP3	r2, r3, lr
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	add	r2, r3, r2
	add	jpc, jpc, #1
        cmp     lr, r2
        orr     ip, ip, r1, lsl #8
	blt	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iadd_if_icmplt
	iadd_if_icmplt
@-----------------------------------------------------------------------------
	.macro	iadd_if_icmpge	jpc_off=0, seq_len=1
	POP3	r2, r3, lr
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	add	r2, r3, r2
	add	jpc, jpc, #1
        cmp     lr, r2
        orr     ip, ip, r1, lsl #8
	bge	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iadd_if_icmpge
	iadd_if_icmpge
@-----------------------------------------------------------------------------
	.macro	iadd_if_icmpgt	jpc_off=0, seq_len=1
	POP3	r2, r3, lr
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	add	r2, r3, r2
	add	jpc, jpc, #1
        cmp     lr, r2
        orr     ip, ip, r1, lsl #8
	bgt	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iadd_if_icmpgt
	iadd_if_icmpgt
@-----------------------------------------------------------------------------
	.macro	iadd_if_icmple	jpc_off=0, seq_len=1
	POP3	r2, r3, lr
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	add	r2, r3, r2
	add	jpc, jpc, #1
        cmp     lr, r2
        orr     ip, ip, r1, lsl #8
	ble	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iadd_if_icmple
	iadd_if_icmple
@-----------------------------------------------------------------------------
	.macro	iadd_goto	jpc_off=0, seq_len=1
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	add	jpc, jpc, #1
	orr	ip, ip, r1, lsl #8
	DISPATCH_START_REG	ip
	POP2	r2, r3
	add	r2, r3, r2
	DISPATCH_NEXT
	PUSH	r2
	DISPATCH_FINISH
	.endm

	Opcode	iadd_goto
	iadd_goto
@-----------------------------------------------------------------------------
	.macro	iadd_ireturn	jpc_off=0, seq_len=1
	POP2	r2, r3
	ldr	tmp2, [istate, #ISTATE_MONITOR_BASE]	@ tmp2 = base
	ldr	tmp1, [istate, #ISTATE_STACK_BASE]	@ tmp1 = end
	add	r1, r3, r2
	ldr	tmp_xxx, [istate, #ISTATE_THREAD]
	cmp	tmp1, tmp2
	bcc	1f
2:
	mov	r3, #0
	ldr	stack, [tmp_xxx, #THREAD_TOP_ZERO_FRAME]
	str	r3, [tmp_xxx, #THREAD_LAST_JAVA_SP]
	ldr	r0, [istate, #ISTATE_METHOD]
	ldr	r3, [stack, #0]
	ldrh	r0, [r0, #40]
	ldr	istate, [istate, #ISTATE_SAVED_ISTATE]
	str	r3, [tmp_xxx, #THREAD_TOP_ZERO_FRAME]
	str	r1, [stack, r0, lsl #2]!
	cmp	istate, #0
	beq	normal_return
        ldr     jpc, [istate, #ISTATE_BCP]
        ldr     r2, [istate, #ISTATE_STACK_LIMIT]
	DISPATCH_START	3				@ ldrb	r0, [jpc, #3]!
        sub     stack, stack, #4
        ldr     r3, [tmp_xxx, #THREAD_TOP_ZERO_FRAME]
	DISPATCH_NEXT					@ ldrb	r1, [jpc, #2]
        add     r2, r2, #4
	DISPATCH_NEXT					@ ldr	ip, [dispatch, r0, lsl #2]
        str     r2, [tmp_xxx, #THREAD_JAVA_SP]
	DISPATCH_NEXT					@ ldrb	r2, [jpc, #1]
        str     r3, [tmp_xxx, #THREAD_LAST_JAVA_SP]
        ldr     constpool, [istate, #ISTATE_CONSTANTS]
        ldr     locals, [istate, #ISTATE_LOCALS]
	DISPATCH_NEXT					@ ands	lr, ip, lr
	add	constpool, constpool, #CONST_POOL_OFFSET
        DISPATCH_FINISH
1:
	PUSH	r1
	add	jpc, jpc, #1
	bl	return_check_monitors
	POP	r1
	b	2b
	.endm

	Opcode	iadd_ireturn
	iadd_ireturn
@-----------------------------------------------------------------------------
	.macro	iadd_iinc	jpc_off=0, seq_len=4
	POP2	tmp1, lr
	DISPATCH_START	\seq_len
	add	tmp1, lr, tmp1
        ldrb    r3, [jpc, #-2]	@ ECN: jpc now points to next bc
        ldrsb   r2, [jpc, #-1]
	DISPATCH_NEXT
	PUSH	tmp1
	ldr	tmp1, [locals, -r3, lsl #2]
	DISPATCH_NEXT
	add	tmp1, tmp1, r2
	str	tmp1, [locals, -r3, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	iadd_iinc
	iadd_iinc
@-----------------------------------------------------------------------------
	.macro	isub_iload	jpc_off=0, seq_len=3
	ldrb	r3, [jpc, #2]
	DISPATCH_START	\seq_len
	POP2	tmp2, tmp1
	DISPATCH_NEXT
	rsb	r3, r3, #0
	DISPATCH_NEXT
	ldr	r3, [locals, r3, lsl #2]
	DISPATCH_NEXT
	sub	tmp2, tmp1, tmp2
	DISPATCH_NEXT
	PUSH2	r3, tmp2
	DISPATCH_FINISH
	.endm

	Opcode	isub_iload
	isub_iload
@-----------------------------------------------------------------------------
	.macro	isub_iload_0	jpc_off=0, seq_len=2
	DISPATCH_START	\seq_len
	rsb	r3, r1, #opc_iload_0
	POP2	tmp2, tmp1
	DISPATCH_NEXT
	ldr	r3, [locals, r3, lsl #2]
	sub	tmp2, tmp1, tmp2
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH2	r3, tmp2
	DISPATCH_FINISH
	.endm

	Opcode	isub_iload_0
	isub_iload_0
@-----------------------------------------------------------------------------
	.macro	isub_iaload	jpc_off=0, seq_len=2
	POP3	r2, r3, lr		@ lr = ref
	DISPATCH_START	\seq_len
	sub	r2, r3, r2		@ r2 = index
#ifndef HW_NULL_PTR_CHECK
	cmp	lr, #0
	beq	null_ptr_exception_jpc_1
#endif
.abortentry74:
	ldr	tmp1, [lr, #8]		@ tmp1 = length
	DISPATCH_NEXT
	cmp	r2, tmp1
	bcs	array_bound_exception_jpc_1
	add	lr, lr, r2, lsl #2
	ldr	tmp1, [lr, #12]
	DISPATCH_NEXT
	PUSH	tmp1
	DISPATCH_FINISH
	.endm

	Opcode	isub_iaload
	isub_iaload
@-----------------------------------------------------------------------------
	.macro	isub_istore	jpc_off=0, seq_len=3
	mov	r0, #opc_isub_u4store
	strb	r0, [jpc]
	b	do_isub_u4store
	.endm

	Opcode	isub_istore
	isub_istore
@-----------------------------------------------------------------------------
	.macro	isub_istore_0	jpc_off=0, seq_len=2
	mov	r0, #opc_isub_istore_N
	strb	r0, [jpc]
	b	do_isub_istore_N
	.endm

	Opcode	isub_istore_0
	isub_istore_0
@-----------------------------------------------------------------------------
	.macro	isub_iastore	jpc_off=0, seq_len=2
	POP2	r2, r3
	DISPATCH_START	\seq_len
	sub	tmp1, r3, r2		@ tmp1 = value
	POP2	r2, r3			@ r2, index, r3 = ref
#ifndef HW_NULL_PTR_CHECK
	cmp	r3, #0
	beq	null_ptr_exception_jpc_1
#endif
.abortentry105:
	ldr	lr, [r3, #8]		@ lr = limit
	DISPATCH_NEXT
	cmp	r2, lr
	bcs	array_bound_exception_jpc_1
	DISPATCH_NEXT
	add	r3, r3, r2, lsl #2
	str	tmp1, [r3, #12]
	DISPATCH_FINISH
	.endm

	Opcode	isub_iastore
	isub_iastore
@-----------------------------------------------------------------------------
	.macro	isub_iadd	jpc_off=0, seq_len=2
	DISPATCH_START	\seq_len
	POP3	r2, r3, tmp1
	DISPATCH_NEXT
	sub	tmp2, r3, r2
	DISPATCH_NEXT
	add	tmp2, tmp1, tmp2
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
	.endm

	Opcode	isub_iadd
	isub_iadd
@-----------------------------------------------------------------------------
	.macro	isub_isub	jpc_off=0, seq_len=2
	DISPATCH_START	\seq_len
	POP3	r2, r3, tmp1
	DISPATCH_NEXT
	sub	tmp2, r3, r2
	DISPATCH_NEXT
	sub	tmp2, tmp1, tmp2
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
	.endm

	Opcode	isub_isub
	isub_isub
@-----------------------------------------------------------------------------
	.macro	isub_ifeq	jpc_off=0, seq_len=1
	POP2	r2, r3
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	sub	r3, r3, r2
	add	jpc, jpc, #1
        cmp     r3, #0
        orr     ip, ip, r1, lsl #8
	beq	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	isub_ifeq
	isub_ifeq
@-----------------------------------------------------------------------------
	.macro	isub_ifne	jpc_off=0, seq_len=1
	POP2	r2, r3
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	sub	r3, r3, r2
	add	jpc, jpc, #1
        cmp     r3, #0
        orr     ip, ip, r1, lsl #8
	bne	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	isub_ifne
	isub_ifne
@-----------------------------------------------------------------------------
	.macro	isub_iflt	jpc_off=0, seq_len=1
	POP2	r2, r3
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	sub	r3, r3, r2
	add	jpc, jpc, #1
        cmp     r3, #0
        orr     ip, ip, r1, lsl #8
	blt	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	isub_iflt
	isub_iflt
@-----------------------------------------------------------------------------
	.macro	isub_ifge	jpc_off=0, seq_len=1
	POP2	r2, r3
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	sub	r3, r3, r2
	add	jpc, jpc, #1
        cmp     r3, #0
        orr     ip, ip, r1, lsl #8
	bge	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	isub_ifge
	isub_ifge
@-----------------------------------------------------------------------------
	.macro	isub_ifgt	jpc_off=0, seq_len=1
	POP2	r2, r3
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	sub	r3, r3, r2
	add	jpc, jpc, #1
        cmp     r3, #0
        orr     ip, ip, r1, lsl #8
	bgt	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	isub_ifgt
	isub_ifgt
@-----------------------------------------------------------------------------
	.macro	isub_ifle	jpc_off=0, seq_len=1
	POP2	r2, r3
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	sub	r3, r3, r2
	add	jpc, jpc, #1
        cmp     r3, #0
        orr     ip, ip, r1, lsl #8
	ble	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	isub_ifle
	isub_ifle
@-----------------------------------------------------------------------------
	.macro	isub_if_icmpeq	jpc_off=0, seq_len=1
	POP3	r2, r3, lr
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	sub	r2, r3, r2
	add	jpc, jpc, #1
        cmp     lr, r2
        orr     ip, ip, r1, lsl #8
	beq	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	isub_if_icmpeq
	isub_if_icmpeq
@-----------------------------------------------------------------------------
	.macro	isub_if_icmpne	jpc_off=0, seq_len=1
	POP3	r2, r3, lr
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	sub	r2, r3, r2
	add	jpc, jpc, #1
        cmp     lr, r2
        orr     ip, ip, r1, lsl #8
	bne	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	isub_if_icmpne
	isub_if_icmpne
@-----------------------------------------------------------------------------
	.macro	isub_if_icmplt	jpc_off=0, seq_len=1
	POP3	r2, r3, lr
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	sub	r2, r3, r2
	add	jpc, jpc, #1
        cmp     lr, r2
        orr     ip, ip, r1, lsl #8
	blt	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	isub_if_icmplt
	isub_if_icmplt
@-----------------------------------------------------------------------------
	.macro	isub_if_icmpge	jpc_off=0, seq_len=1
	POP3	r2, r3, lr
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	sub	r2, r3, r2
	add	jpc, jpc, #1
        cmp     lr, r2
        orr     ip, ip, r1, lsl #8
	bge	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	isub_if_icmpge
	isub_if_icmpge
@-----------------------------------------------------------------------------
	.macro	isub_if_icmpgt	jpc_off=0, seq_len=1
	POP3	r2, r3, lr
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	sub	r2, r3, r2
	add	jpc, jpc, #1
        cmp     lr, r2
        orr     ip, ip, r1, lsl #8
	bgt	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	isub_if_icmpgt
	isub_if_icmpgt
@-----------------------------------------------------------------------------
	.macro	isub_if_icmple	jpc_off=0, seq_len=1
	POP3	r2, r3, lr
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	sub	r2, r3, r2
	add	jpc, jpc, #1
        cmp     lr, r2
        orr     ip, ip, r1, lsl #8
	ble	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	isub_if_icmple
	isub_if_icmple
@-----------------------------------------------------------------------------
	.macro	isub_goto	jpc_off=0, seq_len=1
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	add	jpc, jpc, #1
	orr	ip, ip, r1, lsl #8
	DISPATCH_START_REG	ip
	POP2	r2, r3
	sub	r2, r3, r2
	DISPATCH_NEXT
	PUSH	r2
	DISPATCH_FINISH
	.endm

	Opcode	isub_goto
	isub_goto
@-----------------------------------------------------------------------------
	.macro	isub_ireturn	jpc_off=0, seq_len=1
	POP2	r2, r3
	ldr	tmp2, [istate, #ISTATE_MONITOR_BASE]	@ tmp2 = base
	ldr	tmp1, [istate, #ISTATE_STACK_BASE]	@ tmp1 = end
	sub	r1, r3, r2
	ldr	tmp_xxx, [istate, #ISTATE_THREAD]
	cmp	tmp1, tmp2
	bcc	1f
2:
	mov	r3, #0
	ldr	stack, [tmp_xxx, #THREAD_TOP_ZERO_FRAME]
	str	r3, [tmp_xxx, #THREAD_LAST_JAVA_SP]
	ldr	r0, [istate, #ISTATE_METHOD]
	ldr	r3, [stack, #0]
	ldrh	r0, [r0, #40]
	ldr	istate, [istate, #ISTATE_SAVED_ISTATE]
	str	r3, [tmp_xxx, #THREAD_TOP_ZERO_FRAME]
	str	r1, [stack, r0, lsl #2]!
	cmp	istate, #0
	beq	normal_return
        ldr     jpc, [istate, #ISTATE_BCP]
        ldr     r2, [istate, #ISTATE_STACK_LIMIT]
	DISPATCH_START	3				@ ldrb	r0, [jpc, #3]!
        sub     stack, stack, #4
        ldr     r3, [tmp_xxx, #THREAD_TOP_ZERO_FRAME]
	DISPATCH_NEXT					@ ldrb	r1, [jpc, #2]
        add     r2, r2, #4
	DISPATCH_NEXT					@ ldr	ip, [dispatch, r0, lsl #2]
        str     r2, [tmp_xxx, #THREAD_JAVA_SP]
	DISPATCH_NEXT					@ ldrb	r2, [jpc, #1]
        str     r3, [tmp_xxx, #THREAD_LAST_JAVA_SP]
        ldr     constpool, [istate, #ISTATE_CONSTANTS]
        ldr     locals, [istate, #ISTATE_LOCALS]
	DISPATCH_NEXT					@ ands	lr, ip, lr
	add	constpool, constpool, #CONST_POOL_OFFSET
        DISPATCH_FINISH
1:
	PUSH	r1
	add	jpc, jpc, #1
	bl	return_check_monitors
	POP	r1
	b	2b
	.endm

	Opcode	isub_ireturn
	isub_ireturn
@-----------------------------------------------------------------------------
	.macro	isub_iinc	jpc_off=0, seq_len=4
	POP2	tmp1, lr
	DISPATCH_START	\seq_len
	sub	tmp1, lr, tmp1
        ldrb    r3, [jpc, #-2]	@ ECN: jpc now points to next bc
        ldrsb   r2, [jpc, #-1]
	DISPATCH_NEXT
	PUSH	tmp1
	ldr	tmp1, [locals, -r3, lsl #2]
	DISPATCH_NEXT
	add	tmp1, tmp1, r2
	str	tmp1, [locals, -r3, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	isub_iinc
	isub_iinc
@-----------------------------------------------------------------------------
	.macro	iand_iload	jpc_off=0, seq_len=3
	ldrb	r3, [jpc, #2]
	DISPATCH_START	\seq_len
	POP2	tmp2, tmp1
	DISPATCH_NEXT
	rsb	r3, r3, #0
	DISPATCH_NEXT
	ldr	r3, [locals, r3, lsl #2]
	DISPATCH_NEXT
	and	tmp2, tmp1, tmp2
	DISPATCH_NEXT
	PUSH2	r3, tmp2
	DISPATCH_FINISH
	.endm

	Opcode	iand_iload
	iand_iload
@-----------------------------------------------------------------------------
	.macro	iand_iload_0	jpc_off=0, seq_len=2
	DISPATCH_START	\seq_len
	rsb	r3, r1, #opc_iload_0
	POP2	tmp2, tmp1
	DISPATCH_NEXT
	ldr	r3, [locals, r3, lsl #2]
	and	tmp2, tmp1, tmp2
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH2	r3, tmp2
	DISPATCH_FINISH
	.endm

	Opcode	iand_iload_0
	iand_iload_0
@-----------------------------------------------------------------------------
	.macro	iand_iaload	jpc_off=0, seq_len=2
	POP3	r2, r3, lr		@ lr = ref
	DISPATCH_START	\seq_len
	and	r2, r3, r2		@ r2 = index
#ifndef HW_NULL_PTR_CHECK
	cmp	lr, #0
	beq	null_ptr_exception_jpc_1
#endif
.abortentry75:
	ldr	tmp1, [lr, #8]		@ tmp1 = length
	DISPATCH_NEXT
	cmp	r2, tmp1
	bcs	array_bound_exception_jpc_1
	add	lr, lr, r2, lsl #2
	ldr	tmp1, [lr, #12]
	DISPATCH_NEXT
	PUSH	tmp1
	DISPATCH_FINISH
	.endm

	Opcode	iand_iaload
	iand_iaload
@-----------------------------------------------------------------------------
	.macro	iand_istore	jpc_off=0, seq_len=3
	mov	r0, #opc_iand_u4store
	strb	r0, [jpc]
	b	do_iand_u4store
	.endm

	Opcode	iand_istore
	iand_istore
@-----------------------------------------------------------------------------
	.macro	iand_istore_0	jpc_off=0, seq_len=2
	mov	r0, #opc_iand_istore_N
	strb	r0, [jpc]
	b	do_iand_istore_N
	.endm

	Opcode	iand_istore_0
	iand_istore_0
@-----------------------------------------------------------------------------
	.macro	iand_iastore	jpc_off=0, seq_len=2
	POP2	r2, r3
	DISPATCH_START	\seq_len
	and	tmp1, r3, r2		@ tmp1 = value
	POP2	r2, r3			@ r2, index, r3 = ref
#ifndef HW_NULL_PTR_CHECK
	cmp	r3, #0
	beq	null_ptr_exception_jpc_1
#endif
.abortentry107:
	ldr	lr, [r3, #8]		@ lr = limit
	DISPATCH_NEXT
	cmp	r2, lr
	bcs	array_bound_exception_jpc_1
	DISPATCH_NEXT
	add	r3, r3, r2, lsl #2
	str	tmp1, [r3, #12]
	DISPATCH_FINISH
	.endm

	Opcode	iand_iastore
	iand_iastore
@-----------------------------------------------------------------------------
	.macro	iand_iadd	jpc_off=0, seq_len=2
	DISPATCH_START	\seq_len
	POP3	r2, r3, tmp1
	DISPATCH_NEXT
	and	tmp2, r3, r2
	DISPATCH_NEXT
	add	tmp2, tmp1, tmp2
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
	.endm

	Opcode	iand_iadd
	iand_iadd
@-----------------------------------------------------------------------------
	.macro	iand_isub	jpc_off=0, seq_len=2
	DISPATCH_START	\seq_len
	POP3	r2, r3, tmp1
	DISPATCH_NEXT
	and	tmp2, r3, r2
	DISPATCH_NEXT
	sub	tmp2, tmp1, tmp2
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
	.endm

	Opcode	iand_isub
	iand_isub
@-----------------------------------------------------------------------------
	.macro	iand_ifeq	jpc_off=0, seq_len=1
	POP2	r2, r3
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	and	r3, r3, r2
	add	jpc, jpc, #1
        cmp     r3, #0
        orr     ip, ip, r1, lsl #8
	beq	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iand_ifeq
	iand_ifeq
@-----------------------------------------------------------------------------
	.macro	iand_ifne	jpc_off=0, seq_len=1
	POP2	r2, r3
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	and	r3, r3, r2
	add	jpc, jpc, #1
        cmp     r3, #0
        orr     ip, ip, r1, lsl #8
	bne	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iand_ifne
	iand_ifne
@-----------------------------------------------------------------------------
	.macro	iand_iflt	jpc_off=0, seq_len=1
	POP2	r2, r3
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	and	r3, r3, r2
	add	jpc, jpc, #1
        cmp     r3, #0
        orr     ip, ip, r1, lsl #8
	blt	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iand_iflt
	iand_iflt
@-----------------------------------------------------------------------------
	.macro	iand_ifge	jpc_off=0, seq_len=1
	POP2	r2, r3
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	and	r3, r3, r2
	add	jpc, jpc, #1
        cmp     r3, #0
        orr     ip, ip, r1, lsl #8
	bge	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iand_ifge
	iand_ifge
@-----------------------------------------------------------------------------
	.macro	iand_ifgt	jpc_off=0, seq_len=1
	POP2	r2, r3
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	and	r3, r3, r2
	add	jpc, jpc, #1
        cmp     r3, #0
        orr     ip, ip, r1, lsl #8
	bgt	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iand_ifgt
	iand_ifgt
@-----------------------------------------------------------------------------
	.macro	iand_ifle	jpc_off=0, seq_len=1
	POP2	r2, r3
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	and	r3, r3, r2
	add	jpc, jpc, #1
        cmp     r3, #0
        orr     ip, ip, r1, lsl #8
	ble	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iand_ifle
	iand_ifle
@-----------------------------------------------------------------------------
	.macro	iand_if_icmpeq	jpc_off=0, seq_len=1
	POP3	r2, r3, lr
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	and	r2, r3, r2
	add	jpc, jpc, #1
        cmp     lr, r2
        orr     ip, ip, r1, lsl #8
	beq	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iand_if_icmpeq
	iand_if_icmpeq
@-----------------------------------------------------------------------------
	.macro	iand_if_icmpne	jpc_off=0, seq_len=1
	POP3	r2, r3, lr
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	and	r2, r3, r2
	add	jpc, jpc, #1
        cmp     lr, r2
        orr     ip, ip, r1, lsl #8
	bne	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iand_if_icmpne
	iand_if_icmpne
@-----------------------------------------------------------------------------
	.macro	iand_if_icmplt	jpc_off=0, seq_len=1
	POP3	r2, r3, lr
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	and	r2, r3, r2
	add	jpc, jpc, #1
        cmp     lr, r2
        orr     ip, ip, r1, lsl #8
	blt	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iand_if_icmplt
	iand_if_icmplt
@-----------------------------------------------------------------------------
	.macro	iand_if_icmpge	jpc_off=0, seq_len=1
	POP3	r2, r3, lr
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	and	r2, r3, r2
	add	jpc, jpc, #1
        cmp     lr, r2
        orr     ip, ip, r1, lsl #8
	bge	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iand_if_icmpge
	iand_if_icmpge
@-----------------------------------------------------------------------------
	.macro	iand_if_icmpgt	jpc_off=0, seq_len=1
	POP3	r2, r3, lr
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	and	r2, r3, r2
	add	jpc, jpc, #1
        cmp     lr, r2
        orr     ip, ip, r1, lsl #8
	bgt	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iand_if_icmpgt
	iand_if_icmpgt
@-----------------------------------------------------------------------------
	.macro	iand_if_icmple	jpc_off=0, seq_len=1
	POP3	r2, r3, lr
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	and	r2, r3, r2
	add	jpc, jpc, #1
        cmp     lr, r2
        orr     ip, ip, r1, lsl #8
	ble	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iand_if_icmple
	iand_if_icmple
@-----------------------------------------------------------------------------
	.macro	iand_goto	jpc_off=0, seq_len=1
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	add	jpc, jpc, #1
	orr	ip, ip, r1, lsl #8
	DISPATCH_START_REG	ip
	POP2	r2, r3
	and	r2, r3, r2
	DISPATCH_NEXT
	PUSH	r2
	DISPATCH_FINISH
	.endm

	Opcode	iand_goto
	iand_goto
@-----------------------------------------------------------------------------
	.macro	iand_ireturn	jpc_off=0, seq_len=1
	POP2	r2, r3
	ldr	tmp2, [istate, #ISTATE_MONITOR_BASE]	@ tmp2 = base
	ldr	tmp1, [istate, #ISTATE_STACK_BASE]	@ tmp1 = end
	and	r1, r3, r2
	ldr	tmp_xxx, [istate, #ISTATE_THREAD]
	cmp	tmp1, tmp2
	bcc	1f
2:
	mov	r3, #0
	ldr	stack, [tmp_xxx, #THREAD_TOP_ZERO_FRAME]
	str	r3, [tmp_xxx, #THREAD_LAST_JAVA_SP]
	ldr	r0, [istate, #ISTATE_METHOD]
	ldr	r3, [stack, #0]
	ldrh	r0, [r0, #40]
	ldr	istate, [istate, #ISTATE_SAVED_ISTATE]
	str	r3, [tmp_xxx, #THREAD_TOP_ZERO_FRAME]
	str	r1, [stack, r0, lsl #2]!
	cmp	istate, #0
	beq	normal_return
        ldr     jpc, [istate, #ISTATE_BCP]
        ldr     r2, [istate, #ISTATE_STACK_LIMIT]
	DISPATCH_START	3				@ ldrb	r0, [jpc, #3]!
        sub     stack, stack, #4
        ldr     r3, [tmp_xxx, #THREAD_TOP_ZERO_FRAME]
	DISPATCH_NEXT					@ ldrb	r1, [jpc, #2]
        add     r2, r2, #4
	DISPATCH_NEXT					@ ldr	ip, [dispatch, r0, lsl #2]
        str     r2, [tmp_xxx, #THREAD_JAVA_SP]
	DISPATCH_NEXT					@ ldrb	r2, [jpc, #1]
        str     r3, [tmp_xxx, #THREAD_LAST_JAVA_SP]
        ldr     constpool, [istate, #ISTATE_CONSTANTS]
        ldr     locals, [istate, #ISTATE_LOCALS]
	DISPATCH_NEXT					@ ands	lr, ip, lr
	add	constpool, constpool, #CONST_POOL_OFFSET
        DISPATCH_FINISH
1:
	PUSH	r1
	add	jpc, jpc, #1
	bl	return_check_monitors
	POP	r1
	b	2b
	.endm

	Opcode	iand_ireturn
	iand_ireturn
@-----------------------------------------------------------------------------
	.macro	iand_iinc	jpc_off=0, seq_len=4
	POP2	tmp1, lr
	DISPATCH_START	\seq_len
	and	tmp1, lr, tmp1
        ldrb    r3, [jpc, #-2]	@ ECN: jpc now points to next bc
        ldrsb   r2, [jpc, #-1]
	DISPATCH_NEXT
	PUSH	tmp1
	ldr	tmp1, [locals, -r3, lsl #2]
	DISPATCH_NEXT
	add	tmp1, tmp1, r2
	str	tmp1, [locals, -r3, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	iand_iinc
	iand_iinc
@-----------------------------------------------------------------------------
	.macro	ior_iload	jpc_off=0, seq_len=3
	ldrb	r3, [jpc, #2]
	DISPATCH_START	\seq_len
	POP2	tmp2, tmp1
	DISPATCH_NEXT
	rsb	r3, r3, #0
	DISPATCH_NEXT
	ldr	r3, [locals, r3, lsl #2]
	DISPATCH_NEXT
	orr	tmp2, tmp1, tmp2
	DISPATCH_NEXT
	PUSH2	r3, tmp2
	DISPATCH_FINISH
	.endm

	Opcode	ior_iload
	ior_iload
@-----------------------------------------------------------------------------
	.macro	ior_iload_0	jpc_off=0, seq_len=2
	DISPATCH_START	\seq_len
	rsb	r3, r1, #opc_iload_0
	POP2	tmp2, tmp1
	DISPATCH_NEXT
	ldr	r3, [locals, r3, lsl #2]
	orr	tmp2, tmp1, tmp2
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH2	r3, tmp2
	DISPATCH_FINISH
	.endm

	Opcode	ior_iload_0
	ior_iload_0
@-----------------------------------------------------------------------------
	.macro	ior_iaload	jpc_off=0, seq_len=2
	POP3	r2, r3, lr		@ lr = ref
	DISPATCH_START	\seq_len
	orr	r2, r3, r2		@ r2 = index
#ifndef HW_NULL_PTR_CHECK
	cmp	lr, #0
	beq	null_ptr_exception_jpc_1
#endif
.abortentry76:
	ldr	tmp1, [lr, #8]		@ tmp1 = length
	DISPATCH_NEXT
	cmp	r2, tmp1
	bcs	array_bound_exception_jpc_1
	add	lr, lr, r2, lsl #2
	ldr	tmp1, [lr, #12]
	DISPATCH_NEXT
	PUSH	tmp1
	DISPATCH_FINISH
	.endm

	Opcode	ior_iaload
	ior_iaload
@-----------------------------------------------------------------------------
	.macro	ior_istore	jpc_off=0, seq_len=3
	mov	r0, #opc_ior_u4store
	strb	r0, [jpc]
	b	do_ior_u4store
	.endm

	Opcode	ior_istore
	ior_istore
@-----------------------------------------------------------------------------
	.macro	ior_istore_0	jpc_off=0, seq_len=2
	mov	r0, #opc_ior_istore_N
	strb	r0, [jpc]
	b	do_ior_istore_N
	.endm

	Opcode	ior_istore_0
	ior_istore_0
@-----------------------------------------------------------------------------
	.macro	ior_iastore	jpc_off=0, seq_len=2
	POP2	r2, r3
	DISPATCH_START	\seq_len
	orr	tmp1, r3, r2		@ tmp1 = value
	POP2	r2, r3			@ r2, index, r3 = ref
#ifndef HW_NULL_PTR_CHECK
	cmp	r3, #0
	beq	null_ptr_exception_jpc_1
#endif
.abortentry108:
	ldr	lr, [r3, #8]		@ lr = limit
	DISPATCH_NEXT
	cmp	r2, lr
	bcs	array_bound_exception_jpc_1
	DISPATCH_NEXT
	add	r3, r3, r2, lsl #2
	str	tmp1, [r3, #12]
	DISPATCH_FINISH
	.endm

	Opcode	ior_iastore
	ior_iastore
@-----------------------------------------------------------------------------
	.macro	ior_iadd	jpc_off=0, seq_len=2
	DISPATCH_START	\seq_len
	POP3	r2, r3, tmp1
	DISPATCH_NEXT
	orr	tmp2, r3, r2
	DISPATCH_NEXT
	add	tmp2, tmp1, tmp2
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
	.endm

	Opcode	ior_iadd
	ior_iadd
@-----------------------------------------------------------------------------
	.macro	ior_isub	jpc_off=0, seq_len=2
	DISPATCH_START	\seq_len
	POP3	r2, r3, tmp1
	DISPATCH_NEXT
	orr	tmp2, r3, r2
	DISPATCH_NEXT
	sub	tmp2, tmp1, tmp2
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
	.endm

	Opcode	ior_isub
	ior_isub
@-----------------------------------------------------------------------------
	.macro	ior_ifeq	jpc_off=0, seq_len=1
	POP2	r2, r3
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	orr	r3, r3, r2
	add	jpc, jpc, #1
        cmp     r3, #0
        orr     ip, ip, r1, lsl #8
	beq	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	ior_ifeq
	ior_ifeq
@-----------------------------------------------------------------------------
	.macro	ior_ifne	jpc_off=0, seq_len=1
	POP2	r2, r3
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	orr	r3, r3, r2
	add	jpc, jpc, #1
        cmp     r3, #0
        orr     ip, ip, r1, lsl #8
	bne	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	ior_ifne
	ior_ifne
@-----------------------------------------------------------------------------
	.macro	ior_iflt	jpc_off=0, seq_len=1
	POP2	r2, r3
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	orr	r3, r3, r2
	add	jpc, jpc, #1
        cmp     r3, #0
        orr     ip, ip, r1, lsl #8
	blt	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	ior_iflt
	ior_iflt
@-----------------------------------------------------------------------------
	.macro	ior_ifge	jpc_off=0, seq_len=1
	POP2	r2, r3
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	orr	r3, r3, r2
	add	jpc, jpc, #1
        cmp     r3, #0
        orr     ip, ip, r1, lsl #8
	bge	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	ior_ifge
	ior_ifge
@-----------------------------------------------------------------------------
	.macro	ior_ifgt	jpc_off=0, seq_len=1
	POP2	r2, r3
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	orr	r3, r3, r2
	add	jpc, jpc, #1
        cmp     r3, #0
        orr     ip, ip, r1, lsl #8
	bgt	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	ior_ifgt
	ior_ifgt
@-----------------------------------------------------------------------------
	.macro	ior_ifle	jpc_off=0, seq_len=1
	POP2	r2, r3
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	orr	r3, r3, r2
	add	jpc, jpc, #1
        cmp     r3, #0
        orr     ip, ip, r1, lsl #8
	ble	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	ior_ifle
	ior_ifle
@-----------------------------------------------------------------------------
	.macro	ior_if_icmpeq	jpc_off=0, seq_len=1
	POP3	r2, r3, lr
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	orr	r2, r3, r2
	add	jpc, jpc, #1
        cmp     lr, r2
        orr     ip, ip, r1, lsl #8
	beq	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	ior_if_icmpeq
	ior_if_icmpeq
@-----------------------------------------------------------------------------
	.macro	ior_if_icmpne	jpc_off=0, seq_len=1
	POP3	r2, r3, lr
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	orr	r2, r3, r2
	add	jpc, jpc, #1
        cmp     lr, r2
        orr     ip, ip, r1, lsl #8
	bne	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	ior_if_icmpne
	ior_if_icmpne
@-----------------------------------------------------------------------------
	.macro	ior_if_icmplt	jpc_off=0, seq_len=1
	POP3	r2, r3, lr
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	orr	r2, r3, r2
	add	jpc, jpc, #1
        cmp     lr, r2
        orr     ip, ip, r1, lsl #8
	blt	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	ior_if_icmplt
	ior_if_icmplt
@-----------------------------------------------------------------------------
	.macro	ior_if_icmpge	jpc_off=0, seq_len=1
	POP3	r2, r3, lr
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	orr	r2, r3, r2
	add	jpc, jpc, #1
        cmp     lr, r2
        orr     ip, ip, r1, lsl #8
	bge	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	ior_if_icmpge
	ior_if_icmpge
@-----------------------------------------------------------------------------
	.macro	ior_if_icmpgt	jpc_off=0, seq_len=1
	POP3	r2, r3, lr
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	orr	r2, r3, r2
	add	jpc, jpc, #1
        cmp     lr, r2
        orr     ip, ip, r1, lsl #8
	bgt	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	ior_if_icmpgt
	ior_if_icmpgt
@-----------------------------------------------------------------------------
	.macro	ior_if_icmple	jpc_off=0, seq_len=1
	POP3	r2, r3, lr
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	orr	r2, r3, r2
	add	jpc, jpc, #1
        cmp     lr, r2
        orr     ip, ip, r1, lsl #8
	ble	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	ior_if_icmple
	ior_if_icmple
@-----------------------------------------------------------------------------
	.macro	ior_goto	jpc_off=0, seq_len=1
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	add	jpc, jpc, #1
	orr	ip, ip, r1, lsl #8
	DISPATCH_START_REG	ip
	POP2	r2, r3
	orr	r2, r3, r2
	DISPATCH_NEXT
	PUSH	r2
	DISPATCH_FINISH
	.endm

	Opcode	ior_goto
	ior_goto
@-----------------------------------------------------------------------------
	.macro	ior_ireturn	jpc_off=0, seq_len=1
	POP2	r2, r3
	ldr	tmp2, [istate, #ISTATE_MONITOR_BASE]	@ tmp2 = base
	ldr	tmp1, [istate, #ISTATE_STACK_BASE]	@ tmp1 = end
	orr	r1, r3, r2
	ldr	tmp_xxx, [istate, #ISTATE_THREAD]
	cmp	tmp1, tmp2
	bcc	1f
2:
	mov	r3, #0
	ldr	stack, [tmp_xxx, #THREAD_TOP_ZERO_FRAME]
	str	r3, [tmp_xxx, #THREAD_LAST_JAVA_SP]
	ldr	r0, [istate, #ISTATE_METHOD]
	ldr	r3, [stack, #0]
	ldrh	r0, [r0, #40]
	ldr	istate, [istate, #ISTATE_SAVED_ISTATE]
	str	r3, [tmp_xxx, #THREAD_TOP_ZERO_FRAME]
	str	r1, [stack, r0, lsl #2]!
	cmp	istate, #0
	beq	normal_return
        ldr     jpc, [istate, #ISTATE_BCP]
        ldr     r2, [istate, #ISTATE_STACK_LIMIT]
	DISPATCH_START	3				@ ldrb	r0, [jpc, #3]!
        sub     stack, stack, #4
        ldr     r3, [tmp_xxx, #THREAD_TOP_ZERO_FRAME]
	DISPATCH_NEXT					@ ldrb	r1, [jpc, #2]
        add     r2, r2, #4
	DISPATCH_NEXT					@ ldr	ip, [dispatch, r0, lsl #2]
        str     r2, [tmp_xxx, #THREAD_JAVA_SP]
	DISPATCH_NEXT					@ ldrb	r2, [jpc, #1]
        str     r3, [tmp_xxx, #THREAD_LAST_JAVA_SP]
        ldr     constpool, [istate, #ISTATE_CONSTANTS]
        ldr     locals, [istate, #ISTATE_LOCALS]
	DISPATCH_NEXT					@ ands	lr, ip, lr
	add	constpool, constpool, #CONST_POOL_OFFSET
        DISPATCH_FINISH
1:
	PUSH	r1
	add	jpc, jpc, #1
	bl	return_check_monitors
	POP	r1
	b	2b
	.endm

	Opcode	ior_ireturn
	ior_ireturn
@-----------------------------------------------------------------------------
	.macro	ior_iinc	jpc_off=0, seq_len=4
	POP2	tmp1, lr
	DISPATCH_START	\seq_len
	orr	tmp1, lr, tmp1
        ldrb    r3, [jpc, #-2]	@ ECN: jpc now points to next bc
        ldrsb   r2, [jpc, #-1]
	DISPATCH_NEXT
	PUSH	tmp1
	ldr	tmp1, [locals, -r3, lsl #2]
	DISPATCH_NEXT
	add	tmp1, tmp1, r2
	str	tmp1, [locals, -r3, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	ior_iinc
	ior_iinc
@-----------------------------------------------------------------------------
	.macro	ixor_iload	jpc_off=0, seq_len=3
	ldrb	r3, [jpc, #2]
	DISPATCH_START	\seq_len
	POP2	tmp2, tmp1
	DISPATCH_NEXT
	rsb	r3, r3, #0
	DISPATCH_NEXT
	ldr	r3, [locals, r3, lsl #2]
	DISPATCH_NEXT
	eor	tmp2, tmp1, tmp2
	DISPATCH_NEXT
	PUSH2	r3, tmp2
	DISPATCH_FINISH
	.endm

	Opcode	ixor_iload
	ixor_iload
@-----------------------------------------------------------------------------
	.macro	ixor_iload_0	jpc_off=0, seq_len=2
	DISPATCH_START	\seq_len
	rsb	r3, r1, #opc_iload_0
	POP2	tmp2, tmp1
	DISPATCH_NEXT
	ldr	r3, [locals, r3, lsl #2]
	eor	tmp2, tmp1, tmp2
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH2	r3, tmp2
	DISPATCH_FINISH
	.endm

	Opcode	ixor_iload_0
	ixor_iload_0
@-----------------------------------------------------------------------------
	.macro	ixor_iaload	jpc_off=0, seq_len=2
	POP3	r2, r3, lr		@ lr = ref
	DISPATCH_START	\seq_len
	eor	r2, r3, r2		@ r2 = index
#ifndef HW_NULL_PTR_CHECK
	cmp	lr, #0
	beq	null_ptr_exception_jpc_1
#endif
.abortentry77:
	ldr	tmp1, [lr, #8]		@ tmp1 = length
	DISPATCH_NEXT
	cmp	r2, tmp1
	bcs	array_bound_exception_jpc_1
	add	lr, lr, r2, lsl #2
	ldr	tmp1, [lr, #12]
	DISPATCH_NEXT
	PUSH	tmp1
	DISPATCH_FINISH
	.endm

	Opcode	ixor_iaload
	ixor_iaload
@-----------------------------------------------------------------------------
	.macro	ixor_istore	jpc_off=0, seq_len=3
	mov	r0, #opc_ixor_u4store
	strb	r0, [jpc]
	b	do_ixor_u4store
	.endm

	Opcode	ixor_istore
	ixor_istore
@-----------------------------------------------------------------------------
	.macro	ixor_istore_0	jpc_off=0, seq_len=2
	mov	r0, #opc_ixor_istore_N
	strb	r0, [jpc]
	b	do_ixor_istore_N
	.endm

	Opcode	ixor_istore_0
	ixor_istore_0
@-----------------------------------------------------------------------------
	.macro	ixor_iastore	jpc_off=0, seq_len=2
	POP2	r2, r3
	DISPATCH_START	\seq_len
	eor	tmp1, r3, r2		@ tmp1 = value
	POP2	r2, r3			@ r2, index, r3 = ref
#ifndef HW_NULL_PTR_CHECK
	cmp	r3, #0
	beq	null_ptr_exception_jpc_1
#endif
.abortentry109:
	ldr	lr, [r3, #8]		@ lr = limit
	DISPATCH_NEXT
	cmp	r2, lr
	bcs	array_bound_exception_jpc_1
	DISPATCH_NEXT
	add	r3, r3, r2, lsl #2
	str	tmp1, [r3, #12]
	DISPATCH_FINISH
	.endm

	Opcode	ixor_iastore
	ixor_iastore
@-----------------------------------------------------------------------------
	.macro	ixor_iadd	jpc_off=0, seq_len=2
	DISPATCH_START	\seq_len
	POP3	r2, r3, tmp1
	DISPATCH_NEXT
	eor	tmp2, r3, r2
	DISPATCH_NEXT
	add	tmp2, tmp1, tmp2
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
	.endm

	Opcode	ixor_iadd
	ixor_iadd
@-----------------------------------------------------------------------------
	.macro	ixor_isub	jpc_off=0, seq_len=2
	DISPATCH_START	\seq_len
	POP3	r2, r3, tmp1
	DISPATCH_NEXT
	eor	tmp2, r3, r2
	DISPATCH_NEXT
	sub	tmp2, tmp1, tmp2
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
	.endm

	Opcode	ixor_isub
	ixor_isub
@-----------------------------------------------------------------------------
	.macro	ixor_ifeq	jpc_off=0, seq_len=1
	POP2	r2, r3
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	eor	r3, r3, r2
	add	jpc, jpc, #1
        cmp     r3, #0
        orr     ip, ip, r1, lsl #8
	beq	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	ixor_ifeq
	ixor_ifeq
@-----------------------------------------------------------------------------
	.macro	ixor_ifne	jpc_off=0, seq_len=1
	POP2	r2, r3
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	eor	r3, r3, r2
	add	jpc, jpc, #1
        cmp     r3, #0
        orr     ip, ip, r1, lsl #8
	bne	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	ixor_ifne
	ixor_ifne
@-----------------------------------------------------------------------------
	.macro	ixor_iflt	jpc_off=0, seq_len=1
	POP2	r2, r3
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	eor	r3, r3, r2
	add	jpc, jpc, #1
        cmp     r3, #0
        orr     ip, ip, r1, lsl #8
	blt	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	ixor_iflt
	ixor_iflt
@-----------------------------------------------------------------------------
	.macro	ixor_ifge	jpc_off=0, seq_len=1
	POP2	r2, r3
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	eor	r3, r3, r2
	add	jpc, jpc, #1
        cmp     r3, #0
        orr     ip, ip, r1, lsl #8
	bge	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	ixor_ifge
	ixor_ifge
@-----------------------------------------------------------------------------
	.macro	ixor_ifgt	jpc_off=0, seq_len=1
	POP2	r2, r3
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	eor	r3, r3, r2
	add	jpc, jpc, #1
        cmp     r3, #0
        orr     ip, ip, r1, lsl #8
	bgt	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	ixor_ifgt
	ixor_ifgt
@-----------------------------------------------------------------------------
	.macro	ixor_ifle	jpc_off=0, seq_len=1
	POP2	r2, r3
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	eor	r3, r3, r2
	add	jpc, jpc, #1
        cmp     r3, #0
        orr     ip, ip, r1, lsl #8
	ble	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	ixor_ifle
	ixor_ifle
@-----------------------------------------------------------------------------
	.macro	ixor_if_icmpeq	jpc_off=0, seq_len=1
	POP3	r2, r3, lr
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	eor	r2, r3, r2
	add	jpc, jpc, #1
        cmp     lr, r2
        orr     ip, ip, r1, lsl #8
	beq	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	ixor_if_icmpeq
	ixor_if_icmpeq
@-----------------------------------------------------------------------------
	.macro	ixor_if_icmpne	jpc_off=0, seq_len=1
	POP3	r2, r3, lr
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	eor	r2, r3, r2
	add	jpc, jpc, #1
        cmp     lr, r2
        orr     ip, ip, r1, lsl #8
	bne	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	ixor_if_icmpne
	ixor_if_icmpne
@-----------------------------------------------------------------------------
	.macro	ixor_if_icmplt	jpc_off=0, seq_len=1
	POP3	r2, r3, lr
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	eor	r2, r3, r2
	add	jpc, jpc, #1
        cmp     lr, r2
        orr     ip, ip, r1, lsl #8
	blt	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	ixor_if_icmplt
	ixor_if_icmplt
@-----------------------------------------------------------------------------
	.macro	ixor_if_icmpge	jpc_off=0, seq_len=1
	POP3	r2, r3, lr
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	eor	r2, r3, r2
	add	jpc, jpc, #1
        cmp     lr, r2
        orr     ip, ip, r1, lsl #8
	bge	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	ixor_if_icmpge
	ixor_if_icmpge
@-----------------------------------------------------------------------------
	.macro	ixor_if_icmpgt	jpc_off=0, seq_len=1
	POP3	r2, r3, lr
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	eor	r2, r3, r2
	add	jpc, jpc, #1
        cmp     lr, r2
        orr     ip, ip, r1, lsl #8
	bgt	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	ixor_if_icmpgt
	ixor_if_icmpgt
@-----------------------------------------------------------------------------
	.macro	ixor_if_icmple	jpc_off=0, seq_len=1
	POP3	r2, r3, lr
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	eor	r2, r3, r2
	add	jpc, jpc, #1
        cmp     lr, r2
        orr     ip, ip, r1, lsl #8
	ble	1f
	mov	ip, #3
1:
        ldrb    r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	ixor_if_icmple
	ixor_if_icmple
@-----------------------------------------------------------------------------
	.macro	ixor_goto	jpc_off=0, seq_len=1
        ldrsb   r1, [jpc, #2]
        ldrb    ip, [jpc, #3]
	add	jpc, jpc, #1
	orr	ip, ip, r1, lsl #8
	DISPATCH_START_REG	ip
	POP2	r2, r3
	eor	r2, r3, r2
	DISPATCH_NEXT
	PUSH	r2
	DISPATCH_FINISH
	.endm

	Opcode	ixor_goto
	ixor_goto
@-----------------------------------------------------------------------------
	.macro	ixor_ireturn	jpc_off=0, seq_len=1
	POP2	r2, r3
	ldr	tmp2, [istate, #ISTATE_MONITOR_BASE]	@ tmp2 = base
	ldr	tmp1, [istate, #ISTATE_STACK_BASE]	@ tmp1 = end
	eor	r1, r3, r2
	ldr	tmp_xxx, [istate, #ISTATE_THREAD]
	cmp	tmp1, tmp2
	bcc	1f
2:
	mov	r3, #0
	ldr	stack, [tmp_xxx, #THREAD_TOP_ZERO_FRAME]
	str	r3, [tmp_xxx, #THREAD_LAST_JAVA_SP]
	ldr	r0, [istate, #ISTATE_METHOD]
	ldr	r3, [stack, #0]
	ldrh	r0, [r0, #40]
	ldr	istate, [istate, #ISTATE_SAVED_ISTATE]
	str	r3, [tmp_xxx, #THREAD_TOP_ZERO_FRAME]
	str	r1, [stack, r0, lsl #2]!
	cmp	istate, #0
	beq	normal_return
        ldr     jpc, [istate, #ISTATE_BCP]
        ldr     r2, [istate, #ISTATE_STACK_LIMIT]
	DISPATCH_START	3				@ ldrb	r0, [jpc, #3]!
        sub     stack, stack, #4
        ldr     r3, [tmp_xxx, #THREAD_TOP_ZERO_FRAME]
	DISPATCH_NEXT					@ ldrb	r1, [jpc, #2]
        add     r2, r2, #4
	DISPATCH_NEXT					@ ldr	ip, [dispatch, r0, lsl #2]
        str     r2, [tmp_xxx, #THREAD_JAVA_SP]
	DISPATCH_NEXT					@ ldrb	r2, [jpc, #1]
        str     r3, [tmp_xxx, #THREAD_LAST_JAVA_SP]
        ldr     constpool, [istate, #ISTATE_CONSTANTS]
        ldr     locals, [istate, #ISTATE_LOCALS]
	DISPATCH_NEXT					@ ands	lr, ip, lr
	add	constpool, constpool, #CONST_POOL_OFFSET
        DISPATCH_FINISH
1:
	PUSH	r1
	add	jpc, jpc, #1
	bl	return_check_monitors
	POP	r1
	b	2b
	.endm

	Opcode	ixor_ireturn
	ixor_ireturn
@-----------------------------------------------------------------------------
	.macro	ixor_iinc	jpc_off=0, seq_len=4
	POP2	tmp1, lr
	DISPATCH_START	\seq_len
	eor	tmp1, lr, tmp1
        ldrb    r3, [jpc, #-2]	@ ECN: jpc now points to next bc
        ldrsb   r2, [jpc, #-1]
	DISPATCH_NEXT
	PUSH	tmp1
	ldr	tmp1, [locals, -r3, lsl #2]
	DISPATCH_NEXT
	add	tmp1, tmp1, r2
	str	tmp1, [locals, -r3, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	ixor_iinc
	ixor_iinc
@-----------------------------------------------------------------------------
	.macro	iinc_iconst_m1	jpc_off=0, seq_len=4
        ldrsb   tmp1, [jpc, #2]
	sub	lr, r1, #opc_iconst_0
	DISPATCH_START	\seq_len
	rsb	tmp2, r2, #0
	ldr	r3, [locals, tmp2, lsl #2]
	DISPATCH_NEXT
	add	r3, r3, tmp1
	DISPATCH_NEXT
	PUSH	lr
	DISPATCH_NEXT
	DISPATCH_NEXT
	str	r3, [locals, tmp2, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	iinc_iconst_m1
	iinc_iconst_m1
@-----------------------------------------------------------------------------
	.macro	iinc_iload	jpc_off=0, seq_len=5
	ldrb	lr, [jpc, #4]
        ldrsb   tmp1, [jpc, #2]
	DISPATCH_START	\seq_len
	rsb	tmp2, r2, #0
	ldr	r3, [locals, tmp2, lsl #2]
	DISPATCH_NEXT
	rsb	lr, lr, #0
	DISPATCH_NEXT
	add	r3, r3, tmp1
	DISPATCH_NEXT
	str	r3, [locals, tmp2, lsl #2]
	ldr	tmp1, [locals, lr, lsl #2]
	DISPATCH_NEXT
	PUSH	tmp1
	DISPATCH_FINISH
	.endm

	Opcode	iinc_iload
	iinc_iload
@-----------------------------------------------------------------------------
	.macro	iinc_iload_0	jpc_off=0, seq_len=4
	rsb	lr, r1, #opc_iload_0
        ldrsb   tmp1, [jpc, #2]
	DISPATCH_START	\seq_len
	rsb	tmp2, r2, #0
	ldr	r3, [locals, tmp2, lsl #2]
	DISPATCH_NEXT
	add	r3, r3, tmp1
	DISPATCH_NEXT
	str	r3, [locals, tmp2, lsl #2]
	DISPATCH_NEXT
	ldr	tmp1, [locals, lr, lsl #2]
	DISPATCH_NEXT
	PUSH	tmp1
	DISPATCH_FINISH
	.endm

	Opcode	iinc_iload_0
	iinc_iload_0
@-----------------------------------------------------------------------------
	.macro	iaccess_0_iload	jpc_off=0, seq_len=6
	ldrb	r2, [jpc, #3]
	rsb	tmp1, r0, #opc_iaccess_0
	ldrb	r3, [jpc, #2]
	add	tmp2, constpool, r2, lsl #12
	DISPATCH_START	6
	ldr	tmp1, [locals, tmp1, lsl #2]
	add	tmp2, r3, lsl #4
	ldrb	r3, [jpc, #-1]
	DISPATCH_NEXT
#ifndef HW_NULL_PTR_CHECK
	cmp	tmp1, #0
	beq	null_ptr_exception_jpc_5
#endif
	DISPATCH_NEXT
        ldr     tmp2, [tmp2, #8]
	DISPATCH_NEXT
	rsb	r3, r3, #0
.abortentry89:
	ldr	tmp2, [tmp1, tmp2]
	ldr	r3, [locals, r3, lsl #2]
	DISPATCH_NEXT
	PUSH2	r3, tmp2
	DISPATCH_FINISH
	.endm

	Opcode	iaccess_0_iload
	iaccess_0_iload
@-----------------------------------------------------------------------------
	.macro	iaccess_0_iload_0	jpc_off=0, seq_len=5
	ldrb	r2, [jpc, #3]
	rsb	tmp1, r0, #opc_iaccess_0
	ldrb	ip, [jpc, #2]
	add	tmp2, constpool, r2, lsl #12
	DISPATCH_START	5
	rsb	r3, r1, #opc_iload_0
	ldr	tmp1, [locals, tmp1, lsl #2]
	add	tmp2, ip, lsl #4
	DISPATCH_NEXT
#ifndef HW_NULL_PTR_CHECK
	cmp	tmp1, #0
	beq	null_ptr_exception_jpc_4
#endif
	DISPATCH_NEXT
        ldr     tmp2, [tmp2, #8]
	DISPATCH_NEXT
.abortentry90:
	ldr	tmp2, [tmp1, tmp2]
	ldr	r3, [locals, r3, lsl #2]
	DISPATCH_NEXT
	PUSH2	r3, tmp2
	DISPATCH_FINISH
	.endm

	Opcode	iaccess_0_iload_0
	iaccess_0_iload_0
@-----------------------------------------------------------------------------
	.macro	iaccess_0_iadd	jpc_off=0, seq_len=5
	ldrb	r2, [jpc, #3]
	rsb	tmp1, r0, #opc_iaccess_0
	ldrb	ip, [jpc, #2]
	add	tmp2, constpool, r2, lsl #12
	DISPATCH_START	5
	ldr	tmp1, [locals, tmp1, lsl #2]
	add	tmp2, ip, lsl #4
	DISPATCH_NEXT
#ifndef HW_NULL_PTR_CHECK
	cmp	tmp1, #0
	beq	null_ptr_exception_jpc_4
#endif
	DISPATCH_NEXT
        ldr     tmp2, [tmp2, #8]
	DISPATCH_NEXT
	POP	r3
.abortentry91:
	ldr	tmp2, [tmp1, tmp2]
	DISPATCH_NEXT
	add	tmp2, tmp2, r3
	PUSH	tmp2
	DISPATCH_FINISH
	.endm

	Opcode	iaccess_0_iadd
	iaccess_0_iadd
@-----------------------------------------------------------------------------
	.macro	iaccess_0_ifeq	jpc_off=0, seq_len=4
	ldrb	r2, [jpc, #3]
	rsb	tmp1, r0, #opc_iaccess_0
	ldrb	ip, [jpc, #2]
	add	jpc, jpc, #4
	ldrsb	r0, [jpc, #1]
	add	tmp2, constpool, r2, lsl #12
	ldr	tmp1, [locals, tmp1, lsl #2]
	add	tmp2, ip, lsl #4
	ldrb	ip, [jpc, #2]
#ifndef HW_NULL_PTR_CHECK
	cmp	tmp1, #0
	beq	null_ptr_exception_jpc_3
#endif
        ldr     tmp2, [tmp2, #8]
	orr	ip, ip, r0, lsl #8
.abortentry92:
	ldr	tmp2, [tmp1, tmp2]
	cmp	tmp2, #0
	beq	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iaccess_0_ifeq
	iaccess_0_ifeq
@-----------------------------------------------------------------------------
	.macro	iaccess_0_ifne	jpc_off=0, seq_len=4
	ldrb	r2, [jpc, #3]
	rsb	tmp1, r0, #opc_iaccess_0
	ldrb	ip, [jpc, #2]
	add	jpc, jpc, #4
	ldrsb	r0, [jpc, #1]
	add	tmp2, constpool, r2, lsl #12
	ldr	tmp1, [locals, tmp1, lsl #2]
	add	tmp2, ip, lsl #4
	ldrb	ip, [jpc, #2]
#ifndef HW_NULL_PTR_CHECK
	cmp	tmp1, #0
	beq	null_ptr_exception_jpc_3
#endif
        ldr     tmp2, [tmp2, #8]
	orr	ip, ip, r0, lsl #8
.abortentry93:
	ldr	tmp2, [tmp1, tmp2]
	cmp	tmp2, #0
	bne	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iaccess_0_ifne
	iaccess_0_ifne
@-----------------------------------------------------------------------------
	.macro	iaccess_0_iflt	jpc_off=0, seq_len=4
	ldrb	r2, [jpc, #3]
	rsb	tmp1, r0, #opc_iaccess_0
	ldrb	ip, [jpc, #2]
	add	jpc, jpc, #4
	ldrsb	r0, [jpc, #1]
	add	tmp2, constpool, r2, lsl #12
	ldr	tmp1, [locals, tmp1, lsl #2]
	add	tmp2, ip, lsl #4
	ldrb	ip, [jpc, #2]
#ifndef HW_NULL_PTR_CHECK
	cmp	tmp1, #0
	beq	null_ptr_exception_jpc_3
#endif
        ldr     tmp2, [tmp2, #8]
	orr	ip, ip, r0, lsl #8
.abortentry94:
	ldr	tmp2, [tmp1, tmp2]
	cmp	tmp2, #0
	blt	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iaccess_0_iflt
	iaccess_0_iflt
@-----------------------------------------------------------------------------
	.macro	iaccess_0_ifge	jpc_off=0, seq_len=4
	ldrb	r2, [jpc, #3]
	rsb	tmp1, r0, #opc_iaccess_0
	ldrb	ip, [jpc, #2]
	add	jpc, jpc, #4
	ldrsb	r0, [jpc, #1]
	add	tmp2, constpool, r2, lsl #12
	ldr	tmp1, [locals, tmp1, lsl #2]
	add	tmp2, ip, lsl #4
	ldrb	ip, [jpc, #2]
#ifndef HW_NULL_PTR_CHECK
	cmp	tmp1, #0
	beq	null_ptr_exception_jpc_3
#endif
        ldr     tmp2, [tmp2, #8]
	orr	ip, ip, r0, lsl #8
.abortentry95:
	ldr	tmp2, [tmp1, tmp2]
	cmp	tmp2, #0
	bge	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iaccess_0_ifge
	iaccess_0_ifge
@-----------------------------------------------------------------------------
	.macro	iaccess_0_ifgt	jpc_off=0, seq_len=4
	ldrb	r2, [jpc, #3]
	rsb	tmp1, r0, #opc_iaccess_0
	ldrb	ip, [jpc, #2]
	add	jpc, jpc, #4
	ldrsb	r0, [jpc, #1]
	add	tmp2, constpool, r2, lsl #12
	ldr	tmp1, [locals, tmp1, lsl #2]
	add	tmp2, ip, lsl #4
	ldrb	ip, [jpc, #2]
#ifndef HW_NULL_PTR_CHECK
	cmp	tmp1, #0
	beq	null_ptr_exception_jpc_3
#endif
        ldr     tmp2, [tmp2, #8]
	orr	ip, ip, r0, lsl #8
.abortentry96:
	ldr	tmp2, [tmp1, tmp2]
	cmp	tmp2, #0
	bgt	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iaccess_0_ifgt
	iaccess_0_ifgt
@-----------------------------------------------------------------------------
	.macro	iaccess_0_ifle	jpc_off=0, seq_len=4
	ldrb	r2, [jpc, #3]
	rsb	tmp1, r0, #opc_iaccess_0
	ldrb	ip, [jpc, #2]
	add	jpc, jpc, #4
	ldrsb	r0, [jpc, #1]
	add	tmp2, constpool, r2, lsl #12
	ldr	tmp1, [locals, tmp1, lsl #2]
	add	tmp2, ip, lsl #4
	ldrb	ip, [jpc, #2]
#ifndef HW_NULL_PTR_CHECK
	cmp	tmp1, #0
	beq	null_ptr_exception_jpc_3
#endif
        ldr     tmp2, [tmp2, #8]
	orr	ip, ip, r0, lsl #8
.abortentry97:
	ldr	tmp2, [tmp1, tmp2]
	cmp	tmp2, #0
	ble	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iaccess_0_ifle
	iaccess_0_ifle
@-----------------------------------------------------------------------------
	.macro	iaccess_0_if_icmpeq	jpc_off=0, seq_len=4
	ldrb	r2, [jpc, #3]
	rsb	tmp1, r0, #opc_iaccess_0
	ldrb	ip, [jpc, #2]
	add	jpc, jpc, #4
	ldrsb	r0, [jpc, #1]
	add	tmp2, constpool, r2, lsl #12
	ldr	tmp1, [locals, tmp1, lsl #2]
	add	tmp2, ip, lsl #4
	ldrb	ip, [jpc, #2]
#ifndef HW_NULL_PTR_CHECK
	cmp	tmp1, #0
	beq	null_ptr_exception_jpc_3
#endif
        ldr     tmp2, [tmp2, #8]
	POP	r3
	orr	ip, ip, r0, lsl #8
.abortentry98:
	ldr	tmp2, [tmp1, tmp2]
	cmp	r3, tmp2
	beq	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iaccess_0_if_icmpeq
	iaccess_0_if_icmpeq
@-----------------------------------------------------------------------------
	.macro	iaccess_0_if_icmpne	jpc_off=0, seq_len=4
	ldrb	r2, [jpc, #3]
	rsb	tmp1, r0, #opc_iaccess_0
	ldrb	ip, [jpc, #2]
	add	jpc, jpc, #4
	ldrsb	r0, [jpc, #1]
	add	tmp2, constpool, r2, lsl #12
	ldr	tmp1, [locals, tmp1, lsl #2]
	add	tmp2, ip, lsl #4
	ldrb	ip, [jpc, #2]
#ifndef HW_NULL_PTR_CHECK
	cmp	tmp1, #0
	beq	null_ptr_exception_jpc_3
#endif
        ldr     tmp2, [tmp2, #8]
	POP	r3
	orr	ip, ip, r0, lsl #8
.abortentry99:
	ldr	tmp2, [tmp1, tmp2]
	cmp	r3, tmp2
	bne	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iaccess_0_if_icmpne
	iaccess_0_if_icmpne
@-----------------------------------------------------------------------------
	.macro	iaccess_0_if_icmplt	jpc_off=0, seq_len=4
	ldrb	r2, [jpc, #3]
	rsb	tmp1, r0, #opc_iaccess_0
	ldrb	ip, [jpc, #2]
	add	jpc, jpc, #4
	ldrsb	r0, [jpc, #1]
	add	tmp2, constpool, r2, lsl #12
	ldr	tmp1, [locals, tmp1, lsl #2]
	add	tmp2, ip, lsl #4
	ldrb	ip, [jpc, #2]
#ifndef HW_NULL_PTR_CHECK
	cmp	tmp1, #0
	beq	null_ptr_exception_jpc_3
#endif
        ldr     tmp2, [tmp2, #8]
	POP	r3
	orr	ip, ip, r0, lsl #8
.abortentry100:
	ldr	tmp2, [tmp1, tmp2]
	cmp	r3, tmp2
	blt	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iaccess_0_if_icmplt
	iaccess_0_if_icmplt
@-----------------------------------------------------------------------------
	.macro	iaccess_0_if_icmpge	jpc_off=0, seq_len=4
	ldrb	r2, [jpc, #3]
	rsb	tmp1, r0, #opc_iaccess_0
	ldrb	ip, [jpc, #2]
	add	jpc, jpc, #4
	ldrsb	r0, [jpc, #1]
	add	tmp2, constpool, r2, lsl #12
	ldr	tmp1, [locals, tmp1, lsl #2]
	add	tmp2, ip, lsl #4
	ldrb	ip, [jpc, #2]
#ifndef HW_NULL_PTR_CHECK
	cmp	tmp1, #0
	beq	null_ptr_exception_jpc_3
#endif
        ldr     tmp2, [tmp2, #8]
	POP	r3
	orr	ip, ip, r0, lsl #8
.abortentry101:
	ldr	tmp2, [tmp1, tmp2]
	cmp	r3, tmp2
	bge	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iaccess_0_if_icmpge
	iaccess_0_if_icmpge
@-----------------------------------------------------------------------------
	.macro	iaccess_0_if_icmpgt	jpc_off=0, seq_len=4
	ldrb	r2, [jpc, #3]
	rsb	tmp1, r0, #opc_iaccess_0
	ldrb	ip, [jpc, #2]
	add	jpc, jpc, #4
	ldrsb	r0, [jpc, #1]
	add	tmp2, constpool, r2, lsl #12
	ldr	tmp1, [locals, tmp1, lsl #2]
	add	tmp2, ip, lsl #4
	ldrb	ip, [jpc, #2]
#ifndef HW_NULL_PTR_CHECK
	cmp	tmp1, #0
	beq	null_ptr_exception_jpc_3
#endif
        ldr     tmp2, [tmp2, #8]
	POP	r3
	orr	ip, ip, r0, lsl #8
.abortentry102:
	ldr	tmp2, [tmp1, tmp2]
	cmp	r3, tmp2
	bgt	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iaccess_0_if_icmpgt
	iaccess_0_if_icmpgt
@-----------------------------------------------------------------------------
	.macro	iaccess_0_if_icmple	jpc_off=0, seq_len=4
	ldrb	r2, [jpc, #3]
	rsb	tmp1, r0, #opc_iaccess_0
	ldrb	ip, [jpc, #2]
	add	jpc, jpc, #4
	ldrsb	r0, [jpc, #1]
	add	tmp2, constpool, r2, lsl #12
	ldr	tmp1, [locals, tmp1, lsl #2]
	add	tmp2, ip, lsl #4
	ldrb	ip, [jpc, #2]
#ifndef HW_NULL_PTR_CHECK
	cmp	tmp1, #0
	beq	null_ptr_exception_jpc_3
#endif
        ldr     tmp2, [tmp2, #8]
	POP	r3
	orr	ip, ip, r0, lsl #8
.abortentry103:
	ldr	tmp2, [tmp1, tmp2]
	cmp	r3, tmp2
	ble	1f
	mov	ip, #3
1:
	ldrb	r0, [jpc, ip]!
	DISPATCH_BYTECODE
	.endm

	Opcode	iaccess_0_if_icmple
	iaccess_0_if_icmple
@-----------------------------------------------------------------------------
	.macro	iload_0_iconst_N_iadd	jpc_off=0, seq_len=3
        rsb     r3, r0, #opc_iload_0_iconst_N
        DISPATCH_START  \seq_len
        ldrb    r2, [jpc, #1-\seq_len]
        DISPATCH_NEXT
        ldr     r3, [locals, r3, lsl #2]
        DISPATCH_NEXT
        sub     tmp1, r2, #opc_iconst_0
        DISPATCH_NEXT
        add     r3, r3, tmp1
        DISPATCH_NEXT
        PUSH    r3
        DISPATCH_FINISH
	.endm

	Opcode	iload_0_iconst_N_iadd
	iload_0_iconst_N_iadd
@-----------------------------------------------------------------------------
	.macro	iload_0_iconst_N_isub	jpc_off=0, seq_len=3
        rsb     r3, r0, #opc_iload_0_iconst_N
        DISPATCH_START  \seq_len
        ldrb    r2, [jpc, #1-\seq_len]
        DISPATCH_NEXT
        ldr     r3, [locals, r3, lsl #2]
        DISPATCH_NEXT
        sub     tmp1, r2, #opc_iconst_0
        DISPATCH_NEXT
        sub     r3, r3, tmp1
        DISPATCH_NEXT
        PUSH    r3
        DISPATCH_FINISH
	.endm

	Opcode	iload_0_iconst_N_isub
	iload_0_iconst_N_isub
@-----------------------------------------------------------------------------
	.macro	iload_0_iconst_N_iand	jpc_off=0, seq_len=3
        rsb     r3, r0, #opc_iload_0_iconst_N
        DISPATCH_START  \seq_len
        ldrb    r2, [jpc, #1-\seq_len]
        DISPATCH_NEXT
        ldr     r3, [locals, r3, lsl #2]
        DISPATCH_NEXT
        sub     tmp1, r2, #opc_iconst_0
        DISPATCH_NEXT
        and     r3, r3, tmp1
        DISPATCH_NEXT
        PUSH    r3
        DISPATCH_FINISH
	.endm

	Opcode	iload_0_iconst_N_iand
	iload_0_iconst_N_iand
@-----------------------------------------------------------------------------
	.macro	iload_0_iconst_N_ior	jpc_off=0, seq_len=3
        rsb     r3, r0, #opc_iload_0_iconst_N
        DISPATCH_START  \seq_len
        ldrb    r2, [jpc, #1-\seq_len]
        DISPATCH_NEXT
        ldr     r3, [locals, r3, lsl #2]
        DISPATCH_NEXT
        sub     tmp1, r2, #opc_iconst_0
        DISPATCH_NEXT
        orr     r3, r3, tmp1
        DISPATCH_NEXT
        PUSH    r3
        DISPATCH_FINISH
	.endm

	Opcode	iload_0_iconst_N_ior
	iload_0_iconst_N_ior
@-----------------------------------------------------------------------------
	.macro	iload_0_iconst_N_ixor	jpc_off=0, seq_len=3
        rsb     r3, r0, #opc_iload_0_iconst_N
        DISPATCH_START  \seq_len
        ldrb    r2, [jpc, #1-\seq_len]
        DISPATCH_NEXT
        ldr     r3, [locals, r3, lsl #2]
        DISPATCH_NEXT
        sub     tmp1, r2, #opc_iconst_0
        DISPATCH_NEXT
        eor     r3, r3, tmp1
        DISPATCH_NEXT
        PUSH    r3
        DISPATCH_FINISH
	.endm

	Opcode	iload_0_iconst_N_ixor
	iload_0_iconst_N_ixor
@-----------------------------------------------------------------------------
	.macro	iload_iconst_N_iadd	jpc_off=0, seq_len=4
        ldrb    r3, [jpc, #2]
        rsb     r2, r2, #0
        DISPATCH_START  \seq_len
        DISPATCH_NEXT
        ldr     r2, [locals, r2, lsl #2]
        sub     r3, r3, #opc_iconst_0
        DISPATCH_NEXT
        add     r3, r2, r3
        DISPATCH_NEXT
        DISPATCH_NEXT
        PUSH    r3
        DISPATCH_FINISH
	.endm

	Opcode	iload_iconst_N_iadd
	iload_iconst_N_iadd
@-----------------------------------------------------------------------------
	.macro	iload_iconst_N_isub	jpc_off=0, seq_len=4
        ldrb    r3, [jpc, #2]
        rsb     r2, r2, #0
        DISPATCH_START  \seq_len
        DISPATCH_NEXT
        ldr     r2, [locals, r2, lsl #2]
        sub     r3, r3, #opc_iconst_0
        DISPATCH_NEXT
        sub     r3, r2, r3
        DISPATCH_NEXT
        DISPATCH_NEXT
        PUSH    r3
        DISPATCH_FINISH
	.endm

	Opcode	iload_iconst_N_isub
	iload_iconst_N_isub
@-----------------------------------------------------------------------------
	.macro	iload_iconst_N_iand	jpc_off=0, seq_len=4
        ldrb    r3, [jpc, #2]
        rsb     r2, r2, #0
        DISPATCH_START  \seq_len
        DISPATCH_NEXT
        ldr     r2, [locals, r2, lsl #2]
        sub     r3, r3, #opc_iconst_0
        DISPATCH_NEXT
        and     r3, r2, r3
        DISPATCH_NEXT
        DISPATCH_NEXT
        PUSH    r3
        DISPATCH_FINISH
	.endm

	Opcode	iload_iconst_N_iand
	iload_iconst_N_iand
@-----------------------------------------------------------------------------
	.macro	iload_iconst_N_ior	jpc_off=0, seq_len=4
        ldrb    r3, [jpc, #2]
        rsb     r2, r2, #0
        DISPATCH_START  \seq_len
        DISPATCH_NEXT
        ldr     r2, [locals, r2, lsl #2]
        sub     r3, r3, #opc_iconst_0
        DISPATCH_NEXT
        orr     r3, r2, r3
        DISPATCH_NEXT
        DISPATCH_NEXT
        PUSH    r3
        DISPATCH_FINISH
	.endm

	Opcode	iload_iconst_N_ior
	iload_iconst_N_ior
@-----------------------------------------------------------------------------
	.macro	iload_iconst_N_ixor	jpc_off=0, seq_len=4
        ldrb    r3, [jpc, #2]
        rsb     r2, r2, #0
        DISPATCH_START  \seq_len
        DISPATCH_NEXT
        ldr     r2, [locals, r2, lsl #2]
        sub     r3, r3, #opc_iconst_0
        DISPATCH_NEXT
        eor     r3, r2, r3
        DISPATCH_NEXT
        DISPATCH_NEXT
        PUSH    r3
        DISPATCH_FINISH
	.endm

	Opcode	iload_iconst_N_ixor
	iload_iconst_N_ixor
@-----------------------------------------------------------------------------
	.macro	iload_0_iconst_N_iadd_u4store	jpc_off=0, seq_len=5
        rsb     r3, r0, #opc_iload_0_iconst_N
        DISPATCH_START  \seq_len
	sub	r2, r2, #opc_iconst_0
	DISPATCH_NEXT
        ldrb    tmp1, [jpc, #-1]
        ldr     r3, [locals, r3, lsl #2]
	DISPATCH_NEXT
        add     r3, r3, r2
	DISPATCH_NEXT
	rsb	tmp1, tmp1, #0
	DISPATCH_NEXT
        str     r3, [locals, tmp1, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	iload_0_iconst_N_iadd_u4store
	iload_0_iconst_N_iadd_u4store
@-----------------------------------------------------------------------------
	.macro	iload_iconst_N_iadd_u4store	jpc_off=0, seq_len=6
	ldrb	r3, [jpc, #2]
        ldrb    lr, [jpc, #5]
        rsb     r2, r2, #0
        DISPATCH_START  \seq_len
	sub	r3, r3, #opc_iconst_0
	DISPATCH_NEXT
        rsb     tmp2, lr, #0
	DISPATCH_NEXT
        ldr     tmp1, [locals, r2, lsl #2]
	DISPATCH_NEXT
        add     r3, tmp1, r3
	DISPATCH_NEXT
        str     r3, [locals, tmp2, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	iload_iconst_N_iadd_u4store
	iload_iconst_N_iadd_u4store
@-----------------------------------------------------------------------------
	.macro	iload_0_iconst_N_iadd_istore_N	jpc_off=0, seq_len=4
        rsb     r3, r0, #opc_iload_0_iconst_N
        DISPATCH_START  \seq_len
	sub	r2, r2, #opc_iconst_0
	DISPATCH_NEXT
        ldrb    tmp1, [jpc, #-1]
        ldr     r3, [locals, r3, lsl #2]
	DISPATCH_NEXT
        add     r3, r3, r2
	DISPATCH_NEXT
	rsb	tmp1, tmp1, #opc_istore_0
	DISPATCH_NEXT
        str     r3, [locals, tmp1, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	iload_0_iconst_N_iadd_istore_N
	iload_0_iconst_N_iadd_istore_N
@-----------------------------------------------------------------------------
	.macro	iload_iconst_N_iadd_istore_N	jpc_off=0, seq_len=5
	ldrb	r3, [jpc, #2]
        ldrb    lr, [jpc, #4]
        rsb     r2, r2, #0
        DISPATCH_START  \seq_len
	sub	r3, r3, #opc_iconst_0
	DISPATCH_NEXT
        rsb     tmp2, lr, #opc_istore_0
	DISPATCH_NEXT
        ldr     tmp1, [locals, r2, lsl #2]
	DISPATCH_NEXT
        add     r3, tmp1, r3
	DISPATCH_NEXT
        str     r3, [locals, tmp2, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	iload_iconst_N_iadd_istore_N
	iload_iconst_N_iadd_istore_N
@-----------------------------------------------------------------------------
	.macro	iload_0_iconst_N_isub_u4store	jpc_off=0, seq_len=5
        rsb     r3, r0, #opc_iload_0_iconst_N
        DISPATCH_START  \seq_len
	sub	r2, r2, #opc_iconst_0
	DISPATCH_NEXT
        ldrb    tmp1, [jpc, #-1]
        ldr     r3, [locals, r3, lsl #2]
	DISPATCH_NEXT
        sub     r3, r3, r2
	DISPATCH_NEXT
	rsb	tmp1, tmp1, #0
	DISPATCH_NEXT
        str     r3, [locals, tmp1, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	iload_0_iconst_N_isub_u4store
	iload_0_iconst_N_isub_u4store
@-----------------------------------------------------------------------------
	.macro	iload_iconst_N_isub_u4store	jpc_off=0, seq_len=6
	ldrb	r3, [jpc, #2]
        ldrb    lr, [jpc, #5]
        rsb     r2, r2, #0
        DISPATCH_START  \seq_len
	sub	r3, r3, #opc_iconst_0
	DISPATCH_NEXT
        rsb     tmp2, lr, #0
	DISPATCH_NEXT
        ldr     tmp1, [locals, r2, lsl #2]
	DISPATCH_NEXT
        sub     r3, tmp1, r3
	DISPATCH_NEXT
        str     r3, [locals, tmp2, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	iload_iconst_N_isub_u4store
	iload_iconst_N_isub_u4store
@-----------------------------------------------------------------------------
	.macro	iload_0_iconst_N_isub_istore_N	jpc_off=0, seq_len=4
        rsb     r3, r0, #opc_iload_0_iconst_N
        DISPATCH_START  \seq_len
	sub	r2, r2, #opc_iconst_0
	DISPATCH_NEXT
        ldrb    tmp1, [jpc, #-1]
        ldr     r3, [locals, r3, lsl #2]
	DISPATCH_NEXT
        sub     r3, r3, r2
	DISPATCH_NEXT
	rsb	tmp1, tmp1, #opc_istore_0
	DISPATCH_NEXT
        str     r3, [locals, tmp1, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	iload_0_iconst_N_isub_istore_N
	iload_0_iconst_N_isub_istore_N
@-----------------------------------------------------------------------------
	.macro	iload_iconst_N_isub_istore_N	jpc_off=0, seq_len=5
	ldrb	r3, [jpc, #2]
        ldrb    lr, [jpc, #4]
        rsb     r2, r2, #0
        DISPATCH_START  \seq_len
	sub	r3, r3, #opc_iconst_0
	DISPATCH_NEXT
        rsb     tmp2, lr, #opc_istore_0
	DISPATCH_NEXT
        ldr     tmp1, [locals, r2, lsl #2]
	DISPATCH_NEXT
        sub     r3, tmp1, r3
	DISPATCH_NEXT
        str     r3, [locals, tmp2, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	iload_iconst_N_isub_istore_N
	iload_iconst_N_isub_istore_N
@-----------------------------------------------------------------------------
	.macro	iload_0_iconst_N_iand_u4store	jpc_off=0, seq_len=5
        rsb     r3, r0, #opc_iload_0_iconst_N
        DISPATCH_START  \seq_len
	sub	r2, r2, #opc_iconst_0
	DISPATCH_NEXT
        ldrb    tmp1, [jpc, #-1]
        ldr     r3, [locals, r3, lsl #2]
	DISPATCH_NEXT
        and     r3, r3, r2
	DISPATCH_NEXT
	rsb	tmp1, tmp1, #0
	DISPATCH_NEXT
        str     r3, [locals, tmp1, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	iload_0_iconst_N_iand_u4store
	iload_0_iconst_N_iand_u4store
@-----------------------------------------------------------------------------
	.macro	iload_iconst_N_iand_u4store	jpc_off=0, seq_len=6
	ldrb	r3, [jpc, #2]
        ldrb    lr, [jpc, #5]
        rsb     r2, r2, #0
        DISPATCH_START  \seq_len
	sub	r3, r3, #opc_iconst_0
	DISPATCH_NEXT
        rsb     tmp2, lr, #0
	DISPATCH_NEXT
        ldr     tmp1, [locals, r2, lsl #2]
	DISPATCH_NEXT
        and     r3, tmp1, r3
	DISPATCH_NEXT
        str     r3, [locals, tmp2, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	iload_iconst_N_iand_u4store
	iload_iconst_N_iand_u4store
@-----------------------------------------------------------------------------
	.macro	iload_0_iconst_N_iand_istore_N	jpc_off=0, seq_len=4
        rsb     r3, r0, #opc_iload_0_iconst_N
        DISPATCH_START  \seq_len
	sub	r2, r2, #opc_iconst_0
	DISPATCH_NEXT
        ldrb    tmp1, [jpc, #-1]
        ldr     r3, [locals, r3, lsl #2]
	DISPATCH_NEXT
        and     r3, r3, r2
	DISPATCH_NEXT
	rsb	tmp1, tmp1, #opc_istore_0
	DISPATCH_NEXT
        str     r3, [locals, tmp1, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	iload_0_iconst_N_iand_istore_N
	iload_0_iconst_N_iand_istore_N
@-----------------------------------------------------------------------------
	.macro	iload_iconst_N_iand_istore_N	jpc_off=0, seq_len=5
	ldrb	r3, [jpc, #2]
        ldrb    lr, [jpc, #4]
        rsb     r2, r2, #0
        DISPATCH_START  \seq_len
	sub	r3, r3, #opc_iconst_0
	DISPATCH_NEXT
        rsb     tmp2, lr, #opc_istore_0
	DISPATCH_NEXT
        ldr     tmp1, [locals, r2, lsl #2]
	DISPATCH_NEXT
        and     r3, tmp1, r3
	DISPATCH_NEXT
        str     r3, [locals, tmp2, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	iload_iconst_N_iand_istore_N
	iload_iconst_N_iand_istore_N
@-----------------------------------------------------------------------------
	.macro	iload_0_iconst_N_ior_u4store	jpc_off=0, seq_len=5
        rsb     r3, r0, #opc_iload_0_iconst_N
        DISPATCH_START  \seq_len
	sub	r2, r2, #opc_iconst_0
	DISPATCH_NEXT
        ldrb    tmp1, [jpc, #-1]
        ldr     r3, [locals, r3, lsl #2]
	DISPATCH_NEXT
        orr     r3, r3, r2
	DISPATCH_NEXT
	rsb	tmp1, tmp1, #0
	DISPATCH_NEXT
        str     r3, [locals, tmp1, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	iload_0_iconst_N_ior_u4store
	iload_0_iconst_N_ior_u4store
@-----------------------------------------------------------------------------
	.macro	iload_iconst_N_ior_u4store	jpc_off=0, seq_len=6
	ldrb	r3, [jpc, #2]
        ldrb    lr, [jpc, #5]
        rsb     r2, r2, #0
        DISPATCH_START  \seq_len
	sub	r3, r3, #opc_iconst_0
	DISPATCH_NEXT
        rsb     tmp2, lr, #0
	DISPATCH_NEXT
        ldr     tmp1, [locals, r2, lsl #2]
	DISPATCH_NEXT
        orr     r3, tmp1, r3
	DISPATCH_NEXT
        str     r3, [locals, tmp2, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	iload_iconst_N_ior_u4store
	iload_iconst_N_ior_u4store
@-----------------------------------------------------------------------------
	.macro	iload_0_iconst_N_ior_istore_N	jpc_off=0, seq_len=4
        rsb     r3, r0, #opc_iload_0_iconst_N
        DISPATCH_START  \seq_len
	sub	r2, r2, #opc_iconst_0
	DISPATCH_NEXT
        ldrb    tmp1, [jpc, #-1]
        ldr     r3, [locals, r3, lsl #2]
	DISPATCH_NEXT
        orr     r3, r3, r2
	DISPATCH_NEXT
	rsb	tmp1, tmp1, #opc_istore_0
	DISPATCH_NEXT
        str     r3, [locals, tmp1, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	iload_0_iconst_N_ior_istore_N
	iload_0_iconst_N_ior_istore_N
@-----------------------------------------------------------------------------
	.macro	iload_iconst_N_ior_istore_N	jpc_off=0, seq_len=5
	ldrb	r3, [jpc, #2]
        ldrb    lr, [jpc, #4]
        rsb     r2, r2, #0
        DISPATCH_START  \seq_len
	sub	r3, r3, #opc_iconst_0
	DISPATCH_NEXT
        rsb     tmp2, lr, #opc_istore_0
	DISPATCH_NEXT
        ldr     tmp1, [locals, r2, lsl #2]
	DISPATCH_NEXT
        orr     r3, tmp1, r3
	DISPATCH_NEXT
        str     r3, [locals, tmp2, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	iload_iconst_N_ior_istore_N
	iload_iconst_N_ior_istore_N
@-----------------------------------------------------------------------------
	.macro	iload_0_iconst_N_ixor_u4store	jpc_off=0, seq_len=5
        rsb     r3, r0, #opc_iload_0_iconst_N
        DISPATCH_START  \seq_len
	sub	r2, r2, #opc_iconst_0
	DISPATCH_NEXT
        ldrb    tmp1, [jpc, #-1]
        ldr     r3, [locals, r3, lsl #2]
	DISPATCH_NEXT
        eor     r3, r3, r2
	DISPATCH_NEXT
	rsb	tmp1, tmp1, #0
	DISPATCH_NEXT
        str     r3, [locals, tmp1, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	iload_0_iconst_N_ixor_u4store
	iload_0_iconst_N_ixor_u4store
@-----------------------------------------------------------------------------
	.macro	iload_iconst_N_ixor_u4store	jpc_off=0, seq_len=6
	ldrb	r3, [jpc, #2]
        ldrb    lr, [jpc, #5]
        rsb     r2, r2, #0
        DISPATCH_START  \seq_len
	sub	r3, r3, #opc_iconst_0
	DISPATCH_NEXT
        rsb     tmp2, lr, #0
	DISPATCH_NEXT
        ldr     tmp1, [locals, r2, lsl #2]
	DISPATCH_NEXT
        eor     r3, tmp1, r3
	DISPATCH_NEXT
        str     r3, [locals, tmp2, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	iload_iconst_N_ixor_u4store
	iload_iconst_N_ixor_u4store
@-----------------------------------------------------------------------------
	.macro	iload_0_iconst_N_ixor_istore_N	jpc_off=0, seq_len=4
        rsb     r3, r0, #opc_iload_0_iconst_N
        DISPATCH_START  \seq_len
	sub	r2, r2, #opc_iconst_0
	DISPATCH_NEXT
        ldrb    tmp1, [jpc, #-1]
        ldr     r3, [locals, r3, lsl #2]
	DISPATCH_NEXT
        eor     r3, r3, r2
	DISPATCH_NEXT
	rsb	tmp1, tmp1, #opc_istore_0
	DISPATCH_NEXT
        str     r3, [locals, tmp1, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	iload_0_iconst_N_ixor_istore_N
	iload_0_iconst_N_ixor_istore_N
@-----------------------------------------------------------------------------
	.macro	iload_iconst_N_ixor_istore_N	jpc_off=0, seq_len=5
	ldrb	r3, [jpc, #2]
        ldrb    lr, [jpc, #4]
        rsb     r2, r2, #0
        DISPATCH_START  \seq_len
	sub	r3, r3, #opc_iconst_0
	DISPATCH_NEXT
        rsb     tmp2, lr, #opc_istore_0
	DISPATCH_NEXT
        ldr     tmp1, [locals, r2, lsl #2]
	DISPATCH_NEXT
        eor     r3, tmp1, r3
	DISPATCH_NEXT
        str     r3, [locals, tmp2, lsl #2]
	DISPATCH_FINISH
	.endm

	Opcode	iload_iconst_N_ixor_istore_N
	iload_iconst_N_ixor_istore_N
	.macro	MAIN_DISPATCH_TABLE
	.word	do_nop
	.word	do_u4const_0
	.word	dispatch_iconst_m1+1
	.word	dispatch_iconst_0+1
	.word	dispatch_iconst_1+1
	.word	dispatch_iconst_2+1
	.word	dispatch_iconst_3+1
	.word	dispatch_iconst_4+1
	.word	dispatch_iconst_5+1
	.word	do_u8const_0
	.word	do_lconst_1
	.word	do_u4const_0
	.word	do_fconst_1
	.word	do_fconst_2
	.word	do_u8const_0
	.word	do_dconst_1
	.word	do_bipush
	.word	do_sipush
	.word	do_ldc
	.word	do_ldc_w
	.word	do_ldc2_w
	.word	dispatch_iload+2
	.word	do_u8load
	.word	dispatch_fload+2
	.word	do_u8load
	.word	dispatch_aload+2
	.word	dispatch_iload_0+1
	.word	dispatch_iload_1+1
	.word	dispatch_iload_2+1
	.word	dispatch_iload_3+1
	.word	do_u8load_0
	.word	do_u8load_1
	.word	do_u8load_2
	.word	do_u8load_3
	.word	do_fload_0
	.word	do_fload_0
	.word	do_fload_0
	.word	do_fload_0
	.word	do_u8load_0
	.word	do_u8load_1
	.word	do_u8load_2
	.word	do_u8load_3
	.word	dispatch_aload_0+1
	.word	dispatch_aload_1+1
	.word	dispatch_aload_2+1
	.word	dispatch_aload_3+1
	.word	dispatch_iaload+1
	.word	do_u8aload
	.word	dispatch_faload+1
	.word	do_u8aload
	.word	dispatch_aaload+1
	.word	do_baload
	.word	do_caload
	.word	do_saload
	.word	do_u4store
	.word	do_u8store
	.word	do_u4store
	.word	do_u8store
	.word	do_u4store
	.word	do_u4store_0
	.word	do_u4store_1
	.word	do_u4store_2
	.word	do_u4store_3
	.word	do_u8store_0
	.word	do_u8store_1
	.word	do_u8store_2
	.word	do_u8store_3
	.word	do_u4store_0
	.word	do_u4store_1
	.word	do_u4store_2
	.word	do_u4store_3
	.word	do_u8store_0
	.word	do_u8store_1
	.word	do_u8store_2
	.word	do_u8store_3
	.word	do_u4store_0
	.word	do_u4store_1
	.word	do_u4store_2
	.word	do_u4store_3
	.word	do_u4astore
	.word	do_u8astore
	.word	do_u4astore
	.word	do_u8astore
	.word	do_aastore
	.word	do_bastore
	.word	do_u2astore
	.word	do_u2astore
	.word	do_jpop
	.word	do_jpop2
	.word	do_dup
	.word	do_dup_x1
	.word	do_dup_x2
	.word	do_dup2
	.word	do_dup2_x1
	.word	do_dup2_x2
	.word	do_swap
	.word	dispatch_iadd+1
	.word	do_ladd
	.word	do_fadd
	.word	do_dadd
	.word	dispatch_isub+1
	.word	do_lsub
	.word	do_fsub
	.word	do_dsub
	.word	do_imul
	.word	do_lmul
	.word	do_fmul
	.word	do_dmul
	.word	do_idiv
	.word	do_ldiv
	.word	do_fdiv
	.word	do_ddiv
	.word	do_irem
	.word	do_lrem
	.word	do_frem
	.word	do_drem
	.word	do_ineg
	.word	do_lneg
	.word	do_fneg
	.word	do_dneg
	.word	do_ishl
	.word	do_lshl
	.word	do_ishr
	.word	do_lshr
	.word	do_iushr
	.word	do_lushr
	.word	dispatch_iand+1
	.word	do_land
	.word	dispatch_ior+1
	.word	do_lor
	.word	dispatch_ixor+1
	.word	do_lxor
	.word	dispatch_iinc+3
	.word	do_i2l
	.word	do_i2f
	.word	do_i2d
	.word	do_l2i
	.word	do_l2f
	.word	do_l2d
	.word	do_f2i
	.word	do_f2l
	.word	do_f2d
	.word	do_d2i
	.word	do_d2l
	.word	do_d2f
	.word	do_i2b
	.word	do_i2c
	.word	do_i2s
	.word	do_lcmp
	.word	do_fcmpl
	.word	do_fcmpg
	.word	do_dcmpl
	.word	do_dcmpg
	.word	do_ifeq_unsafe
	.word	do_ifne_unsafe
	.word	do_iflt_unsafe
	.word	do_ifge_unsafe
	.word	do_ifgt_unsafe
	.word	do_ifle_unsafe
	.word	do_if_icmpeq_unsafe
	.word	do_if_icmpne_unsafe
	.word	do_if_icmplt_unsafe
	.word	do_if_icmpge_unsafe
	.word	do_if_icmpgt_unsafe
	.word	do_if_icmple_unsafe
	.word	do_if_icmpeq_unsafe
	.word	do_if_icmpne_unsafe
	.word	do_goto_unsafe
	.word	do_jsr
	.word	do_ret
	.word	do_tableswitch
	.word	do_lookupswitch
	.word	do_ireturn_unsafe
	.word	do_lreturn_unsafe
	.word	do_ireturn_unsafe
	.word	do_lreturn_unsafe
	.word	do_ireturn_unsafe
	.word	do_return_unsafe
	.word	do_getstatic
	.word	do_putstatic
	.word	do_getfield
	.word	do_putfield
	.word	do_invokevirtual
	.word	do_invokespecial
	.word	do_invokestatic
	.word	do_invokeinterface
	.word	do_undefined
	.word	do_new
	.word	do_newarray
	.word	do_anewarray
	.word	do_arraylength
	.word	do_athrow
	.word	do_checkcast
	.word	do_instanceof
	.word	do_monitorenter
	.word	do_monitorexit
	.word	do_wide
	.word	do_multianewarray
	.word	do_ifeq_unsafe
	.word	do_ifne_unsafe
	.word	do_goto_w
	.word	do_jsr_w
	.word	do_breakpoint
	.word	do_undefined
	.word	do_bgetfield
	.word	do_cgetfield
	.word	do_undefined
	.word	do_undefined
	.word	do_igetfield
	.word	do_lgetfield
	.word	do_sgetfield
	.word	do_aputfield
	.word	do_bputfield
	.word	do_cputfield
	.word	do_undefined
	.word	do_undefined
	.word	do_iputfield
	.word	do_lputfield
	.word	do_undefined
	.word	dispatch_iaccess_0+4
	.word	dispatch_iaccess_1+4
	.word	dispatch_iaccess_2+4
	.word	dispatch_iaccess_3+4
	.word	do_undefined
	.word	do_undefined
	.word	do_undefined
	.word	do_invokevfinal
	.word	do_undefined
	.word	do_undefined
	.word	do_return_register_finalizer
	.word	do_undefined
	.word	dispatch_iload_0_iconst_N+2
	.word	dispatch_iload_1_iconst_N+2
	.word	dispatch_iload_2_iconst_N+2
	.word	dispatch_iload_3_iconst_N+2
	.word	dispatch_iload_iconst_N+3
	.word	do_invokeresolved
	.word	do_iadd_istore_N
	.word	do_isub_istore_N
	.word	do_iand_istore_N
	.word	do_ior_istore_N
	.word	do_ixor_istore_N
	.word	do_iadd_u4store
	.word	do_isub_u4store
	.word	do_iand_u4store
	.word	do_ior_u4store
	.word	do_ixor_u4store
	.word	do_invokespecialresolved
	.word	do_invokestaticresolved
	.word	do_undefined
	.word	do_undefined
	.word	do_undefined
	.word	do_undefined
	.word	do_undefined
	.word	do_undefined
	.word	do_undefined
	.endm
	.macro	SUB_DISPATCH_TABLES
dispatch_iconst_m1:
dispatch_iconst_0:
dispatch_iconst_1:
dispatch_iconst_2:
dispatch_iconst_3:
dispatch_iconst_4:
dispatch_iconst_5:
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_m1_astore
	.word	do_iconst_N
	.word	do_iconst_m1_astore
	.word	do_iconst_N
	.word	do_iconst_m1_astore
	.word	do_iconst_m1_istore_0
	.word	do_iconst_m1_istore_0
	.word	do_iconst_m1_istore_0
	.word	do_iconst_m1_istore_0
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_m1_iadd
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_m1_isub
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_m1_idiv
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_m1_ishl
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_m1_if_icmpeq
	.word	do_iconst_m1_if_icmpne
	.word	do_iconst_m1_if_icmplt
	.word	do_iconst_m1_if_icmpge
	.word	do_iconst_m1_if_icmpgt
	.word	do_iconst_m1_if_icmple
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_m1_ireturn
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_m1_invokevfinal
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_m1_invokeresolved
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_m1_invokespecialresolved
	.word	do_iconst_m1_invokestaticresolved
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
dispatch_iload:
dispatch_fload:
dispatch_aload:
	.word	do_u4load
	.word	do_u4load
	.word	do_iload_iconst_m1
	.word	do_iload_iconst_m1
	.word	do_iload_iconst_m1
	.word	do_iload_iconst_m1
	.word	do_iload_iconst_m1
	.word	do_iload_iconst_m1
	.word	do_iload_iconst_m1
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_iload_bipush
	.word	do_iload_sipush
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_iload_iload
	.word	do_u4load
	.word	do_iload_iload
	.word	do_u4load
	.word	do_iload_iload
	.word	do_iload_iload_0
	.word	do_iload_iload_0
	.word	do_iload_iload_0
	.word	do_iload_iload_0
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_iload_aload_0
	.word	do_iload_aload_0
	.word	do_iload_aload_0
	.word	do_iload_aload_0
	.word	do_iload_iaload
	.word	do_u4load
	.word	do_iload_iaload
	.word	do_u4load
	.word	do_iload_iaload
	.word	do_iload_baload
	.word	do_iload_caload
	.word	do_iload_saload
	.word	do_iload_astore
	.word	do_u4load
	.word	do_iload_astore
	.word	do_u4load
	.word	do_iload_astore
	.word	do_iload_istore_0
	.word	do_iload_istore_0
	.word	do_iload_istore_0
	.word	do_iload_istore_0
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_iload_astore_0
	.word	do_iload_astore_0
	.word	do_iload_astore_0
	.word	do_iload_astore_0
	.word	do_iload_iastore
	.word	do_u4load
	.word	do_iload_iastore
	.word	do_u4load
	.word	do_u4load
	.word	do_iload_bastore
	.word	do_iload_castore
	.word	do_iload_castore
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_iload_iadd
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_iload_isub
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_iload_imul
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_iload_idiv
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_iload_irem
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_iload_ineg
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_iload_ishl
	.word	do_u4load
	.word	do_iload_ishr
	.word	do_u4load
	.word	do_iload_iushr
	.word	do_u4load
	.word	do_iload_iand
	.word	do_u4load
	.word	do_iload_ior
	.word	do_u4load
	.word	do_iload_ixor
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_iload_i2c
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_iload_ifeq
	.word	do_iload_ifne
	.word	do_iload_iflt
	.word	do_iload_ifge
	.word	do_iload_ifgt
	.word	do_iload_ifle
	.word	do_iload_if_icmpeq
	.word	do_iload_if_icmpne
	.word	do_iload_if_icmplt
	.word	do_iload_if_icmpge
	.word	do_iload_if_icmpgt
	.word	do_iload_if_icmple
	.word	do_iload_if_icmpeq
	.word	do_iload_if_icmpne
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_iload_ireturn
	.word	do_u4load
	.word	do_iload_ireturn
	.word	do_u4load
	.word	do_iload_ireturn
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_iload_invokeinterface
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_iload_ifeq
	.word	do_iload_ifne
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_iload_igetfield
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_iload_invokevfinal
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_iload_invokeresolved
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_iload_invokespecialresolved
	.word	do_iload_invokestaticresolved
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
	.word	do_u4load
dispatch_iload_0:
dispatch_iload_1:
dispatch_iload_2:
dispatch_iload_3:
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0_iconst_m1
	.word	do_iload_0_iconst_m1
	.word	do_iload_0_iconst_m1
	.word	do_iload_0_iconst_m1
	.word	do_iload_0_iconst_m1
	.word	do_iload_0_iconst_m1
	.word	do_iload_0_iconst_m1
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0_bipush
	.word	do_iload_0_sipush
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0_iload
	.word	do_iload_0
	.word	do_iload_0_iload
	.word	do_iload_0
	.word	do_iload_0_iload
	.word	do_iload_0_iload_0
	.word	do_iload_0_iload_0
	.word	do_iload_0_iload_0
	.word	do_iload_0_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0_aload_0
	.word	do_iload_0_aload_0
	.word	do_iload_0_aload_0
	.word	do_iload_0_aload_0
	.word	do_iload_0_iaload
	.word	do_iload_0
	.word	do_iload_0_iaload
	.word	do_iload_0
	.word	do_iload_0_iaload
	.word	do_iload_0_baload
	.word	do_iload_0_caload
	.word	do_iload_0_saload
	.word	do_iload_0_astore
	.word	do_iload_0
	.word	do_iload_0_astore
	.word	do_iload_0
	.word	do_iload_0_astore
	.word	do_iload_0_istore_0
	.word	do_iload_0_istore_0
	.word	do_iload_0_istore_0
	.word	do_iload_0_istore_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0_iastore
	.word	do_iload_0
	.word	do_iload_0_iastore
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0_bastore
	.word	do_iload_0_castore
	.word	do_iload_0_castore
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0_iadd
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0_isub
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0_imul
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0_idiv
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0_irem
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0_ineg
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0_ishl
	.word	do_iload_0
	.word	do_iload_0_ishr
	.word	do_iload_0
	.word	do_iload_0_iushr
	.word	do_iload_0
	.word	do_iload_0_iand
	.word	do_iload_0
	.word	do_iload_0_ior
	.word	do_iload_0
	.word	do_iload_0_ixor
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0_i2c
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0_ifeq
	.word	do_iload_0_ifne
	.word	do_iload_0_iflt
	.word	do_iload_0_ifge
	.word	do_iload_0_ifgt
	.word	do_iload_0_ifle
	.word	do_iload_0_if_icmpeq
	.word	do_iload_0_if_icmpne
	.word	do_iload_0_if_icmplt
	.word	do_iload_0_if_icmpge
	.word	do_iload_0_if_icmpgt
	.word	do_iload_0_if_icmple
	.word	do_iload_0_if_icmpeq
	.word	do_iload_0_if_icmpne
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0_ireturn
	.word	do_iload_0
	.word	do_iload_0_ireturn
	.word	do_iload_0
	.word	do_iload_0_ireturn
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0_invokeinterface
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0_ifeq
	.word	do_iload_0_ifne
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0_invokevfinal
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0_invokeresolved
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0_invokespecialresolved
	.word	do_iload_0_invokestaticresolved
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
dispatch_aload_0:
dispatch_aload_1:
dispatch_aload_2:
dispatch_aload_3:
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0_iconst_m1
	.word	do_aload_0_iconst_m1
	.word	do_aload_0_iconst_m1
	.word	do_aload_0_iconst_m1
	.word	do_aload_0_iconst_m1
	.word	do_aload_0_iconst_m1
	.word	do_aload_0_iconst_m1
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0_bipush
	.word	do_aload_0_sipush
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0_iload
	.word	do_aload_0
	.word	do_aload_0_iload
	.word	do_aload_0
	.word	do_aload_0_iload
	.word	do_aload_0_iload_0
	.word	do_aload_0_iload_0
	.word	do_aload_0_iload_0
	.word	do_aload_0_iload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0_aload_0
	.word	do_aload_0_aload_0
	.word	do_aload_0_aload_0
	.word	do_aload_0_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0_astore
	.word	do_aload_0
	.word	do_aload_0_astore
	.word	do_aload_0
	.word	do_aload_0_astore
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0_astore_0
	.word	do_aload_0_astore_0
	.word	do_aload_0_astore_0
	.word	do_aload_0_astore_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0_invokeinterface
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0_igetfield
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0_invokevfinal
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0_invokeresolved
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0_invokespecialresolved
	.word	do_aload_0_invokestaticresolved
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
dispatch_iaload:
dispatch_faload:
dispatch_aaload:
	.word	do_u4aload
	.word	do_u4aload
	.word	do_iaload_iconst_m1
	.word	do_iaload_iconst_m1
	.word	do_iaload_iconst_m1
	.word	do_iaload_iconst_m1
	.word	do_iaload_iconst_m1
	.word	do_iaload_iconst_m1
	.word	do_iaload_iconst_m1
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_iaload_bipush
	.word	do_iaload_sipush
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_iaload_iload
	.word	do_u4aload
	.word	do_iaload_iload
	.word	do_u4aload
	.word	do_iaload_iload
	.word	do_iaload_iload_0
	.word	do_iaload_iload_0
	.word	do_iaload_iload_0
	.word	do_iaload_iload_0
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_iaload_aload_0
	.word	do_iaload_aload_0
	.word	do_iaload_aload_0
	.word	do_iaload_aload_0
	.word	do_iaload_iaload
	.word	do_u4aload
	.word	do_iaload_iaload
	.word	do_u4aload
	.word	do_iaload_iaload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_iaload_astore
	.word	do_u4aload
	.word	do_iaload_astore
	.word	do_u4aload
	.word	do_iaload_astore
	.word	do_iaload_istore_0
	.word	do_iaload_istore_0
	.word	do_iaload_istore_0
	.word	do_iaload_istore_0
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_iaload_iastore
	.word	do_u4aload
	.word	do_iaload_iastore
	.word	do_u4aload
	.word	do_u4aload
	.word	do_iaload_bastore
	.word	do_iaload_castore
	.word	do_iaload_castore
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_iaload_iand
	.word	do_u4aload
	.word	do_iaload_ior
	.word	do_u4aload
	.word	do_iaload_ixor
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_iaload_ifeq
	.word	do_iaload_ifne
	.word	do_iaload_iflt
	.word	do_iaload_ifge
	.word	do_iaload_ifgt
	.word	do_iaload_ifle
	.word	do_iaload_if_icmpeq
	.word	do_iaload_if_icmpne
	.word	do_iaload_if_icmplt
	.word	do_iaload_if_icmpge
	.word	do_iaload_if_icmpgt
	.word	do_iaload_if_icmple
	.word	do_iaload_if_icmpeq
	.word	do_iaload_if_icmpne
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_iaload_ifeq
	.word	do_iaload_ifne
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
	.word	do_u4aload
dispatch_iadd:
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd_iload
	.word	do_iadd
	.word	do_iadd_iload
	.word	do_iadd
	.word	do_iadd_iload
	.word	do_iadd_iload_0
	.word	do_iadd_iload_0
	.word	do_iadd_iload_0
	.word	do_iadd_iload_0
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd_iaload
	.word	do_iadd
	.word	do_iadd_iaload
	.word	do_iadd
	.word	do_iadd_iaload
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd_istore
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd_istore_0
	.word	do_iadd_istore_0
	.word	do_iadd_istore_0
	.word	do_iadd_istore_0
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd_iastore
	.word	do_iadd
	.word	do_iadd_iastore
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd_isub
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd_iinc
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd_ifeq
	.word	do_iadd_ifne
	.word	do_iadd_iflt
	.word	do_iadd_ifge
	.word	do_iadd_ifgt
	.word	do_iadd_ifle
	.word	do_iadd_if_icmpeq
	.word	do_iadd_if_icmpne
	.word	do_iadd_if_icmplt
	.word	do_iadd_if_icmpge
	.word	do_iadd_if_icmpgt
	.word	do_iadd_if_icmple
	.word	do_iadd_if_icmpeq
	.word	do_iadd_if_icmpne
	.word	do_iadd_goto
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd_ireturn
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd_ifeq
	.word	do_iadd_ifne
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
	.word	do_iadd
dispatch_isub:
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub_iload
	.word	do_isub
	.word	do_isub_iload
	.word	do_isub
	.word	do_isub_iload
	.word	do_isub_iload_0
	.word	do_isub_iload_0
	.word	do_isub_iload_0
	.word	do_isub_iload_0
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub_iaload
	.word	do_isub
	.word	do_isub_iaload
	.word	do_isub
	.word	do_isub_iaload
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub_istore
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub_istore_0
	.word	do_isub_istore_0
	.word	do_isub_istore_0
	.word	do_isub_istore_0
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub_iastore
	.word	do_isub
	.word	do_isub_iastore
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub_iadd
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub_iinc
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub_ifeq
	.word	do_isub_ifne
	.word	do_isub_iflt
	.word	do_isub_ifge
	.word	do_isub_ifgt
	.word	do_isub_ifle
	.word	do_isub_if_icmpeq
	.word	do_isub_if_icmpne
	.word	do_isub_if_icmplt
	.word	do_isub_if_icmpge
	.word	do_isub_if_icmpgt
	.word	do_isub_if_icmple
	.word	do_isub_if_icmpeq
	.word	do_isub_if_icmpne
	.word	do_isub_goto
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub_ireturn
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub_ifeq
	.word	do_isub_ifne
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
	.word	do_isub
dispatch_iand:
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand_iload
	.word	do_iand
	.word	do_iand_iload
	.word	do_iand
	.word	do_iand_iload
	.word	do_iand_iload_0
	.word	do_iand_iload_0
	.word	do_iand_iload_0
	.word	do_iand_iload_0
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand_iaload
	.word	do_iand
	.word	do_iand_iaload
	.word	do_iand
	.word	do_iand_iaload
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand_istore
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand_istore_0
	.word	do_iand_istore_0
	.word	do_iand_istore_0
	.word	do_iand_istore_0
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand_iastore
	.word	do_iand
	.word	do_iand_iastore
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand_iadd
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand_isub
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand_iinc
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand_ifeq
	.word	do_iand_ifne
	.word	do_iand_iflt
	.word	do_iand_ifge
	.word	do_iand_ifgt
	.word	do_iand_ifle
	.word	do_iand_if_icmpeq
	.word	do_iand_if_icmpne
	.word	do_iand_if_icmplt
	.word	do_iand_if_icmpge
	.word	do_iand_if_icmpgt
	.word	do_iand_if_icmple
	.word	do_iand_if_icmpeq
	.word	do_iand_if_icmpne
	.word	do_iand_goto
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand_ireturn
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand_ifeq
	.word	do_iand_ifne
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
	.word	do_iand
dispatch_ior:
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior_iload
	.word	do_ior
	.word	do_ior_iload
	.word	do_ior
	.word	do_ior_iload
	.word	do_ior_iload_0
	.word	do_ior_iload_0
	.word	do_ior_iload_0
	.word	do_ior_iload_0
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior_iaload
	.word	do_ior
	.word	do_ior_iaload
	.word	do_ior
	.word	do_ior_iaload
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior_istore
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior_istore_0
	.word	do_ior_istore_0
	.word	do_ior_istore_0
	.word	do_ior_istore_0
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior_iastore
	.word	do_ior
	.word	do_ior_iastore
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior_iadd
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior_isub
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior_iinc
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior_ifeq
	.word	do_ior_ifne
	.word	do_ior_iflt
	.word	do_ior_ifge
	.word	do_ior_ifgt
	.word	do_ior_ifle
	.word	do_ior_if_icmpeq
	.word	do_ior_if_icmpne
	.word	do_ior_if_icmplt
	.word	do_ior_if_icmpge
	.word	do_ior_if_icmpgt
	.word	do_ior_if_icmple
	.word	do_ior_if_icmpeq
	.word	do_ior_if_icmpne
	.word	do_ior_goto
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior_ireturn
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior_ifeq
	.word	do_ior_ifne
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
	.word	do_ior
dispatch_ixor:
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor_iload
	.word	do_ixor
	.word	do_ixor_iload
	.word	do_ixor
	.word	do_ixor_iload
	.word	do_ixor_iload_0
	.word	do_ixor_iload_0
	.word	do_ixor_iload_0
	.word	do_ixor_iload_0
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor_iaload
	.word	do_ixor
	.word	do_ixor_iaload
	.word	do_ixor
	.word	do_ixor_iaload
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor_istore
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor_istore_0
	.word	do_ixor_istore_0
	.word	do_ixor_istore_0
	.word	do_ixor_istore_0
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor_iastore
	.word	do_ixor
	.word	do_ixor_iastore
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor_iadd
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor_isub
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor_iinc
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor_ifeq
	.word	do_ixor_ifne
	.word	do_ixor_iflt
	.word	do_ixor_ifge
	.word	do_ixor_ifgt
	.word	do_ixor_ifle
	.word	do_ixor_if_icmpeq
	.word	do_ixor_if_icmpne
	.word	do_ixor_if_icmplt
	.word	do_ixor_if_icmpge
	.word	do_ixor_if_icmpgt
	.word	do_ixor_if_icmple
	.word	do_ixor_if_icmpeq
	.word	do_ixor_if_icmpne
	.word	do_ixor_goto
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor_ireturn
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor_ifeq
	.word	do_ixor_ifne
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
	.word	do_ixor
dispatch_iinc:
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc_iconst_m1
	.word	do_iinc_iconst_m1
	.word	do_iinc_iconst_m1
	.word	do_iinc_iconst_m1
	.word	do_iinc_iconst_m1
	.word	do_iinc_iconst_m1
	.word	do_iinc_iconst_m1
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc_iload
	.word	do_iinc
	.word	do_iinc_iload
	.word	do_iinc
	.word	do_iinc_iload
	.word	do_iinc_iload_0
	.word	do_iinc_iload_0
	.word	do_iinc_iload_0
	.word	do_iinc_iload_0
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
	.word	do_iinc
dispatch_iaccess_0:
dispatch_iaccess_1:
dispatch_iaccess_2:
dispatch_iaccess_3:
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0_iload
	.word	do_iaccess_0
	.word	do_iaccess_0_iload
	.word	do_iaccess_0
	.word	do_iaccess_0_iload
	.word	do_iaccess_0_iload_0
	.word	do_iaccess_0_iload_0
	.word	do_iaccess_0_iload_0
	.word	do_iaccess_0_iload_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0_iadd
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0_ifeq
	.word	do_iaccess_0_ifne
	.word	do_iaccess_0_iflt
	.word	do_iaccess_0_ifge
	.word	do_iaccess_0_ifgt
	.word	do_iaccess_0_ifle
	.word	do_iaccess_0_if_icmpeq
	.word	do_iaccess_0_if_icmpne
	.word	do_iaccess_0_if_icmplt
	.word	do_iaccess_0_if_icmpge
	.word	do_iaccess_0_if_icmpgt
	.word	do_iaccess_0_if_icmple
	.word	do_iaccess_0_if_icmpeq
	.word	do_iaccess_0_if_icmpne
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0_ifeq
	.word	do_iaccess_0_ifne
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
dispatch_iload_0_iconst_N:
dispatch_iload_1_iconst_N:
dispatch_iload_2_iconst_N:
dispatch_iload_3_iconst_N:
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N_iadd
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N_isub
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N_iand
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N_ior
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N_ixor
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N_iadd_istore_N
	.word	do_iload_0_iconst_N_isub_istore_N
	.word	do_iload_0_iconst_N_iand_istore_N
	.word	do_iload_0_iconst_N_ior_istore_N
	.word	do_iload_0_iconst_N_ixor_istore_N
	.word	do_iload_0_iconst_N_iadd_u4store
	.word	do_iload_0_iconst_N_isub_u4store
	.word	do_iload_0_iconst_N_iand_u4store
	.word	do_iload_0_iconst_N_ior_u4store
	.word	do_iload_0_iconst_N_ixor_u4store
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
dispatch_iload_iconst_N:
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N_iadd
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N_isub
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N_iand
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N_ior
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N_ixor
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N_iadd_istore_N
	.word	do_iload_iconst_N_isub_istore_N
	.word	do_iload_iconst_N_iand_istore_N
	.word	do_iload_iconst_N_ior_istore_N
	.word	do_iload_iconst_N_ixor_istore_N
	.word	do_iload_iconst_N_iadd_u4store
	.word	do_iload_iconst_N_isub_u4store
	.word	do_iload_iconst_N_iand_u4store
	.word	do_iload_iconst_N_ior_u4store
	.word	do_iload_iconst_N_ixor_u4store
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.word	do_iload_iconst_N
	.endm
