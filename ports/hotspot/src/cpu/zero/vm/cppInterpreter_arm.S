#if defined(PRODUCT) && defined(HOTSPOT_ASM)
//#define HW_NULL_PTR_CHECK
//#define UNALIGNED_ACCESS
//#define B14

#define ARMv4

#define GCC_VERSION (__GNUC__ * 10000 + __GNUC_MINOR__ * 100 + __GNUC_PATCHLEVEL__)

// ECN: DOH!!! gcc 4.4 has changed the name mangling scheme!!!
#if GCC_VERSION >= 40400
#define oop_store		_Z9oop_storeIP7oopDescEvPT_S1_
#else
#define oop_store		_Z9oop_storeIP7oopDescEvPVT_S1_
#endif

#define stack		r4
#define	jpc		r5
#define dispatch	r6
#define locals		r7
#define istate		r8
#define constpool	r9
#define arm_sp		r13

#define CONST_POOL_OFFSET	16

#define tmp_xxx		r7
#define tmp_yyy		r5
#define tmp_zzz		r8
#define tmp_vvv		r9

#define tmp1		r11
#define tmp2		r10

#define regset r4-r11

#define tos_btos        0
#define tos_ctos        1
#define tos_stos        2
#define tos_itos        3
#define tos_ltos        4
#define tos_ftos        5
#define tos_dtos        6
#define tos_atos        7

#define JVM_CONSTANT_Utf8		1
#define JVM_CONSTANT_Unicode		2
#define JVM_CONSTANT_Integer		3
#define JVM_CONSTANT_Float		4
#define JVM_CONSTANT_Long		5
#define JVM_CONSTANT_Double		6
#define JVM_CONSTANT_Class		7
#define JVM_CONSTANT_String		8
#define JVM_CONSTANT_Fieldref		9
#define JVM_CONSTANT_Methodref		10
#define JVM_CONSTANT_InterfaceMethodref	11
#define JVM_CONSTANT_NameAndType	12

#define JVM_CONSTANT_UnresolvedClass	100
#define JVM_CONSTANT_ClassIndex		101
#define JVM_CONSTANT_UnresolvedString	102
#define JVM_CONSTANT_StringIndex	103
#define JVM_CONSTANT_UnresolvedClassInError	104

#define T_BOOLEAN	4
#define T_CHAR		5
#define T_FLOAT		6
#define T_DOUBLE	7
#define T_BYTE		8
#define T_SHORT		9
#define T_INT		10
#define T_LONG		11
#define T_OBJECT	12
#define T_ARRAY		13
#define T_VOID		14

#define _thread_uninitialized	0
#define _thread_new		2
#define _thread_new_trans	3
#define _thread_in_native	4
#define _thread_in_native_trans	5
#define _thread_in_vm		6
#define _thread_in_vm_trans	7
#define _thread_in_Java		8
#define	_thread_in_Java_trans	9
#define _thread_blocked		10
#define _thread_blocked_trans	11
#define _thread_max_state	12


#define THREAD_VTABLE		  0
#define THREAD_PENDING_EXC	  4
#define THREAD_SUSPEND_FLAGS	 24
#define THREAD_ACTIVE_HANDLES	 32
#define THREAD_LAST_HANDLE_MARK	 40

#ifdef B14
#define THREAD_TLAB_TOP		 56
#define THREAD_TLAB_END		 64
#define THREAD_HANDLE_AREA	152
#define THREAD_STACK_BASE	156
#define THREAD_STACK_SIZE	160
#define THREAD_LAST_JAVA_SP	260
#define THREAD_JNI_ENVIRONMENT	272
#define THREAD_VM_RESULT	300
#define THREAD_STATE		320
#define THREAD_DO_NOT_UNLOCK	345
#define THREAD_JAVA_STACK_BASE	476
#define THREAD_JAVA_SP		484
#define	THREAD_TOP_ZERO_FRAME	488

#define THREAD_VTABLE_IS_LOCK_OWNED	56
#else
#define THREAD_TLAB_TOP		 56-4
#define THREAD_TLAB_END		 64-4
#define THREAD_HANDLE_AREA	152-4
#define THREAD_STACK_BASE	156-4
#define THREAD_STACK_SIZE	160-4
#define THREAD_LAST_JAVA_SP	260-4
#define THREAD_JNI_ENVIRONMENT	272-4
#define THREAD_VM_RESULT	300-4
#define THREAD_STATE		320-4
#define THREAD_DO_NOT_UNLOCK	345-4
#define THREAD_JAVA_STACK_BASE	476-4
#define THREAD_JAVA_SP		484-4
#define	THREAD_TOP_ZERO_FRAME	488-4

#define THREAD_VTABLE_IS_LOCK_OWNED	52
#endif

#define UNIVERSE_VTABLE			  0
#define UNIVERSE_VTABLE_TOP_ADDR	 96
#define UNIVERSE_VTABLE_END_ADDR	100

#ifdef B14
#define VMSYMBOLS_ArithmeticException		77
#define VMSYMBOLS_ArrayIndexOutOfBounds		78
#define VMSYMBOLS_ArrayStoreException		79
#define VMSYMBOLS_ClassCastException		80
#define VMSYMBOLS_NullPointerException		95
#define VMSYMBOLS_AbstractMethodError		103
#define VMSYMBOLS_IncompatibleClassChangeError	110
#define VMSYMBOLS_InternalError 		111
#else
#define VMSYMBOLS_ArithmeticException		78
#define VMSYMBOLS_ArrayIndexOutOfBounds		79
#define VMSYMBOLS_ArrayStoreException		80
#define VMSYMBOLS_ClassCastException		81
#define VMSYMBOLS_NullPointerException		96
#define VMSYMBOLS_AbstractMethodError		104
#define VMSYMBOLS_IncompatibleClassChangeError	111
#define VMSYMBOLS_InternalError 		112
#endif

#define ISTATE_THREAD		0
#define ISTATE_BCP		4
#define	ISTATE_LOCALS		8
#define	ISTATE_CONSTANTS	12
#define ISTATE_METHOD		16
#define ISTATE_MDX		20
#define ISTATE_STACK		24
#define ISTATE_SAVED_ISTATE	28
#define ISTATE_MSG		28
#define ISTATE_CALLEE		32	// union frame_manager_message

#define	ISTATE_PREV_LINK	44
#define ISTATE_OOP_TEMP		48
#define ISTATE_STACK_BASE	52
#define ISTATE_STACK_LIMIT	56
#define ISTATE_MONITOR_BASE	60
#define ISTATE_SELF_LINK	64
#define ISTATE_CAFEBABF		68

#define last_implemented_bytecode 248

	.macro	ALIGN_CODE
	.align	6
	.endm

	.macro	ALIGN_DATA
	.align	6
	.endm

	.macro	ALIGN_OPCODE
	.align	6
	.endm

	.macro	ALIGN_WORD
	.align	2
	.endm

	.macro	Opcode	label
	ALIGN_OPCODE
do_\label:
	.endm

	.macro	GET_STACK	offset, reg
	ldr	\reg, [stack, #(\offset+1) * 4]
	.endm

	.macro	PUT_STACK	offset, reg
	str	\reg, [stack, #(\offset+1) * 4]
	.endm

	.macro	PUSH4	reg1, reg2, reg3, reg4
	stmda	stack!, {\reg1, \reg2, \reg3, \reg4}
	.endm

	.macro	POP4	reg1, reg2, reg3, reg4
	ldmib	stack!, {\reg1, \reg2, \reg3, \reg4}
	.endm

	.macro	PUSH3	reg1, reg2, reg3
	stmda	stack!, {\reg1, \reg2, \reg3}
	.endm

	.macro	POP3	reg1, reg2, reg3
	ldmib	stack!, {\reg1, \reg2, \reg3}
	.endm

	.macro	PUSH2	reg1, reg2
	stmda	stack!, {\reg1, \reg2}
	.endm

	.macro	PUSH	reg
	str	\reg, [stack], #-4
	.endm

	.macro	POP2	reg1, reg2
	ldmib	stack!, {\reg1, \reg2}
	.endm

	.macro	POP	reg
	ldr	\reg, [stack, #4]!
	.endm

	.set	dispatch_state, 0

	.macro	DISPATCH_START	step=0
	.set	dispatch_state, 1
	ldrb	r0, [jpc, #\step]!
	.endm

	.macro	DISPATCH_START_REG	reg
	.set	dispatch_state, 1
	ldrb	r0, [jpc, \reg]!
	.endm

	.macro	DISPATCH_STATE	state
	.set	dispatch_state, \state
	.endm

	.macro	DISPATCH_1
        ldrb    r1, [jpc, #2]
	.endm

	.macro	DISPATCH_2
        ldr     ip, [dispatch, r0, lsl #2]
	.endm

	.macro	DISPATCH_3
        ldrb    r2, [jpc, #1]
	.endm

	.macro	DISPATCH_4
        ands    lr, ip, #7
	.endm

	.macro	DISPATCH_NEXT
    .if dispatch_state == 0
	.error	"DISPATCH_FINISH without a DISPATCH_START or DISPATCH_STATE"
    .elseif dispatch_state == 1
	DISPATCH_1
    .elseif dispatch_state == 2
	DISPATCH_2
    .elseif dispatch_state == 3
	DISPATCH_3
    .elseif dispatch_state == 4
	DISPATCH_4
    .else
	.error "Too many DISPATCH_NEXTs"
    .endif
	.set	dispatch_state, dispatch_state + 1
	.endm

	.macro	DISPATCH_FINISH
    .if dispatch_state == 0
	.error	"DISPATCH_FINISH without a DISPATCH_START or DISPATCH_STATE"
    .elseif dispatch_state == 1
	DISPATCH_1
	DISPATCH_2
	DISPATCH_3
	DISPATCH_4
    .elseif dispatch_state == 2
	DISPATCH_2
	DISPATCH_3
	DISPATCH_4
    .elseif dispatch_state == 3
	DISPATCH_3
	DISPATCH_4
    .elseif dispatch_state == 4
	DISPATCH_4
    .endif
        moveq   pc, ip
	ldrb	r1, [jpc, lr]
        bic     ip, ip, #7
        ldr     ip, [ip, r1, lsl #2]
        mov     pc, ip
	.set	dispatch_state, 0
	.endm

	.macro	DISPATCH_BYTECODE
        ldrb    r1, [jpc, #2]
        ldr     ip, [dispatch, r0, lsl #2]
        ldrb    r2, [jpc, #1]
        ands    lr, ip, #7
        moveq   pc, ip
	ldrb	r1, [jpc, lr]
        bic     ip, ip, #7
        ldr     ip, [ip, r1, lsl #2]
        mov     pc, ip
	.endm

	.macro	DISPATCH step=0
	ldrb	r0, [jpc, #\step]!
        ldrb    r1, [jpc, #2]
        ldr     ip, [dispatch, r0, lsl #2]
        ldrb    r2, [jpc, #1]
        ands    lr, ip, #7
        moveq   pc, ip
	ldrb	r1, [jpc, lr]
        bic     ip, ip, #7
        ldr     ip, [ip, r1, lsl #2]
        mov     pc, ip
	.endm

#define FFI_TYPE_VOID		0
#define FFI_TYPE_FLOAT		2
#define	FFI_TYPE_DOUBLE		3
#define FFI_TYPE_BOOL		5
#define	FFI_TYPE_SINT8		6
#define FFI_TYPE_UINT16		7
#define FFI_TYPE_SINT16		8
#define FFI_TYPE_SINT32		10
#define FFI_TYPE_SINT64		12
#define FFI_TYPE_POINTER	14

	.macro	_BLX	reg
#ifdef ARMv4
	mov	lr, pc
	mov	pc, \reg
#else
	blx	\reg
#endif
	.endm
#define blx _BLX

	.macro	_BX	reg
#ifdef ARMv4
	mov	pc, \reg
#else
	bx	\reg
#endif
	.endm
#define bx _BX

	.macro	_BXEQ	reg
#ifdef ARMv4
	moveq	pc, \reg
#else
	bxeq	\reg
#endif
	.endm
#define bxeq _BXEQ

	.macro	_BXNE	reg
#ifdef ARMv4
	movne	pc, \reg
#else
	bxne	\reg
#endif
	.endm
#define bxne _BXNE

#ifdef ARMv4
	.arch armv4
#else
	.arch armv7-a
#endif
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4

	.text

	ALIGN_CODE
build_normal:
	ldr	ip, [r1, #24]
	tst	ip, #32
	bne	build_normal_synchronized
build_normal_unsynchronized:
	stmfd	sp!, {r4, r5, r6, r7, r8}
	ldr	r4, [r0, #8]
	ldrh	r8, [r1, #38]
	ldrh	ip, [r1, #40]
	mov	r5, #0
	sub	r3, r4, #4
	str	r3, [r0, #8]
	str	r5, [r4, #-4]
	ldr	r7, [r0, #8]
	mov	r6, r0
	sub	r3, r7, #4
	str	r3, [r0, #8]
	mvn	r0, #0x540		@ form 0xCAFEBABF in r0
	bic	r0, r0, #0x14000
	bic	r0, r0, #0x35000000
	mov	ip, ip, asl #2
	sub	ip, ip, #4
	str	r0, [r7, #-4]
	ldr	r3, [r6, #8]
	add	r4, r4, ip
	sub	r0, r3, #68
	str	r0, [r6, #8]
	str	r4, [r0, #8]
	str	r5, [r0, #44]
	str	r1, [r0, #16]
	str	r0, [r0, #64]
	str	r2, [r3, #-68]
	ldr	r3, [r1, #8]
	cmp	r8, r5
	add	r3, r3, #48
	str	r3, [r0, #4]
	ldr	r2, [r1, #12]
	mov	r3, #0
	ldr	r1, [r2, #12]
	str	r5, [r0, #32]
	str	r5, [r0, #48]
	str	r1, [r0, #12]
	str	r5, [r0, #20]
	str	r3, [r0, #28]
	ldr	r3, [r6, #8]
	str	r3, [r0, #60]
	ldr	r2, [r6, #8]
	str	r2, [r0, #52]
	ldr	r3, [r6, #8]
	sub	r3, r3, #4
	str	r3, [r0, #24]
	ldrne	r3, [r6, #8]
	ldreq	r3, [r6, #8]
	subne	r3, r3, r8, asl #2
	strne	r3, [r6, #8]
	sub	r3, r3, #4
	str	r3, [r0, #56]
	mov	r0, r7
	ldmfd	sp!, {r4, r5, r6, r7, r8}
	bx	lr

	ALIGN_CODE
build_normal_synchronized:
	stmfd	sp!, {r4, r5, r6, r7, r8, sl}
	ldr	r6, [r0, #8]
	mov	r4, r0
	ldrh	sl, [r1, #38]
	ldrh	r0, [r1, #40]
	mov	r5, r1
	mov	ip, #0
	sub	r3, r6, #4
	mvn	r1, #0x540		@ form 0xCAFEBABF in r1
	bic	r1, r1, #0x14000
	bic	r1, r1, #0x35000000
	str	r3, [r4, #8]
	str	ip, [r6, #-4]
	ldr	r7, [r4, #8]
	mov	r0, r0, asl #2
	sub	r3, r7, #4
	str	r3, [r4, #8]
	str	r1, [r7, #-4]
	ldr	r3, [r4, #8]
	sub	r8, r0, #4
	sub	r0, r3, #68
	str	r0, [r4, #8]
	str	r5, [r0, #16]
	str	ip, [r0, #44]
	str	r0, [r0, #64]
	str	r2, [r3, #-68]
	add	r2, r6, r8
	str	r2, [r0, #8]
	ldr	r3, [r5, #8]
	add	r3, r3, #48
	str	r3, [r0, #4]
	ldr	r2, [r5, #12]
	mov	r3, #0
	ldr	r1, [r2, #12]
	str	ip, [r0, #32]
	str	ip, [r0, #48]
	str	r1, [r0, #12]
	str	ip, [r0, #20]
	str	r3, [r0, #28]
	ldr	r3, [r4, #8]
	str	r3, [r0, #60]
	ldr	r2, [r4, #8]
	sub	ip, r2, #8
	str	ip, [r4, #8]
	ldr	r3, [r5, #24]
	tst	r3, #8
	ldrne	r3, [r5, #12]
	ldreq	r1, [r6, r8]
	ldrne	r2, [r3, #16]
	ldrne	r1, [r2, #60]
	cmp	sl, #0
	str	r1, [ip, #4]
	ldr	r2, [r4, #8]
	str	r2, [r0, #52]
	ldr	r3, [r4, #8]
	sub	r3, r3, #4
	str	r3, [r0, #24]
	ldrne	r3, [r4, #8]
	ldreq	r3, [r4, #8]
	subne	r3, r3, sl, asl #2
	strne	r3, [r4, #8]
	sub	r3, r3, #4
	str	r3, [r0, #56]
	mov	r0, r7
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl}
	bx	lr

	ALIGN_CODE
build_native:
	ldr	ip, [r1, #24]
	tst	ip, #32
	bne	build_native_synchronized
build_native_unsynchronized:
	stmfd	sp!, {r4, r5, r6, r7}
	ldr	r6, [r0, #8]
	ldrh	r4, [r1, #42]
	mov	r5, r0
	mov	r7, #0
	sub	r3, r6, #4
	mvn	ip, #0x540		@ form 0xCAFEBABF in ip
	bic	ip, ip, #0x14000
	bic	ip, ip, #0x35000000
	str	r3, [r0, #8]
	str	r7, [r6, #-4]
	ldr	r0, [r0, #8]
	mov	r4, r4, asl #2
	sub	r3, r0, #4
	str	r3, [r5, #8]
	str	ip, [r0, #-4]
	ldr	r3, [r5, #8]
	sub	r4, r4, #4
	sub	ip, r3, #68
	add	r6, r6, r4
	str	ip, [r5, #8]
	str	r2, [r3, #-68]
	str	r6, [ip, #8]
	str	r1, [ip, #16]
	str	ip, [ip, #64]
	str	r7, [ip, #44]
	str	r7, [ip, #4]
	ldr	r2, [r1, #12]
	mov	r3, #2
	ldr	r1, [r2, #12]
	str	r3, [ip, #28]
	str	r7, [ip, #32]
	str	r1, [ip, #12]
	str	r7, [ip, #48]
	str	r7, [ip, #20]
	ldr	r3, [r5, #8]
	str	r3, [ip, #60]
	ldr	r2, [r5, #8]
	str	r2, [ip, #52]
	ldr	r3, [r5, #8]
	sub	r3, r3, #4
	str	r3, [ip, #24]
	ldr	r2, [r5, #8]
	sub	r2, r2, #4
	str	r2, [ip, #56]
	ldmfd	sp!, {r4, r5, r6, r7}
	bx	lr

	ALIGN_CODE
build_native_synchronized:
	stmfd	sp!, {r4, r5, r6, r7, r8}
	ldr	r7, [r0, #8]
	mov	r5, r0
	mov	ip, #0
	ldrh	r0, [r1, #42]
	mov	r6, r1
	sub	r3, r7, #4
	mvn	r1, #0x540		@ form 0xCAFEBABF in r1
	bic	r1, r1, #0x14000
	bic	r1, r1, #0x35000000
	str	r3, [r5, #8]
	str	ip, [r7, #-4]
	ldr	r8, [r5, #8]
	mov	r0, r0, asl #2
	sub	r3, r8, #4
	str	r3, [r5, #8]
	str	r1, [r8, #-4]
	ldr	r3, [r5, #8]
	sub	r0, r0, #4
	sub	r4, r3, #68
	str	r4, [r5, #8]
	str	r6, [r4, #16]
	str	r4, [r4, #64]
	str	ip, [r4, #44]
	str	ip, [r4, #4]
	str	r2, [r3, #-68]
	add	r3, r7, r0
	str	r3, [r4, #8]
	ldr	r2, [r6, #12]
	mov	r3, #2
	ldr	r1, [r2, #12]
	str	r3, [r4, #28]
	str	ip, [r4, #32]
	str	r1, [r4, #12]
	str	ip, [r4, #48]
	str	ip, [r4, #20]
	ldr	r3, [r5, #8]
	str	r3, [r4, #60]
	ldr	r2, [r5, #8]
	sub	r1, r2, #8
	str	r1, [r5, #8]
	ldr	r3, [r6, #24]
	tst	r3, #8
	ldrne	r3, [r6, #12]
	ldreq	r0, [r7, r0]
	ldrne	r2, [r3, #16]
	ldrne	r0, [r2, #60]
	str	r0, [r1, #4]
	ldr	r3, [r5, #8]
	mov	r0, r8
	str	r3, [r4, #52]
	ldr	r2, [r5, #8]
	sub	r2, r2, #4
	str	r2, [r4, #24]
	ldr	r3, [r5, #8]
	sub	r3, r3, #4
	str	r3, [r4, #56]
	ldmfd	sp!, {r4, r5, r6, r7, r8}
	bx	lr

	ALIGN_CODE
	.global	asm_generate_method_entry
asm_generate_method_entry:
	cmp	r0, #6
	movcs	r0, #0
	adrcc	ip, asm_method_table
	ldrcc	r0, [ip, r0, lsl #2]
	bx	lr
asm_method_table:
	.word	normal_entry
	.word	normal_entry_synchronized
	.word	native_entry
	.word	native_entry_synchronized
	.word	empty_entry
	.word	accessor_entry

	ALIGN_CODE
	.global	native_entry_synchronized
native_entry_synchronized:
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	r1, r0
	sub	sp, sp, #60
	add	r0, r2, #THREAD_JAVA_STACK_BASE
	mov	r7, r2
	bl	build_native
	ldr	r3, [r7, #THREAD_TOP_ZERO_FRAME]
	add	r1, sp, #52
	str	r1, [sp, #0]
	ldr	sl, .L306native_entry_synchronized
.LPIC19native_entry_synchronized:
	add	sl, pc, sl
	str	r3, [r0, #0]
	ldr	r2, [r7, #THREAD_STACK_SIZE]
	ldr	r3, [r7, #THREAD_STACK_BASE]
	sub	r9, r0, #72
	rsb	r3, r2, r3
	str	r0, [r7, #THREAD_TOP_ZERO_FRAME]
	rsb	r3, r3, r1
	ldr	r2, [r9, #8]
	cmp	r3, #3072
	str	r2, [sp, #4]
	blt	.L294native_entry_synchronized
	ldr	ip, [r9, #16]
	ldr	r3, [ip, #24]
	ands	r0, r3, #32
	moveq	r8, r0
	bne	.L295native_entry_synchronized
.L243native_entry_synchronized:
	ldr	r4, [ip, #84]
	cmp	r4, #0
	beq	.L296native_entry_synchronized
.L248native_entry_synchronized:
	ldr	r3, .L306native_entry_synchronized+4
	ldr	r2, [sl, r3]
	cmp	r4, r2
	beq	.L297native_entry_synchronized
.L249native_entry_synchronized:
	ldr	r2, [r4, #4]
	ldr	ip, [ip, #80]
	ldr	r1, [r7, #THREAD_JAVA_SP]
	mov	r2, r2, asl #2
	rsb	r2, r2, #0
	str	ip, [sp, #8]
	add	r5, r1, r2
	str	r5, [r7, #THREAD_JAVA_SP]
	add	r3, r7, #THREAD_JNI_ENVIRONMENT
	str	r3, [sp, #52]
	ldr	r3, [sp, #0]
	add	lr, r5, #4
	str	r3, [r1, r2]
	mov	r3, #0
	str	r3, [sp, #48]
	ldr	r2, [r9, #16]
	ldr	r3, [r2, #24]
	tst	r3, #8
	bne	.L298native_entry_synchronized
.L250native_entry_synchronized:
	rsb	r3, r5, lr
	ldr	r2, [r4, #4]
	mov	ip, r3, asr #2
	cmp	ip, r2
	bge	.L299native_entry_synchronized
	ldr	fp, .L306native_entry_synchronized+8
	add	r3, ip, #6
	add	r1, r4, #24
	mov	r3, r3, asl #2
	str	r1, [sp, #12]
	ldr	r6, [sl, fp]
	add	r1, r4, r3
	ldr	r0, [sp, #4]
	b	.L258native_entry_synchronized
.L257native_entry_synchronized:
	cmp	r3, #8
	subeq	r3, r0, #4
	streq	r3, [lr], #4
	ldreq	r2, [r4, #4]
	add	ip, ip, #1
	subeq	r0, r3, #4
	cmp	ip, r2
	add	r1, r1, #4
	bge	.L252native_entry_synchronized
.L258native_entry_synchronized:
	ldr	r3, [r1, #0]
	cmp	r3, r6
	beq	.L300native_entry_synchronized
	ldr	r3, [r3, #0]
	cmp	r3, #4
	bne	.L257native_entry_synchronized
.L293native_entry_synchronized:
	str	r0, [lr], #4
.L291native_entry_synchronized:
	ldr	r2, [r4, #4]
	add	ip, ip, #1
	cmp	ip, r2
	sub	r0, r0, #4
	add	r1, r1, #4
	blt	.L258native_entry_synchronized
.L252native_entry_synchronized:
	ldr	r0, [r7, #THREAD_TOP_ZERO_FRAME]
	ldr	r1, [sp, #8]
	mov	r3, r5
	str	r0, [r7, #THREAD_LAST_JAVA_SP]
	mov	r2, #_thread_in_native
	mov	r0, r4
	str	r2, [r7, #THREAD_STATE]
	add	r2, sp, #40
	bl	ffi_call
	ldr	r2, .L306native_entry_synchronized+12
	mov	r3, #_thread_in_native_trans
	str	r3, [r7, #THREAD_STATE]
	ldr	r3, [sl, r2]
	ldr	r1, [r3, #0]
	cmp	r1, #1
	ble	.L259native_entry_synchronized
	ldr	r3, .L306native_entry_synchronized+16
	ldr	r2, [sl, r3]
	ldrb	r1, [r2, #0]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L301native_entry_synchronized
	ldr	r3, .L306native_entry_synchronized+20
	ldr	r2, .L306native_entry_synchronized+24
	ldr	r0, [sl, r3]
	ldr	r1, [sl, r2]
	mov	r2, #1
	ldr	r3, [r0, #0]
	ldr	ip, [r1, #0]
	and	r3, r3, r7, lsr #3
	str	r2, [ip, r3]
.L259native_entry_synchronized:
	ldr	r3, .L306native_entry_synchronized+28
	ldr	r2, [sl, r3]
	ldr	r1, [r2, #0]
	cmp	r1, #0
	beq	.L302native_entry_synchronized
.L261native_entry_synchronized:
	mov	r0, r7
	bl	_ZN10JavaThread40check_special_condition_for_native_transEPS_
	.p2align 3
.L262native_entry_synchronized:
	mov	r3, #_thread_in_Java
	mov	r2, #0
	str	r3, [r7, #THREAD_STATE]
	str	r2, [r7, #THREAD_LAST_JAVA_SP]
	ldr	r0, [sp, #12]
	ldr	r1, [r4, #4]
	ldr	r2, [sl, fp]
	ldr	r3, [r0, r1, asl #2]
	cmp	r3, r2
	beq	.L303native_entry_synchronized
.L263native_entry_synchronized:
	ldr	r2, [r7, #THREAD_ACTIVE_HANDLES]
	cmp	r8, #0
	mov	r3, #0
	str	r3, [r2, #128]
	beq	.L292native_entry_synchronized
	ldr	r1, [r7, #THREAD_PENDING_EXC]
	cmp	r1, #0
	beq	.L304native_entry_synchronized
.L241native_entry_synchronized:
	ldr	r2, [r7, #THREAD_TOP_ZERO_FRAME]
	cmp	r1, #0
	add	r1, r2, #4
	str	r1, [r7, #THREAD_JAVA_SP]
	ldr	r3, [r2, #0]
	str	r3, [r7, #THREAD_TOP_ZERO_FRAME]
	ldr	r2, [r9, #16]
	ldrh	r3, [r2, #42]
	mov	r3, r3, asl #2
	add	r4, r1, r3
	str	r4, [r7, #THREAD_JAVA_SP]
	beq	.L305native_entry_synchronized
.L279native_entry_synchronized:
	add	sp, sp, #60
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L300native_entry_synchronized:
	ldr	r3, [r0, #0]
	cmp	r3, #0
	beq	.L293native_entry_synchronized
	ldr	r3, [r7, #THREAD_JAVA_SP]
	sub	r2, r3, #4
	str	r2, [r7, #THREAD_JAVA_SP]
	str	r0, [r3, #-4]
	ldr	r2, [r7, #THREAD_JAVA_SP]
	str	r2, [lr], #4
	b	.L291native_entry_synchronized
.L302native_entry_synchronized:
	ldr	r3, [r7, #THREAD_SUSPEND_FLAGS]
	cmp	r3, #0
	beq	.L262native_entry_synchronized
	mov	r0, r7
	bl	_ZN10JavaThread40check_special_condition_for_native_transEPS_
	b	.L262native_entry_synchronized
.L298native_entry_synchronized:
	ldr	r1, [r2, #12]
	add	r3, sp, #56
	mov	r2, r9
	ldr	r0, [r1, #16]
	add	lr, lr, #4
	ldr	r1, [r0, #60]
	str	r1, [r2, #48]!
	str	r2, [r3, #-8]!
	str	r3, [r5, #4]
	b	.L250native_entry_synchronized
.L295native_entry_synchronized:
	ldr	r8, [r9, #52]
	ldr	fp, .L306native_entry_synchronized+32
	ldr	r5, [r8, #4]
	ldr	r3, [r5, #0]
	orr	r4, r3, #1
	str	r4, [r8, #0]
	.p2align 3
.L245native_entry_synchronized:
	ldr	r6, [r5, #0]
	mov	r0, r4
	cmp	r4, r6
	mov	r1, r8
	mov	r2, r5
	bne	.L244native_entry_synchronized
	blx	fp
	cmp	r0, #0
	bne	.L245native_entry_synchronized
.L244native_entry_synchronized:
	cmp	r4, r6
	beq	.L290native_entry_synchronized
	bic	r1, r4, #3
	ldr	r3, [r7, #0]
	mov	r0, r7
	ldr	ip, [r3, #THREAD_VTABLE_IS_LOCK_OWNED]
	blx	ip
	subs	r4, r0, #0
	beq	.L247native_entry_synchronized
	mov	r3, #0
	str	r3, [r8, #0]
	ldr	ip, [r9, #16]
	b	.L243native_entry_synchronized
.L304native_entry_synchronized:
	ldr	r6, [r8, #0]
	ldr	r5, [r8, #4]
	cmp	r6, #0
	str	r1, [r8, #4]
	ldrne	fp, .L306native_entry_synchronized+32
	beq	.L292native_entry_synchronized
	.p2align 3
.L283native_entry_synchronized:
	ldr	r4, [r5, #0]
	mov	r0, r8
	cmp	r8, r4
	mov	r1, r6
	mov	r2, r5
	bne	.L265native_entry_synchronized
	blx	fp
	cmp	r0, #0
	bne	.L283native_entry_synchronized
.L265native_entry_synchronized:
	cmp	r8, r4
	beq	.L292native_entry_synchronized
	add	r4, sp, #16
	mov	r0, r4
	mov	r1, r7
	str	r5, [r8, #4]
	bl	_ZN10HandleMark10initializeEP6Thread
	ldr	r3, [r7, #THREAD_TOP_ZERO_FRAME]
	mov	r0, r7
	mov	r1, r8
	str	r3, [r7, #THREAD_LAST_JAVA_SP]
	bl	_ZN18InterpreterRuntime11monitorexitEP10JavaThreadP15BasicObjectLock
	mov	r3, #0
	mov	r0, r4
	str	r3, [r7, #THREAD_LAST_JAVA_SP]
	bl	_ZN10HandleMarkD1Ev
.L292native_entry_synchronized:
	ldr	r1, [r7, #4]
	b	.L241native_entry_synchronized
.L294native_entry_synchronized:
	str	r0, [r7, #THREAD_LAST_JAVA_SP]
	mov	r0, r7
	bl	_ZN18InterpreterRuntime24throw_StackOverflowErrorEP10JavaThread
	mov	r3, #0
	ldr	r1, [r7, #THREAD_PENDING_EXC]
	str	r3, [r7, #THREAD_LAST_JAVA_SP]
	b	.L241native_entry_synchronized
.L247native_entry_synchronized:
	ldr	r3, [r7, #THREAD_TOP_ZERO_FRAME]
	mov	r1, r8
	mov	r0, r7
	str	r3, [r7, #THREAD_LAST_JAVA_SP]
	bl	_ZN18InterpreterRuntime12monitorenterEP10JavaThreadP15BasicObjectLock
	ldr	r1, [r7, #THREAD_PENDING_EXC]
	str	r4, [r7, #THREAD_LAST_JAVA_SP]
	cmp	r1, #0
	bne	.L241native_entry_synchronized
	.p2align 3
.L290native_entry_synchronized:
	ldr	ip, [r9, #16]
	b	.L243native_entry_synchronized
.L301native_entry_synchronized:
	ldr	r3, .L306native_entry_synchronized+28
	ldr	r2, [sl, r3]
	ldr	r1, [r2, #0]
	cmp	r1, #0
	bne	.L261native_entry_synchronized
	b	.L302native_entry_synchronized
.L303native_entry_synchronized:
	ldr	r3, [sp, #40]
	cmp	r3, #0
	streq	r3, [r9, #48]
	ldrne	r3, [r3, #0]
	strne	r3, [r9, #48]
	b	.L263native_entry_synchronized
.L305native_entry_synchronized:
	ldr	r0, [r9, #16]
	bl	_ZNK13methodOopDesc11result_typeEv
	ldr	r2, .L306native_entry_synchronized+36
	ldr	r1, [sl, r2]
	ldr	r3, [r1, r0, asl #2]
	sub	r3, r4, r3, asl #2
	str	r3, [r7, #THREAD_JAVA_SP]
	ldr	r0, [r9, #16]
	bl	_ZNK13methodOopDesc11result_typeEv
	sub	r0, r0, #4
	cmp	r0, #9
	addls	pc, pc, r0, asl #2
	b	.L279native_entry_synchronized
.L278native_entry_synchronized:
	b	.L269native_entry_synchronized
	b	.L270native_entry_synchronized
	b	.L271native_entry_synchronized
	b	.L272native_entry_synchronized
	b	.L273native_entry_synchronized
	b	.L274native_entry_synchronized
	b	.L275native_entry_synchronized
	b	.L276native_entry_synchronized
	b	.L277native_entry_synchronized
	b	.L277native_entry_synchronized
.L299native_entry_synchronized:
	add	r0, r4, #24
	ldr	fp, .L306native_entry_synchronized+8
	str	r0, [sp, #12]
	b	.L252native_entry_synchronized
.L277native_entry_synchronized:
	ldr	r3, [r9, #48]
	ldr	r0, [sp, #4]
	str	r3, [r0, #0]
	b	.L279native_entry_synchronized
.L276native_entry_synchronized:
	add	r3, sp, #40
	ldmia	r3, {r3-r4}
	ldr	r0, [sp, #4]
	stmda	r0, {r3-r4}
	b	.L279native_entry_synchronized
.L275native_entry_synchronized:
	ldr	r3, [sp, #40]
	ldr	r2, [sp, #4]
	str	r3, [r2, #0]
	b	.L279native_entry_synchronized
.L274native_entry_synchronized:
	ldrsh	r3, [sp, #40]
	ldr	r1, [sp, #4]
	str	r3, [r1, #0]
	b	.L279native_entry_synchronized
.L273native_entry_synchronized:
	ldrsb	r3, [sp, #40]
	ldr	r0, [sp, #4]
	str	r3, [r0, #0]
	b	.L279native_entry_synchronized
.L272native_entry_synchronized:
	add	r3, sp, #40
	ldmia	r3, {r3-r4}
	ldr	r2, [sp, #4]
	stmda	r2, {r3-r4}
	b	.L279native_entry_synchronized
.L271native_entry_synchronized:
	ldr	r3, [sp, #40]	@ float
	ldr	r1, [sp, #4]
	str	r3, [r1, #0]	@ float
	b	.L279native_entry_synchronized
.L270native_entry_synchronized:
	ldrh	r3, [sp, #40]
	ldr	r2, [sp, #4]
	str	r3, [r2, #0]
	b	.L279native_entry_synchronized
.L269native_entry_synchronized:
	ldr	r1, [sp, #4]
	ldrb	r3, [sp, #40]	@ zero_extendqisi2
	subs	r3, r3, #0
	movne	r3, #1
	str	r3, [r1, #0]
	b	.L279native_entry_synchronized
.L296native_entry_synchronized:
	ldr	r3, [r7, #THREAD_TOP_ZERO_FRAME]
	mov	r0, r7
	str	r3, [r7, #THREAD_LAST_JAVA_SP]
	ldr	r1, [r9, #16]
	bl	_ZN18InterpreterRuntime19prepare_native_callEP10JavaThreadP13methodOopDesc
	ldr	r1, [r7, #THREAD_PENDING_EXC]
	str	r4, [r7, #THREAD_LAST_JAVA_SP]
	cmp	r1, #0
	bne	.L241native_entry_synchronized
	ldr	ip, [r9, #16]
	ldr	r4, [ip, #84]
	b	.L248native_entry_synchronized
.L297native_entry_synchronized:
	ldr	r3, [r7, #THREAD_TOP_ZERO_FRAME]
	mov	r2, #0
	mov	r0, r7
	str	r3, [r7, #THREAD_LAST_JAVA_SP]
	mov	r3, r2
	ldr	r1, [r9, #16]
	bl	_ZN18InterpreterRuntime22slow_signature_handlerEP10JavaThreadP13methodOopDescPiS4_
	ldr	r1, [r7, #THREAD_PENDING_EXC]
	mov	r3, #0
	cmp	r1, #0
	str	r3, [r7, #THREAD_LAST_JAVA_SP]
	mov	r4, r0
	bne	.L241native_entry_synchronized
	ldr	ip, [r9, #16]
	b	.L249native_entry_synchronized
.L307native_entry_synchronized:
	ALIGN_DATA
.L306native_entry_synchronized:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC19native_entry_synchronized+8)
	.word	_ZN18InterpreterRuntime22slow_signature_handlerEP10JavaThreadP13methodOopDescPiS4_(GOT)
	.word	ffi_type_pointer(GOT)
	.word	_ZN2os16_processor_countE(GOT)
	.word	UseMembar(GOT)
	.word	_ZN2os20_serialize_page_maskE(GOT)
	.word	_ZN2os19_mem_serialize_pageE(GOT)
	.word	_ZN20SafepointSynchronize6_stateE(GOT)
	.word	-61504
	.word	type2size(GOT)

	ALIGN_CODE
	.global	empty_entry
empty_entry:
	ldr	r3, .L1359
	ldr	r1, .L1359+4
.LPIC19:
	add	r3, pc, r3

	ldr	ip, [r3, r1]
	ldr	r3, [ip, #0]
	cmp	r3, #0
	bne	normal_entry_synchronized

	ldrh	r3, [r0, #42]
	ldr	r1, [r2, #THREAD_JAVA_SP]
	add	r1, r1, r3, lsl #2
	str	r1, [r2, #THREAD_JAVA_SP]
	bx	lr
.L1359:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC19+8)
	.word	_ZN20SafepointSynchronize6_stateE(GOT)

@ ---- START execute.s ---------------------------------------------------------------------

#ifdef HW_NULL_PTR_CHECK

#define uc_mcontext		20
#define arm_registers_offset	12
#define arm_cpsr_offset		16*4

	.global	asm_check_null_ptr
asm_check_null_ptr:
	add	r0, r0, #uc_mcontext + arm_registers_offset
	ldr	r1, [r0, #15*4]
	adr	ip, abort_table
abort_loop:
	ldr	r2, [ip], #4
	cmp	r2, #0
	moveq	r0, #0
	bxeq	lr
	cmp	r2, r1
	bne	abort_loop

	adr	r3, abort_table+4
	sub	r3, ip, r3

	adr	ip, jpc_correction_table
	ldrb	r3, [ip, r3, lsr #2]

	ldr	ip, [r0, #5*4]
	sub	ip, ip, r3
	str	ip, [r0, #5*4]

	adrl	r3, null_ptr_exception
	str	r3, [r0, #15*4]
do_setcontext:
	mov	r0, #1
	bx	lr
abort_table:
	.word	.abortentry5
	.word	.abortentry6
	.word	.abortentry7
	.word	.abortentry8
	.word	.abortentry9
	.word	.abortentry10
	.word	.abortentry11
	.word	.abortentry12
	.word	.abortentry13

	.word	.abortentry19
	.word	.abortentry20
	.word	.abortentry21
	.word	.abortentry22
	.word	.abortentry23
	.word	.abortentry24
	.word	.abortentry25
	.word	.abortentry26
	.word	.abortentry27
	.word	.abortentry28
	.word	.abortentry29
	.word	.abortentry30
	.word	.abortentry31
	.word	.abortentry32

	.word	.abortentry38
	.word	.abortentry39
	.word	.abortentry40
	.word	.abortentry41
	.word	.abortentry42
	.word	.abortentry42_1
	.word	.abortentry43
	.word	.abortentry44
	.word	.abortentry45
	.word	.abortentry46
	.word	.abortentry47
	.word	.abortentry48
	.word	.abortentry49
	.word	.abortentry50
	.word	.abortentry51
	.word	.abortentry52

	.word	.abortentry58
	.word	.abortentry59
	.word	.abortentry60

	.word	.abortentry61
	.word	.abortentry62
	.word	.abortentry63
	.word	.abortentry64
	.word	.abortentry65
	.word	.abortentry66
	.word	.abortentry67
	.word	.abortentry68
	.word	.abortentry69
	.word	.abortentry70
	.word	.abortentry71
	.word	.abortentry72

	.word	.abortentry73
	.word	.abortentry74
	.word	.abortentry75
	.word	.abortentry76
	.word	.abortentry77

	.word	.abortentry78
	.word	.abortentry79
	.word	.abortentry80
	.word	.abortentry81
	.word	.abortentry82
	.word	.abortentry83
	.word	.abortentry84
	.word	.abortentry85
	.word	.abortentry86
	.word	.abortentry87

	.word	.abortentry88
	.word	.abortentry89
	.word	.abortentry90
	.word	.abortentry91
	.word	.abortentry92
	.word	.abortentry93
	.word	.abortentry94
	.word	.abortentry95
	.word	.abortentry96
	.word	.abortentry97
	.word	.abortentry98
	.word	.abortentry99
	.word	.abortentry100
	.word	.abortentry101
	.word	.abortentry102
	.word	.abortentry103
	.word	.abortentry104
	.word	.abortentry105
	.word	.abortentry106
	.word	.abortentry107
	.word	.abortentry108
	.word	.abortentry109
	.word	0
jpc_correction_table:
	.byte	1, 1, 1, 1, 1, 1, 1, 1, 1
	.byte	1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
	.byte	2, 3, 4, 3, 2, 2, 0, 1, 3, 2, 0, 1, 0, 1, 0, 1
	.byte	2, 2, 2
	.byte	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.byte	1, 1, 1, 1, 1
	.byte	3, 3, 3, 3, 3, 3, 3, 3, 3, 3
	.byte	3, 5, 4, 4, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 1, 1, 1, 1, 1
	ALIGN_WORD

#else
	.global	asm_check_null_ptr
asm_check_null_ptr:
	mov	r0, #0
	bx	lr

#endif

	ALIGN_CODE
fast_native_entry:
	ldr	r2, [istate, #ISTATE_THREAD]
	mov	r11, tmp2
	ldrh	r1, [r11, #42]
	ldr	r4, [r2, #THREAD_JAVA_SP]
	ldr	ip, [r2, #THREAD_TOP_ZERO_FRAME]
	mov	r0, #0
	mvn	r10, #0x540		@ form 0xCAFEBABF in r10
	bic	r10, r10, #0x14000
	bic	r10, r10, #0x35000000
	sub	r9, r4, #76
	mov	r7, r9
	str	r9, [r2, #THREAD_JAVA_SP]	@ drop stack
	sub	r5, r9, #4		@ stack limit = r9 - 4
	mov	r3, r9
	stmdb	r4, {r0, r3, r5, r7, r9, r10, ip}
	str	r0, [r9, #ISTATE_CALLEE]
	str	r0, [r9, #ISTATE_PREV_LINK]
	str	r0, [r9, #ISTATE_MSG]
	str	r0, [r9, #ISTATE_MDX]
	sub	r7, r4, #4
	add	r7, r7, r1, lsl #2
	mov	r5, #0
	ldr	r10, [r11, #12]
	ldr	r10, [r10, #12]
	stmia	r9, {r2, r5, r7, r10, r11}
	add	r0, r9, #72
	mov	r9, r2
.LPIC18_fast_native_entry:
	ldr	r2, [r9, #THREAD_STACK_SIZE]
	ldr	r3, [r9, #THREAD_STACK_BASE]
	rsb	r3, r2, r3
	rsb	r3, r3, sp
	cmp	r3, #4096
	str	r0, [r9, #THREAD_TOP_ZERO_FRAME]
	blt	.fast_native_entry_throw_stack_overflow
	ldr	r5, [r11, #84]
	cmp	r5, #0
	bne	.fast_native_entry_got_handleraddr
	str	r0, [r9, #THREAD_LAST_JAVA_SP]
	mov	r0, r9
	mov	r1, r11
	bl	_ZN18InterpreterRuntime19prepare_native_callEP10JavaThreadP13methodOopDesc
	ldr	r11, [r9, #THREAD_TOP_ZERO_FRAME]
	ldr	r1, [r9, #THREAD_PENDING_EXC]
	str	r5, [r9, #THREAD_LAST_JAVA_SP]
	ldr	r11, [r11, #-72 + ISTATE_METHOD]
	cmp	r1, #0
	bne	.fast_native_entry_exception
	ldr	r5, [r11, #84]
.fast_native_entry_got_handleraddr:
	ldr	r2, [dispatch, #InterpreterRuntime_slow_signature_handler_Address-XXX]
	cmp	r5, r2
	bne	.fast_native_entry_get_handler
	ldr	r3, [r9, #THREAD_TOP_ZERO_FRAME]
	mov	r2, #0
	mov	r0, r9
	str	r3, [r9, #THREAD_LAST_JAVA_SP]
	mov	r3, r2
	mov	r1, r11
	bl	_ZN18InterpreterRuntime22slow_signature_handlerEP10JavaThreadP13methodOopDescPiS4_
	ldr	r11, [r9, #THREAD_TOP_ZERO_FRAME]
	ldr	r1, [r9, #THREAD_PENDING_EXC]
	mov	r3, #0
	ldr	r11, [r11, #-72 + ISTATE_METHOD]
	cmp	r1, #0
	str	r3, [r9, #THREAD_LAST_JAVA_SP]
	mov	r5, r0
	bne	.fast_native_entry_exception
.fast_native_entry_get_handler:

	sub	ip, r7, r4
	mov	ip, ip, asr #2
	add	lr, ip, #4
	bic	lr, lr, #1

	add	r3, r4, #ISTATE_OOP_TEMP-76

	mov	r4, arm_sp
	sub	arm_sp, arm_sp, #16
	sub	arm_sp, arm_sp, lr, lsl #2
	mov	lr, arm_sp

	add	r1, r5, #24

	add	r2, r9, #THREAD_JNI_ENVIRONMENT
	str	r2, [lr], #4
	add	r1, r1, #4

	ldr	r2, [r11, #24]
	tst	r2, #8
	beq	.do_fast_copy_args

	ldr	r2, [r11, #12]
	ldr	r2, [r2, #16]
	ldr	r2, [r2, #60]
	str	r2, [r3]

	str	r3, [lr], #4
	add	r1, r1, #4

.do_fast_copy_args:
	cmp	ip, #0
	blt	.fast_no_args

.fast_copy_args:
	ldr	r0, [r1], #4
	ldrh	r3, [r0, #6]
	cmp	r3, #FFI_TYPE_DOUBLE
	cmpne	r3, #FFI_TYPE_SINT64
	beq	.fast_copy_long

	cmp	r3, #FFI_TYPE_POINTER
	beq	.fast_copy_ptr

	ldr	r2, [r7], #-4
	str	r2, [lr], #4
	subs	ip, ip, #1
	bge	.fast_copy_args
	b	.fast_no_args

.fast_copy_long:
	tst	lr, #4
	addne	lr, lr, #4
	ldmda	r7!, {r2, r3}
	stmia	lr!, {r2, r3}
	subs	ip, ip, #2
	bge	.fast_copy_args
	b	.fast_no_args

.fast_copy_ptr:
	ldr	r2, [r7], #-4
	cmp	r2, #0
	addne	r2, r7, #4
	str	r2, [lr], #4
	subs	ip, ip, #1
	bge	.fast_copy_args

.fast_no_args:
	ldr	r0, [r9, #THREAD_TOP_ZERO_FRAME]
	str	r0, [r9, #THREAD_LAST_JAVA_SP]

	mov	r2, #_thread_in_native
	str	r2, [r9, #THREAD_STATE]

	ldr	ip, [r11, #80]
	ldrh	r11, [r11, #42]
	ldmia	arm_sp!, {r0, r1, r2, r3}
	blx	ip

	mov	arm_sp, r4

	mov	r3, #_thread_in_native_trans
	str	r3, [r9, #THREAD_STATE]

	ldr	r3, [dispatch, #SafePointSynchronize_state_Address-XXX]

	ldr	r3, [r3, #0]
	cmp	r3, #0
	ldreq	r3, [r9, #THREAD_SUSPEND_FLAGS]
	cmpeq	r3, #0
	bne	.fast_native_entry_do_special

.fast_native_entry_do_return:
	mov	r3, #_thread_in_Java
	mov	r2, #0
	str	r3, [r9, #THREAD_STATE]
	str	r2, [r9, #THREAD_LAST_JAVA_SP]

	add	r2, r5, #24
	ldr	r3, [r5, #4]

	ldr	r5, [r9, #THREAD_TOP_ZERO_FRAME]
@	ldr	r11, [r5, #-72 + ISTATE_METHOD]

	ldr	lr, [r5], #4

	add	r5, r5, r11, lsl #2

	ldr	ip, [r2, r3, asl #2]
	ldrh	r2, [ip, #6]

	cmp	r2, #FFI_TYPE_POINTER
	beq	.fast_native_return_obj

	str	lr, [r9, #THREAD_TOP_ZERO_FRAME]		@ Defer dropping frame until after we have dealt with
					@ objects

	ldr	ip, [r9, #THREAD_ACTIVE_HANDLES]
	mov	r3, #0			@ ECN: OK, not an obj, save to clear handles
	str	r3, [ip, #128]

	cmp	r2, #FFI_TYPE_VOID
	beq	.fast_native_return_void
	cmp	r2, #FFI_TYPE_FLOAT
	cmpne	r2, #FFI_TYPE_SINT32
	beq	.fast_native_return_w
	cmp	r2, #FFI_TYPE_DOUBLE
	cmpne	r2, #FFI_TYPE_SINT64
	beq	.fast_native_return_dw

	cmp	r2, #FFI_TYPE_UINT16
	beq	.fast_native_return_char
	cmp	r2, #FFI_TYPE_SINT16
	beq	.fast_native_return_short
	cmp	r2, #FFI_TYPE_BOOL
	beq	.fast_native_return_bool
	cmp	r2, #FFI_TYPE_SINT8
	beq	.fast_native_return_byte

	str	r0, [r0, -r0]

.fast_native_return_dw:
	stmdb	r5!, {r0, r1}
	str	r5, [r9, #THREAD_JAVA_SP]
	b	.fast_native_exit
.fast_native_return_byte:
	mov	r0, r0, lsl #24
	mov	r0, r0, asr #24
	str	r0, [r5, #-4]!
	str	r5, [r9, #THREAD_JAVA_SP]
	b	.fast_native_exit
.fast_native_return_char:
	mov	r0, r0, lsl #16
	mov	r0, r0, lsr #16
	str	r0, [r5, #-4]!
	str	r5, [r9, #THREAD_JAVA_SP]
	b	.fast_native_exit
.fast_native_return_bool:
	ands	r0, r0, #255
	movne	r0, #1
	str	r0, [r5, #-4]!
	str	r5, [r9, #THREAD_JAVA_SP]
	b	.fast_native_exit

.fast_native_entry_throw_stack_overflow:
	str	r0, [r9, #THREAD_LAST_JAVA_SP]
	mov	r0, r9
	bl	_ZN18InterpreterRuntime24throw_StackOverflowErrorEP10JavaThread
	mov	r3, #0
	ldr	r1, [r9, #THREAD_PENDING_EXC]
	str	r3, [r9, #THREAD_LAST_JAVA_SP]
.fast_native_entry_exception:
	ldr	r5, [r9, #THREAD_TOP_ZERO_FRAME]
	ldr	r3, [r5], #4
	str	r3, [r9, #THREAD_TOP_ZERO_FRAME]

	ldrh	r3, [r11, #42]
	add	r5, r5, r3, lsl #2
	str	r5, [r9, #THREAD_JAVA_SP]
	b	.fast_native_exit

.fast_native_entry_do_special:
	stmdb	sp!, {r0, r1}
	mov	r0, r9
	bl	_ZN10JavaThread40check_special_condition_for_native_transEPS_
	ldmia	sp!, {r0, r1}
	b	.fast_native_entry_do_return

.fast_native_return_obj:
	cmp	r0, #0
	ldrne	r0, [r0]
	str	r0, [r5, #-4]!

	str	lr, [r9, #THREAD_TOP_ZERO_FRAME]		@ Defer dropping frame until after we have dealt with
					@ objects

	str	r5, [r9, #THREAD_JAVA_SP]
	ldr	r2, [r9, #THREAD_ACTIVE_HANDLES]
	mov	r3, #0			@ ECN: Now that the object is safe on the Java stack
	str	r3, [r2, #128]		@ stack, with the Thread SP updated, clear the active_handles.
	b	.fast_native_exit
.fast_native_return_short:
	mov	r0, r0, lsl #16
	mov	r0, r0, asr #16
.fast_native_return_w:
	str	r0, [r5, #-4]!
.fast_native_return_void:
	str	r5, [r9, #THREAD_JAVA_SP]
.fast_native_exit:
	ldr	r2, [istate, #ISTATE_STACK_LIMIT]
	sub	r5, r5, #4
	str	r5, [istate, #ISTATE_STACK]

	ldr	r1, [r9, #THREAD_TOP_ZERO_FRAME]
	add	r2, r2, #4
	str	r2, [r9, #THREAD_JAVA_SP]
	str	r1, [r9, #THREAD_LAST_JAVA_SP]
	ldr	r0, [istate, #ISTATE_THREAD]
	ldr	stack, [istate, #ISTATE_STACK]
	ldr	jpc, [istate, #ISTATE_BCP]
	ldr	r3, [r0, #THREAD_PENDING_EXC]
	DISPATCH_START	3
	ldr	constpool, [istate, #ISTATE_CONSTANTS]
	ldr	locals, [istate, #ISTATE_LOCALS]
	DISPATCH_NEXT
	add	constpool, constpool, #CONST_POOL_OFFSET
	DISPATCH_NEXT
	cmp	r3, #0
	DISPATCH_NEXT
	bne	invokespecial_exception_fix
	DISPATCH_FINISH

#include "bytecodes.s"

	Opcode	idiv

	POP2	r0, r1
int_div:
	cmp	r0, #0
	beq	.divc_0

        ands    a4, a1, #0x80000000
        rsbmi   a1, a1, #0
        eors    ip, a4, a2, ASR #32
        rsbcs   a2, a2, #0
	movs	a3, a1
.s_loop:
        cmp     a3, a2, LSR #8
        movls   a3, a3, LSL #8
        blo     .s_loop
        cmp     a3, a2, LSR #1
        bhi     .s_jump7
        cmp     a3, a2, LSR #2
        bhi     .s_jump6
        cmp     a3, a2, LSR #3
        bhi     .s_jump5
        cmp     a3, a2, LSR #4
        bhi     .s_jump4
        cmp     a3, a2, LSR #5
        bhi     .s_jump3
        cmp     a3, a2, LSR #6
        bhi     .s_jump2
        cmp     a3, a2, LSR #7
        bhi     .s_jump1
.s_loop2:
@ not executed when falling into .s_loop2
        movhi   a3, a3, LSR #8
        cmp     a2, a3, LSL #7
        adc     a4, a4, a4
        subcs   a2, a2, a3, LSL #7
        cmp     a2, a3, LSL #6
.s_jump1:
        adc     a4, a4, a4
        subcs   a2, a2, a3, LSL #6
        cmp     a2, a3, LSL #5
.s_jump2:
        adc     a4, a4, a4
        subcs   a2, a2, a3, LSL #5
        cmp     a2, a3, LSL #4
.s_jump3:
        adc     a4, a4, a4
        subcs   a2, a2, a3, LSL #4
        cmp     a2, a3, LSL #3
.s_jump4:
        adc     a4, a4, a4
        subcs   a2, a2, a3, LSL #3
        cmp     a2, a3, LSL #2
.s_jump5:
        adc     a4, a4, a4
        subcs   a2, a2, a3, LSL #2
        cmp     a2, a3, LSL #1
.s_jump6:
        adc     a4, a4, a4
        subcs   a2, a2, a3, LSL #1
.s_jump7:
        cmp     a2, a3
        adc     a4, a4, a4
        subcs   a2, a2, a3
        cmp     a3, a1
        bne     .s_loop2
	DISPATCH_START	1
        movs    ip, ip, lsl #1
	DISPATCH_NEXT
	rsbcs	a4, a4, #0
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	a4
	DISPATCH_FINISH

	Opcode	irem

	POP2	r0, r1
int_rem:
	cmp	r0, #0
	beq	.remc_0

        ands    a4, a1, #0x80000000
        rsbmi   a1, a1, #0
        eors    ip, a4, a2, ASR #32
        rsbcs   a2, a2, #0
	movs	a3, a1
.r_loop:
        cmp     a3, a2, LSR #8
        movls   a3, a3, LSL #8
        blo     .r_loop
        cmp     a3, a2, LSR #1
        bhi     .r_jump7
        cmp     a3, a2, LSR #2
        bhi     .r_jump6
        cmp     a3, a2, LSR #3
        bhi     .r_jump5
        cmp     a3, a2, LSR #4
        bhi     .r_jump4
        cmp     a3, a2, LSR #5
        bhi     .r_jump3
        cmp     a3, a2, LSR #6
        bhi     .r_jump2
        cmp     a3, a2, LSR #7
        bhi     .r_jump1
.r_loop2:
@ not executed when falling into .r_loop2
        movhi   a3, a3, LSR #8
        cmp     a2, a3, LSL #7
        adc     a4, a4, a4
        subcs   a2, a2, a3, LSL #7
        cmp     a2, a3, LSL #6
.r_jump1:
        adc     a4, a4, a4
        subcs   a2, a2, a3, LSL #6
        cmp     a2, a3, LSL #5
.r_jump2:
        adc     a4, a4, a4
        subcs   a2, a2, a3, LSL #5
        cmp     a2, a3, LSL #4
.r_jump3:
        adc     a4, a4, a4
        subcs   a2, a2, a3, LSL #4
        cmp     a2, a3, LSL #3
.r_jump4:
        adc     a4, a4, a4
        subcs   a2, a2, a3, LSL #3
        cmp     a2, a3, LSL #2
.r_jump5:
        adc     a4, a4, a4
        subcs   a2, a2, a3, LSL #2
        cmp     a2, a3, LSL #1
.r_jump6:
        adc     a4, a4, a4
        subcs   a2, a2, a3, LSL #1
.r_jump7:
        cmp     a2, a3
        adc     a4, a4, a4
        subcs   a2, a2, a3
        cmp     a3, a1
        bne     .r_loop2
	DISPATCH_START	1
        movs    ip, ip, lsl #1
	rsbmi	a2, a2, #0
	PUSH	a2
	DISPATCH_FINISH

@ ip = branch offset
@ r0 = 1st bytecode
@ jpc has been updated
	Opcode	goto_safe
        ldrsb   r1, [jpc, #1]
        ldrb    ip, [jpc, #2]
        orr     ip, ip, r1, lsl #8
        DISPATCH_START_REG	ip
branch_taken:
	cmp	ip, #0
	bgt	branch_no_check

	ldr	r3, [dispatch, #SafePointSynchronize_state_Address-XXX]
	ldr	r1, [r3]
	cmp	r1, #1
	bne	branch_no_check

	ldr	r3, [istate, #ISTATE_THREAD]
	mov	r0, sp
	str	r3, [sp]
	bl	_ZN17HandleMarkCleanerD1Ev
	ldr	r0, [istate, #ISTATE_THREAD]
	str	jpc, [istate, #ISTATE_BCP]
	str	stack, [istate, #ISTATE_STACK]
	bl	_ZN20SafepointSynchronize5blockEP10JavaThread
	ldr	r0, [istate, #ISTATE_THREAD]
	ldr	stack, [istate, #ISTATE_STACK]
	ldr	r3, [r0, #THREAD_PENDING_EXC]
	ldr	jpc, [istate, #ISTATE_BCP]
	cmp	r3, #0
	ldr	locals, [istate, #ISTATE_LOCALS]
	bne	handle_exception
	DISPATCH_START	0
branch_no_check:
	DISPATCH_BYTECODE

	Opcode	ifeq_safe
	Opcode	ifnull_safe
        POP     r3
        ldrsb   r1, [jpc, #1]
        ldrb    ip, [jpc, #2]
        cmp     r3, #0
        orreq   ip, ip, r1, lsl #8
        ldreqb  r0, [jpc, ip]!
        ldrneb  r0, [jpc, #3]!
	beq	branch_taken
	DISPATCH_BYTECODE

	Opcode	ifne_safe
	Opcode	ifnonnull_safe
        POP     r3
        ldrsb   r1, [jpc, #1]
        ldrb    ip, [jpc, #2]
        cmp     r3, #0
        orrne   ip, ip, r1, lsl #8
        ldrneb  r0, [jpc, ip]!
        ldreqb  r0, [jpc, #3]!
	bne	branch_taken
	DISPATCH_BYTECODE

	Opcode	iflt_safe
        POP     r3
        ldrsb   r1, [jpc, #1]
        ldrb    ip, [jpc, #2]
        cmp     r3, #0
        orrlt   ip, ip, r1, lsl #8
        ldrltb  r0, [jpc, ip]!
        ldrgeb  r0, [jpc, #3]!
	blt	branch_taken
	DISPATCH_BYTECODE

	Opcode	ifge_safe
        POP     r3
        ldrsb   r1, [jpc, #1]
        ldrb    ip, [jpc, #2]
        cmp     r3, #0
        orrge   ip, ip, r1, lsl #8
        ldrgeb  r0, [jpc, ip]!
        ldrltb  r0, [jpc, #3]!
	bge	branch_taken
	DISPATCH_BYTECODE

	Opcode	ifgt_safe
        POP     r3
        ldrsb   r1, [jpc, #1]
        ldrb    ip, [jpc, #2]
        cmp     r3, #0
        orrgt   ip, ip, r1, lsl #8
        ldrgtb  r0, [jpc, ip]!
        ldrleb  r0, [jpc, #3]!
	bgt	branch_taken
	DISPATCH_BYTECODE

	Opcode	ifle_safe
        POP     r3
        ldrsb   r1, [jpc, #1]
        ldrb    ip, [jpc, #2]
        cmp     r3, #0
        orrle   ip, ip, r1, lsl #8
        ldrleb  r0, [jpc, ip]!
        ldrgtb  r0, [jpc, #3]!
	ble	branch_taken
	DISPATCH_BYTECODE

	Opcode	if_icmpeq_safe
	Opcode	if_acmpeq_safe
        POP2    r2, r3
        ldrsb   r1, [jpc, #1]
        ldrb    ip, [jpc, #2]
        cmp     r3, r2
        orreq   ip, ip, r1, lsl #8
        ldreqb  r0, [jpc, ip]!
        ldrneb  r0, [jpc, #3]!
	beq	branch_taken
	DISPATCH_BYTECODE

	Opcode	if_icmpne_safe
	Opcode	if_acmpne_safe
        POP2    r2, r3
        ldrsb   r1, [jpc, #1]
        ldrb    ip, [jpc, #2]
        cmp     r3, r2
        orrne   ip, ip, r1, lsl #8
        ldrneb  r0, [jpc, ip]!
        ldreqb  r0, [jpc, #3]!
	bne	branch_taken
	DISPATCH_BYTECODE

	Opcode	if_icmplt_safe
        POP2    r2, r3
        ldrsb   r1, [jpc, #1]
        ldrb    ip, [jpc, #2]
        cmp     r3, r2
        orrlt   ip, ip, r1, lsl #8
        ldrltb  r0, [jpc, ip]!
        ldrgeb  r0, [jpc, #3]!
	blt	branch_taken
	DISPATCH_BYTECODE

	Opcode	if_icmpge_safe
        POP2    r2, r3
        ldrsb   r1, [jpc, #1]
        ldrb    ip, [jpc, #2]
        cmp     r3, r2
        orrge   ip, ip, r1, lsl #8
        ldrgeb  r0, [jpc, ip]!
        ldrltb  r0, [jpc, #3]!
	bge	branch_taken
	DISPATCH_BYTECODE

	Opcode	if_icmpgt_safe
        POP2    r2, r3
        ldrsb   r1, [jpc, #1]
        ldrb    ip, [jpc, #2]
        cmp     r3, r2
        orrgt   ip, ip, r1, lsl #8
        ldrgtb  r0, [jpc, ip]!
        ldrleb  r0, [jpc, #3]!
	bgt	branch_taken
	DISPATCH_BYTECODE

	Opcode	if_icmple_safe
        POP2    r2, r3
        ldrsb   r1, [jpc, #1]
        ldrb    ip, [jpc, #2]
        cmp     r3, r2
        orrle   ip, ip, r1, lsl #8
        ldrleb  r0, [jpc, ip]!
        ldrgtb  r0, [jpc, #3]!
	ble	branch_taken
	DISPATCH_BYTECODE

	Opcode	ireturn_safe
	Opcode	freturn_safe
	Opcode	lreturn_safe
	Opcode	dreturn_safe
	Opcode	areturn_safe
	Opcode	return_safe
	ldr	r3, [dispatch, #SafePointSynchronize_state_Address-XXX]
	ldr	r1, [r3]
	cmp	r1, #1
	bne	handle_return
	ldr	r3, [istate, #ISTATE_THREAD]
	mov	r0, sp
	str	r3, [sp]
	bl	_ZN17HandleMarkCleanerD1Ev
	ldr	r0, [istate, #ISTATE_THREAD]
	str	jpc, [istate, #ISTATE_BCP]
	str	stack, [istate, #ISTATE_STACK]
	bl	_ZN20SafepointSynchronize5blockEP10JavaThread
	ldr	r0, [istate, #ISTATE_THREAD]
	ldr	stack, [istate, #ISTATE_STACK]
	ldr	jpc, [istate, #ISTATE_BCP]
	ldr	r3, [r0, #THREAD_PENDING_EXC]
	ldr	locals, [istate, #ISTATE_LOCALS]
	cmp	r3, #0
	beq	handle_return
	b	handle_exception

resolve_putstatic:
	mov	r1, #179
	sub	jpc, jpc, #3
        ldr     r0, [istate, #ISTATE_THREAD]
        str     jpc, [istate, #ISTATE_BCP]
        str     stack, [istate, #ISTATE_STACK]
       	bl      _ZN18InterpreterRuntime15resolve_get_putEP10JavaThreadN9Bytecodes4CodeE
        ldr     r0, [istate, #ISTATE_THREAD]
        ldr     stack, [istate, #ISTATE_STACK]
        ldr     r3, [r0, #THREAD_PENDING_EXC]
        ldr     jpc, [istate, #ISTATE_BCP]
        cmp     r3, #0
	ldr	constpool, [istate, #ISTATE_CONSTANTS]
	add	constpool, constpool, #CONST_POOL_OFFSET
        ldr     locals, [istate, #ISTATE_LOCALS]
        bne     getfield_exception
        ldrb    r3, [jpc, #1]
        ldrb    r2, [jpc, #2]
        DISPATCH_START	3
        orr     r3, r3, r2, lsl #8      @ r3 = index
	add	tmp2, constpool, r3, lsl #4	@ tmp2 = cache
	DISPATCH_NEXT
        ldr     r3, [tmp2, #4]            @ r3 = object
        ldr     lr, [tmp2, #12]           @ lr = tos_type
        ldr     r2, [tmp2, #8]            @ r2 = offset
        movs    lr, lr, lsr #29
        bhi     putstatic_w             @ C = 1, Z = 0 => R2 == 3, 5, 7
        bcs     putstatic_h             @ C = 1 => R2 = 1
        beq     putstatic_sb            @ Z = 1 => R2 = 0
        tst     lr, #2
        bne     putstatic_dw
        b       putstatic_sh

resolve_getstatic:
	mov	r1, #178
	sub	jpc, jpc, #3
        ldr     r0, [istate, #ISTATE_THREAD]
        str     jpc, [istate, #ISTATE_BCP]
        str     stack, [istate, #ISTATE_STACK]
       	bl      _ZN18InterpreterRuntime15resolve_get_putEP10JavaThreadN9Bytecodes4CodeE
        ldr     r0, [istate, #ISTATE_THREAD]
        ldr     stack, [istate, #ISTATE_STACK]
        ldr     r3, [r0, #THREAD_PENDING_EXC]
        ldr     jpc, [istate, #ISTATE_BCP]
        cmp     r3, #0
	ldr	constpool, [istate, #ISTATE_CONSTANTS]
	add	constpool, constpool, #CONST_POOL_OFFSET
        ldr     locals, [istate, #ISTATE_LOCALS]
        bne     getfield_exception
        ldrb    r3, [jpc, #1]
        ldrb    r2, [jpc, #2]
        DISPATCH_START	3
        orr     r3, r3, r2, lsl #8      @ r3 = index
	add	tmp2, constpool, r3, lsl #4	@ tmp2 = cache
	DISPATCH_NEXT
        ldr     r3, [tmp2, #4]
        ldr     r2, [tmp2, #12]
        ldr     lr, [tmp2, #8]
        movs    r2, r2, lsr #29
        bhi     getstatic_w             @ C = 1, Z = 0 => R2 == 3, 5, 7
        bcs     getstatic_h             @ C = 1 => R2 = 1
        beq     getstatic_sb            @ Z = 1 => R2 = 0
        tst     r2, #2
        bne     getstatic_dw
        b       getstatic_sh

resolve_putfield:
	mov	r1, #181
	b	resolve_get_put
resolve_getfield:
	mov	r1, #180
resolve_get_put:
	mov	tmp1, lr
        ldr     r0, [istate, #ISTATE_THREAD]
        str     jpc, [istate, #ISTATE_BCP]
        str     stack, [istate, #ISTATE_STACK]
       	bl      _ZN18InterpreterRuntime15resolve_get_putEP10JavaThreadN9Bytecodes4CodeE
        ldr     r0, [istate, #ISTATE_THREAD]
        ldr     stack, [istate, #ISTATE_STACK]
        ldr     r3, [r0, #THREAD_PENDING_EXC]
        ldr     jpc, [istate, #ISTATE_BCP]
        cmp     r3, #0
	ldr	constpool, [istate, #ISTATE_CONSTANTS]
	add	constpool, constpool, #CONST_POOL_OFFSET
        ldr     locals, [istate, #ISTATE_LOCALS]
        bne     getfield_exception
@ Now restart the getfield
        ldrb    r3, [jpc, #1]
        ldrb    r2, [jpc, #2]
        orr     r3, r3, r2, lsl #8      @ r3 = index
	add	tmp2, constpool, r3, lsl #4	@ tmp2 = cache
	bx	tmp1

accessor_non_w:
	bcs	accessor_h
	beq	accessor_sb
	tst	r0, #2
	bne	accessor_dw
accessor_sh:
	ldrsh	r0, [r3, r1]
	str	r0, [ip, #0]
	bx	lr
accessor_h:
	ldrh	r0, [r3, r1]
	str	r0, [ip, #0]
	bx	lr
accessor_sb:
	ldrsb	r0, [r3, r1]
	str	r0, [ip, #0]
	bx	lr
accessor_dw:
	add	r0, r3, r1
	ldm	r0, {r0, r1}
	sub	ip, ip, #4
	str	ip, [r2, #THREAD_JAVA_SP]
	stmia	ip, {r0, r1}
	bx	lr

	Opcode	getfield
        add     tmp2, constpool, r1, lsl #12
        ldr     r3, [tmp2, r2, lsl #4]! @ tmp2 = cache, r3 = flags
        and     r3, r3, #0x00ff0000
        cmp     r3, #180 << 16
        blne     resolve_getfield

        ldr     r2, [tmp2, #12]
        movs    r2, r2, lsr #29
	movhi	r0, #opc_igetfield
        bls     getfield_non_w
rewrite_bytecode:
	strb	r0, [jpc]
	DISPATCH_BYTECODE

getfield_non_w:
        bcs     getfield_h              @ C = 1 => R2 = 1
        beq     getfield_sb             @ Z = 1 => R2 = 0
        tst     r2, #2
        bne     getfield_dw
getfield_sh:
	mov	r0, #opc_sgetfield
	b	rewrite_bytecode
getfield_h:
	mov	r0, #opc_cgetfield
	b	rewrite_bytecode
getfield_sb:
	mov	r0, #opc_bgetfield
	b	rewrite_bytecode
getfield_dw:
	mov	r0, #opc_lgetfield
	b	rewrite_bytecode

	Opcode	putfield
        add     tmp2, constpool, r1, lsl #12
        ldr     r3, [tmp2, r2, lsl #4]! @ tmp2 = cache, r3 = flags
        and     r3, r3, #0xff000000
        cmp     r3, #181 << 24
        blne     resolve_putfield

        ldr     r2, [tmp2, #12]
        movs    r2, r2, lsr #29
	bls	putfield_non_w
	mov	r0, #opc_iputfield
	cmp	r2, #tos_atos >> 1
	moveq	r0, #opc_aputfield
	b	rewrite_bytecode

putfield_non_w:
	bcs	putfield_h
	beq	putfield_sb
	tst	r2, #2
	bne	putfield_dw
putfield_sh:
putfield_h:
	mov	r0, #opc_cputfield
	b	rewrite_bytecode
putfield_sb:
	mov	r0, #opc_bputfield
	b	rewrite_bytecode
putfield_dw:
	mov	r0, #opc_lputfield
	b	rewrite_bytecode
putfield_a:
	mov	r0, #opc_aputfield
	b	rewrite_bytecode

getstatic_sh:
	DISPATCH_STATE	2
	ldrsh	tmp2, [r3, lr]
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
getstatic_h:
	DISPATCH_STATE	2
	ldrh	tmp2, [r3, lr]
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
getstatic_sb:
	DISPATCH_STATE	2
	ldrsb	tmp2, [r3, lr]
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
getstatic_dw:
	DISPATCH_STATE	2
	add	r3, r3, lr
	ldm	r3, {r2, tmp2}
	DISPATCH_NEXT
	PUSH2	r2, tmp2
	DISPATCH_FINISH
getstatic_w:
	DISPATCH_STATE	2
	ldr	tmp2, [r3, lr]
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH

putstatic_sh:
putstatic_h:
	DISPATCH_STATE	2
	POP	tmp2
	DISPATCH_NEXT
	strh	tmp2, [r3, r2]
	DISPATCH_FINISH
putstatic_w:
	DISPATCH_STATE	2
	cmp	lr, #tos_atos >> 1	@ >> 1 due to lsr #29 above
	beq	putstatic_a
	POP	tmp2
	DISPATCH_NEXT
	str	tmp2, [r3, r2]
	DISPATCH_FINISH
putstatic_sb:
	DISPATCH_STATE	2
	POP	tmp2
	DISPATCH_NEXT
	strb	tmp2, [r3, r2]
	DISPATCH_FINISH
putstatic_dw:
	DISPATCH_STATE	2
	add	r2, r2, r3
	POP2	r3, tmp2
	DISPATCH_NEXT
	stm	r2, {r3, tmp2}
	DISPATCH_FINISH
putstatic_a:
	POP	r1			@ r1 = value
	add	r0, r3, r2
	PUSH	r3
       	bl      oop_store
    ldr	r3, [dispatch, #Universe_collectedHeap_Address-XXX]
	DISPATCH_START	0
	POP	r2
    ldr	r3, [r3]
	DISPATCH_NEXT
    ldr	r3, [r3, #12]
	DISPATCH_NEXT
        mov     tmp2, #0
    ldr	r3, [r3, #76]
        strb    tmp2, [r3, r2, lsr #9]
	DISPATCH_FINISH


resolve_invokevirtual:
	mov	tmp1, lr
	mov	r1, #182
	ldr	r0, [istate, #ISTATE_THREAD]
	str	jpc, [istate, #ISTATE_BCP]
	str	stack, [istate, #ISTATE_STACK]
	bl	_ZN18InterpreterRuntime14resolve_invokeEP10JavaThreadN9Bytecodes4CodeE
	ldr	r0, [istate, #ISTATE_THREAD]
	ldr	stack, [istate, #ISTATE_STACK]
	ldr	r3, [r0, #THREAD_PENDING_EXC]
	ldr	jpc, [istate, #ISTATE_BCP]
	cmp	r3, #0
	ldr	constpool, [istate, #ISTATE_CONSTANTS]
	add	constpool, constpool, #CONST_POOL_OFFSET
	ldr	locals, [istate, #ISTATE_LOCALS]
	bne	invokevirtual_exception

        ldrb    r3, [jpc, #1]
        ldrb    r2, [jpc, #2]
        orr     r3, r3, r2, lsl #8      @ r3 = index
	add	r0, constpool, r3, lsl #4	@ r1 = cache
	bx	tmp1

resolve_invokestatic:
	mov	tmp1, lr
	mov	r1, #184
	ldr	r0, [istate, #ISTATE_THREAD]
	str	jpc, [istate, #ISTATE_BCP]
	str	stack, [istate, #ISTATE_STACK]
	bl	_ZN18InterpreterRuntime14resolve_invokeEP10JavaThreadN9Bytecodes4CodeE
	ldr	r0, [istate, #ISTATE_THREAD]
	ldr	stack, [istate, #ISTATE_STACK]
	ldr	r3, [r0, #4]
	ldr	jpc, [istate, #ISTATE_BCP]
	cmp	r3, #0
	ldr	constpool, [istate, #ISTATE_CONSTANTS]
	add	constpool, constpool, #CONST_POOL_OFFSET
	ldr	locals, [istate, #ISTATE_LOCALS]
	bne	invokestatic_exception

        ldrb    r3, [jpc, #1]
        ldrb    r2, [jpc, #2]
        orr     r3, r3, r2, lsl #8      @ r3 = index
	add	r0, constpool, r3, lsl #4	@ r1 = cache
	bx	tmp1

resolve_invokespecial:
	mov	tmp1, lr
	mov	r1, #183
	ldr	r0, [istate, #ISTATE_THREAD]
	str	jpc, [istate, #ISTATE_BCP]
	str	stack, [istate, #ISTATE_STACK]
	bl	_ZN18InterpreterRuntime14resolve_invokeEP10JavaThreadN9Bytecodes4CodeE
	ldr	r0, [istate, #ISTATE_THREAD]
	ldr	stack, [istate, #ISTATE_STACK]
	ldr	r3, [r0, #THREAD_PENDING_EXC]
	ldr	jpc, [istate, #ISTATE_BCP]
	cmp	r3, #0
	ldr	constpool, [istate, #ISTATE_CONSTANTS]
	add	constpool, constpool, #CONST_POOL_OFFSET
	ldr	locals, [istate, #ISTATE_LOCALS]
	bne	invokespecial_exception

        ldrb    r3, [jpc, #1]
        ldrb    r2, [jpc, #2]
        orr     r3, r3, r2, lsl #8      @ r3 = index
	add	r0, constpool, r3, lsl #4	@ r1 = cache
	bx	tmp1

	Opcode	invokeinterface
	ldrb	r1, [jpc, #2]	@ zero_extendqisi2
	ldrb	r3, [jpc, #1]	@ zero_extendqisi2
	mov	r0, constpool
	orr	r3, r3, r1, asl #8
	ldr	r2, [r0, r3, asl #4]
	mov	tmp1, r3, asl #4
	add	r0, r0, tmp1
	mov	r2, r2, asr #16
	and	r2, r2, #255
	cmp	r2, #185
	beq	.invokeinterface_1
	str	jpc, [istate, #ISTATE_BCP]
	str	stack, [istate, #ISTATE_STACK]
	ldr	r0, [istate, #ISTATE_THREAD]
	mov	r1, #185
	bl	_ZN18InterpreterRuntime14resolve_invokeEP10JavaThreadN9Bytecodes4CodeE
	ldr	r0, [istate, #ISTATE_THREAD]
	ldr	constpool, [istate, #ISTATE_CONSTANTS]
	add	constpool, constpool, #CONST_POOL_OFFSET
	ldr	stack, [istate, #ISTATE_STACK]
	ldr	r3, [r0, #THREAD_PENDING_EXC]
	ldr	jpc, [istate, #ISTATE_BCP]
	cmp	r3, #0
	ldr	locals, [istate, #ISTATE_LOCALS]
	bne	handle_exception
	mov	r3, constpool
	add	r0, r3, tmp1
.invokeinterface_1:
	ldr	r3, [r0, #12]
	ands	tmp_vvv, r3, #16777216
	bne	.invokeinterface_6
	ldr	lr, [r0, #4]
	ldr	r3, [r0, #12]
	and	r3, r3, #255
	ldr	r3, [stack, r3, asl #2]
	cmp	r3, #0
	beq	null_ptr_exception
	ldr	sl, [r3, #4]
	add	r3, sl, #8
	add	tmp1, sl, #304
	ldr	r2, [r3, #224]
	ldr	ip, [r3, #228]
	add	r2, r2, #1
	bic	r2, r2, #1
	cmp	ip, #0
	mov	r3, r2, asl #2
	add	r1, tmp1, r3
	movle	r2, tmp_vvv
	ble	.invokeinterface_4
	ldr	r3, [tmp1, r2, asl #2]
	cmp	lr, r3
	movne	r2, tmp_vvv
	bne	.invokeinterface_3
	b	.invokeinterface_5
.invokeinterface_2:
	ldr	r3, [r1, #0]
	cmp	lr, r3
	beq	.invokeinterface_5
.invokeinterface_3:
	add	r2, r2, #1
	cmp	r2, ip
	add	r1, r1, #8
	blt	.invokeinterface_2
.invokeinterface_4:
	cmp	r2, ip
	beq	incompatibleclass_exception
.invokeinterface_5:
	ldr	r3, [r0, #8]
	ldr	r2, [r1, #4]
	mov	r3, r3, asl #2
	add	r3, sl, r3
	ldr	r0, [r3, r2]
	cmp	r0, #0
	bne	.invokeinterface_7
abstractmethod_exception:
	mov	r0, #VMSYMBOLS_AbstractMethodError
	b	raise_exception
incompatibleclass_exception:
	mov	r0, #VMSYMBOLS_IncompatibleClassChangeError
	b	raise_exception

.invokeinterface_6:
	ldr	r3, [r0, #12]
	mov	r1, stack
	and	r3, r3, #255
	ldr	r2, [stack, r3, asl #2]
	cmp	r2, #0
	beq	null_ptr_exception
	ldr	r3, [r0, #12]
	tst	r3, #67108864
	ldreq	r3, [r0, #12]
	ldreq	r2, [r0, #8]
	andeq	r3, r3, #255
	ldrne	r0, [r0, #8]
	ldreq	r1, [stack, r3, asl #2]
	moveq	r2, r2, asl #2
	ldreq	r3, [r1, #4]
	addeq	r3, r3, r2
	ldreq	r0, [r3, #304]
.invokeinterface_7:
	str	r0, [istate, #ISTATE_CALLEE]
	ldr	r3, [r0, #76]
	mov	r1, #0
	str	r3, [istate, #36]
	str	stack, [istate, #ISTATE_STACK]
	str	jpc, [istate, #ISTATE_BCP]
	ldr	lr, [istate, #ISTATE_THREAD]
	str	r1, [lr, #THREAD_LAST_JAVA_SP]
	ldr	r3, [istate, #ISTATE_STACK]
	add	r3, r3, #4
	str	r3, [lr, #THREAD_JAVA_SP]
	ldr	ip, [istate, #36]
	ldr	r2, [istate, #ISTATE_THREAD]
	mov	r1, ip
	ldr	ip, [ip]
	blx	ip
	ldr	ip, [istate, #ISTATE_THREAD]
	ldr	r3, [ip, #THREAD_JAVA_SP]
	ldr	r2, [istate, #ISTATE_STACK_LIMIT]
	sub	r3, r3, #4
	str	r3, [istate, #ISTATE_STACK]
	ldr	r1, [ip, #THREAD_TOP_ZERO_FRAME]
	add	r2, r2, #4
	str	r2, [ip, #THREAD_JAVA_SP]
	str	r1, [ip, #THREAD_LAST_JAVA_SP]
	ldr	r0, [istate, #ISTATE_THREAD]
	ldr	stack, [istate, #ISTATE_STACK]
	ldr	jpc, [istate, #ISTATE_BCP]
	ldr	r3, [r0, #THREAD_PENDING_EXC]
	ldr	locals, [istate, #ISTATE_LOCALS]
	cmp	r3, #0
	bne	handle_exception
invokeinterface_exit:
	ldr	constpool, [istate, #ISTATE_CONSTANTS]
	add	constpool, constpool, #CONST_POOL_OFFSET
	DISPATCH	5

	Opcode	new
	ldrb	ip, [jpc, #1]	@ zero_extendqisi2
	ldrb	r2, [jpc, #2]	@ zero_extendqisi2
	ldr	r3, [istate, #ISTATE_METHOD]
	orr	r2, r2, ip, asl #8
	ldr	lr, [r3, #12]
	mov	r2, r2, asl #16
	ldr	r1, [lr, #8]
	add	r1, r1, #12
	ldrb	r3, [r1, r2, lsr #16]	@ zero_extendqisi2
	mov	r2, r2, lsr #16
	and	r3, r3, #255
	str	r2, [sp, #52]
	cmp	r3, #104
	cmpne	r3, #100
	beq	.new_1
	mov	r3, r2, asl #2
	add	r3, lr, r3
	ldr	r3, [r3, #32]
	add	r1, r3, #8
	str	r3, [sp, #84]
	str	r1, [sp, #88]
	ldr	r3, [r1, #216]
	cmp	r3, #5
	beq	.new_2
.new_1:
	ldr	r3, [istate, #ISTATE_METHOD]
	str	jpc, [istate, #ISTATE_BCP]
	str	stack, [istate, #ISTATE_STACK]
	ldr	r0, [istate, #ISTATE_THREAD]
	ldr	r1, [r3, #12]
	ldr	r2, [sp, #52]
	bl	_ZN18InterpreterRuntime4_newEP10JavaThreadP19constantPoolOopDesci
	ldr	r0, [istate, #ISTATE_THREAD]
	ldr	stack, [istate, #ISTATE_STACK]
	ldr	ip, [r0, #THREAD_PENDING_EXC]
	ldr	jpc, [istate, #ISTATE_BCP]
	cmp	ip, #0
	ldr	constpool, [istate, #ISTATE_CONSTANTS]
	add	constpool, constpool, #CONST_POOL_OFFSET
	ldr	locals, [istate, #ISTATE_LOCALS]
	beq	new_exit
	b	handle_exception
.new_2:
	ldr	r3, [r1, #4]
	tst	r3, #1
	bne	.new_1
	mov	fp, r3, asr #2
	ldr	r3, [dispatch, #UseTLAB_Address-XXX]
	ldr	r2, [dispatch, #ZeroTLAB_Address-XXX]
	ldrb	r1, [r3]
	cmp	r1, #0
	ldrb	r0, [r2]
	bne	.new_9
.new_3:
	mov	tmp_vvv, fp, asl #2
.new_4:
	ldr	r2, [dispatch, #Universe_collectedHeap_Address-XXX]
	str	r2, [sp, #20]
.new_5:
	ldr	r1, [sp, #20]
	ldr	r2, [r1, #0]
	mov	r0, r2
	ldr	r3, [r2, #UNIVERSE_VTABLE]
	ldr	ip, [r3, #UNIVERSE_VTABLE_TOP_ADDR]
	blx	ip
	ldr	r3, [sp, #20]
	ldr	r2, [r3, #0]
	ldr	r3, [r2, #UNIVERSE_VTABLE]
	ldr	tmp_xxx, [r0, #0]
	mov	r0, r2
	ldr	ip, [r3, #UNIVERSE_VTABLE_END_ADDR]
	blx	ip
	add	sl, tmp_xxx, tmp_vvv
	ldr	r3, [r0, #0]
	cmp	sl, r3
	bhi	.new_1
	ldr	ip, [sp, #20]
	ldr	r3, [ip, #0]
	mov	r0, r3
	ldr	r2, [r3, #UNIVERSE_VTABLE]
	ldr	ip, [r2, #UNIVERSE_VTABLE_TOP_ADDR]
	blx	ip
	mov	r2, tmp_xxx
	mov	r1, r0
	mov	r0, sl
	bl	_ZN6Atomic11cmpxchg_ptrEPvPVvS0_
	cmp	r0, tmp_xxx
	bne	.new_5
	subs	tmp_xxx, r0, #0
	beq	.new_1
.new_6:
	subs	r2, fp, #2
	bne	.new_10
.new_7:
	ldr	r3, [dispatch, #UseBiasedLocking_Address-XXX]
	ldrb	r1, [r3]
	cmp	r1, #0
	moveq	r3, #1
	ldrne	r0, [sp, #88]
	streq	r3, [tmp_xxx, #0]
	ldrne	r3, [r0, #96]
	add	r0, tmp_xxx, #4
	strne	r3, [tmp_xxx, #0]
	ldr	r3, [dispatch, #always_do_update_barrier_Address-XXX]
	ldrb	r1, [r3]	@ zero_extendqisi2
	cmp	r1, #0
	ldreq	r2, [sp, #84]
	streq	r2, [tmp_xxx, #4]
	beq	.new_8
	ldr	r1, [sp, #84]
	bl	oop_store
.new_8:
	str	tmp_xxx, [stack], #-4
	b	new_exit_1
.new_9:
	ldr	r1, [istate, #ISTATE_THREAD]
	ldr	r2, [r1, #THREAD_TLAB_TOP]
	ldr	r3, [r1, #THREAD_TLAB_END]
	rsb	r3, r2, r3
	cmp	fp, r3, lsr #2
	bhi	.new_3
	cmp	r2, #0
	mov	tmp_vvv, fp, asl #2
	add	r3, r2, tmp_vvv
	mov	tmp_xxx, r2
	str	r3, [r1, #THREAD_TLAB_TOP]
	beq	.new_4
	cmp	r0, #0
	bne	.new_7
	b	.new_6
.new_10:
	mov	r2, r2, asl #2
	add	r0, tmp_xxx, #8
	mov	r1, #0
	bl	memset
	b	.new_7
new_exit:
	ldr	r2, [r0, #THREAD_VM_RESULT]
	str	r2, [stack], #-4
	ldr	r3, [istate, #ISTATE_THREAD]
	str	ip, [r3, #THREAD_VM_RESULT]
new_exit_1:
	ldr	locals, [istate, #ISTATE_LOCALS]
	ldr	constpool, [istate, #ISTATE_CONSTANTS]
	add	constpool, constpool, #CONST_POOL_OFFSET
	DISPATCH	3

bytecode_interpreter_str:
	.ascii  "[Bytecode Interpreter]\000"
	ALIGN_WORD

	Opcode	newarray
	ldrb	r1, [jpc, #1]	@ zero_extendqisi2
	ldr	r2, [stack, #4]
	ldr	r0, [istate, #ISTATE_THREAD]
	str	jpc, [istate, #ISTATE_BCP]
	str	stack, [istate, #ISTATE_STACK]
	bl	_ZN18InterpreterRuntime8newarrayEP10JavaThread9BasicTypei
	ldr	r0, [istate, #ISTATE_THREAD]
	ldr	stack, [istate, #ISTATE_STACK]
	ldr	ip, [r0, #THREAD_PENDING_EXC]
	ldr	jpc, [istate, #ISTATE_BCP]
	cmp	ip, #0
	ldr	constpool, [istate, #ISTATE_CONSTANTS]
	add	constpool, constpool, #CONST_POOL_OFFSET
	ldr	locals, [istate, #ISTATE_LOCALS]
	bne	handle_exception
	ldr	r2, [r0, #THREAD_VM_RESULT]
	str	r2, [stack, #4]
	ldr	r3, [istate, #ISTATE_THREAD]
	str	ip, [r3, #THREAD_VM_RESULT]
	DISPATCH	2

	Opcode	anewarray
	ldrb	r0, [jpc, #1]	@ zero_extendqisi2
	ldr	r3, [stack, #4]
	ldr	lr, [istate, #ISTATE_METHOD]
	ldrb	r2, [jpc, #2]	@ zero_extendqisi2
	orr	r2, r2, r0, asl #8
	str	jpc, [istate, #ISTATE_BCP]
	str	stack, [istate, #ISTATE_STACK]
	ldr	r1, [lr, #12]
	ldr	r0, [istate, #ISTATE_THREAD]
	bl	_ZN18InterpreterRuntime9anewarrayEP10JavaThreadP19constantPoolOopDescii
	ldr	r0, [istate, #ISTATE_THREAD]
	ldr	stack, [istate, #ISTATE_STACK]
	ldr	ip, [r0, #THREAD_PENDING_EXC]
	ldr	jpc, [istate, #ISTATE_BCP]
	cmp	ip, #0
	ldr	constpool, [istate, #ISTATE_CONSTANTS]
	add	constpool, constpool, #CONST_POOL_OFFSET
	ldr	locals, [istate, #ISTATE_LOCALS]
	bne	handle_exception
	ldr	r2, [r0, #THREAD_VM_RESULT]
	str	r2, [stack, #4]
	ldr	r3, [istate, #ISTATE_THREAD]
	str	ip, [r3, #THREAD_VM_RESULT]
	DISPATCH	3

	Opcode	arraylength
	ldr	r3, [stack, #4]
	cmp	r3, #0
	beq	null_ptr_exception
	ldr	r1, [r3, #8]
	str	r1, [stack, #4]
	DISPATCH	1

	Opcode	athrow
	ldr	r1, [stack, #4]
	cmp	r1, #0
	beq	null_ptr_exception
	mov	r2, #0
	ldr	r0, [istate, #ISTATE_THREAD]
	mov	r3, r2
	bl	_ZN12ThreadShadow21set_pending_exceptionEP7oopDescPKci
	b	handle_exception

	Opcode	checkcast
	ldr	r3, [stack, #4]
	cmp	r3, #0
	beq	.checkcast_exit
	ldrb	sl, [jpc, #2]	@ zero_extendqisi2
	ldrb	tmp_xxx, [jpc, #1]	@ zero_extendqisi2
	orr	r1, sl, tmp_xxx, asl #8
	ldr	r3, [istate, #ISTATE_METHOD]
	mov	r1, r1, asl #16
	ldr	r0, [r3, #12]
	mov	tmp_xxx, r1, lsr #16
	ldr	r2, [r0, #8]
	add	r2, r2, #12
	ldrb	r3, [r2, r1, lsr #16]	@ zero_extendqisi2
	and	r3, r3, #255
	cmp	r3, #104
	cmpne	r3, #100
	beq	.checkcast_2
.checkcast_1:
	mov	r1, tmp_xxx, asl #2
	ldr	r0, [stack, #4]
	ldr	r2, [istate, #ISTATE_METHOD]
	ldr	r0, [r0, #4]
	ldr	r3, [r2, #12]
	add	r3, r3, r1
	ldr	tmp_vvv, [r3, #32]
	cmp	tmp_vvv, r0
	beq	.checkcast_exit
	add	tmp_xxx, r0, #8
	mov	r0, tmp_xxx
	mov	r1, tmp_vvv
	bl	_ZNK5Klass13is_subtype_ofEP12klassOopDesc
	cmp	r0, #0
	bne	.checkcast_exit
	mov	r0, tmp_xxx
	add	sl, sp, #216
	ldr	r3, [istate, #ISTATE_THREAD]
	ldr	fp, [r3, #144]		@ THREAD_RESOURCE_AREA
	ldr	r1, [fp, #4]
	str	r1, [sp, #112]
	ldr	r2, [fp, #8]
	str	r2, [sp, #116]
	ldr	r3, [fp, #12]
	str	r3, [sp, #120]
	bl	_ZNK5Klass13external_nameEv
	mov	tmp_xxx, r0
	add	r0, tmp_vvv, #8
	bl	_ZNK5Klass13external_nameEv
	mov	r1, r0
	mov	r0, tmp_xxx
	bl	_ZN13SharedRuntime27generate_class_cast_messageEPKcS1_
	ldr	tmp_xxx, [dispatch, #VmSymbols_symbols_Address-XXX]
	ldr	ip, [istate, #ISTATE_THREAD]
	adrl	r1, bytecode_interpreter_str
	mov	r2, #99
	mov	r3, #_thread_in_vm
	str	jpc, [istate, #ISTATE_BCP]
	str	stack, [istate, #ISTATE_STACK]
	str	ip, [sl, #-72]!
	str	r3, [ip, #THREAD_STATE]
	ldr	r3, [tmp_xxx, #VMSYMBOLS_ClassCastException * 4]
	ldr	ip, [istate, #ISTATE_THREAD]
	str	r0, [sp, #0]
	mov	r0, ip
	bl	_ZN10Exceptions10_throw_msgEP6ThreadPKciP13symbolOopDescS3_
	mov	r0, sl
	bl	_ZN18ThreadInVMfromJavaD1Ev
	ldr	r0, [sp, #112]
	ldr	r3, [r0, #0]
	ldr	stack, [istate, #ISTATE_STACK]
	cmp	r3, #0
	ldr	jpc, [istate, #ISTATE_BCP]
	beq	1f
	bl	_ZN5Chunk9next_chopEv
1:
	ldr	r2, [sp, #120]
	str	r2, [fp, #12]
	ldr	r3, [sp, #112]
	str	r3, [fp, #4]
	ldr	ip, [sp, #116]
	str	ip, [fp, #8]
	b	handle_exception
.checkcast_2:
	ldr	r0, [istate, #ISTATE_THREAD]
	str	jpc, [istate, #ISTATE_BCP]
	str	stack, [istate, #ISTATE_STACK]
	bl	_ZN18InterpreterRuntime13quicken_io_ccEP10JavaThread
	ldr	r0, [istate, #ISTATE_THREAD]
	ldr	stack, [istate, #ISTATE_STACK]
	ldr	r3, [r0, #THREAD_PENDING_EXC]
	ldr	jpc, [istate, #ISTATE_BCP]
	cmp	r3, #0
	ldr	constpool, [istate, #ISTATE_CONSTANTS]
	add	constpool, constpool, #CONST_POOL_OFFSET
	beq	.checkcast_1
	b	handle_exception
.checkcast_exit:
	ldr	locals, [istate, #ISTATE_LOCALS]
	ldr	constpool, [istate, #ISTATE_CONSTANTS]
	add	constpool, constpool, #CONST_POOL_OFFSET
	DISPATCH	3

	Opcode	instanceof
	ldr	r3, [stack, #4]
	cmp	r3, #0
	beq	.instanceof_exit
	ldrb	tmp1, [jpc, #1]	@ zero_extendqisi2
	ldr	r3, [istate, #ISTATE_METHOD]
	ldrb	r2, [jpc, #2]	@ zero_extendqisi2
	ldr	ip, [r3, #12]
	orr	r2, r2, tmp1, asl #8
	ldr	r1, [ip, #8]
	mov	r2, r2, asl #16
	add	r1, r1, #12
	mov	tmp1, r2, lsr #16
	ldrb	r3, [r1, r2, lsr #16]	@ zero_extendqisi2
	and	r3, r3, #255
	cmp	r3, #104
	cmpne	r3, #100
	bne	.instanceof_1
	ldr	r0, [istate, #ISTATE_THREAD]
	str	jpc, [istate, #ISTATE_BCP]
	str	stack, [istate, #ISTATE_STACK]
	bl	_ZN18InterpreterRuntime13quicken_io_ccEP10JavaThread
	ldr	r0, [istate, #ISTATE_THREAD]
	ldr	stack, [istate, #ISTATE_STACK]
	ldr	r3, [r0, #THREAD_PENDING_EXC]
	ldr	jpc, [istate, #ISTATE_BCP]
	cmp	r3, #0
	ldr	locals, [istate, #ISTATE_LOCALS]
	bne	handle_exception
.instanceof_1:
	mov	r1, tmp1, asl #2
	ldr	r0, [stack, #4]
	ldr	r2, [istate, #ISTATE_METHOD]
	ldr	r0, [r0, #4]
	ldr	r3, [r2, #12]
	add	r3, r3, r1
	ldr	r1, [r3, #32]
	cmp	r1, r0
	beq	.instanceof_2
	add	r0, r0, #8
	bl	_ZNK5Klass13is_subtype_ofEP12klassOopDesc
	cmp	r0, #0
	streq	r0, [stack, #4]
	beq	.instanceof_exit
.instanceof_2:
	mov	r3, #1
	str	r3, [stack, #4]
.instanceof_exit:
	ldr	constpool, [istate, #ISTATE_CONSTANTS]
	add	constpool, constpool, #CONST_POOL_OFFSET
	DISPATCH	3

	Opcode	monitorenter
	ldr	r1, [stack, #4]
	cmp	r1, #0
	beq	.monitorenter_4
	ldr	r0, [istate, #ISTATE_MONITOR_BASE]
	ldr	r2, [istate, #ISTATE_STACK_BASE]
	cmp	r2, r0
	beq	.monitorenter_5
	mov	sl, #0
.monitorenter_1:
	ldr	r3, [r2, #4]
	cmp	r3, #0
	moveq	sl, r2
	beq	.monitorenter_2
	cmp	r1, r3
	beq	.monitorenter_3
.monitorenter_2:
	add	r2, r2, #8
	cmp	r2, r0
	bne	.monitorenter_1
.monitorenter_3:
	cmp	sl, #0
	beq	.monitorenter_5
	str	r1, [sl, #4]
	ldr	r3, [r1, #0]
	mov	r0, sl
	orr	tmp1, r3, #1
	mov	r2, tmp1
	str	tmp1, [sl, #0]
	bl	_ZN6Atomic11cmpxchg_ptrEPvPVvS0_
	cmp	r0, tmp1
	beq	.monitorenter_exit
	bic	r1, tmp1, #3
	ldr	r2, [istate, #ISTATE_THREAD]
	mov	r0, r2
	ldr	r3, [r2, #0]
	ldr	ip, [r3, #THREAD_VTABLE_IS_LOCK_OWNED]
	blx	ip
	cmp	r0, #0
	movne	lr, #0
	strne	lr, [sl, #0]
	bne	.monitorenter_exit
	mov	r1, sl
	str	jpc, [istate, #ISTATE_BCP]
	str	stack, [istate, #ISTATE_STACK]
	ldr	r0, [istate, #ISTATE_THREAD]
	bl	_ZN18InterpreterRuntime12monitorenterEP10JavaThreadP15BasicObjectLock
	ldr	r0, [istate, #ISTATE_THREAD]
	ldr	stack, [istate, #ISTATE_STACK]
	ldr	jpc, [istate, #ISTATE_BCP]
	ldr	r3, [r0, #THREAD_PENDING_EXC]
	cmp	r3, #0
	ldr	locals, [istate, #ISTATE_LOCALS]
	beq	.monitorenter_exit
	b	handle_exception
.monitorenter_4:
	b	null_ptr_exception
.monitorenter_5:
	mov	lr, #0
	str	jpc, [istate, #ISTATE_BCP]
	str	stack, [istate, #ISTATE_STACK]
	ldr	r3, [istate, #ISTATE_THREAD]
	ldr	ip, [istate, #ISTATE_THREAD]
	ldr	r1, [r3, #THREAD_JAVA_SP]
	ldr	r3, [r3, #THREAD_JAVA_STACK_BASE]
	str	lr, [ip, #THREAD_LAST_JAVA_SP]
	rsb	r3, r3, r1
	cmp	r3, #7
	ble	vm_fatal_error
	sub	r3, r1, #8
	ldr	r1, [istate, #ISTATE_THREAD]
	str	r3, [r1, #THREAD_JAVA_SP]
	ldr	r2, [istate, #ISTATE_STACK]
	ldr	r1, [istate, #ISTATE_STACK_BASE]
	add	r3, r2, #4
	cmp	r1, r3
	bls	.monitorenter_7
	add	r0, r2, #8
.monitorenter_6:
	ldr	r3, [r0, #-4]
	mov	r2, r0
	str	r3, [r0, #-12]
	add	r0, r0, #4
	ldr	r1, [istate, #ISTATE_STACK_BASE]
	cmp	r1, r2
	bhi	.monitorenter_6
	ldr	r2, [istate, #ISTATE_STACK]
.monitorenter_7:
	sub	r1, r1, #8
	sub	r2, r2, #8
	ldr	r3, [istate, #ISTATE_STACK_LIMIT]
	str	r1, [istate, #ISTATE_STACK_BASE]
	str	r2, [istate, #ISTATE_STACK]
	sub	r3, r3, #8
	mov	r0, #0
	str	r3, [istate, #ISTATE_STACK_LIMIT]
	str	r0, [r1, #4]
	ldr	r1, [istate, #ISTATE_THREAD]
	ldr	r3, [r1, #THREAD_TOP_ZERO_FRAME]
	str	r3, [r1, #THREAD_LAST_JAVA_SP]
	ldr	stack, [istate, #ISTATE_STACK]
	ldr	sl, [istate, #ISTATE_STACK_BASE]
	ldr	jpc, [istate, #ISTATE_BCP]
	ldr	r3, [stack, #4]
	ldr	locals, [istate, #ISTATE_LOCALS]
	mov	r1, r3
	str	r3, [sl, #4]
	ldr	r2, [r3, #0]
	mov	r0, sl
	orr	tmp1, r2, #1
	mov	r2, tmp1
	str	tmp1, [sl, #0]
	bl	_ZN6Atomic11cmpxchg_ptrEPvPVvS0_
	cmp	r0, tmp1
	beq	.monitorenter_exit
	bic	r1, tmp1, #3
	ldr	r2, [istate, #ISTATE_THREAD]
	mov	r0, r2
	ldr	r3, [r2, #0]
	ldr	ip, [r3, #THREAD_VTABLE_IS_LOCK_OWNED]
	blx	ip
	cmp	r0, #0
	movne	ip, #0
	strne	ip, [sl, #0]
	bne	.monitorenter_exit
	mov	r1, sl
	ldr	r0, [istate, #ISTATE_THREAD]
	str	jpc, [istate, #ISTATE_BCP]
	str	stack, [istate, #ISTATE_STACK]
	bl	_ZN18InterpreterRuntime12monitorenterEP10JavaThreadP15BasicObjectLock
	ldr	r0, [istate, #ISTATE_THREAD]
	ldr	stack, [istate, #ISTATE_STACK]
	ldr	r3, [r0, #THREAD_PENDING_EXC]
	ldr	jpc, [istate, #ISTATE_BCP]
	cmp	r3, #0
	ldr	locals, [istate, #ISTATE_LOCALS]
	beq	.monitorenter_exit
	b	handle_exception
.monitorenter_exit:
	ldr	constpool, [istate, #ISTATE_CONSTANTS]
	add	constpool, constpool, #CONST_POOL_OFFSET
	add	stack, stack, #4
	DISPATCH	1

	Opcode	monitorexit
	ldr	sl, [stack, #4]
	cmp	sl, #0
	beq	.monitorexit_3
	ldr	r2, [istate, #ISTATE_MONITOR_BASE]
	ldr	tmp1, [istate, #ISTATE_STACK_BASE]
	cmp	tmp1, r2
	bne	.monitorexit_2
	b	.monitorexit_4
.monitorexit_1:
	add	tmp1, tmp1, #8
	cmp	tmp1, r2
	beq	.monitorexit_4
.monitorexit_2:
	ldr	r3, [tmp1, #4]
	cmp	sl, r3
	bne	.monitorexit_1
	ldr	r0, [tmp1, #0]
	mov	lr, #0
	cmp	r0, lr
	str	lr, [tmp1, #4]
	beq	.monitorexit_exit
	mov	r1, sl
	mov	r2, tmp1
	bl	_ZN6Atomic11cmpxchg_ptrEPvPVvS0_
	cmp	tmp1, r0
	beq	.monitorexit_exit
	str	sl, [tmp1, #4]
	mov	r1, tmp1
	str	jpc, [istate, #ISTATE_BCP]
	str	stack, [istate, #ISTATE_STACK]
	ldr	r0, [istate, #ISTATE_THREAD]
	bl	_ZN18InterpreterRuntime11monitorexitEP10JavaThreadP15BasicObjectLock
	ldr	r0, [istate, #ISTATE_THREAD]
	ldr	stack, [istate, #ISTATE_STACK]
	ldr	jpc, [istate, #ISTATE_BCP]
	ldr	r3, [r0, #THREAD_PENDING_EXC]
	cmp	r3, #0
	ldr	locals, [istate, #ISTATE_LOCALS]
	beq	.monitorexit_exit
	b	handle_exception
.monitorexit_3:
	b	null_ptr_exception
.monitorexit_4:
	ldr	r0, [istate, #ISTATE_THREAD]
	str	jpc, [istate, #ISTATE_BCP]
	str	stack, [istate, #ISTATE_STACK]
	bl	_ZN18InterpreterRuntime37throw_illegal_monitor_state_exceptionEP10JavaThread
	b	handle_exception_with_bcp
.monitorexit_exit:
	add	stack, stack, #4
	ldr	constpool, [istate, #ISTATE_CONSTANTS]
	add	constpool, constpool, #CONST_POOL_OFFSET
	DISPATCH	1

vm_fatal_error:
	adr	r0, .fatal_filename
	mov	r1, #99
	bl	_Z28report_should_not_reach_herePKci
	b	breakpoint
.fatal_filename:
	.ascii	"[Optimsed Assembler Interpreter Loop]\000"
	ALIGN_WORD

	Opcode	aastore
	ldr	tmp1, [stack, #12]
	ldr	tmp_vvv, [stack, #8]
	cmp	tmp1, #0
	ldr	sl, [stack, #4]
	beq	null_ptr_exception
	ldr	r3, [tmp1, #8]
	cmp	tmp_vvv, r3
	bcs	array_bounds_exception
	cmp	sl, #0
	beq	.aastore_exit
	ldr	r3, [tmp1, #4]
	ldr	r0, [sl, #4]
	ldr	r1, [r3, #136]
	cmp	r0, r1
	beq	.aastore_exit
	add	r0, r0, #8
	bl	_ZNK5Klass13is_subtype_ofEP12klassOopDesc
	cmp	r0, #0
	moveq	r0, #VMSYMBOLS_ArrayStoreException
	beq	raise_exception
.aastore_exit:
    ldr r2, [dispatch, #Universe_collectedHeap_Address-XXX]
	add	r1, tmp1, #12
	str	sl, [r1, tmp_vvv, asl #2]!
    ldr	r3, [r2]
	mov	lr, #0
    ldr	r3, [r3, #12]
	add	stack, stack, #12
    ldr	r3, [r3, #76]
	strb	lr, [r3, r1, lsr #9]
	ldr	constpool, [istate, #ISTATE_CONSTANTS]
	add	constpool, constpool, #CONST_POOL_OFFSET
	DISPATCH	1

	Opcode	wide
	ldrb	r2, [jpc, #1]
	ldrb	r1, [jpc, #2]	@ zero_extendqisi2
	ldrb	r3, [jpc, #3]	@ zero_extendqisi2

	sub	lr, r2, #opc_aload+1
	cmp	lr, #opc_istore - (opc_aload+1)
	bcc	wide_undef_opc_exception

	sub	lr, r2, #opc_iload
	cmp	r2, #opc_istore
	subcs	lr, lr, #opc_istore - (opc_aload+1)
	cmp	r2, #opc_astore+1

	orr	r1, r3, r1, asl #8
	adr	r3, wide_case_table
	ldrcc	pc, [r3, lr, lsl #2]
	
	cmp	r2, #opc_ret
	beq	do_wide_ret
	cmp	r2, #opc_iinc
	beq	do_wide_iinc
wide_undef_opc_exception:
	mov	r0, #VMSYMBOLS_InternalError
	adr	r1, undef_opcode_msg
	b	raise_exception_with_msg
undef_opcode_msg:
	.ascii  "undefined opcode\000"
	ALIGN_WORD

wide_case_table:
        .word	case_wide_iload
        .word	case_wide_lload
        .word	case_wide_fload
        .word	case_wide_dload
        .word	case_wide_aload
        .word	case_wide_istore
        .word	case_wide_lstore
        .word	case_wide_fstore
        .word	case_wide_dstore
        .word	case_wide_astore

case_wide_iload:
case_wide_fload:
case_wide_aload:
	ldr	r2, [locals, -r1, lsl #2]
	PUSH	r2
	DISPATCH	4
case_wide_istore:
case_wide_fstore:
	POP	r2
	str	r2, [locals, -r1, lsl #2]
	DISPATCH	4
case_wide_dload:
case_wide_lload:
	sub	r1, locals, r1, lsl #2
	ldmda	r1, {r1, r2}
	PUSH2	r1, r2
	DISPATCH	4
case_wide_dstore:
case_wide_lstore:
	POP2	r2, r3
	sub	r1, locals, r1, lsl #2
	stmda	r1, {r2, r3}
	DISPATCH	4
case_wide_astore:
	mov	r3, r1
	mov	r0, stack
	mvn	r1, #0
	mov	r2, locals
	bl	_ZN19BytecodeInterpreter6astoreEPiiS0_i
	DISPATCH	4
do_wide_ret:
	ldr	r2, [istate, #ISTATE_METHOD]
	ldr	r2, [r2, #8]
	ldr	r1, [locals, -r1, lsl #2]
	add	jpc, r2, r1
	DISPATCH	48
do_wide_iinc:
	ldrsb	r2, [jpc, #4]
	ldrb	r3, [jpc, #5]
	orr	r2, r3, r2, lsl #8
	ldr	r3, [locals, -r1, lsl #2]
	add	r3, r3, r2
	str	r3, [locals, -r1, lsl #2]
	DISPATCH	6

	Opcode	multianewarray
	ldrb	tmp1, [jpc, #3]	@ zero_extendqisi2
	ldr	r0, [istate, #ISTATE_THREAD]
	add	r1, stack, tmp1, lsl #2
	str	jpc, [istate, #ISTATE_BCP]
	str	stack, [istate, #ISTATE_STACK]
	bl	_ZN18InterpreterRuntime14multianewarrayEP10JavaThreadPi
	ldr	r0, [istate, #ISTATE_THREAD]
	ldr	stack, [istate, #ISTATE_STACK]
	ldr	r1, [r0, #THREAD_PENDING_EXC]
	ldr	jpc, [istate, #ISTATE_BCP]
	cmp	r1, #0
	ldr	constpool, [istate, #ISTATE_CONSTANTS]
	add	constpool, constpool, #CONST_POOL_OFFSET
	ldr	locals, [istate, #ISTATE_LOCALS]
	bne	handle_exception
	ldr	r3, [r0, #THREAD_VM_RESULT]
	str	r3, [stack, tmp1, asl #2]
	ldr	r2, [istate, #ISTATE_THREAD]
	mov	r3, tmp1, asl #2
	sub	r3, r3, #4
	str	r1, [r2, #THREAD_VM_RESULT]
	add	stack, stack, r3
	DISPATCH	4

	Opcode	jsr_w
	ldr	r3, [istate, #ISTATE_METHOD]
	ldr	r1, [r3, #8]
	rsb	r2, r1, jpc
	sub	r2, r2, #43
	str	r2, [stack], #-4
	b	do_goto_w

	Opcode	goto_w
	add	r2, jpc, #1
	ldrb	tmp1, [jpc, #1]	@ zero_extendqisi2
	ldrb	r3, [r2, #3]	@ zero_extendqisi2
	ldrb	r0, [r2, #1]	@ zero_extendqisi2
	ldrb	ip, [r2, #2]	@ zero_extendqisi2
	orr	r3, r3, tmp1, asl #24
	orr	r3, r3, r0, asl #16
	orr	r3, r3, ip, asl #8
	cmp	r3, #0
	add	jpc, jpc, r3
	bgt	1f

	ldr	r3, [dispatch, #SafePointSynchronize_state_Address-XXX]
	ldr	r1, [r3]
	cmp	r1, #1
	bne	1f
	ldr	r3, [istate, #ISTATE_THREAD]
	mov	r0, sp
	str	r3, [sp]
	bl	_ZN17HandleMarkCleanerD1Ev
	ldr	r0, [istate, #ISTATE_THREAD]
	str	jpc, [istate, #ISTATE_BCP]
	str	stack, [istate, #ISTATE_STACK]
	bl	_ZN20SafepointSynchronize5blockEP10JavaThread
	ldr	r0, [istate, #ISTATE_THREAD]
	ldr	stack, [istate, #ISTATE_STACK]
	ldr	r3, [r0, #THREAD_PENDING_EXC]
	ldr	jpc, [istate, #ISTATE_BCP]
	cmp	r3, #0
	ldr	constpool, [istate, #ISTATE_CONSTANTS]
	add	constpool, constpool, #CONST_POOL_OFFSET
	ldr	locals, [istate, #ISTATE_LOCALS]
	bne	handle_exception
1:
	DISPATCH	0

	Opcode	breakpoint
	mov	r2, jpc
	str	stack, [istate, #ISTATE_STACK]
	str	jpc, [istate, #ISTATE_BCP]
	ldr	r0, [istate, #ISTATE_THREAD]
	ldr	r1, [istate, #ISTATE_METHOD]
	bl	_ZN18InterpreterRuntime24get_original_bytecode_atEP10JavaThreadP13methodOopDescPh
	ldr	stack, [istate, #ISTATE_STACK]
	ldmib	istate, {jpc, locals}	@ phole ldm
	mov	tmp1, r0
	ldr	r0, [istate, #ISTATE_THREAD]
	ldr	r3, [r0, #THREAD_PENDING_EXC]
	cmp	r3, #0
	bne	handle_exception
	str	stack, [istate, #ISTATE_STACK]
	str	jpc, [istate, #ISTATE_BCP]
	mov	r2, jpc
	ldr	r1, [istate, #ISTATE_METHOD]
	bl	_ZN18InterpreterRuntime11_breakpointEP10JavaThreadP13methodOopDescPh
	ldr	r0, [istate, #ISTATE_THREAD]
	ldr	stack, [istate, #ISTATE_STACK]
	ldr	r3, [r0, #THREAD_PENDING_EXC]
	ldr	jpc, [istate, #ISTATE_BCP]
	cmp	r3, #0
	ldr	constpool, [istate, #ISTATE_CONSTANTS]
	add	constpool, constpool, #CONST_POOL_OFFSET
	ldr	locals, [istate, #ISTATE_LOCALS]
	bne	handle_exception
	and	r0, tmp1, #255
	DISPATCH_BYTECODE

	Opcode	undefined
	ldr	r2, [dispatch, #Bytecodes_name_Address-XXX]
	ldrb	r3, [jpc, #0]	@ zero_extendqisi2
	adrl	r0, bytecode_interpreter_str
	cmp	r3, #last_implemented_bytecode+1
	adrcs	ip, unknown_bytecode
	ldrcc	ip, [r2, r3, asl #2]
	adr	r2, unimplemented_opcode_msg
	mov	r1, #99
	str	ip, [sp, #0]
	bl	_Z19report_fatal_varargPKciS0_z
	b	breakpoint
unimplemented_opcode_msg:
	.ascii  "\011*** Unimplemented opcode: %d = %s\012\000"
unknown_bytecode:
	.ascii	"<unknown>\000"
	ALIGN_WORD

	Opcode	return_register_finalizer
	ldr	r1, [locals, #0]
	ldr	r3, [r1, #4]
	ldr	r2, [r3, #84]
	tst	r2, #1073741824
	beq	handle_return
	str	jpc, [istate, #ISTATE_BCP]
	str	stack, [istate, #ISTATE_STACK]
	ldr	r0, [istate, #ISTATE_THREAD]
	bl	_ZN18InterpreterRuntime18register_finalizerEP10JavaThreadP7oopDesc
	ldr	r0, [istate, #ISTATE_THREAD]
	ldr	stack, [istate, #ISTATE_STACK]
	ldr	jpc, [istate, #ISTATE_BCP]
	ldr	r3, [r0, #THREAD_PENDING_EXC]
	ldr	locals, [istate, #ISTATE_LOCALS]
	cmp	r3, #0
	beq	handle_return
	b	handle_exception

@ ECN: normal_entry_synchronized doesn't really mean synchronized. It means
@ may or may not be synchronized. So we still have to check the synchronized
@ flag in the synchronized path, otherwise we may get an IllegalMonitor.
normal_entry_synchronized:
	stmfd	sp!, {regset, lr}
	sub	sp, sp, #220
	mov	sl, r0
	mov	tmp1, r2
	ldrh	r2, [sl, #40]
	ldrh	r3, [sl, #42]
	rsb	tmp_zzz, r3, r2
	cmp	tmp_zzz, #0
	ble	.normal_entry_synchronized_no_locals

	mov	r2, #0
	ldr	r1, [tmp1, #THREAD_JAVA_SP]
.zero_locals_synchronized:
	subs	tmp_zzz, tmp_zzz, #1
	str	r2, [r1, #-4]!
	bgt	.zero_locals_synchronized
	str	r1, [tmp1, #THREAD_JAVA_SP]

.normal_entry_synchronized_no_locals:
	mov	r2, tmp1
	mov	r1, sl
	add	r0, tmp1, #THREAD_JAVA_STACK_BASE
	bl	build_normal
@	add	lr, sp, #192
@	str	r0, [sp, #56]
	mov	tmp_vvv, r0
	ldr	r3, [tmp1, #THREAD_TOP_ZERO_FRAME]
	sub	r0, r0, #72
@	str	lr, [sp, #32]
	mov	istate, r0
@	str	r0, [sp, #60]
	str	r3, [tmp_vvv, #0]
	ldr	r0, [tmp1, #THREAD_STACK_SIZE]
	ldr	r3, [tmp1, #THREAD_STACK_BASE]
	ldr	r2, [tmp1, #THREAD_JAVA_SP]
	ldr	r1, [tmp1, #THREAD_JAVA_STACK_BASE]
	adrl	ip, dispatch_init_adcon
	rsb	r3, r0, r3
	rsb	r2, r1, r2
	ldmia	ip, {r0, r1}
	rsb	r3, r3, sp
	cmp	r2, #4096
	cmpge	r3, #32768
	add	r0, r0, ip
	str	tmp_vvv, [tmp1, #THREAD_TOP_ZERO_FRAME]
	str	tmp_vvv, [tmp1, #THREAD_LAST_JAVA_SP]
	add	dispatch, r1, r0
	blt	.throw_stack_overflow
	ldr	stack, [istate, #ISTATE_STACK]
	ldmib	istate, {jpc, locals}	@ phole ldm
	ldr	r0, [istate, #ISTATE_METHOD]
	ldr	r3, [r0, #24]
	tst	r3, #32
	bne	normal_do_synchronization
	ldr	constpool, [istate, #ISTATE_CONSTANTS]
	add	constpool, constpool, #CONST_POOL_OFFSET
	DISPATCH	0

do_execute_java_bytecodes_restore_locals_and_jpc:
	ldr	jpc, [istate, #ISTATE_BCP]
do_execute_java_bytecodes_restore_locals:
	ldr	locals, [istate, #ISTATE_LOCALS]
	ldr	constpool, [istate, #ISTATE_CONSTANTS]
	add	constpool, constpool, #CONST_POOL_OFFSET
	DISPATCH	0

normal_do_synchronization:
	tst	r3, #8
	ldrne	r3, [r0, #12]
	ldreq	sl, [locals, #0]
	ldrne	r2, [r3, #16]
	ldr	r3, [dispatch, #UseBiasedLocking_Address-XXX]
	ldr	ip, [istate, #ISTATE_MONITOR_BASE]
	ldrne	sl, [r2, #60]
	str	ip, [sp, #100]
	ldrb	r1, [r3]
	cmp	r1, #0
	beq	.normal_do_synchronisation_1
	ldr	tmp_xxx, [sl, #0]
	and	r3, tmp_xxx, #7
	cmp	r3, #5
	beq	.normal_do_synchronisation_4
.normal_do_synchronisation_1:
	ldr	r0, [sp, #100]
	ldr	r3, [sl, #0]
	sub	fp, r0, #8
	orr	tmp_xxx, r3, #1
	str	tmp_xxx, [r0, #-8]
.normal_do_synchronisation_2:
	ldr	tmp_vvv, [sl, #0]
	cmp	tmp_xxx, tmp_vvv
	bne	.normal_do_synchronisation_3
	mov	r0, tmp_xxx
	mov	r1, fp
	mov	r2, sl
	mov	r3, #0xffffffc0
	bic	r3, r3, #0xf000
	blx	r3
	cmp	r0, #0
	bne	.normal_do_synchronisation_2
.normal_do_synchronisation_3:
	cmp	tmp_xxx, tmp_vvv
	beq	do_execute_java_bytecodes_restore_locals
	bic	r1, tmp_xxx, #3
	ldr	r2, [istate, #ISTATE_THREAD]
	mov	r0, r2
	ldr	r3, [r2, #0]
	ldr	ip, [r3, #THREAD_VTABLE_IS_LOCK_OWNED]
	blx	ip
	cmp	r0, #0
	beq	.handle_exception_28
	ldr	r0, [sp, #100]
	mov	r3, #0
	str	r3, [r0, #-8]
	b	do_execute_java_bytecodes_restore_locals
.normal_do_synchronisation_4:
	ldr	r2, [sl, #4]
	ldr	r2, [r2, #104]
	ldr	r0, [istate, #ISTATE_THREAD]
	eor	r3, r2, r0
	eor	r3, r3, tmp_xxx
	bics	ip, r3, #120
	beq	do_execute_java_bytecodes_restore_locals
	mov	r0, r2
	mov	r1, sl
	mov	r2, tmp_xxx
	bl	_ZN6Atomic11cmpxchg_ptrEPvPVvS0_
	cmp	tmp_xxx, r0
	beq	.normal_do_synchronisation_1
	b	do_execute_java_bytecodes_restore_locals

# r2 = [jpc, #1]
# r1 = [jpc, #2]
        Opcode  invokevirtual
        add     r0, constpool, r1, lsl #12
        ldr     r2, [r0, r2, asl #4]!           @ r0 = cache
        and     r2, r2, #0xff000000
        cmp     r2, #182 << 24
        blne    resolve_invokevirtual
        ldr     r3, [r0, #12]
        mov     r0, #opc_invokeresolved
        tst     r3, #67108864
        movne   r0, #opc_invokevfinal
        b       rewrite_bytecode

	Opcode	invokespecial
        add     r0, constpool, r1, lsl #12
        ldr     r2, [r0, r2, asl #4]!           @ r0 = cache
        and     r2, r2, #0x00ff0000
        cmp     r2, #183 << 16
        blne     resolve_invokespecial
	mov	r0, #opc_invokespecialresolved
	b	rewrite_bytecode

	Opcode	invokestatic
        add     r0, constpool, r1, lsl #12
        ldr     r2, [r0, r2, asl #4]!           @ r0 = cache
	and	r2, r2, #0x00ff0000
	cmp	r2, #184 << 16
	blne	resolve_invokestatic
	mov	r0, #opc_invokestaticresolved
	b	rewrite_bytecode

# r2 = [jpc, #1]
# r1 = [jpc, #2]
	Opcode	invokevfinal
	str	stack, [istate, #ISTATE_STACK]
	add	r0, constpool, r1, lsl #12
	str	jpc, [istate, #ISTATE_BCP]
	add	r0, r2, asl #4
	ldr	r3, [r0, #12]
	ldr	tmp1, [istate, #ISTATE_THREAD]
	and	r1, r3, #255
	ldr	r2, [stack, r1, asl #2]
	mov	r1, #0
	cmp	r2, #0
	beq	null_ptr_exception

	ldr	tmp2, [r0, #8]

	str	tmp2, [istate, #ISTATE_CALLEE]
	ldr	ip, [tmp2, #76]
	str	r1, [tmp1, #THREAD_LAST_JAVA_SP]
	str	ip, [istate, #36]

	add	stack, stack, #4
	str	stack, [tmp1, #THREAD_JAVA_SP]

	ldr	r3, [ip, #0]
	adr	lr, normal_entry
	cmp	r3, lr
	beq	fast_normal_entry
	adr	lr, native_entry
	cmp	r3, lr
	beq	fast_native_entry
	adr	lr, accessor_entry
	cmp	r3, lr
	beq	fast_accessor_entry
	b	normal_dispatch_and_return

# r2 = [jpc, #1]
# r1 = [jpc, #2]
        Opcode  invokeresolved
        str     stack, [istate, #ISTATE_STACK]
        add     r0, constpool, r1, lsl #12
        str     jpc, [istate, #ISTATE_BCP]
        add     r0, r0, r2, asl #4
        ldr     r3, [r0, #12]
        ldr     tmp1, [istate, #ISTATE_THREAD]
        and     r1, r3, #255
        ldr     r2, [stack, r1, asl #2]
        mov     r1, #0
#ifndef HW_NULL_PTR_CHECK
        cmp     r2, #0
        beq     null_ptr_exception_jpc_0
#endif

        ldr     tmp2, [r0, #8]
.abortentry104:
        ldr     r3, [r2, #4]
        add     r3, r3, tmp2, lsl #2
        ldr     tmp2, [r3, #304]

        str     tmp2, [istate, #ISTATE_CALLEE]
        ldr     ip, [tmp2, #76]
        str     r1, [tmp1, #THREAD_LAST_JAVA_SP]
        str     ip, [istate, #36]

        add     stack, stack, #4
        str     stack, [tmp1, #THREAD_JAVA_SP]

        ldr     r3, [ip, #0]
        adr     lr, normal_entry
        cmp     r3, lr
        beq     fast_normal_entry
        adr     lr, native_entry
        cmp     r3, lr
        beq     fast_native_entry
        adr     lr, accessor_entry
        cmp     r3, lr
        beq     fast_accessor_entry

normal_dispatch_and_return:
	mov	r0, tmp2
	mov	r1, ip
	ldr	r2, [istate, #ISTATE_THREAD]
	blx	r3

	ldr	ip, [istate, #ISTATE_THREAD]
	ldr	r3, [ip, #THREAD_JAVA_SP]
	ldr	r2, [istate, #ISTATE_STACK_LIMIT]
	sub	r3, r3, #4
	str	r3, [istate, #ISTATE_STACK]

	ldr	r1, [ip, #THREAD_TOP_ZERO_FRAME]
	add	r2, r2, #4
	str	r2, [ip, #THREAD_JAVA_SP]
	str	r1, [ip, #THREAD_LAST_JAVA_SP]
	ldr	r0, [istate, #ISTATE_THREAD]
	ldr	stack, [istate, #ISTATE_STACK]
	ldr	jpc, [istate, #ISTATE_BCP]
	ldr	r3, [r0, #4]
	DISPATCH_START	3
	ldr	locals, [istate, #ISTATE_LOCALS]
	ldr	constpool, [istate, #ISTATE_CONSTANTS]
	DISPATCH_NEXT
	DISPATCH_NEXT
	add	constpool, constpool, #CONST_POOL_OFFSET
	cmp	r3, #0
	DISPATCH_NEXT
	bne	invokespecial_exception_fix
	DISPATCH_FINISH

	Opcode	invokestaticresolved
        str     stack, [istate, #ISTATE_STACK]
        add     r0, constpool, r1, lsl #12
	str	jpc, [istate, #ISTATE_BCP]
	add	r0, r2, asl #4

	ldr	tmp2, [r0, #4]
	mov	r1, #0
	str	tmp2, [istate, #ISTATE_CALLEE]
	ldr	r3, [tmp2, #76]
	ldr	tmp1, [istate, #ISTATE_THREAD]
	str	r3, [istate, #36]
	str	r1, [tmp1, #THREAD_LAST_JAVA_SP]

	add	stack, stack, #4
	str	stack, [tmp1, #THREAD_JAVA_SP]

	ldr	ip, [istate, #36]
	ldr	r3, [ip, #0]
	adr	lr, normal_entry
	cmp	r3, lr
	beq	fast_normal_entry
	adr	lr, native_entry
	cmp	r3, lr
	beq	fast_native_entry
	adr	lr, accessor_entry
	cmp	r3, lr
	beq	fast_accessor_entry
	b	normal_dispatch_and_return

	Opcode	invokespecialresolved
        str     stack, [istate, #ISTATE_STACK]
        add     r0, constpool, r1, lsl #12
	str	jpc, [istate, #ISTATE_BCP]
	add	r0, r2, asl #4

	ldr	r3, [r0, #12]
	ldr	tmp1, [istate, #ISTATE_THREAD]
	and	r3, r3, #255
	ldr	r2, [stack, r3, asl #2]
	mov	r1, #0
	cmp	r2, #0
	beq	null_ptr_exception

	ldr	tmp2, [r0, #4]

	str	tmp2, [istate, #ISTATE_CALLEE]
	ldr	ip, [tmp2, #76]
	str	r1, [tmp1, #THREAD_LAST_JAVA_SP]
	str	ip, [istate, #36]

	add	stack, stack, #4
	str	stack, [tmp1, #THREAD_JAVA_SP]

	ldr	r3, [ip, #0]
	adr	lr, normal_entry
	cmp	r3, lr
	beq	fast_normal_entry
	adr	lr, native_entry
	cmp	r3, lr
	beq	fast_native_entry
	adr	lr, accessor_entry
	cmp	r3, lr
	beq	fast_accessor_entry
	b	normal_dispatch_and_return

	ALIGN_CODE
accessor_entry:
	adrl	ip, dispatch_init_adcon
	ldr	r3, [ip]
	add	r3, r3, ip
	ldr	ip, [ip, #12]
	ldr	ip, [r3, ip]
	ldr	r1, [r0, #8]
	ldr	ip, [ip, #0]
	ldrb	r3, [r1, #50]
	ldrb	r1, [r1, #51]
	cmp	ip, #0
	ldr	ip, [r0, #12]
	bne	normal_entry
	ldr	ip, [ip, #12]
	orr	r3, r3, r1, lsl #8		@ r3 = index

	add	r1, ip, #16
	ldr	r3, [r1, r3, lsl #4]!		@ r1 = cache, r3 = flags
	ldr	ip, [r2, #THREAD_JAVA_SP]			@ ip == stack
	and	r3, r3, #0x00ff0000
	cmp	r3, #180 << 16
	ldr	r3, [ip, #0]
	bne	normal_entry

	cmp	r3, #0
	beq	normal_entry

	ldr	r0, [r1, #12]
	ldr	r1, [r1, #8]
	movs	r0, r0, lsr #29
	bls	accessor_non_w

	ldr	r0, [r3, r1]
	str	r0, [ip, #0]
	bx	lr

	ALIGN_CODE
normal_entry:
	adrl	ip, dispatch_init_adcon
	stmfd	sp!, {regset, lr}
	mov	tmp2, r0
	ldmia	ip, {r0, r1}
	sub	sp, sp, #220

	mov	istate, #ISTATE_THREAD
	add	dispatch, ip, r3

	add	r0, r0, ip
	add	dispatch, r1, r0

	ldrh	r1, [tmp2, #40]
	ldrh	r3, [tmp2, #42]
	mov	tmp1, r2

	rsb	tmp_xxx, r3, r1
	ldr	stack, [tmp1, #THREAD_JAVA_SP]
	movs	tmp_xxx, tmp_xxx, asr #1
	mov	r0, #0
	mov	ip, #0
	strcs	r0, [stack, #-4]!
.zero_locals:
	subs	tmp_xxx, tmp_xxx, #1
	stmgedb	stack!, {r0, ip}
	bgt	.zero_locals

@ r11 = thread
@ r10 = method
	ldrh	r2, [r10, #38]
        mvn     tmp_vvv, #0x540              	@ form 0xCAFEBABF
        bic     tmp_vvv, tmp_vvv, #0x14000
        bic     tmp_vvv, tmp_vvv, #0x35000000
	str	istate, [stack, #-76 + ISTATE_SAVED_ISTATE]
	sub	istate, stack, #76			@ istate == istate
	mov	r7, istate				@ monitor_base == istate
	sub	r5, istate, r2, lsl #2
	str	r5, [tmp1, #THREAD_JAVA_SP]		@ drop stack now
	sub	r5, r5, #4			@ stack limit = istate - stackwords - 4
	mov	r3, istate
	stmdb	stack, {r0, r3, r5, r7, istate, tmp_vvv, ip} @

	str	ip, [istate, #ISTATE_CALLEE]
	str	ip, [istate, #ISTATE_MDX]
	str	ip, [istate, #ISTATE_PREV_LINK]

	sub	locals, stack, #4
	add	locals, locals, r1, lsl #2	@ locals == r7

	ldr	jpc, [r10, #8]			@ jpc == r5
	ldr	constpool, [r10, #12]			@ 

	sub	stack, istate, #ISTATE_BCP			@ stack == r4
	str	stack, [istate, #ISTATE_STACK]

	add	jpc, jpc, #48

	ldr	constpool, [constpool, #12]

	str	tmp1, [istate, #ISTATE_THREAD]
	stmib	istate, {jpc, locals, constpool, r10}

	add	constpool, constpool, #CONST_POOL_OFFSET

	str	stack, [istate, #ISTATE_STACK]

	add	tmp2, istate, #72

	ldr	r3, [tmp1, #THREAD_TOP_ZERO_FRAME]
	str	r3, [istate, #72]		@ Fill in prev_link
	ldr	r0, [tmp1, #THREAD_STACK_SIZE]
	ldr	r3, [tmp1, #THREAD_STACK_BASE]
	ldr	r2, [tmp1, #THREAD_JAVA_SP]
	ldr	r1, [tmp1, #THREAD_JAVA_STACK_BASE]
	rsb	r3, r0, r3
	DISPATCH_START	0
	rsb	r2, r1, r2
	rsb	r3, r3, sp
	DISPATCH_NEXT
	cmp	r2, #4096
	cmpge	r3, #32768
	DISPATCH_NEXT
	str	tmp2, [tmp1, #THREAD_TOP_ZERO_FRAME]
	str	tmp2, [tmp1, #THREAD_LAST_JAVA_SP]
	DISPATCH_NEXT
	blt	.throw_stack_overflow
	DISPATCH_FINISH

	ALIGN_CODE
native_entry:
	adrl	ip, dispatch_init_adcon
	stmfd	sp!, {r3, r4, r5, r7, r9, r10, r11, lr}
@---
	ldmia	ip, {dispatch, r7}
	mov	r11, r0
	ldrh	r1, [r11, #42]
	add	dispatch, dispatch, ip
	ldr	r4, [r2, #THREAD_JAVA_SP]
	add	dispatch, dispatch, r7
	ldr	ip, [r2, #THREAD_TOP_ZERO_FRAME]
	mov	r0, #0
	mvn	r10, #0x540		@ form 0xCAFEBABF in r10
	bic	r10, r10, #0x14000
	bic	r10, r10, #0x35000000
	sub	r9, r4, #76
	mov	r7, r9
	str	r9, [r2, #THREAD_JAVA_SP]	@ drop stack
	sub	r5, r9, #4		@ stack limit = r9 - 4
	mov	r3, r9
	stmdb	r4, {r0, r3, r5, r7, r9, r10, ip}
	str	r0, [r9, #ISTATE_CALLEE]
	str	r0, [r9, #ISTATE_PREV_LINK]
	str	r0, [r9, #ISTATE_MSG]
	str	r0, [r9, #ISTATE_MDX]
	sub	r7, r4, #4
	add	r7, r7, r1, lsl #2
	mov	r5, #0
	ldr	r10, [r11, #12]
	ldr	r10, [r10, #12]
	stmia	r9, {r2, r5, r7, r10, r11}
	add	r0, r9, #72
	mov	r9, r2
@---
.LPIC18_native_entry:
	ldr	r2, [r9, #THREAD_STACK_SIZE]
	ldr	r3, [r9, #THREAD_STACK_BASE]
	rsb	r3, r2, r3
	rsb	r3, r3, sp
	cmp	r3, #4096
	str	r0, [r9, #THREAD_TOP_ZERO_FRAME]
	blt	.native_entry_throw_stack_overflow
	ldr	r5, [r11, #84]
	cmp	r5, #0
	bne	.native_entry_got_handleraddr
	str	r0, [r9, #THREAD_LAST_JAVA_SP]
	mov	r0, r9
	mov	r1, r11
	bl	_ZN18InterpreterRuntime19prepare_native_callEP10JavaThreadP13methodOopDesc
	ldr	r1, [r9, #THREAD_PENDING_EXC]
	str	r5, [r9, #THREAD_LAST_JAVA_SP]
	cmp	r1, #0
	bne	.native_entry_exception
	ldr	r5, [r11, #84]
.native_entry_got_handleraddr:
	ldr	r2, [dispatch, #InterpreterRuntime_slow_signature_handler_Address-XXX]
	cmp	r5, r2
	bne	.native_entry_get_handler
	ldr	r3, [r9, #THREAD_TOP_ZERO_FRAME]
	mov	r2, #0
	mov	r0, r9
	str	r3, [r9, #THREAD_LAST_JAVA_SP]
	mov	r3, r2
	mov	r1, r11
	bl	_ZN18InterpreterRuntime22slow_signature_handlerEP10JavaThreadP13methodOopDescPiS4_
	ldr	r1, [r9, #THREAD_PENDING_EXC]
	mov	r3, #0
	cmp	r1, #0
	str	r3, [r9, #THREAD_LAST_JAVA_SP]
	mov	r5, r0
	bne	.native_entry_exception
.native_entry_get_handler:

	sub	ip, r7, r4
	mov	ip, ip, asr #2
	add	lr, ip, #4
	bic	lr, lr, #1

	add	r3, r4, #ISTATE_OOP_TEMP-76

	mov	r4, sp
	sub	sp, sp, #16
	sub	sp, sp, lr, lsl #2
	mov	lr, sp

	add	r1, r5, #24

	add	r2, r9, #THREAD_JNI_ENVIRONMENT
	str	r2, [lr], #4
	add	r1, r1, #4

	ldr	r2, [r11, #24]
	tst	r2, #8
	beq	.do_copy_args

	ldr	r2, [r11, #12]
	ldr	r2, [r2, #16]
	ldr	r2, [r2, #60]
	str	r2, [r3]

	str	r3, [lr], #4
	add	r1, r1, #4

.do_copy_args:
	cmp	ip, #0
	blt	.no_args

.copy_args:
	ldr	r0, [r1], #4
	ldrh	r3, [r0, #6]
	cmp	r3, #FFI_TYPE_DOUBLE
	cmpne	r3, #FFI_TYPE_SINT64
	beq	.copy_long

	cmp	r3, #FFI_TYPE_POINTER
	beq	.copy_ptr

	ldr	r2, [r7], #-4
	str	r2, [lr], #4
	subs	ip, ip, #1
	bge	.copy_args
	b	.no_args

.copy_long:
	tst	lr, #4
	addne	lr, lr, #4
	ldmda	r7!, {r2, r3}
	stmia	lr!, {r2, r3}
	subs	ip, ip, #2
	bge	.copy_args
	b	.no_args

.copy_ptr:
	ldr	r2, [r7], #-4
	cmp	r2, #0
	addne	r2, r7, #4
	str	r2, [lr], #4
	subs	ip, ip, #1
	bge	.copy_args

.no_args:
	ldr	r0, [r9, #THREAD_TOP_ZERO_FRAME]
	str	r0, [r9, #THREAD_LAST_JAVA_SP]

	mov	r2, #_thread_in_native
	str	r2, [r9, #THREAD_STATE]

	ldr	ip, [r11, #80]
	ldrh	r11, [r11, #42]
	ldmia	sp!, {r0, r1, r2, r3}
	blx	ip

	mov	sp, r4

	mov	r3, #_thread_in_native_trans
	str	r3, [r9, #THREAD_STATE]

.L206_native_entry:
	ldr	r3, [dispatch, #SafePointSynchronize_state_Address-XXX]
	ldr	r3, [r3, #0]
	cmp	r3, #0
	ldreq	r3, [r9, #THREAD_SUSPEND_FLAGS]
	cmpeq	r3, #0
	bne	.native_entry_do_special

.native_entry_do_return:
	mov	r3, #_thread_in_Java
	mov	r2, #0
	str	r3, [r9, #THREAD_STATE]
	str	r2, [r9, #THREAD_LAST_JAVA_SP]

	add	r2, r5, #24
	ldr	r3, [r5, #4]

	ldr	r5, [r9, #THREAD_TOP_ZERO_FRAME]
	ldr	ip, [r5], #4
	str	ip, [r9, #THREAD_TOP_ZERO_FRAME]

	add	r5, r5, r11, lsl #2

	ldr	ip, [r2, r3, asl #2]
	ldrh	r2, [ip, #6]

	cmp	r2, #FFI_TYPE_POINTER
	beq	.native_return_obj

	ldr	ip, [r9, #THREAD_ACTIVE_HANDLES]
	mov	r3, #0			@ ECN: OK, not an obj, save to clear handles
	str	r3, [ip, #128]

	cmp	r2, #FFI_TYPE_VOID
	beq	.native_return_void
	cmp	r2, #FFI_TYPE_FLOAT
	cmpne	r2, #FFI_TYPE_SINT32
	beq	.native_return_w
	cmp	r2, #FFI_TYPE_DOUBLE
	cmpne	r2, #FFI_TYPE_SINT64
	beq	.native_return_dw

	cmp	r2, #FFI_TYPE_UINT16
	beq	.native_return_char
	cmp	r2, #FFI_TYPE_SINT16
	beq	.native_return_short
	cmp	r2, #FFI_TYPE_BOOL
	beq	.native_return_bool
	cmp	r2, #FFI_TYPE_SINT8
	beq	.native_return_byte

	str	r0, [r0, -r0]

.native_return_obj:
	cmp	r0, #0
	ldrne	r0, [r0]
	str	r0, [r5, #-4]!
	str	r5, [r9, #THREAD_JAVA_SP]
	ldr	r2, [r9, #THREAD_ACTIVE_HANDLES]
	mov	r3, #0			@ ECN: Now that the object is safe on the Java stack
	str	r3, [r2, #128]		@ stack, with the Thread SP updated, clear the active_handles.
	ldmfd	sp!, {r3, r4, r5, r7, r9, r10, r11, pc}
.native_return_short:
	mov	r0, r0, lsl #16
	mov	r0, r0, asr #16
.native_return_w:
	str	r0, [r5, #-4]!
.native_return_void:
	str	r5, [r9, #THREAD_JAVA_SP]
	ldmfd	sp!, {r3, r4, r5, r7, r9, r10, r11, pc}
.native_return_dw:
	stmdb	r5!, {r0, r1}
	str	r5, [r9, #THREAD_JAVA_SP]
	ldmfd	sp!, {r3, r4, r5, r7, r9, r10, r11, pc}
.native_return_byte:
	mov	r0, r0, lsl #24
	mov	r0, r0, asr #24
	str	r0, [r5, #-4]!
	str	r5, [r9, #THREAD_JAVA_SP]
	ldmfd	sp!, {r3, r4, r5, r7, r9, r10, r11, pc}
.native_return_char:
	mov	r0, r0, lsl #16
	mov	r0, r0, lsr #16
	str	r0, [r5, #-4]!
	str	r5, [r9, #THREAD_JAVA_SP]
	ldmfd	sp!, {r3, r4, r5, r7, r9, r10, r11, pc}
.native_return_bool:
	ands	r0, r0, #255
	movne	r0, #1
	str	r0, [r5, #-4]!
	str	r5, [r9, #THREAD_JAVA_SP]
	ldmfd	sp!, {r3, r4, r5, r7, r9, r10, r11, pc}

.native_entry_throw_stack_overflow:
	str	r0, [r9, #THREAD_LAST_JAVA_SP]
	mov	r0, r9
	bl	_ZN18InterpreterRuntime24throw_StackOverflowErrorEP10JavaThread
	mov	r3, #0
	ldr	r1, [r9, #THREAD_PENDING_EXC]
	str	r3, [r9, #THREAD_LAST_JAVA_SP]
.native_entry_exception:
	ldr	r5, [r9, #THREAD_TOP_ZERO_FRAME]
	ldr	r3, [r5], #4
	str	r3, [r9, #THREAD_TOP_ZERO_FRAME]

	ldrh	r3, [r11, #42]
	add	r5, r5, r3, lsl #2
	str	r5, [r9, #THREAD_JAVA_SP]

	ldmfd	sp!, {r3, r4, r5, r7, r9, r10, r11, pc}
.native_entry_do_special:
	stmdb	sp!, {r0, r1}
	mov	r0, r9
	bl	_ZN10JavaThread40check_special_condition_for_native_transEPS_
	ldmia	sp!, {r0, r1}
	b	.native_entry_do_return

	ALIGN_CODE
fast_normal_entry:
	ldrh	r0, [tmp2, #40]
	mov	r1, #0
	ldrh	r3, [tmp2, #42]
        mvn     ip, #0x540             @ form 0xCAFEBABF in ip
	ldrh	r2, [tmp2, #38]
        bic     ip, ip, #0x35000000
        sub     r7, r0, r3
        subs    r5, r7, #2
        tst     r7, #1
        bic     ip, ip, #0x14000
        strne   r1, [stack, #-4]!
        bcc     3f
1:
        str     r1, [stack, #-4]
        str     r1, [stack, #-8]!
        subs    r5, r5, #2
        bcs     1b
3:
	ldr	lr, [tmp1, #THREAD_TOP_ZERO_FRAME]
        str     istate, [stack, #-76 + ISTATE_SAVED_ISTATE]
        sub     istate, stack, #76                      @ istate == istate
        sub     r2, istate, r2, lsl #2
        str     r1, [stack, #-76 + ISTATE_MDX]
        mov     r7, istate                              @ monitor_base == istate
	str	r2, [tmp1, #THREAD_JAVA_SP]
        sub     r5, r2, #4                      @ stack limit = istate - stackwords - 4
        mov     r3, istate
        stmdb   stack, {r1, r3, r5, r7, istate, ip, lr} @
        sub     locals, stack, #4
        add     locals, locals, r0, lsl #2      @ locals == r7
        ldr     r3, [tmp1, #THREAD_JAVA_STACK_BASE]
        sub     stack, istate, #4                       @ stack == r4
        ldr     jpc, [tmp2, #8]
        ldr     constpool, [tmp2, #12]                  @
        str     stack, [istate, #ISTATE_STACK]
        add     ip, istate, #72
	DISPATCH_START	48
	mov	lr, #0				@ ECN: FIXME - r1 already 0
        ldr     constpool, [constpool, #12]
        str     ip, [tmp1, #THREAD_TOP_ZERO_FRAME]
        rsb     r2, r3, r2
        str     ip, [tmp1, #THREAD_LAST_JAVA_SP]
	DISPATCH_NEXT
        str     tmp1, [istate, #ISTATE_THREAD]
        stmib   istate, {jpc, locals, constpool, r10}
	DISPATCH_NEXT
        cmp     r2, #4096
        add     constpool, constpool, #CONST_POOL_OFFSET
        str     lr, [istate, #ISTATE_PREV_LINK]
	blt	.throw_stack_overflow
	DISPATCH_NEXT
	str	lr, [istate, #ISTATE_CALLEE]
	DISPATCH_FINISH

handle_return:

	ldr	tmp2, [istate, #ISTATE_MONITOR_BASE]	@ tmp2 = base

	ldr	tmp1, [istate, #ISTATE_STACK_BASE]	@ tmp1 = end
	ldr	tmp_xxx, [istate, #ISTATE_THREAD]

	cmp	tmp1, tmp2
	blcc	return_check_monitors

	mov	r3, #0
	ldrb	ip, [jpc, #0]

	ldr	r2, [tmp_xxx, #THREAD_TOP_ZERO_FRAME]
	str	r3, [tmp_xxx, #THREAD_LAST_JAVA_SP]
	ldr	r0, [istate, #ISTATE_METHOD]
	ldr	r3, [r2, #0]
	ldrh	r0, [r0, #40]
	add	r1, r2, #4
	str	r3, [tmp_xxx, #THREAD_TOP_ZERO_FRAME]

	add	r1, r1, r0, lsl #2

	cmp	ip, #opc_lreturn
	cmpne	ip, #opc_dreturn
	ldreq	r0, [stack, #8]
	streq	r0, [r1, #-4]!
	cmpne	ip, #opc_ireturn
	cmpne	ip, #opc_freturn
	cmpne	ip, #opc_areturn
	ldreq	r0, [stack, #4]
	streq	r0, [r1, #-4]!

	ldr	istate, [istate, #ISTATE_SAVED_ISTATE]

	str	r1, [tmp_xxx, #THREAD_JAVA_SP]

	cmp	istate, #ISTATE_THREAD

	addeq	sp, sp, #220
	ldmeqfd	sp!, {regset, pc}

fast_handle_return:
        ldr	ip, [istate, #ISTATE_THREAD]
        ldr     r3, [ip, #THREAD_JAVA_SP]
        ldr     r2, [istate, #ISTATE_STACK_LIMIT]
        sub     r3, r3, #4
        str     r3, [istate, #ISTATE_STACK]

        ldr     r1, [ip, #THREAD_TOP_ZERO_FRAME]
        add     r2, r2, #4
        str     r2, [ip, #THREAD_JAVA_SP]
        str     r1, [ip, #THREAD_LAST_JAVA_SP]
        ldr     r0, [istate, #ISTATE_THREAD]
        ldr     stack, [istate, #ISTATE_STACK]
        ldr     jpc, [istate, #ISTATE_BCP]
        ldr     r3, [r0, #THREAD_PENDING_EXC]
        DISPATCH_START	3
        ldr     constpool, [istate, #ISTATE_CONSTANTS]
        ldr     locals, [istate, #ISTATE_LOCALS]
        DISPATCH_NEXT
	add	constpool, constpool, #CONST_POOL_OFFSET
        DISPATCH_NEXT
        cmp     r3, #0
        DISPATCH_NEXT
        bne     return_exception
        DISPATCH_FINISH

normal_return:
        add   sp, sp, #220
        str   stack, [tmp_xxx, #THREAD_JAVA_SP]
        ldmfd sp!, {regset, pc}

return_check_monitors:
	ldr	r2, [istate, #ISTATE_METHOD]
	ldr	r0, [r2, #24]
	tst	r0, #1<<5
	subne	tmp2, tmp2, #8
	cmp	tmp1, tmp2
	bcs	.return_unlock
1:
	ldr	r3, [tmp1, #4]
	cmp	r3, #0
	bne	return_throw_illegal_monitor_state
	add	tmp1, tmp1, #8
	cmp	tmp1, tmp2
	bcc	1b

.return_unlock:
	tst	r0, #1<<5
	bxeq	lr

	ldr	tmp1, [tmp2, #4]			@ base->obj == NULL
	cmp	tmp1, #0
	beq	return_throw_illegal_monitor_state

	ldr	r0, [tmp2, #0]			@ r0 = header
	mov	r3, #0
	cmp	r0, #0
	str	r3, [tmp2, #4]			@ base->obj = NULL
	bxeq	lr

	mov	tmp_vvv, lr
	mov	r1, tmp1
	mov	r2, tmp2
	bl	_ZN6Atomic11cmpxchg_ptrEPvPVvS0_
	cmp	tmp2, r0
	bxeq	tmp_vvv

	str	tmp1, [tmp2, #4]
	add	r0, sp, #144
	mov	r1, tmp_xxx
	bl	_ZN10HandleMark10initializeEP6Thread
	mov	r1, tmp2
	mov	r0, tmp_xxx
	str	jpc, [istate, #ISTATE_BCP]
	str	stack, [istate, #ISTATE_STACK]
	bl	_ZN18InterpreterRuntime11monitorexitEP10JavaThreadP15BasicObjectLock
	ldr	stack, [istate, #ISTATE_STACK]
	ldr	jpc, [istate, #ISTATE_BCP]
	add	r0, sp, #144
	bl	_ZN10HandleMarkD1Ev
	ldr	r3, [tmp_xxx, #THREAD_PENDING_EXC]
	cmp	r3, #0
	bne	handle_exception
	bx	tmp_vvv

return_throw_illegal_monitor_state:
	add	r0, sp, #144
	mov	r1, tmp_xxx
	bl	_ZN10HandleMark10initializeEP6Thread
	str	jpc, [istate, #ISTATE_BCP]
	str	stack, [istate, #ISTATE_STACK]
	mov	r0, tmp_xxx
	bl	_ZN18InterpreterRuntime37throw_illegal_monitor_state_exceptionEP10JavaThread
	add	r0, sp, #144
	bl	_ZN10HandleMarkD1Ev
	b	handle_exception_with_bcp

@ ----------------------------------------------------------------------------------------
.throw_stack_overflow:
	ldr	r0, [istate, #ISTATE_THREAD]
	bl	_ZN18InterpreterRuntime24throw_StackOverflowErrorEP10JavaThread
	ldr	r3, [istate, #ISTATE_THREAD]
	ldr	ip, [istate, #ISTATE_THREAD]
	ldr	r2, [r3, #THREAD_TOP_ZERO_FRAME]
	mov	r3, #0
	add	r1, r2, #4
	str	r3, [ip, #THREAD_LAST_JAVA_SP]
	str	r1, [ip, #THREAD_JAVA_SP]
	ldr	r3, [r2, #0]
	str	r3, [ip, #THREAD_TOP_ZERO_FRAME]
	ldr	r2, [istate, #ISTATE_METHOD]
	ldrh	r3, [r2, #40]
	mov	r3, r3, asl #2
	add	r1, r1, r3
	str	r1, [ip, #THREAD_JAVA_SP]
	ldr	istate, [istate, #ISTATE_SAVED_ISTATE]
	cmp	istate, #ISTATE_THREAD
	addeq	sp, sp, #220
	ldmeqfd	sp!, {regset, pc}
	b	fast_handle_return

handle_exception_do_not_unlock:
	mov	r3, #1
	strb	r3, [r2, #THREAD_DO_NOT_UNLOCK]
	b	handle_exception

raise_exception:
	adr	r1, null_str
raise_exception_with_msg:
	str	r1, [sp]
	ldr	r3, [dispatch, #VmSymbols_symbols_Address-XXX]
	ldr	r3, [r3, r0, lsl #2]
        ldr     tmp1, [istate, #ISTATE_THREAD]
        str     jpc, [istate, #ISTATE_BCP]
        str     stack, [istate, #ISTATE_STACK]
        mov     ip, #_thread_in_vm
        str     ip, [tmp1, #THREAD_STATE]
        mov     r2, #99
        ldr     r0, [istate, #ISTATE_THREAD]
        adrl    r1, bytecode_interpreter_str
       	bl      _ZN10Exceptions10_throw_msgEP6ThreadPKciP13symbolOopDescS3_
        mov     r0, sp
        str     tmp1, [sp]
       	bl      _ZN18ThreadInVMfromJavaD1Ev
        b       handle_exception_with_bcp
null_str:
	.byte	0
	ALIGN_WORD

invokespecial_exception_fix:
invokestatic_exception_fix:
invokevirtual_exception_fix:
return_exception:
	sub	jpc, jpc, #3
invokespecial_exception:
invokestatic_exception:
invokevirtual_exception:
putfield_exception:
getfield_exception:
handle_exception:
	str	jpc, [istate, #ISTATE_BCP]
handle_exception_with_bcp:
	ldr	stack, [istate, #ISTATE_STACK_BASE]
	sub	stack, stack, #4
	str	stack, [istate, #ISTATE_STACK]
	add	r1, sp, #168
	str	r1, [sp, #36]
	ldr	r0, [istate, #ISTATE_THREAD]
handle_exception_1:
	ldr	sl, [r0, #4]
	str	r0, [sp, #124]
	cmp	sl, #0
	moveq	tmp_yyy, sl
	beq	.handle_exception_3
	ldr	r0, [r0, #THREAD_HANDLE_AREA]
	ldr	r1, [r0, #8]
	ldr	r3, [r0, #12]
	add	r2, r1, #4
	cmp	r2, r3
	movls	r3, r1
	strls	r2, [r0, #8]
	bls	.handle_exception_2
	mov	r1, #4
	bl	_ZN5Arena4growEj
	mov	r3, r0
.handle_exception_2:
	str	sl, [r3, #0]
	mov	tmp_yyy, r3
	ldr	r0, [istate, #ISTATE_THREAD]
.handle_exception_3:
	mov	r1, r0
	ldr	r0, [sp, #36]
	bl	_ZN10HandleMark10initializeEP6Thread
	ldr	r0, [istate, #ISTATE_THREAD]
	bl	_ZN12ThreadShadow23clear_pending_exceptionEv
	ldr	r1, [istate, #ISTATE_STACK_BASE]
	ldr	r0, [istate, #ISTATE_THREAD]
	cmp	tmp_yyy, #0
	sub	stack, r1, #4
	moveq	r1, tmp_yyy
	str	stack, [istate, #ISTATE_STACK]
	ldrne	r1, [tmp_yyy, #0]
	bl	_ZN18InterpreterRuntime31exception_handler_for_exceptionEP10JavaThreadP7oopDesc
	ldr	stack, [istate, #ISTATE_STACK]
	mov	sl, r0
	ldr	r0, [istate, #ISTATE_THREAD]
	ldr	r3, [r0, #THREAD_PENDING_EXC]
	cmp	r3, #0
	beq	.handle_exception_5
	ldr	r0, [sp, #36]
	bl	_ZN10HandleMarkD1Ev
	ldr	r1, [sp, #124]
	ldr	tmp_yyy, [r1, #THREAD_LAST_HANDLE_MARK]
	ldr	r0, [tmp_yyy, #8]
	ldr	sl, [tmp_yyy, #4]
	ldr	r3, [r0, #0]
	cmp	r3, #0
	beq	.handle_exception_4
	bl	_ZN5Chunk9next_chopEv
	ldr	r0, [tmp_yyy, #8]
.handle_exception_4:
	str	r0, [sl, #4]
	ldr	r3, [tmp_yyy, #12]
	str	r3, [sl, #8]
	ldr	r2, [tmp_yyy, #16]
	str	r2, [sl, #12]
	ldr	r0, [istate, #ISTATE_THREAD]
	b	handle_exception_1
.handle_exception_5:
	ldr	tmp_yyy, [r0, #THREAD_VM_RESULT]
	cmp	tmp_yyy, #0
	moveq	r1, tmp_yyy
	beq	.handle_exception_7
	ldr	r3, [dispatch, #ThreadLocalStorage_thread_index-XXX]
	ldr	r0, [r3]
	bl	pthread_getspecific
	ldr	r0, [r0, #THREAD_HANDLE_AREA]
	ldr	r1, [r0, #8]
	ldr	r3, [r0, #12]
	add	r2, r1, #4
	cmp	r2, r3
	movls	r3, r1
	strls	r2, [r0, #8]
	bls	.handle_exception_6
	mov	r1, #4
	bl	_ZN5Arena4growEj
	mov	r3, r0
.handle_exception_6:
	str	tmp_yyy, [r3, #0]
	mov	r1, r3
	ldr	r0, [istate, #ISTATE_THREAD]
.handle_exception_7:
	cmp	sl, #0
	mov	r3, #0
	str	r3, [r0, #THREAD_VM_RESULT]
	blt	.handle_exception_9
	cmp	r1, r3
	moveq	r0, r1
	ldrne	r0, [r1, #0]
	str	r0, [stack, #0]
	sub	stack, stack, #4
	ldr	r3, [istate, #ISTATE_METHOD]
	ldr	r0, [sp, #36]
	ldr	r2, [r3, #8]
	add	r2, r2, #48
	add	ip, r2, sl
	str	ip, [istate, #ISTATE_BCP]
	bl	_ZN10HandleMarkD1Ev
	ldr	r1, [sp, #124]
	ldr	tmp_yyy, [r1, #THREAD_LAST_HANDLE_MARK]
	ldr	r0, [tmp_yyy, #8]
	ldr	sl, [tmp_yyy, #4]
	ldr	r3, [r0, #0]
	cmp	r3, #0
	beq	.handle_exception_8
	bl	_ZN5Chunk9next_chopEv
	ldr	r0, [tmp_yyy, #8]
.handle_exception_8:
	str	r0, [sl, #4]
	ldr	r3, [tmp_yyy, #12]
	str	r3, [sl, #8]
	ldr	r2, [tmp_yyy, #16]
	str	r2, [sl, #12]
	b	do_execute_java_bytecodes_restore_locals_and_jpc
.handle_exception_9:
	cmp	r1, #0
	ldr	r0, [istate, #ISTATE_THREAD]
	mov	r2, #0
	ldrne	r1, [r1, #0]
	mov	r3, r2
	bl	_ZN12ThreadShadow21set_pending_exceptionEP7oopDescPKci
	ldr	r0, [istate, #ISTATE_THREAD]
	ldr	tmp_yyy, [r0, #4]
	cmp	tmp_yyy, #0
	streq	tmp_yyy, [sp, #48]
	beq	.handle_exception_11
	ldr	r0, [r0, #THREAD_HANDLE_AREA]
	ldr	r1, [r0, #8]
	ldr	r3, [r0, #12]
	add	r2, r1, #4
	cmp	r2, r3
	movls	r3, r1
	strls	r2, [r0, #8]
	bls	.handle_exception_10
	mov	r1, #4
	bl	_ZN5Arena4growEj
	mov	r3, r0
.handle_exception_10:
	str	tmp_yyy, [r3, #0]
	ldr	r0, [istate, #ISTATE_THREAD]
	str	r3, [sp, #48]
.handle_exception_11:
	bl	_ZN12ThreadShadow23clear_pending_exceptionEv
	mov	r1, #0
	ldr	r0, [istate, #ISTATE_THREAD]
	str	r1, [sp, #44]
	ldrb	r3, [r0, #THREAD_DO_NOT_UNLOCK]	@ zero_extendqisi2
	cmp	r3, r1
	beq	.handle_exception_15
	strb	r1, [r0, #THREAD_DO_NOT_UNLOCK]
	ldr	r0, [istate, #ISTATE_THREAD]
.handle_exception_12:
	ldr	r1, [sp, #48]
	cmp	r1, #0
	movne	r2, r1
	ldrne	r1, [r2, #0]
.handle_exception_13:
	mov	r2, #0
	mov	r3, r2
	bl	_ZN12ThreadShadow21set_pending_exceptionEP7oopDescPKci
	mov	r3, #0
	ldr	r2, [istate, #ISTATE_BCP]
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	str	stack, [istate, #ISTATE_STACK]
	str	r2, [istate, #ISTATE_CALLEE]
	ldr	lr, [istate, #ISTATE_THREAD]
	ldr	r1, [lr, #THREAD_TOP_ZERO_FRAME]
	str	r3, [lr, #THREAD_LAST_JAVA_SP]
	add	r2, r1, #4
	str	r2, [lr, #THREAD_JAVA_SP]
	ldr	r3, [r1, #0]
	str	r3, [lr, #THREAD_TOP_ZERO_FRAME]
	ldr	r1, [istate, #ISTATE_METHOD]
	ldrh	r3, [r1, #40]
	ldr	r0, [sp, #36]
	mov	r3, r3, asl #2
	add	r2, r2, r3
	str	r2, [lr, #THREAD_JAVA_SP]
	bl	_ZN10HandleMarkD1Ev
	ldr	r0, [sp, #124]
	ldr	tmp_yyy, [r0, #THREAD_LAST_HANDLE_MARK]
	ldr	r0, [tmp_yyy, #8]
	ldr	sl, [tmp_yyy, #4]
	ldr	r3, [r0, #0]
	cmp	r3, #0
	beq	.handle_exception_14
	bl	_ZN5Chunk9next_chopEv
	ldr	r0, [tmp_yyy, #8]
.handle_exception_14:
	str	r0, [sl, #4]
	ldr	r3, [tmp_yyy, #12]
	str	r3, [sl, #8]
	ldr	r2, [tmp_yyy, #16]
	str	r2, [sl, #12]
	ldr	istate, [istate, #ISTATE_SAVED_ISTATE]
	cmp	istate, #ISTATE_THREAD
	bne	fast_handle_return
	add	sp, sp, #220
	ldmfd	sp!, {regset, pc}
.handle_exception_15:
	ldr	ip, [istate, #ISTATE_MONITOR_BASE]
	ldr	r2, [istate, #ISTATE_METHOD]
	str	ip, [sp, #92]
	ldr	tmp_vvv, [istate, #ISTATE_STACK_BASE]
	ldr	r3, [r2, #24]
	mov	r3, r3, lsr #5
	ands	r3, r3, #1
	subne	ip, ip, #8
	strne	ip, [sp, #92]
	ldr	lr, [sp, #92]
	str	r3, [sp, #96]
	cmp	tmp_vvv, lr
	bcs	.handle_exception_21
	add	r0, sp, #144
	add	r1, sp, #212
	str	r0, [sp, #28]
	str	r1, [sp, #24]
	.p2align 3
.handle_exception_16:
	ldr	tmp_yyy, [tmp_vvv, #4]
	cmp	tmp_yyy, #0
	beq	.handle_exception_20
	ldr	fp, [tmp_vvv, #0]
	mov	r2, #0
	cmp	fp, r2
	str	r2, [tmp_vvv, #4]
	beq	.handle_exception_19
	.p2align 3
.handle_exception_17:
	ldr	sl, [tmp_yyy, #0]
	cmp	tmp_vvv, sl
	bne	.handle_exception_18
	mov	r0, tmp_vvv
	mov	r1, fp
	mov	r2, tmp_yyy
	mov	r3, #0xffffffc0
	bic	r3, r3, #0xf000
	blx	r3
	cmp	r0, #0
	bne	.handle_exception_17
.handle_exception_18:
	cmp	tmp_vvv, sl
	beq	.handle_exception_19
	str	tmp_yyy, [tmp_vvv, #4]
	ldr	r0, [sp, #28]
	ldr	r1, [istate, #ISTATE_THREAD]
	bl	_ZN10HandleMark10initializeEP6Thread
	mov	r1, tmp_vvv
	ldr	r0, [istate, #ISTATE_THREAD]
	str	stack, [istate, #ISTATE_STACK]
	bl	_ZN18InterpreterRuntime11monitorexitEP10JavaThreadP15BasicObjectLock
	ldr	stack, [istate, #ISTATE_STACK]
	ldr	r0, [sp, #28]
	bl	_ZN10HandleMarkD1Ev
.handle_exception_19:
	ldr	r1, [sp, #44]
	cmp	r1, #0
	beq	.handle_exception_27
	ldr	r3, [r1, #0]
	cmp	r3, #0
	beq	.handle_exception_27
.handle_exception_20:
	ldr	r3, [sp, #92]
	add	tmp_vvv, tmp_vvv, #8
	cmp	tmp_vvv, r3
	bcc	.handle_exception_16
.handle_exception_21:
	ldr	ip, [sp, #96]
	cmp	ip, #0
	beq	.handle_exception_23
	ldr	r0, [sp, #92]
	ldr	sl, [r0, #4]
	cmp	sl, #0
	beq	.handle_exception_26
	mov	ip, r0
	ldr	r0, [r0, #0]
	mov	r3, #0
	cmp	r0, #0
	str	r3, [ip, #4]
	beq	.handle_exception_23
	mov	r1, sl
	ldr	r2, [sp, #92]
	bl	_ZN6Atomic11cmpxchg_ptrEPvPVvS0_
	ldr	r1, [sp, #92]
	cmp	r1, r0
	beq	.handle_exception_22
	ldr	r3, [sp, #92]
	add	tmp_yyy, sp, #144
	mov	r0, tmp_yyy
	str	sl, [r3, #4]
	ldr	r1, [istate, #ISTATE_THREAD]
	bl	_ZN10HandleMark10initializeEP6Thread
	ldr	r1, [sp, #92]
	ldr	r0, [istate, #ISTATE_THREAD]
	str	stack, [istate, #ISTATE_STACK]
	bl	_ZN18InterpreterRuntime11monitorexitEP10JavaThreadP15BasicObjectLock
	mov	r0, tmp_yyy
	ldr	stack, [istate, #ISTATE_STACK]
	bl	_ZN10HandleMarkD1Ev
	ldr	r0, [istate, #ISTATE_THREAD]
	ldr	r1, [r0, #4]
	cmp	r1, #0
	beq	.handle_exception_24
	add	r0, sp, #204
	bl	_ZN6HandleC1EP7oopDesc
	ldr	r1, [sp, #204]
	ldr	r0, [istate, #ISTATE_THREAD]
	str	r1, [sp, #44]
	bl	_ZN12ThreadShadow23clear_pending_exceptionEv
.handle_exception_22:
	ldr	r0, [istate, #ISTATE_THREAD]
	b	.handle_exception_24
.handle_exception_23:
	ldr	r0, [istate, #ISTATE_THREAD]
.handle_exception_24:
	ldr	r3, [sp, #44]
	cmp	r3, #0
	beq	.handle_exception_12
.handle_exception_25:
	ldr	lr, [sp, #44]
	ldr	r1, [lr, #0]
	cmp	r1, #0
	bne	.handle_exception_13
	b	.handle_exception_12
.handle_exception_26:
	ldr	r1, [sp, #44]
	cmp	r1, #0
	beq	.handle_exception_29
	ldr	r3, [r1, #0]
	cmp	r3, #0
	beq	.handle_exception_29
	ldr	r0, [istate, #ISTATE_THREAD]
	b	.handle_exception_25

.handle_exception_27:
	ldr	r0, [sp, #28]
	ldr	r1, [istate, #ISTATE_THREAD]
	bl	_ZN10HandleMark10initializeEP6Thread
	ldr	r0, [istate, #ISTATE_THREAD]
	str	stack, [istate, #ISTATE_STACK]
	bl	_ZN18InterpreterRuntime37throw_illegal_monitor_state_exceptionEP10JavaThread
	ldr	r0, [sp, #28]
	ldr	stack, [istate, #ISTATE_STACK]
	bl	_ZN10HandleMarkD1Ev
	ldr	r0, [sp, #24]
	ldr	r3, [istate, #ISTATE_THREAD]
	ldr	r1, [r3, #4]
	bl	_ZN6HandleC1EP7oopDesc
	ldr	r2, [sp, #212]
	ldr	r0, [istate, #ISTATE_THREAD]
	str	r2, [sp, #44]
	bl	_ZN12ThreadShadow23clear_pending_exceptionEv
	b	.handle_exception_20
.handle_exception_28:
	mov	r1, fp
	str	stack, [istate, #ISTATE_STACK]
	ldr	r0, [istate, #ISTATE_THREAD]
	bl	_ZN18InterpreterRuntime12monitorenterEP10JavaThreadP15BasicObjectLock
	ldr	r0, [istate, #ISTATE_THREAD]
	ldr	stack, [istate, #ISTATE_STACK]
	ldr	r3, [r0, #THREAD_PENDING_EXC]
	cmp	r3, #0
	mov	r2, r0
	beq	do_execute_java_bytecodes_restore_locals_and_jpc
	b	handle_exception_do_not_unlock
.handle_exception_29:
	add	tmp_yyy, sp, #144
	mov	r0, tmp_yyy
	ldr	r1, [istate, #ISTATE_THREAD]
	bl	_ZN10HandleMark10initializeEP6Thread
	ldr	r0, [istate, #ISTATE_THREAD]
	str	stack, [istate, #ISTATE_STACK]
	bl	_ZN18InterpreterRuntime37throw_illegal_monitor_state_exceptionEP10JavaThread
	mov	r0, tmp_yyy
	ldr	stack, [istate, #ISTATE_STACK]
	bl	_ZN10HandleMarkD1Ev
	ldr	r3, [istate, #ISTATE_THREAD]
	add	r0, sp, #208
	ldr	r1, [r3, #4]
	bl	_ZN6HandleC1EP7oopDesc
	ldr	r2, [sp, #208]
	ldr	r0, [istate, #ISTATE_THREAD]
	str	r2, [sp, #44]
	bl	_ZN12ThreadShadow23clear_pending_exceptionEv
	ldr	r0, [istate, #ISTATE_THREAD]
	b	.handle_exception_24
opclabels_data_adcon:
	.word	opclabels_data(GOTOFF)

	ALIGN_CODE
fast_accessor_entry:
	ldr	ip, [dispatch, #SafePointSynchronize_state_Address-XXX]
	ldr	r3, [tmp2, #8]
	ldr	ip, [ip, #0]
	ldrb	lr, [r3, #50]
	ldrb	r3, [r3, #51]
	cmp	ip, #0
	ldr	ip, [tmp2, #12]
	bne	fast_normal_entry
	ldr	ip, [ip, #12]

	DISPATCH_START	3

	orr	lr, lr, r3, lsl #8		@ lr = index
	add	r3, ip, #16
	ldr	lr, [r3, lr, lsl #4]!		@ r3 = cache, lr = flags

	DISPATCH_NEXT

	cmp	lr, #180 << 16
	GET_STACK	0, lr
	bne	fast_normal_entry

	cmp	lr, #0
	beq	fast_normal_entry


	ldr	r2, [r3, #12]
	ldr	r3, [r3, #8]
	movs	r2, r2, lsr #29
	bls	.fast_accessor_non_w

	DISPATCH_NEXT

	ldr	tmp1, [lr, r3]

	DISPATCH_NEXT
	DISPATCH_NEXT

	PUT_STACK	0, tmp1

	DISPATCH_FINISH

.fast_accessor_non_w:
	bcs	.fast_accessor_h
	beq	.fast_accessor_sb
	tst	r2, #2
	bne	.fast_accessor_dw
.fast_accessor_sh:
	DISPATCH_STATE	2
	DISPATCH_NEXT
	ldrsh	tmp1, [lr, r3]
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUT_STACK	0, tmp1
	DISPATCH_FINISH
.fast_accessor_h:
	DISPATCH_STATE	2
	DISPATCH_NEXT
	ldrh	tmp1, [lr, r3]
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUT_STACK	0, tmp1
	DISPATCH_FINISH
.fast_accessor_sb:
	DISPATCH_STATE	2
	DISPATCH_NEXT
	ldrsb	tmp1, [lr, r3]
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUT_STACK	0, tmp1
	DISPATCH_FINISH
.fast_accessor_dw:
	DISPATCH_STATE	2
	add	tmp1, lr, r3
	DISPATCH_NEXT
	ldm	tmp1, {tmp2, tmp1}
	DISPATCH_NEXT
	PUT_STACK	0, tmp1
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH

.iconst_div_rem_0:
	sub	jpc, jpc, #1			@ Point to idiv
.lrem_0:
.ldiv_0:
.remc_0:
.divc_0:
divide_by_zero_exception:
	mov	r0, #VMSYMBOLS_ArithmeticException
	adr	r1, div_zero_msg
	b	raise_exception_with_msg
div_zero_msg:
	.ascii  "/ by int zero\000"
	ALIGN_WORD

array_bound_exception_jpc_4_r3:
	sub	jpc, jpc, #1
array_bound_exception_jpc_3_r3:
	sub	jpc, jpc, #1
array_bound_exception_jpc_2_r3:
	sub	jpc, jpc, #1
array_bound_exception_jpc_1_r3:
	sub	jpc, jpc, #1
array_bound_exception_jpc_0_r3:
	mov	r2, r3
	b	array_bounds_exception
array_bound_exception_jpc_1_tmp2:
	sub	jpc, jpc, #1
array_bound_exception_jpc_0_tmp2:
	mov	r2, tmp2
	b	array_bounds_exception
array_bound_exception_jpc_3:
	sub	jpc, jpc, #1
array_bound_exception_jpc_2:
	sub	jpc, jpc, #1
array_bound_exception_jpc_1:
	sub	jpc, jpc, #1
array_bound_exception_jpc_0:
array_bounds_exception:
	adr	r1, percent_d_str
	add	r0, sp, #168
	bl	sprintf
	add	r1, sp, #168
	mov	r0, #VMSYMBOLS_ArrayIndexOutOfBounds
	b	raise_exception_with_msg
percent_d_str:
	.ascii	"%d\000"
	ALIGN_WORD

#ifndef HW_NULL_PTR_CHECK
null_ptr_exception_jpc_5:
	sub	jpc, jpc, #1
null_ptr_exception_jpc_4:
	sub	jpc, jpc, #1
null_ptr_exception_jpc_3:
	sub	jpc, jpc, #1
null_ptr_exception_jpc_2:
	sub	jpc, jpc, #1
null_ptr_exception_jpc_1:
	sub	jpc, jpc, #1
null_ptr_exception_jpc_0:
#endif
null_ptr_exception:
	mov	r0, #VMSYMBOLS_NullPointerException
	b	raise_exception

@ ==== Fast SW FP emulation ===============================================================

#define al		r0
#define ah		r1
#define bl		r2
#define bh		r3
#define tmp		tmp1
#define sh		r12
#define ex_add		r14

@ TOS = TOSM1 + TOS
@ What we actually do is TOS = TOS + TOSM1
@ --- do_dadd_vtos -------------------------------------------------
	Opcode	dadd
	POP4	al, ah, bl, bh
	mov	tmp, #0xff000000
	orr	tmp, tmp, #0x00e00000
        bics    ex_add, tmp, ah, LSL #1
        bicnes  ex_add, tmp, bh, LSL #1
        beq     .dadd_naninf
        teq     ah, bh
        eormi   bh, bh, #1 << 31
        bmi     ._dsub1
._dadd1:
        subs    ex_add, al, bl
        sbcs    sh, ah, bh
        bhs     .dadd_swapped
        adds    bl, bl, ex_add
        adc     bh, bh, sh
        subs    al, al, ex_add
        sbc     ah, ah, sh
.dadd_swapped:
        mov     ex_add, ah, LSR #20
        sub     sh, ex_add, bh, LSR #20
        tst     tmp, bh, LSL #1
        beq     .dadd_uncommon
        bic     ah, ah, ex_add, LSL #20
        bic     bh, bh, tmp
        orr     bh, bh, #1 << 20
.dadd_doadd:
        rsbs    tmp, sh, #32
        blo     .dadd_bigshift
.dadd_smallshift:
        adds    al, al, bl, LSR sh
        adc     ah, ah, bh, LSR sh
        adds    al, al, bh, LSL tmp
        adcs    ah, ah, #0
        cmp     ah, #1 << 20
        bhs     .dadd_carry
        add     ah, ah, ex_add, LSL #20     @ add exponent
.dadd_nocarry:
        movs    bl, bl, LSL tmp         @ round and sticky bits
	bpl	.dadd_exit
        adds    al, al, #1
        movccs  bl, bl, LSL #1          @ is sticky bit zero?
	bne	.dadd_exit
.dadd_roundeven:
        cmp     al, #0
        bicne   al, al, #1              @ RTE if carry didn't occur
        adceq   ah, ah, #0              @ increment high word if it did
.dadd_check_overflow_inx:
        mov     bh, ah, LSL #1
        cmp     bh, #0xFFE00000
	blo	.dadd_exit
        subhs   ah, ah, #3<<29          @ bias exponent
	b	.return_double_Inf
.dadd_bigshift:
        cmp     bl, #1
        adc     bl, bh, bh
        sub     sh, sh, #32             @ nonzero
        rsbs    tmp, sh, #31            @ sets C if within a word
        movlo   tmp, #0                 @ C clear if sh > 31
        addhss  al, al, bh, LSR sh
        adc     ah, ah, ex_add, LSL #20
        cmp     ex_add, ah, LSR #20
        beq     .dadd_nocarry
        sub     ah, ah, ex_add, LSL #20
.dadd_carry:
        add     ah, ah, #1 << 20
        movs    ah, ah, LSR #1
        add     ah, ah, ex_add, LSL #20
        movs    al, al, RRX
        bcc     .dadd_check_overflow_exact
        adcs    al, al, #0
        movccs  tmp, bl, LSL tmp    @EQ = round to even
        bne     .dadd_check_overflow_exact
        b       .dadd_roundeven
.dadd_rnearup_carry:
        adds    al, al, #1
        movccs  bl, bl, LSL #1          @ is sticky bit zero?
        bne     .dadd_check_overflow_inx
        b       .dadd_roundeven
.dadd_check_overflow_exact:
        mov     bh, ah, LSL #1
        cmp     bh, #0xFFE00000
	blo	.dadd_exit
        sub     ah, ah, #3<<29          @ bias exponent

.return_double_Inf:
	and	a3, ah, #0x80000000
.return_double_Inf_1:
	mov	al, #0
	mov	ah, #0x7f000000
	orr	ah, ah, #0x00f00000
	orr	ah,ah,a3
.dadd_exit:
	PUSH2	al, ah
	DISPATCH	1

.dadd_uncommon:
        orrs    tmp, bl, bh, LSL #1     @ Is b zero or denormal?
        beq     .dadd_bzero
        movs    tmp, ex_add, LSL #21
        bic     ah, ah, ex_add, LSL #20
        bicne   bh, bh, #1 << 31
        subne   sh, sh, #1              @ adjust exponent to fake exp_b = 1
        bne     .dadd_doadd    
        adds    al, al, bl
        adc     ah, ah, bh
        b       .daddsub_denorm
.dadd_bzero:
        movs    tmp, ex_add, LSL #21        @ is a denormal?
	bne	.dadd_exit
        orrs    tmp, al, ah, LSL #1     @ a zero?
	beq	.dadd_exit
        b       .daddsub_denorm

.dadd_naninf:
        cmp     al, #1                  @ sets C if al!=0
        adc     ex_add, ah, ah
        cmp     bl, #1
        adc     sh, bh, bh
        cmp     ex_add, tmp                 @ HI if a is NaN
        cmpls   sh, tmp                 @ HI if either is NaN
        bhi     .return_double_NaN
        cmp     ex_add, sh
        beq     .dadd_twoinf
        cmp     ex_add, tmp                 @ EQ if a is Inf
        movne   ah, bh
        movne   al, bl
	b	.dadd_exit
.dadd_twoinf:
        teq     ah, bh
	bpl	.dadd_exit
	b	.return_double_NaN

@ ECN: load 1st arg off stack and do a reverse subtract
@ ECN: We want TOSM1 - TOS, but args end up in wrong order so do rsb
@ --- do_dsub_itos -------------------------------------------------
	Opcode	dsub
	POP4	al, ah, bl, bh
        mov     tmp, #0xff000000
        orr     tmp, tmp, #0x00e00000
        bics    ex_add, tmp, ah, LSL #1
        bicnes  ex_add, tmp, bh, LSL #1
        beq     .drsb_naninf
	teq	ah, bh
	eor	ah, ah, #1 << 31
	bmi	._dadd1
	eor	bh, bh, #1 << 31
._dsub1:
        subs    ex_add, al, bl
        sbcs    sh, ah, bh
        bhs     .dsub_swapped
.dsub_do_swap:
        eor     sh, sh, #1 << 31        @ negate a and b as a - b == -b - -a
        adds    bl, bl, ex_add
        adc     bh, bh, sh
        subs    al, al, ex_add
        sbc     ah, ah, sh
.dsub_swapped:
        mov     ex_add, ah, LSR #20
        sub     sh, ex_add, bh, LSR #20
        tst     tmp, bh, LSL #1
        beq     .dsub_uncommon
        bic     ah, ah, ex_add, LSL #20
        bic     bh, bh, tmp, ASR #1
        rsbs    bl, bl, #0
        rsc     bh, bh, tmp, ASR #1     @ 0xffe00000 >> 1 = -(1 << 20)
.dsub_dosub:
        rsbs    tmp, sh, #32
        blo     .dsub_bigshift
.dsub_smallshift:
        adds    al, al, bl, LSR sh
        adc     ah, ah, bh, ASR sh
        adds    al, al, bh, LSL tmp
        adcs    ah, ah, #0
        bmi     .dsub_borrow
.dsub_noborrow:
        add     ah, ah, ex_add, LSL #20
        movs    bl, bl, LSL tmp
.dsub_dorounding:
	bpl	.dsub_exit
        adds    al, al, #1              @ Z flag set if carry to high word
        cmpne   bl, #0x80000000         @ check we don't have to round to even
	bne	.dsub_exit
        cmp     al, #0
        addeq   ah, ah, #1
        bicne   al, al, #1
	b	.dsub_exit
.dsub_bigshift:
        cmp     bl, #1
        adc     bl, bh, bh 
        sub     sh, sh, #32
        rsbs    tmp, sh, #31
        blo     .dsub_hugeshift
        adds    al, al, bh, ASR sh
        adcs    ah, ah, #-1
        bpl     .dsub_noborrow
.dsub_borrow:
        add     tmp, tmp, #1
        movs    tmp, bl, LSL tmp
        adcs    al, al, al              @ shift al,ah left including guard bit
        adc     ah, ah, ah
        add     sh, ah, ex_add, LSL #21     @ ah = 0xFFE00000 + fraction. Adding
        movs    sh, sh, LSR #21         @ C-bit is clear if bit 20 of ah
        bls     .dsub_renormalize        @   clear, so 2 bits or more
        add     ah, ah, ex_add, LSL #20
        adds    al, al, tmp, LSR #31    @ C and Z flag are set if carry over
        cmpcc   tmp, #0x80000000        @ check that we don't have to round
	bne	.dsub_exit
        cmp     al, #0
        addeq   ah, ah, #1
        bicne   al, al, #1
	b	.dsub_exit
.dsub_renormalize:
        bcs     .dsub_ex_one
        adds    ah, ah, #1 << 21
        cmpeq   al, #0
        beq     .dsub_retzero            @ go and deal with it, if so
        mov     sh, ex_add, LSR #11
        bic     ex_add, ex_add, #1 << 11
        sub     ex_add, ex_add, #2        @ for leading bit
.dsub_renormloop:                 @ TODO: add loop for 8 bit per cycle renorm
        adds    al, al, al
        adc     ah, ah, ah
        sub     ex_add, ex_add, #1
        tst     ah, #1 << 20
        beq     .dsub_renormloop
        add     ah, ah, sh, LSL #31 
        add     ah, ah, ex_add, LSL #20
        cmp     ex_add, #0
	bgt	.dsub_exit
        add     ah, ah, #3 << 29        @ bias exponent
        @ Rounding direction indicator is zero (denormal results are exact)
	mov	ip, #0
        b       .__dunder
.dsub_hugeshift:
.dsub_return:
        add     ah, ah, ex_add, LSL #20
.dsub_return1:
.dsub_exit:
	PUSH2	al, ah
	DISPATCH	1
.dsub_ex_one:    @ underflow when ex = 1 - shift back to denorm
        movs    ah, ah, ASR #1
        mov     al, al, RRX
        add     ah, ah, ex_add, LSL #20
        b       .dsub_denorm
.dsub_uncommon:
        orrs    tmp, bl, bh, LSL #12    @ is b zero or denorm?
        beq     .dsub_bzero
        movs    tmp, ex_add, LSL #21
        bic     ah, ah, ex_add, LSL #20
        beq     .dsub_both_denorm
        bic     bh, bh, #1 << 31
        sub     sh, sh, #1
        rsbs    bl, bl,#0
        rsc     bh, bh,#0
        b       .dsub_dosub    
.dsub_both_denorm:
        subs    al, al, bl
        sbc     ah, ah, bh
        b       .dsub_denorm
.dsub_bzero:
        orrs    tmp, al, ah, LSL #1
        bne     .dsub_denorm             @ return a@ but it might be denormal
.dsub_retzero:
        mov     ah, #0                  @ clear sign bit (al is already 0)
	b	.dsub_exit
.dsub_denorm:
.daddsub_denorm:
        movs    bl, ah, LSL #1          @ discard sign bit
        tsteq   al, al                  @ do we have a zero?
        beq     .dsub_retzero            @ yes@ go and ensure the right sign
	b	.dsub_exit
.drsb_naninf:
        @ Handle NaNs and infinities in reverse subtraction. We
        @ just swap the operands and go to dsub_naninf.
        eor     ah, ah, bh
        eor     al, al, bl
        eor     bh, bh, ah
        eor     bl, bl, al
        eor     ah, ah, bh
        eor     al, al, bl
.dsub_naninf:
        cmp     al, #1                  @ sets C if al!=0
        adc     ex_add, ah, ah
        cmp     bl, #1
        adc     sh, bh, bh
        cmp     ex_add, tmp                 @ HI if a is NaN
        cmpls   sh, tmp                 @ HI if either is NaN
        bhi     .return_double_NaN
        cmp     ex_add, sh
        beq     .dsub_twoinf
        cmp     ex_add, tmp                 @ EQ if a is Inf
        eorne   ah, bh, #0x80000000
        movne   al, bl
	b	.dsub_exit
.dsub_twoinf:
        teq     ah, bh
	bmi	.dsub_exit

.return_double_NaN:
	and	a3, ah, #0x80000000
	mov	al, #0
	mov	ah, #0x7f000000
	orr	ah, ah, #0x00f80000
	orr	ah,ah,a3
	b	.dsub_exit

@ === underflow handler ================================================

#define	INX_pos	30
#define INX_bit (1<<30)

#define exp	r2
#define temp	r3

.__dunder:
        tst     ah, ah
        orrmi   ip, ip, #1<<16
        mov     temp, #0x600
        mov     exp, ah, LSR #20      @ find the exponent
        add     temp, temp, #1
        bic     ah, ah, exp, LSL #20 @ remove exponent from mantissa
        bic     exp, exp, #0x800        @ lose the sign bit
        sub     exp, temp, exp
        orr     ah, ah, #1<<20      @ put on mantissa leading bit
        cmp     exp, #53
        bhi     .dunder_stickyonly
        beq     .dunder_roundbit
        cmp     exp, #21
        blo     .dunder_hiword
        subs    exp, exp, #32
        bls     .dunder_hiloword
.dunder_loloword:
        rsb     temp, exp, #32
        cmp     al, #0
        mov     al, ah, LSR exp
        mov     exp, ah, LSL temp
        orrne   exp, exp, #1
        mov     ah, #0
        b       .dunder_round
.dunder_hiloword:
        rsb     temp, exp, #0
        add     exp, exp, #32
        mov     ah, ah, LSL temp
        orr     ah, ah, al, LSR exp
        mov     exp, al, LSL temp
        mov     al, ah
        mov     ah, #0
        b       .dunder_round
.dunder_hiword:
        rsb     temp, exp, #32
        mov     tmp, al, LSL temp
        mov     temp, ah, LSL temp
        orr     al, temp, al, LSR exp
        mov     ah, ah, LSR exp
        mov     exp, tmp
        b       .dunder_round
.dunder_roundbit:
        orrs    exp, al, ah, LSL #12
        mov     al, #0
        mov     ah, #0
        mov     exp, #0x80000000
        addne   exp, exp, #1
        b       .dunder_round
.dunder_stickyonly:
        mov     exp, #1
        mov     ah, #0
        mov     al, #0
.dunder_round:
        tst     ip, #1<<16
        bic     ip, ip, #1<<16
        orrne   ah, ah, #0x80000000
        tst     exp, exp
	beq	.dsub_exit
        movs    exp, exp, LSL #1        @ round bit in C, sticky in ~Z
        bcc     .dunder_rerounded        @ if no round bit, we're done
        beq     .dunder_roundeven        @ RTE is tricky due to rerounding
.dunder_roundup:
        adds    al, al, #1          @ round up
        adc     ah, ah, #0
.dunder_rerounded:
	b	.dsub_exit
.dunder_roundeven:
        movs    exp, ip, ASR #INX_pos   @ get -1, 0, +1 from direction bits
        bmi     .dunder_roundup          @ if -1, round up unconditionally
        bne     .dunder_rerounded        @ if +1, round down unconditionally
        adds    al, al, #1          @ round up ...
        adc     ah, ah, #0
        bic     al, al, #1          @ ... and then to even
        b       .dunder_rerounded

@ === MULTIPLY Double ===================================================

#define ex_m		r14
#define uh		r12
#define ul		r4
#define rs		r4
#define th		r5
#define tl		r11

@ --- do_dmul_itos -------------------------------------------------
	Opcode	dmul
	POP4	al, ah, bl, bh
	stmdb	sp!, {r4, r5}
	mov	tmp, #0x7f00000
	orr	tmp, tmp, #0x00f0000
        bics    ex_m, tmp, ah, LSR #4     @ test for Infs or NaNs
        bicnes  ex_m, tmp, bh, LSR #4
        beq     .dmul_naninf
        and     ex_m, tmp, ah, LSR #4     @ get exponent of a
        eor     th, ah, bh              @ compute sign of result
        orr     ex_m, ex_m, th, LSR #31     @   and save it at bottom of ex
        ands    th, tmp, bh, LSR #4     @ get exponent of b, and test
        tstne   ah, tmp, LSL #4         @   for zeros/denorms ...
        beq     .dmul_zerodenorm         @   go and renormalise if we got any
.dmul_normalised:
        add     ex_m, ex_m, th              @ calculate exponent of result
        sub     ex_m, ex_m, #0x3FC0000      @ rebias exponent mostly
        bic     ah, ah, tmp, LSL #5     @ clear sign and all but lo bit of exp
        bic     bh, bh, tmp, LSL #5
        orr     ah, ah, #1<<20          @ set leading bit on mantissa
        orr     bh, bh, #1<<20          @ set leading bit on mantissa
.dmul_mantmul:
        umull   ul, uh, ah, bl
        umull   tl, th, al, bh
        adds    tl, tl, ul
        adcs    th, th, uh              @ carry from here is used below
        umull   ul, uh, ah, bh          @ uh:ul is top part
        adc     bh, uh, #0              @ get carry from above addition
        umull   ah, uh, al, bl          @ uh:ah is bottom part
        adds    tl, tl, uh
        adcs    th, th, ul
        adcs    bh, bh, #0
        tst     ah, ah
        orrne   tl, tl, #1              @ don't lose sticky bit
        mov     bl, #-4
        mov     uh, #32-12              @ uh will be corresponding right shift
        cmp     bh, #0x200              @ C set if it's 11 bits
        adc     uh, uh, #0
        adc     bl, bl, ex_m, ASR #16     @ increment exponent correspondingly
        rsb     ul, uh, #32             @ ul is left shift
        mov     ah, bh, LSL ul
        mov     al, th, LSL ul
        orr     ah, ah, th, LSR uh
        orr     al, al, tl, LSR uh
        add     ah, ah, bl, LSL #20 @ put exponent back on (may wrap
        eor     ah, ah, ex_m, LSL #31 @ put sign back on (with EOR so that
        movs    rs, tl, LSL ul          @ compute the round word
        beq     .dmul_exact
        movs    uh, rs, LSL #1          @ rs is already in place
        movcc   rs, #-INX_bit           @ direction indicator: rounded down
        bcc     .dmul_rounded
        orreq   bh, bh, #1<<31          @ save the round-to-even bit
        adcs    al, al, #0          @ round up if necessary
        adc     ah, ah, #0
        mov     rs, #INX_bit            @ direction indicator: rounded up
        tst     al, bh, LSR #31       @ does RTE do anything?
        bic     al, al, bh, LSR #31 @ perform RTE
        movne   rs, #-INX_bit           @ if RTE had effect, we rounded down
.dmul_exact:
.dmul_rounded:
        teq     ah, ex_m, LSL #31       @ do the signs agree?
	mov	uh, #0x70000000         @ even if so, need to test exp 0/7FF
	orr	uh, uh, #0x0ff00000
        bmi     .dmul_outflow            @ if not, UFL or OFL
        tst     ah, uh
        bicnes  uh, uh, ah            @ is exp 0 or 7FF?
        beq     .dmul_outflow
.dmul_exit:
	ldmia	sp!, {r4, r5}
	PUSH2	al, ah
	DISPATCH	1

.dmul_rdirect:
        movs    ul, ex_m, LSL #31         @ put sign bit in N
        tstpl   uh, #2 << 22        @ if +ve: EQ iff round up. Keeps PL
        tstmi   uh, #1 << 22         @ if -ve: EQ iff round up.
        moveq   rs, #INX_bit            @ rounded up
        movne   rs, #-INX_bit           @ rounded down
        addeqs  al, al, #1          @ may set C
        adc     ah, ah, #0
        b       .dmul_rounded

.dmul_outflow:
        cmp     ex_m, #0x400<<16          @ Which ballpark are we in?
        addle   ah, ah, #0x60000000 @ Bias up if underflow
        subge   ah, ah, #0x60000000 @ Bias down if overflow
	mov	ip, rs
	ldmia	sp!, {r4, r5}
        ble     .__dunder                @ underflow
	b	.return_double_Inf

.dmul_zerodenorm:
        orrs    ul, al, ah, LSL #1      @ is a zero?
        orrnes  ul, bl, bh, LSL #1      @ or is b zero?
        beq     .dmul_zero               @ Return zero if so

        tst     th, th                  @ is b denormal?
        beq     .dmul_renorm_op2
.dmul_done_op2:
        bics    ul, ex_m, #1              @ is a denormal? (careful of sign bit)
        beq     .dmul_renorm_op1
        b       .dmul_normalised
.dmul_zero:
        mov     al, #0                  @ clear low word
        mov     ah, ex_m, LSL #31         @ get sign of result and clear hi word
	b	.dmul_exit

.dmul_renorm_op1:
        add     ex_m, ex_m, #1<<16          @ correct the exponent
        bic     ah, ah, #0x80000000       @ this will get in our way
        orrs    tl, ah, al, LSR #12    @ is highest set bit in low twelve?
        moveq   al, al, LSL #20         @ if so, move it up
        subeq   ex_m, ex_m, #20<<16       @ and adjust exponent
        tst     ah, ah                  @ is highest set bit in low word?
        moveq   ah, al, LSR #12         @ if so, move up by 20
        moveq   al, al, LSL #20
        subeq   ex_m, ex_m, #20<<16       @ and adjust exponent
        mov     ul, #0                 @ shift of top word
        movs    tl, ah, LSR #(21-16)   @ is highest set bit within 16 of top?
        moveq   ah, ah, LSL #16         @ if not, move up
        addeq   ul, ul, #16           @ and adjust exponent
        movs    tl, ah, LSR #(21-8)   @ is highest set bit within 8 of top?
        moveq   ah, ah, LSL #8         @ if not, move up
        addeq   ul, ul, #8           @ and adjust exponent
        movs    tl, ah, LSR #(21-4)   @ is highest set bit within 4 of top?
        moveq   ah, ah, LSL #4         @ if not, move up
        addeq   ul, ul, #4           @ and adjust exponent
        movs    tl, ah, LSR #(21-2)   @ is highest set bit within 2 of top?
        moveq   ah, ah, LSL #2         @ if not, move up
        addeq   ul, ul, #2           @ and adjust exponent
        movs    tl, ah, LSR #(21-1)   @ is highest set bit within 1 of top?
        moveq   ah, ah, LSL #1         @ if not, move up
        addeq   ul, ul, #1           @ and adjust exponent

        sub     ex_m, ex_m, ul, LSL #16  @ calculate final pseudo exponent
        mov     tl, al, LSL ul        @ shift low word up by same amout
        rsb     ul, ul, #32           @ compute reverse shift for al
        orr     ah, ah, al, LSR ul     @ put in high end of low word
        mov     al, tl

@ ECN: Reload tmp
	mov	tmp, #0x7f00000
	orr	tmp, tmp, #0x00f0000

        b       .dmul_normalised

.dmul_renorm_op2:
        add     th, th, #1<<16          @ correct the exponent
        bic     bh, bh, #0x80000000       @ this will get in our way
        orrs    tl, bh, bl, LSR #12    @ is highest set bit in low twelve?
        moveq   bl, bl, LSL #20         @ if so, move it up
        subeq   th, th, #20<<16       @ and adjust exponent
        tst     bh, bh                  @ is highest set bit in low word?
        moveq   bh, bl, LSR #12         @ if so, move up by 20
        moveq   bl, bl, LSL #20
        subeq   th, th, #20<<16       @ and adjust exponent
        mov     ul, #0                 @ shift of top word
        movs    tl, bh, LSR #(21-16)   @ is highest set bit within 16 of top?
        moveq   bh, bh, LSL #16         @ if not, move up
        addeq   ul, ul, #16           @ and adjust exponent
        movs    tl, bh, LSR #(21-8)   @ is highest set bit within 8 of top?
        moveq   bh, bh, LSL #8         @ if not, move up
        addeq   ul, ul, #8           @ and adjust exponent
        movs    tl, bh, LSR #(21-4)   @ is highest set bit within 4 of top?
        moveq   bh, bh, LSL #4         @ if not, move up
        addeq   ul, ul, #4           @ and adjust exponent
        movs    tl, bh, LSR #(21-2)   @ is highest set bit within 2 of top?
        moveq   bh, bh, LSL #2         @ if not, move up
        addeq   ul, ul, #2           @ and adjust exponent
        movs    tl, bh, LSR #(21-1)   @ is highest set bit within 1 of top?
        moveq   bh, bh, LSL #1         @ if not, move up
        addeq   ul, ul, #1           @ and adjust exponent

        sub     th, th, ul, LSL #16  @ calculate final pseudo exponent
        mov     tl, bl, LSL ul        @ shift low word up by same amout
        rsb     ul, ul, #32           @ compute reverse shift for bl
        orr     bh, bh, bl, LSR ul     @ put in high end of low word
        mov     bl, tl

@ ECN: Reload tmp
	mov	tmp, #0x7f00000
	orr	tmp, tmp, #0x00f0000

        b       .dmul_done_op2

.dmul_naninf:
        mov     uh, ah, LSL #1          @ discard sign bit on a
        mov     ul, bh, LSL #1          @ and on b
        cmp     uh, tmp, LSL #5         @ HI if ah shows a to be NaN
        cmpeq   al, #0                  @ now HI if a is NaN
        cmpls   ul, tmp, LSL #5         @ another chance to set HI ...
        cmpeq   bl, #0                  @  ... if b is NaN
        bhi     .dmul_ivo
        orrs    ul, al, ah, LSL #1      @ is a zero?
        orrnes  ul, bl, bh, LSL #1      @ or is b zero?
        beq     .dmul_ivo
        eor     ah, ah, bh
        mov     al, #0
        and     ah, ah, #0x80000000
        orr     ah, ah, tmp, LSL #4
	b	.dmul_exit

.dmul_ivo:
	ldmia	sp!, {r4, r5}
	b	.return_double_NaN

#undef al
#undef ah
#undef bl
#undef bh
#undef tmp
#undef sh
#undef ex_add

#undef	INX_pos
#undef INX_bit

#undef exp
#undef temp

#undef ex_m
#undef uh
#undef ul
#undef rs
#undef th
#undef tl

@ --- ignore_safepoints ---------------------------------------------------------------------------
	.global	_ZN14CppInterpreter17ignore_safepointsEv
	.type	_ZN14CppInterpreter17ignore_safepointsEv, %function
_ZN14CppInterpreter17ignore_safepointsEv:
	adrl	ip, dispatch_init_adcon
	ldmia	ip, {r2, r3}
	add	r2, r2, ip
	add	ip, r3, r2
	ldr	r2, [ip, #AbstractInterpreter_notice_safepoints-XXX]
	ldrb	r1, [r2, #0]	@ zero_extendqisi2
	cmp	r1, #0
	bxeq	lr
	mov	r3, #0
	strb	r3, [r2, #0]
	adrl	r3, main_dispatch_table
	mov	r2, #256
1:
	ldr	r1, [r3], #4
	str	r1, [ip], #4
	subs	r2, r2, #1
	bne	1b

	bx	lr

@ --- notice_safepoints ---------------------------------------------------------------------------
	.global	_ZN14CppInterpreter17notice_safepointsEv
	.type	_ZN14CppInterpreter17notice_safepointsEv, %function
_ZN14CppInterpreter17notice_safepointsEv:
	adrl	ip, dispatch_init_adcon
	ldmia	ip, {r2, r3}
	add	r2, r2, ip
	add	ip, r3, r2
	ldr	r2, [ip, #AbstractInterpreter_notice_safepoints-XXX]
	ldrb	r1, [r2, #0]	@ zero_extendqisi2
	cmp	r1, #0
	bxne	lr
	mov	r3, #1
	strb	r3, [r2, #0]
	adrl	r3, safe_dispatch_table
	mov	r2, #256
1:
	ldr	r1, [r3], #4
	str	r1, [ip], #4
	subs	r2, r2, #1
	bne	1b

	bx	lr

@ --- END execute.s ----------------------------------------------------------------------------

bci_init:
	adr	r3, dispatch_init_adcon
	ldmia	r3, {r0, r1}
	add	r0, r0, r3
	add	r1, r1, r0
	adr	r2, adcon_init_table
	mov	r3, r1
1:
	ldr	ip, [r2], #4
	cmp	ip, #0
	ldrne	ip, [r0, ip]
	strne	ip, [r1, #-4]!
	bne	1b
	adr	r2, main_dispatch_table
	mov	r1, #256
2:
	ldr	ip, [r2], #4
	str	ip, [r3], #4
	subs	r1, r1, #1
	bne	2b

	bx	lr

	ALIGN_DATA
dispatch_init_adcon:
	.word	_GLOBAL_OFFSET_TABLE_-dispatch_init_adcon, opclabels_data(GOTOFF)
adcon_init_table:
	.word	_ZN18InterpreterRuntime22slow_signature_handlerEP10JavaThreadP13methodOopDescPiS4_(GOT)
	.word	_ZN20SafepointSynchronize6_stateE(GOT)
	.word	_ZN9vmSymbols8_symbolsE(GOT)
	.word	always_do_update_barrier(GOT)
	.word	UseBiasedLocking(GOT)
	.word	_ZN8Universe14_collectedHeapE(GOT)
	.word	ZeroTLAB(GOT)
	.word	UseTLAB(GOT)
	.word	_ZN9Bytecodes5_nameE(GOT)
	.word	_ZN19AbstractInterpreter18_notice_safepointsE(GOT)
	.word	_ZN18ThreadLocalStorage13_thread_indexE(GOT)
	.word	0

	ALIGN_DATA
main_dispatch_table:
	MAIN_DISPATCH_TABLE
safe_dispatch_table:
	.word	do_nop
	.word	do_u4const_0
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
	.word	do_iconst_N
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
	.word	do_u4load
	.word	do_u8load
	.word	do_u4load
	.word	do_u8load
	.word	do_u4load
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
	.word	do_iload_0
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
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_aload_0
	.word	do_u4aload
	.word	do_u8aload
	.word	do_u4aload
	.word	do_u8aload
	.word	do_u4aload
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
	.word	do_iadd
	.word	do_ladd
	.word	do_fadd
	.word	do_dadd
	.word	do_isub
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
	.word	do_iand
	.word	do_land
	.word	do_ior
	.word	do_lor
	.word	do_ixor
	.word	do_lxor
	.word	do_iinc
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
	.word	do_ifeq_safe
	.word	do_ifne_safe
	.word	do_iflt_safe
	.word	do_ifge_safe
	.word	do_ifgt_safe
	.word	do_ifle_safe
	.word	do_if_icmpeq_safe
	.word	do_if_icmpne_safe
	.word	do_if_icmplt_safe
	.word	do_if_icmpge_safe
	.word	do_if_icmpgt_safe
	.word	do_if_icmple_safe
	.word	do_if_icmpeq_safe
	.word	do_if_icmpne_safe
	.word	do_goto_safe
	.word	do_jsr
	.word	do_ret
	.word	do_tableswitch
	.word	do_lookupswitch
	.word	do_ireturn_safe
	.word	do_lreturn_safe
	.word	do_ireturn_safe
	.word	do_lreturn_safe
	.word	do_ireturn_safe
	.word	do_return_safe
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
	.word	do_ifeq_safe
	.word	do_ifne_safe
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
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_iaccess_0
	.word	do_undefined
	.word	do_undefined
	.word	do_undefined
	.word	do_invokevfinal
	.word	do_undefined
	.word	do_undefined
	.word	do_return_register_finalizer
	.word	do_undefined
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_iconst_N
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

	SUB_DISPATCH_TABLES

	.section	.init_array,"aw",%init_array
	.word	bci_init(target1)

	.data
	ALIGN_DATA
	.word	0, 0, 0, 0, 0
ThreadLocalStorage_thread_index:			.word	0
AbstractInterpreter_notice_safepoints:			.word	0
Bytecodes_name_Address:					.word	0
UseTLAB_Address:					.word	0
ZeroTLAB_Address:					.word	0
Universe_collectedHeap_Address:				.word	0
UseBiasedLocking_Address:				.word	0
always_do_update_barrier_Address:			.word	0
VmSymbols_symbols_Address:				.word	0
SafePointSynchronize_state_Address:			.word	0
InterpreterRuntime_slow_signature_handler_Address:	.word	0
XXX:
opclabels_data:
	.word	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.word	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.word	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.word	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.word	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.word	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.word	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.word	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.word	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.word	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.word	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.word	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.word	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.word	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.word	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.word	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
#endif // HOTSPOT_ASM
