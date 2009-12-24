@ Copyright 2009 Edward Nevill
@ DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
@
@ This code is free software; you can redistribute it and/or modify it
@ under the terms of the GNU General Public License version 2 only, as
@ published by the Free Software Foundation.
@
@ This code is distributed in the hope that it will be useful, but WITHOUT
@ ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
@ FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
@ version 2 for more details (a copy is included in the LICENSE file that
@ accompanied this code).
@
@ You should have received a copy of the GNU General Public License version
@ 2 along with this work; if not, write to the Free Software Foundation,
@ Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.

#ifdef HOTSPOT_ASM

#define ARMv4

#ifdef SHARK
#define USE_COMPILER
#define DISABLE_NOTICE_SAFEPOINTS
#endif

#ifdef USE_COMPILER

#define MP_COMPILE_THRESHOLD    0x10000         // 65536 - must be a single MOV constant
#define UP_COMPILE_THRESHOLD    0x30000         // 196608 - must be a single MOV constant

#define MAX_FG_METHOD_SIZE      500

#ifndef DISABLE_ON_STACK_REPLACEMENT
#define ON_STACK_REPLACEMENT
#endif
#ifndef ENABLE_BG_COMP_ON_NON_MP
#define DISABLE_BG_COMP_ON_NON_MP
#endif

#endif // USE_COMPILER

#ifndef DISABLE_NOTICE_SAFEPOINTS
#define NOTICE_SAFEPOINTS
#endif
#ifndef DISABLE_HW_NULL_PTR_CHECK
#define HW_NULL_PTR_CHECK
#endif
#ifndef DISABLE_FASTPATH_ENTRY
#define FASTPATH_ENTRY
#endif
#ifndef DISABLE_NATIVE_ENTRY
#define NATIVE_ENTRY
#endif
#ifndef DISABLE_FAST_BYTECODES
#define FAST_BYTECODES
#endif
#ifndef DISABLE_HW_FP
#define HW_FP
#endif

#define stack		r4
#define	jpc		r5
#define dispatch	r6
#define locals		r7
#define istate		r8
#define constpool	r9
#define arm_sp		r13

#define tmp_xxx		r7
#define tmp_yyy		r5
#define tmp_vvv		r9

#define tmp1		r11
#define tmp2		r10

#define tmp_invoke_len	lr

#define regset r3-r11

// XXX hardwired constants!
#define tos_btos        0
#define tos_ctos        1
#define tos_stos        2
#define tos_itos        3
#define tos_ltos        4
#define tos_ftos        5
#define tos_dtos        6
#define tos_atos        7

#include "offsets_arm.s"

// XXX hardwired constants!
#define RESOURCEAREA_AREA	0
#define RESOURCEAREA_CHUNK	4
#define RESOURCEAREA_HWM	8
#define RESOURCEAREA_MAX	12

// XXX hardwired constants!
#define ISTATE_THREAD		0
#define ISTATE_BCP		4
#define	ISTATE_LOCALS		8
#define	ISTATE_CONSTANTS	12
#define ISTATE_METHOD		16
#define ISTATE_MDX		20
#define ISTATE_STACK		24
#define ISTATE_ADVANCE_PC	28
#define ISTATE_MSG		28
#define ISTATE_CALLEE		32	// union frame_manager_message
#define	ISTATE_PREV_LINK	44
#define ISTATE_OOP_TEMP		48
#define ISTATE_STACK_BASE	52
#define ISTATE_STACK_LIMIT	56
#define ISTATE_MONITOR_BASE	60
#define ISTATE_SELF_LINK	64
#define ISTATE_FRAME_TYPE	68
#define ISTATE_NEXT_FRAME	72
#define FRAME_SIZE		76

// XXX hardwired constants!
#define ENTRY_FRAME             1
#define INTERPRETER_FRAME       2
#define SHARK_FRAME             3
#define FAKE_STUB_FRAME         4

#define last_implemented_bytecode 201

	.macro	ALIGN_CODE
	.align	3
	.endm

	.macro	ALIGN_DATA
	.align	3
	.endm

	.macro	ALIGN_OPCODE
	.align	3
	.endm

	.macro	ALIGN_WORD
	.align	2
	.endm

@------------------------------------------------
@ Software NULL Pointer check macro.
@ Usage:
@	SW_NPC	cmp	obj, #0
@	SW_NPC	beq	null_ptr_exception
@------------------------------------------------
	.macro	SW_NPC	p1, p2, p3, p4
#ifndef HW_NULL_PTR_CHECK
  .ifnes "\p4", ""
	\p1 \p2, \p3, \p4
  .else
    .ifnes "\p3", ""
	\p1 \p2, \p3
    .else
	\p1 \p2
    .endif
  .endif
#endif // HW_NULL_PTR_CHECK
	.endm

	.macro	HW_NPC	p1, p2, p3, p4
#ifdef HW_NULL_PTR_CHECK
  .ifnes "\p4", ""
	\p1 \p2, \p3, \p4
  .else
    .ifnes "\p3", ""
	\p1 \p2, \p3
    .else
	\p1 \p2
    .endif
  .endif
#endif // HW_NULL_PTR_CHECK
	.endm

@------------------------------------------------
@ Fast Bytecode Macros FBC and NFBC
@ Use to conditionalise code using fast bytecodes
@ EG:
@	FBC	mov	r0, #opc_invokeresolved
@	FBC	b	rewrite_bytecode
@	NFBC	code to handle slow case
@	NFBC	...
@------------------------------------------------
	.macro	FBC	p1, p2, p3, p4, p5
#ifdef FAST_BYTECODES
  .ifnes "\p5", ""
	  \p1 \p2, \p3, \p4, \p5
  .else
    .ifnes "\p4", ""
	  \p1 \p2, \p3, \p4
    .else
      .ifnes "\p3", ""
	  \p1 \p2, \p3
      .else
	  \p1 \p2
      .endif
    .endif
  .endif
#endif
	.endm

	.macro	NFBC	p1, p2, p3, p4
#ifndef FAST_BYTECODES
  .ifnes "\p4", ""
	\p1 \p2, \p3, \p4
  .else
    .ifnes "\p3", ""
	\p1 \p2, \p3
    .else
	\p1 \p2
    .endif
  .endif
#endif
	.endm

@------------------------------------------------
@ Notice Safepoints macro
@ Usage:
@	NSP	<notice safepoint specific code>
@------------------------------------------------
	.macro	NSP	p1, p2, p3, p4, p5
#ifdef NOTICE_SAFEPOINTS
  .ifnes "\p5", ""
	  \p1 \p2, \p3, \p4, \p5
  .else
    .ifnes "\p4", ""
	  \p1 \p2, \p3, \p4
    .else
      .ifnes "\p3", ""
	  \p1 \p2, \p3
      .else
	  \p1 \p2
      .endif
    .endif
  .endif
#endif
	.endm

@------------------------------------------------
@ Use Compiler macro
@ Usage:
@	USEC	<compiler specific code>
@------------------------------------------------
	.macro	USEC	p1, p2, p3, p4
#ifdef USE_COMPILER
  .ifnes "\p4", ""
	\p1 \p2, \p3, \p4
  .else
    .ifnes "\p3", ""
	\p1 \p2, \p3
    .else
	\p1 \p2
    .endif
  .endif
#endif
	.endm

@------------------------------------------------
@ On stack replacement macro
@ Usage:
@       OSR     <compiler specific code>
@------------------------------------------------
        .macro  OSR     p1, p2, p3, p4
#ifdef ON_STACK_REPLACEMENT
  .ifnes "\p4", ""
        \p1 \p2, \p3, \p4
  .else
    .ifnes "\p3", ""
        \p1 \p2, \p3
    .else
        \p1 \p2
    .endif
  .endif
#endif
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

	.macro	PUSH	reg1, reg2, reg3, reg4
  .ifnes "\reg4", ""
	stmda	stack!, {\reg1, \reg2, \reg3, \reg4}
  .else
    .ifnes "\reg3", ""
	stmda	stack!, {\reg1, \reg2, \reg3}
    .else
      .ifnes "\reg2", ""
	stmda	stack!, {\reg1, \reg2}
      .else
	str	\reg1, [stack], #-4
      .endif
    .endif
  .endif
	.endm

	.macro	POP	reg1, reg2, reg3, reg4
  .ifnes "\reg4", ""
	ldmib	stack!, {\reg1, \reg2, \reg3, \reg4}
  .else
    .ifnes "\reg3", ""
	ldmib	stack!, {\reg1, \reg2, \reg3}
    .else
      .ifnes "\reg2", ""
	ldmib	stack!, {\reg1, \reg2}
      .else
	ldr	\reg1, [stack, #4]!
      .endif
    .endif
  .endif
	.endm

	.macro	CACHE_JPC
	ldr	jpc, [istate, #ISTATE_BCP]
	.endm

	.macro	CACHE_LOCALS
	ldr	locals, [istate, #ISTATE_LOCALS]
	.endm

	.macro	CACHE_STACK
	ldr	stack, [istate, #ISTATE_STACK]
	.endm

	.macro	CACHE_CP
	ldr	constpool, [istate, #ISTATE_CONSTANTS]
	.endm

	.macro	DECACHE_STACK
	str	stack, [istate, #ISTATE_STACK]
	.endm

	.macro	DECACHE_JPC
	str	jpc, [istate, #ISTATE_BCP]
	.endm

@ ECN:	I assert that istate->locals and istate->stack cannot move on a GC.
@	The reasoning is that istate itself is stored on the Java stack
@	and locals and stack are relative to istate. Therefore if locals or
@	stack were to move, istate itself would have to move and we would
@	lose our entire interpreter state.
@ To prove this I have changed the code which recaches locals and stack
@ to assert that locals == istate->locals and stack == istate->stack.
@ This saves a lot of needles recaching of interpreter state.
	.macro	ASSERT_LOCALS_CACHED
#if 0
	str	ip, [arm_sp, #-4]!
	mrs	ip, cpsr
	str	ip, [arm_sp, #-4]!
	mov	ip, locals
	ldr	locals, [istate, #ISTATE_LOCALS]
	cmp	ip, locals
	strne	r0, [r0, -r0]
	ldr	ip, [arm_sp], #4
	msr	cpsr, ip
	ldr	ip, [arm_sp], #4
#endif
	.endm

	.macro	ASSERT_STACK_CACHED
#if 0
	str	ip, [arm_sp, #-4]!
	mrs	ip, cpsr
	str	ip, [arm_sp, #-4]!
	mov	ip, stack
	ldr	stack, [istate, #ISTATE_STACK]
	cmp	ip, stack
	strne	r0, [r0, -r0]
	ldr	ip, [arm_sp], #4
	msr	cpsr, ip
	ldr	ip, [arm_sp], #4
#endif
	.endm

@ DISPATCH_LOOP causes the dispatch code to branch every time to a label 'dispatch_loop'
@ This is primarily for debugging so we can stick assertions at the dispatch_loop label
@ which will then be checked after every bytcode.
@ #define DISPATCH_LOOP

@ CODETRACE tarces bytecodes in a code buffer which can be examined under gdb
@ Note: DISPATCH_LOOP must be enabled for CODETRACE to work
@ #define CODETRACE

@ DISPATCH_ASSERTS enables various assertions in the dispatch loop, such as checking
@ stack, frame, locals and constpool are all consistent and not corrupted
@#define DISPATCH_ASSERTS

	.macro	ABORTNE
	strne	r0, [r0, -r0]
	.endm

	.macro	ABORTCS
	strcs	r0, [r0, -r0]
	.endm

	.macro	ABORTCC
	strcc	r0, [r0, -r0]
	.endm

	.macro	CHECK_CONSTPOOL
#ifdef DISPATCH_ASSERTS
	@ First check istate->constpool == method->constpool
	ldr	r1, [istate, #ISTATE_CONSTANTS]
	ldr	r2, [istate, #ISTATE_METHOD]
	ldr	r2, [r2, #METHOD_CONSTANTS]
	ldr	r2, [r2, #CONSTANTPOOL_CACHE]
	cmp	r1, r2
	ABORTNE
@	cmp	r1, constpool
@	ABORTNE
#endif
	.endm

	.macro	CHECK_LOCALS
#ifdef DISPATCH_ASSERTS
	@ Check cached locals var is the same as that in istate
	ldr	r1, [istate, #ISTATE_LOCALS]
	cmp	r1, locals
	ABORTNE
#endif
	.endm

	.macro	CHECK_FRAME
#ifdef DISPATCH_ASSERTS
	@ Check #INTERPRETER_FRAME hasn't been overwritten
	ldr	r1, [istate, #ISTATE_FRAME_TYPE]
	cmp	r1, #INTERPRETER_FRAME
	ABORTNE
	@ Check we are still the topmost frame
	ldr	r1, [istate, #ISTATE_THREAD]
	ldr	r1, [r1, #THREAD_TOP_ZERO_FRAME]
	add	r2, istate, #ISTATE_NEXT_FRAME
	cmp	r1, r2
	ABORTNE
	@ And check the NEXT_FRAME pointer points to a valid frame
	ldr	r1, [istate, #ISTATE_NEXT_FRAME]
	ldr	r2, [r1, #-ISTATE_NEXT_FRAME + ISTATE_FRAME_TYPE]
	bic	r2, r2, #7	@ ECN: Allow for differing frames
	cmp	r2, #0
	ABORTNE
#endif
	.endm

	.macro	CHECK_BACKTRACE
#ifdef DISPATCH_ASSERTS
	add	r3, istate, #ISTATE_NEXT_FRAME
@ ECN: Only check a limited no of frames back. topmost frame already checked
@ Check 2nd frame up
	ldr	r3, [r3]
	ldr	r2, [r3, #-ISTATE_NEXT_FRAME + ISTATE_FRAME_TYPE]
	cmp	r2, #ENTRY_FRAME
	beq	2f
	cmp	ip, #INTERPRETER_FRAME
	ABORTNE				@ Must be ENTRY_FRAME, or INTERPRETER_FRAME
	ldr	r1, [r3, #-ISTATE_NEXT_FRAME + ISTATE_CONSTANTS]
	ldr	r2, [r3, #-ISTATE_NEXT_FRAME + ISTATE_METHOD]
	ldr	r2, [r2, #12]
	ldr	r2, [r2, #12]
	cmp	r1, r2
	ABORTNE
@ Check 3rd frame up
	ldr	r3, [r3]
	ldr	r2, [r3, #-ISTATE_NEXT_FRAME + ISTATE_FRAME_TYPE]
	cmp	r2, #ENTRY_FRAME
	beq	2f
	cmp	r2, #INTERPRETER_FRAME
	ABORTNE				@ Must be ENTRY_FRAME, or INTERPRETER_FRAME
	ldr	r1, [r3, #-ISTATE_NEXT_FRAME + ISTATE_CONSTANTS]
	ldr	r2, [r3, #-ISTATE_NEXT_FRAME + ISTATE_METHOD]
	ldr	r2, [r2, #12]
	ldr	r2, [r2, #12]
	cmp	r1, r2
	ABORTNE
@ Check 4th frame up
	ldr	r3, [r3]
	ldr	r2, [r3, #-ISTATE_NEXT_FRAME + ISTATE_FRAME_TYPE]
	cmp	r2, #ENTRY_FRAME
	beq	2f
	cmp	r2, #INTERPRETER_FRAME
	ABORTNE				@ Must be ENTRY_FRAME, or INTERPRETER_FRAME
	ldr	r1, [r3, #-ISTATE_NEXT_FRAME + ISTATE_CONSTANTS]
	ldr	r2, [r3, #-ISTATE_NEXT_FRAME + ISTATE_METHOD]
	ldr	r2, [r2, #12]
	ldr	r2, [r2, #12]
	cmp	r1, r2
	ABORTNE
@ Check 5th frame up
	ldr	r3, [r3]
	ldr	r2, [r3, #-ISTATE_NEXT_FRAME + ISTATE_FRAME_TYPE]
	cmp	r2, #ENTRY_FRAME
	beq	2f
	cmp	r2, #INTERPRETER_FRAME
	ABORTNE				@ Must be ENTRY_FRAME, or INTERPRETER_FRAME
	ldr	r1, [r3, #-ISTATE_NEXT_FRAME + ISTATE_CONSTANTS]
	ldr	r2, [r3, #-ISTATE_NEXT_FRAME + ISTATE_METHOD]
	ldr	r2, [r2, #12]
	ldr	r2, [r2, #12]
	cmp	r1, r2
	ABORTNE
@ Check 7th frame up
	ldr	r3, [r3]
	ldr	r2, [r3, #-ISTATE_NEXT_FRAME + ISTATE_FRAME_TYPE]
	cmp	r2, #ENTRY_FRAME
	beq	2f
	cmp	r2, #INTERPRETER_FRAME
	ABORTNE				@ Must be ENTRY_FRAME, or INTERPRETER_FRAME
	ldr	r1, [r3, #-ISTATE_NEXT_FRAME + ISTATE_CONSTANTS]
	ldr	r2, [r3, #-ISTATE_NEXT_FRAME + ISTATE_METHOD]
	ldr	r2, [r2, #12]
	ldr	r2, [r2, #12]
	cmp	r1, r2
	ABORTNE
@ Check 8th frame up
	ldr	r3, [r3]
	ldr	r2, [r3, #-ISTATE_NEXT_FRAME + ISTATE_FRAME_TYPE]
	cmp	r2, #ENTRY_FRAME
	beq	2f
	cmp	r2, #INTERPRETER_FRAME
	ABORTNE				@ Must be ENTRY_FRAME, or INTERPRETER_FRAME
	ldr	r1, [r3, #-ISTATE_NEXT_FRAME + ISTATE_CONSTANTS]
	ldr	r2, [r3, #-ISTATE_NEXT_FRAME + ISTATE_METHOD]
	ldr	r2, [r2, #12]
	ldr	r2, [r2, #12]
	cmp	r1, r2
	ABORTNE
2:
#endif
	.endm

	.macro	CHECK_STACK
#ifdef DISPATCH_ASSERTS
	ldr	r1, [istate, #ISTATE_STACK_BASE]
	cmp	stack, r1
	ABORTCS
	ldr	r1, [istate, #ISTATE_STACK_LIMIT]
	@ ECN: The stack can point below the stack limit in the
	@	case that we have a full stack. As long as we dont actually
	@	try writing to it.
	add	r2, stack, #4
	cmp	r2, r1
	ABORTCC
#endif
	.endm

#define CODETRACE_BUFFER_SIZE	(1 * 1024)
	.macro	TRACE_CODE
#ifdef CODETRACE
	ldr	r1, [dispatch, #CodeTrace_Idx-XXX]
	cmp	r1, #CODETRACE_BUFFER_SIZE
	moveq	r1, #0
	sub	r2, dispatch, #XXX-CodeTrace_Buffer_Base
	str	jpc, [r2, r1]
	add	r1, r1, #4
	str	r1, [dispatch, #CodeTrace_Idx-XXX]
#endif
	.endm

	.macro	BREAK_DISPATCH
	ldr	r1, [dispatch, #DispatchBreakPoint-XXX]
	cmp	r1, jpc
	bleq	do_dispatch_break
	.endm

	.set	dispatch_state, 0

	.macro	DISPATCH_STATE	state
	.set	dispatch_state, \state
	.endm

	.macro	DISPATCH_START	step=0
	.set	dispatch_state, 1
	ldrb	r0, [jpc, #\step]!
	.endm

	.macro	DISPATCH_START_REG	reg
	.set	dispatch_state, 1
	ldrb	r0, [jpc, \reg]!
	.endm

	.macro	DISPATCH_START_R2_R0
	.set	dispatch_state, 1
	mov	r0, r2
	.endm

	.macro	DISPATCH_START_R2_JPC
	.set	dispatch_state, 1
	add	jpc, jpc, #1
	.endm

	.macro	DISPATCH_START_R2
	.set	dispatch_state, 1
	add	jpc, jpc, #1
	mov	r0, r2
	.endm

#ifdef DISPATCH_LOOP
	.macro	DISPATCH_NEXT
	.endm

	.macro	DISPATCH_FINISH
	b	dispatch_loop
	.endm

	.macro	DISPATCH_BYTECODE
	b	dispatch_loop
	.endm

	.macro	DISPATCH	step=0
	ldrb	r0, [jpc, #\step]!
	b	dispatch_loop
	.endm
#else
	.macro	DISPATCH_1
@        ldrb    r1, [jpc, #2]
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
        ldr     pc, [ip, r1, lsl #2]
	.set	dispatch_state, 0
	.endm

	.macro	DISPATCH_BYTECODE
@        ldrb    r1, [jpc, #2]
        ldr     ip, [dispatch, r0, lsl #2]
        ldrb    r2, [jpc, #1]
        ands    lr, ip, #7
        moveq   pc, ip
	ldrb	r1, [jpc, lr]
        bic     ip, ip, #7
        ldr     pc, [ip, r1, lsl #2]
	.endm

	.macro	DISPATCH step=0
	ldrb	r0, [jpc, #\step]!
@        ldrb    r1, [jpc, #2]
        ldr     ip, [dispatch, r0, lsl #2]
        ldrb    r2, [jpc, #1]
        ands    lr, ip, #7
        moveq   pc, ip
	ldrb	r1, [jpc, lr]
        bic     ip, ip, #7
        ldr     pc, [ip, r1, lsl #2]
	.endm
#endif // DISPATCH_LOOP

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
	mov	lr, pc
	mov	pc, \reg
	.endm

	.macro	_BX	reg
	mov	pc, \reg
	.endm

	.macro	_BXEQ	reg
	moveq	pc, \reg
	.endm

	.macro	_BXNE	reg
	movne	pc, \reg
	.endm

#ifdef ARMv4

#define blx _BLX
#define bx _BX
#define bxeq _BXEQ
#define bxne _BXNE
	.arch armv4

#else
	.arch armv7-a
#endif
#ifdef HW_FP
	.fpu vfp
#else
	.fpu softvfp
#endif
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4

	.text

do_dispatch_break:
	mov	pc, lr

#ifdef DISPATCH_LOOP
@ r0 = bytecode
@ jpc has been updated
dispatch_loop:
	TRACE_CODE
dispatch_check_constpool:
	CHECK_CONSTPOOL
dispatch_check_locals:
	CHECK_LOCALS
dispatch_check_stack:
	CHECK_STACK
dispatch_check_frame:
	CHECK_FRAME
dispatch_check_backtrace:
	CHECK_BACKTRACE
dispatch_break:
	BREAK_DISPATCH
        ldrb    r1, [jpc, #2]
        ldr     ip, [dispatch, r0, lsl #2]
        ldrb    r2, [jpc, #1]
        ands    lr, ip, #7
        moveq   pc, ip
	ldrb	r1, [jpc, lr]
        bic     ip, ip, #7
        ldr     ip, [ip, r1, lsl #2]
        mov     pc, ip
#endif

is_subtype_of:
	ldr	r2, [r1, #16]
	add	ip, r0, r2
	ldr	ip, [ip, #-8]
	cmp	ip, r1
	moveq	r0, #1
	bxeq	lr
	cmp	r2, #20
	movne	r0, #0
	bxne	lr
	b	_ZNK5Klass23search_secondary_supersEP12klassOopDesc

HandleC:
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r3, HandleC_adcons
	subs	r5, r1, #0
	mov	r4, r0
.HandleC_pic:
	add	r3, pc, r3
	streq	r5, [r0, #0]
	beq	2f
	ldr	r2, HandleC_adcons+4
	ldr	r3, [r3, r2]
	ldr	r0, [r3, #0]
	bl	pthread_getspecific
	ldr	r3, [r0, #THREAD_HANDLE_AREA]
	ldr	r0, [r3, #8]
	ldr	r1, [r3, #12]
	add	r2, r0, #4
	cmp	r2, r1
	strls	r2, [r3, #8]
	bhi	3f
1:
	str	r5, [r0, #0]
	str	r0, [r4, #0]
2:
	mov	r0, r4
	ldmfd	sp!, {r4, r5, r6, pc}
3:
	mov	r0, r3
	mov	r1, #4
	bl	_ZN5Arena4growEj
	b	1b
HandleC_adcons:
	.word	_GLOBAL_OFFSET_TABLE_-(.HandleC_pic+8)
	.word	_ZN18ThreadLocalStorage13_thread_indexE(GOT)

HandleMarkCleanerD:
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r3, [r0, #0]
	mov	r6, r0
	ldr	r4, [r3, #40]
	ldr	r0, [r4, #8]
	ldr	r5, [r4, #4]
	ldr	r3, [r0, #0]
	cmp	r3, #0
	beq	1f
	bl	_ZN5Chunk9next_chopEv
	ldr	r0, [r4, #8]
1:
	str	r0, [r5, #4]
	mov	r0, r6
	ldr	r3, [r4, #12]
	str	r3, [r5, #8]
	ldr	r3, [r4, #16]
	str	r3, [r5, #12]
	ldmfd	sp!, {r4, r5, r6, pc}

cmpxchg_ptr:
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	mov	r6, #0xffffffc0
	mov	r4, r2
	mov	r7, r0
	mov	r5, r1
	bic	r6, r6, #0xf000
	mov	r8, r2
1:
	ldr	r3, [r5, #0]
	mov	r0, r4
	mov	r1, r7
	mov	r2, r5
	cmp	r4, r3
	bne	2f
	blx	r6
	cmp	r0, #0
	bne	1b
	mov	r0, r8
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
2:
	mov	r8, r3
	mov	r0, r8
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}

ThreadInVMfromJavaD:
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r5, ThreadInVMfromJavaD_adcons
	ldr	r3, ThreadInVMfromJavaD_adcons+4
	mov	r2, #_thread_in_vm_trans
.ThreadInVMfromJavaD_pic:
	add	r5, pc, r5
	ldr	r6, [r0, #0]
	mov	r4, r0
	ldr	r3, [r5, r3]
	str	r2, [r6, #THREAD_STATE]
	ldr	r3, [r3, #0]
	cmp	r3, #1
	ble	1f
	ldr	r3, ThreadInVMfromJavaD_adcons+8
	ldr	r3, [r5, r3]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	6f
	ldr	r3, ThreadInVMfromJavaD_adcons+12
	mov	r1, #1
	ldr	r2, ThreadInVMfromJavaD_adcons+16
	ldr	r3, [r5, r3]
	ldr	r2, [r5, r2]
	ldr	r3, [r3, #0]
	ldr	r2, [r2, #0]
	and	r3, r3, r6, lsr #3
	str	r1, [r2, r3]
1:
	ldr	r3, ThreadInVMfromJavaD_adcons+20
	ldr	r3, [r5, r3]
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	5f
2:
	mov	r3, #8
	str	r3, [r6, #THREAD_STATE]
	ldr	r0, [r4, #0]
	ldr	r3, [r0, #THREAD_SPECIALRUNTIMEEXITCONDITION]
	cmp	r3, #0
	bne	3f
	ldr	r3, [r0, #THREAD_SUSPEND_FLAGS]
	tst	r3, #_thread_external_suspend
	beq	4f
3:
	mov	r1, #1
	bl	_ZN10JavaThread37handle_special_runtime_exit_conditionEb
	mov	r0, r4
	ldmfd	sp!, {r4, r5, r6, pc}
4:
	ldr	r3, [r0, #THREAD_SUSPEND_FLAGS]
	tst	r3, #_thread_deopt_suspend
	bne	3b
	mov	r0, r4
	ldmfd	sp!, {r4, r5, r6, pc}
5:
	mov	r0, r6
	bl	_ZN20SafepointSynchronize5blockEP10JavaThread
	b	2b
6:
	mov	r3, #0xffffffa0
	bic	r3, r3, #0xf000
	blx	r3
	b	1b
ThreadInVMfromJavaD_adcons:
	.word	_GLOBAL_OFFSET_TABLE_-(.ThreadInVMfromJavaD_pic+8)
	.word	_ZN2os16_processor_countE(GOT)
	.word	UseMembar(GOT)
	.word	_ZN2os20_serialize_page_maskE(GOT)
	.word	_ZN2os19_mem_serialize_pageE(GOT)
	.word	_ZN20SafepointSynchronize6_stateE(GOT)

#define oop_address_tmp	tmp1
#define oop_value_tmp	tmp2
#define oop_lr		locals

	ALIGN_CODE
oop_store:
	mov	oop_lr, lr
@	mov	oop_address_tmp, r0
@	mov	oop_value_tmp, r1
	ldr	r3, [dispatch, #oopDesc_Address-XXX]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #8]
	cmp	r2, #1
	beq	1f
	mov	r0, r3
	mov	r1, oop_address_tmp
	ldr	r3, [r3, #0]
	mov	r2, oop_value_tmp
	mov	lr, pc
	ldr	pc, [r3, #48]
1:
	ldr	r3, [dispatch, #always_do_update_barrier_Address-XXX]
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	2f
	mov	r3, #0xffffffa0
	bic	r3, r3, #0xf000
	blx	r3
2:
	mov	lr, oop_lr
	CACHE_LOCALS
	ldr	r3, [dispatch, #oopDesc_Address-XXX]
	str	oop_value_tmp, [oop_address_tmp, #0]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #8]
	cmp	r2, #1
	beq	3f
	mov	r0, r3
	mov	r1, oop_address_tmp
	mov	r2, oop_value_tmp
	ldr	r3, [r3, #0]
	ldr	pc, [r3, #52]
3:
	ldr	r3, [r3, #76]
	mov	r2, #0
	strb	r2, [r3, oop_address_tmp, lsr #9]
	mov	pc, lr

build_frame:
	mov	r3, r0
	ldr	r0, [r1, #METHOD_ACCESSFLAGS]
	stmfd	arm_sp!, {r4, r5, r6, r7, r8}
	ands	r7, r0, #JVM_ACC_SYNCHRONIZED
	movne	r7, #2
	tst	r0, #JVM_ACC_NATIVE
	mov	r4, #0
	movne	r5, #0
	ldreqh	r6, [r1, #METHOD_MAXLOCALS]
	ldrneh	r6, [r1, #METHOD_SIZEOFPARAMETERS]
	ldreq	r0, [r3, #8]
	subeq	r6, r6, #1
	ldrne	r0, [r3, #8]
	subne	r6, r6, #1
	ldreqh	r5, [r1, #METHOD_MAXSTACK]
	addeq	r6, r0, r6, asl #2
	addne	r6, r0, r6, asl #2
	sub	ip, r0, #4
	str	ip, [r3, #8]
	mov     ip, #INTERPRETER_FRAME
	str	r4, [r0, #-4]
	ldr	r0, [r3, #8]
	sub	r8, r0, #4
	str	r8, [r3, #8]
	str	ip, [r0, #-4]
	ldr	r8, [r3, #8]
	sub	ip, r8, #68
	str	ip, [r3, #8]
	str	r2, [r8, #-68]
	mov	r8, #0
	str	r4, [ip, #44]
	str	r6, [ip, #8]
	str	r1, [ip, #16]
	str	ip, [ip, #64]
	ldr	r2, [r1, #METHOD_ACCESSFLAGS]
	tst	r2, #JVM_ACC_NATIVE
	mov	r2, #0
	ldreq	r4, [r1, #METHOD_CONSTMETHOD]
	addeq	r4, r4, #CONSTMETHOD_CODEOFFSET
	str	r4, [ip, #4]
	ldr	r4, [r1, #METHOD_CONSTANTS]
	ldr	r4, [r4, #CONSTANTPOOL_CACHE]
	str	r8, [ip, #28]
	str	r2, [ip, #32]
	str	r4, [ip, #12]
	str	r2, [ip, #48]
	str	r2, [ip, #20]
	ldr	r2, [r3, #8]
	str	r2, [ip, #60]
	ldr	r2, [r1, #METHOD_ACCESSFLAGS]
	tst	r2, #JVM_ACC_SYNCHRONIZED
	beq	.L10
	ldr	r2, [r3, #8]
	sub	r7, r2, r7, asl #2
	str	r7, [r3, #8]
	ldr	r2, [r1, #METHOD_ACCESSFLAGS]
	tst	r2, #JVM_ACC_STATIC
	ldrne	r2, [r1, #METHOD_CONSTANTS]
	ldreq	r2, [r6, #0]
	ldrne	r2, [r2, #16]
	ldrne	r2, [r2, #60]
	str	r2, [r7, #4]
.L10:
	ldr	r2, [r3, #8]
	cmp	r5, #0
	str	r2, [ip, #52]
	ldr	r2, [r3, #8]
	sub	r2, r2, #4
	str	r2, [ip, #24]
	ldrne	r2, [r3, #8]
	ldreq	r5, [r3, #8]
	subne	r5, r2, r5, asl #2
	strne	r5, [r3, #8]
	sub	r5, r5, #4
	str	r5, [ip, #56]
	ldmfd	arm_sp!, {r4, r5, r6, r7, r8}
	bx	lr

	ALIGN_CODE
	.global	asm_generate_method_entry
asm_generate_method_entry:
	mov	r3, r0
	mov	r0, #0
#ifdef PRODUCT
	adrl	ip, dispatch_init_adcon
	ldm	ip, {r1, r2}
	add	r1, r1, ip
	add	r1, r1, r2		@ r1->dispatch

#ifndef USE_COMPILER
	ldr	r2, [r1, #UseCompiler_Address-XXX]
	ldrb	r2, [r2]
	cmp	r2, #0
	bne	1f
#endif

	ldr	r2, [r1, #can_post_interpreter_events-XXX]
	ldrb	r2, [r2]
	cmp	r2, #0
	bne	1f

	ldr	r2, [r1, #PrintCommandLineFlags_Address-XXX]
	ldrb	r2, [r2]
	cmp	r2, #0
	bne	1f

	cmp	r3, #14
	adrcc	ip, asm_method_table
	ldrcc	r0, [ip, r3, lsl #2]
1:
#endif // PRODUCT
	bx	lr
asm_method_table:
	.word	normal_entry
	.word	normal_entry_synchronized
#ifdef NATIVE_ENTRY
	.word	native_entry
#else
	.word	0
#endif
	.word	0			@ cppInterpreter can handle native_entry_synchronized
	.word	empty_entry
	.word	accessor_entry
	.word	normal_entry
	.word	normal_entry
	.word	normal_entry
	.word	normal_entry
	.word	normal_entry
	.word	normal_entry
	.word	normal_entry
	.word	normal_entry

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
	ldr	r2, [ip], #8
	cmp	r2, #0
	moveq	r0, #0
	bxeq	lr
	cmp	r2, r1
	bne	abort_loop

	ldr	r3, [ip, #-4]
	cmp	r3, #8
	bcs	1f

	ldr	ip, [r0, #5*4]
	sub	ip, ip, r3
	str	ip, [r0, #5*4]

	adrl	r3, null_ptr_exception
1:
	str	r3, [r0, #15*4]
do_setcontext:
	mov	r0, #1
	bx	lr
abort_table:
			.word	.abortentry5, 1
			.word	.abortentry6, 1
			.word	.abortentry7, 1
			.word	.abortentry8, 1
			.word	.abortentry9, 1
			.word	.abortentry10, 1
			.word	.abortentry11, 1
			.word	.abortentry12, 1
			.word	.abortentry13, 1

		FBC	.word	.abortentry19, 1
		FBC	.word	.abortentry20, 1
		FBC	.word	.abortentry21, 1
		FBC	.word	.abortentry22, 1
		FBC	.word	.abortentry23, 1
		FBC	.word	.abortentry24, 1
		FBC	.word	.abortentry25, 1
		FBC	.word	.abortentry26, 1
		FBC	.word	.abortentry27, 1
		FBC	.word	.abortentry28, 1
		FBC	.word	.abortentry29, 1
		FBC	.word	.abortentry30, 1
		FBC	.word	.abortentry31, 1
		FBC	.word	.abortentry32, 1

		FBC	.word	.abortentry38, 2
		FBC	.word	.abortentry39, 3
		FBC	.word	.abortentry40, 4
		FBC	.word	.abortentry41, 3
		FBC	.word	.abortentry42, 2
		FBC	.word	.abortentry42_1, 2
		FBC	.word	.abortentry43, 0
		FBC	.word	.abortentry44, 1
		FBC	.word	.abortentry45, 3
		FBC	.word	.abortentry46, 2
		FBC	.word	.abortentry47, 0
		FBC	.word	.abortentry48, 1
		FBC	.word	.abortentry49, 0
		FBC	.word	.abortentry50, 1
		FBC	.word	.abortentry51, 0
		FBC	.word	.abortentry52, 1

		FBC	.word	.abortentry58, 2
		FBC	.word	.abortentry59, 2
		FBC	.word	.abortentry60, 2

	NSP	FBC	.word	.abortentry61, 0
	NSP	FBC	.word	.abortentry62, 0
	NSP	FBC	.word	.abortentry63, 0
	NSP	FBC	.word	.abortentry64, 0
	NSP	FBC	.word	.abortentry65, 0
	NSP	FBC	.word	.abortentry66, 0
	NSP	FBC	.word	.abortentry67, 0
	NSP	FBC	.word	.abortentry68, 0
	NSP	FBC	.word	.abortentry69, 0
	NSP	FBC	.word	.abortentry70, 0
	NSP	FBC	.word	.abortentry71, 0
	NSP	FBC	.word	.abortentry72, 0

		FBC	.word	.abortentry73, 1
		FBC	.word	.abortentry74, 1
		FBC	.word	.abortentry75, 1
		FBC	.word	.abortentry76, 1
		FBC	.word	.abortentry77, 1

	    FBC		.word	.abortentry78, 3
	    FBC		.word	.abortentry79, 3
	    FBC		.word	.abortentry80, 3
	    FBC		.word	.abortentry81, 3
	    FBC		.word	.abortentry82, 3
	    FBC		.word	.abortentry83, 3
	    FBC		.word	.abortentry84, 3
	    FBC		.word	.abortentry85, 3
	    FBC		.word	.abortentry86, 3
	    FBC		.word	.abortentry87, 3

	    FBC    	.word	.abortentry88, 3
	    FBC	   	.word	.abortentry89, 5
	    FBC	     	.word	.abortentry90, 4
	    FBC	     	.word	.abortentry91, 4
	NSP FBC	     	.word	.abortentry92, 3
	NSP FBC	     	.word	.abortentry93, 3
	NSP FBC	     	.word	.abortentry94, 3
	NSP FBC	     	.word	.abortentry95, 3
	NSP FBC	     	.word	.abortentry96, 3
	NSP FBC	     	.word	.abortentry97, 3
	NSP FBC	     	.word	.abortentry98, 3
	NSP FBC	     	.word	.abortentry99, 3
	NSP FBC	     	.word	.abortentry100, 3
	NSP FBC	     	.word	.abortentry101, 3
	NSP FBC	     	.word	.abortentry102, 3
	NSP FBC	     	.word	.abortentry103, 3
	    FBC		.word	.abortentry104, 0
		FBC	.word	.abortentry105, 1
		FBC	.word	.abortentry106, 1
		FBC	.word	.abortentry107, 1
		FBC	.word	.abortentry108, 1
		FBC	.word	.abortentry109, 1
			.word	.abortentry110, 0

		FBC	.word	.abortentry111, 3
		FBC	.word	.abortentry112, 3

		FBC	.word	.abortentry113, 0
			.word	.abortentry114, 1
			.word	.abortentry115, 0
			.word	.abortentry116, abstractmethod_exception
		FBC	.word	.abortentry117, 0
			.word	.abortentry118, 0
			.word	.abortentry119, return_throw_illegal_monitor_state
		FBC	.word	.abortentry120, 0
	.word	0

#else
	.global	asm_check_null_ptr
asm_check_null_ptr:
	mov	r0, #0
	bx	lr

#endif

#ifdef NATIVE_ENTRY
	ALIGN_CODE
fast_native_entry:
	mov	r2, tmp1
	mov	r11, tmp2
fast_native_entry_with_args:
	ldrh	r1, [r11, #METHOD_SIZEOFPARAMETERS]
	ldr	r4, [r2, #THREAD_JAVA_SP]
	ldr	r3, [r2, #THREAD_TOP_ZERO_FRAME]
	mov	r0, #0
	mov	ip, #INTERPRETER_FRAME
	sub	r9, r4, #FRAME_SIZE
	str	r9, [r2, #THREAD_JAVA_SP]	@ drop stack
	sub	r5, r9, #4		@ stack limit = r9 - 4
	str	r3, [r9, #ISTATE_NEXT_FRAME]
	str	ip, [r9, #ISTATE_FRAME_TYPE]
	str	r9, [r9, #ISTATE_MONITOR_BASE]
	str	r5, [r9, #ISTATE_STACK_LIMIT]
	str	r9, [r9, #ISTATE_STACK_BASE]
	str	r0, [r9, #ISTATE_OOP_TEMP]

@	str	r0, [r9, #ISTATE_CALLEE]
@	str	r0, [r9, #ISTATE_PREV_LINK]
	str	r0, [r9, #ISTATE_MSG]
@	str	r0, [r9, #ISTATE_MDX]

	ldr	r10, [r11, #METHOD_CONSTANTS]
	sub	r7, r4, #4
	mov	r5, #0
	add	r7, r7, r1, lsl #2

	ldr	r10, [r10, #CONSTANTPOOL_CACHE]

	str	r2, [r9, #ISTATE_THREAD]
	str	r5, [r9, #ISTATE_BCP]
	str	r7, [r9, #ISTATE_LOCALS]
	str	r10, [r9, #ISTATE_CONSTANTS]
	str	r11, [r9, #ISTATE_METHOD]

@	stmia	r9, {r2, r5, r7, r10, r11}
	ldr	r1, [r2, #THREAD_STACK_SIZE]
	ldr	r3, [r2, #THREAD_STACK_BASE]
	add	r0, r9, #72
	mov	r9, r2
	rsb	r3, r1, r3
	rsb	r3, r3, arm_sp
	cmp	r3, #4096
	str	r0, [r9, #THREAD_TOP_ZERO_FRAME]
	ldr	r5, [r11, #METHOD_SIGNATUREHANDLER]
	blt	.fast_native_entry_throw_stack_overflow
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
	ldr	r5, [r11, #METHOD_SIGNATUREHANDLER]
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
	add	r3, r4, #ISTATE_OOP_TEMP-76

	mov	ip, ip, asr #2
	mov	r4, arm_sp

	add	lr, ip, #4
	sub	arm_sp, arm_sp, #16

	bic	lr, lr, #1
	add	r1, r5, #24

	sub	arm_sp, arm_sp, lr, lsl #2
	add	r2, r9, #THREAD_JNI_ENVIRONMENT

	mov	lr, arm_sp
	str	r2, [lr], #4

	ldr	r2, [r11, #METHOD_ACCESSFLAGS]
	add	r1, r1, #4
	tst	r2, #JVM_ACC_STATIC
	beq	.do_fast_copy_args

	ldr	r2, [r11, #METHOD_CONSTANTS]
	ldr	r2, [r2, #16]
	str	r3, [lr], #4
	ldr	r2, [r2, #60]
	add	r1, r1, #4
	str	r2, [r3]


.do_fast_copy_args:
	cmp	ip, #0
	blt	.fast_no_args

.fast_copy_args:
	ldr	r0, [r1], #4
	ldrh	r3, [r0, #6]
	ldr	r2, [r7], #-4
	cmp	r3, #FFI_TYPE_DOUBLE
	cmpne	r3, #FFI_TYPE_SINT64
	beq	.fast_copy_long

	cmp	r3, #FFI_TYPE_POINTER
	beq	.fast_copy_ptr

	subs	ip, ip, #1
	str	r2, [lr], #4
	bge	.fast_copy_args
	b	.fast_no_args

.fast_copy_long:
	tst	lr, #4
	ldr	r3, [r7], #-4
	addne	lr, lr, #4
	str	r2, [lr, #4]
	subs	ip, ip, #2
	str	r3, [lr], #8
	bge	.fast_copy_args
	b	.fast_no_args

.fast_copy_ptr:
	cmp	r2, #0
	addne	r2, r7, #4
	subs	ip, ip, #1
	str	r2, [lr], #4
	bge	.fast_copy_args

.fast_no_args:
	ldr	r0, [r9, #THREAD_TOP_ZERO_FRAME]
	mov	r2, #_thread_in_native

	str	r0, [r9, #THREAD_LAST_JAVA_SP]
	str	r2, [r9, #THREAD_STATE]

	ldr	ip, [r11, #METHOD_NATIVEHANDLER]
	ldrh	r11, [r11, #METHOD_SIZEOFPARAMETERS]

#ifdef CODETRACE
	ldr	r1, [dispatch, #CodeTrace_Idx-XXX]
	cmp	r1, #CODETRACE_BUFFER_SIZE
	moveq	r1, #0
	sub	r2, dispatch, #XXX-CodeTrace_Buffer_Base
	mov	r3, #0x4e << 24		@ 'NATV' -> r3
	orr	r3, r3, #0x4a << 16
	orr	r3, r3, #0x54 << 8
	orr	r3, r3, #0x56
	str	r3, [r2, r1]
	add	r1, r1, #4
	cmp	r1, #CODETRACE_BUFFER_SIZE
	moveq	r1, #0
	str	ip, [r2, r1]
	add	r1, r1, #4
	str	r1, [dispatch, #CodeTrace_Idx-XXX]
#endif

	ldmia	arm_sp!, {r0, r1, r2, r3}
	blx	ip

	mov	ip, #_thread_in_native_trans
	mov	arm_sp, r4

	ldr	r3, [dispatch, #SafePointSynchronize_state_Address-XXX]
	str	ip, [r9, #THREAD_STATE]

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

	ldr	lr, [r5], #4

	add	r5, r5, r11, lsl #2

	ldr	ip, [r2, r3, asl #2]
	adr	r3, .return_type_table

	ldrh	r2, [ip, #6]
	ldr	ip, [r9, #THREAD_ACTIVE_HANDLES]

	mov	tmp1, #0
	ldr	pc, [r3, r2, lsl #2]

.return_type_table:
	.word	.fast_native_return_void	@ FFI_TYPE_VOID	== 0
	.word	0
	.word	.fast_native_return_w		@ FFI_TYPE_FLOAT == 2
	.word	.fast_native_return_dw		@ FFI_TYPE_DOUBLE == 3
	.word	0
	.word	.fast_native_return_bool	@ FFI_TYPE_BOOL == 5
	.word	.fast_native_return_byte	@ FFI_TYPE_SINT8 == 6
	.word	.fast_native_return_char	@ FFI_TYPE_UINT16 == 7
	.word	.fast_native_return_short	@ FFI_TYPE_SINT16 == 8
	.word	0
	.word	.fast_native_return_w		@ FFI_TYPE_SINT32 == 10
	.word	0
	.word	.fast_native_return_dw		@ FFI_TYPE_SINT64 == 12
	.word	0
	.word	.fast_native_return_obj		@ FFI_TYPE_POINTER == 14

.fast_native_return_dw:
	str	r0, [r5, #-8]!
	str	lr, [r9, #THREAD_TOP_ZERO_FRAME]
	str	tmp1, [ip, #JNIHANDLEBLOCK_TOP]
	str	r1, [r5, #4]
	cmp	istate, #0
	str	r5, [r9, #THREAD_JAVA_SP]
	bne	.fast_native_return
	ldmfd	arm_sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.fast_native_return_byte:
	mov	r0, r0, lsl #24
	str	lr, [r9, #THREAD_TOP_ZERO_FRAME]
	mov	r0, r0, asr #24
	str	tmp1, [ip, #JNIHANDLEBLOCK_TOP]
	str	r0, [r5, #-4]!
	cmp	istate, #0
	str	r5, [r9, #THREAD_JAVA_SP]
	bne	.fast_native_return
	ldmfd	arm_sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.fast_native_return_char:
	mov	r0, r0, lsl #16
	str	lr, [r9, #THREAD_TOP_ZERO_FRAME]
	mov	r0, r0, lsr #16
	str	tmp1, [ip, #JNIHANDLEBLOCK_TOP]
	str	r0, [r5, #-4]!
	cmp	istate, #0
	str	r5, [r9, #THREAD_JAVA_SP]
	bne	.fast_native_return
	ldmfd	arm_sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.fast_native_return_bool:
	ands	r0, r0, #255
	str	lr, [r9, #THREAD_TOP_ZERO_FRAME]
	movne	r0, #1
	str	tmp1, [ip, #JNIHANDLEBLOCK_TOP]
	str	r0, [r5, #-4]!
	cmp	istate, #0
	str	r5, [r9, #THREAD_JAVA_SP]
	bne	.fast_native_return
	ldmfd	arm_sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.fast_native_return_obj:
	cmp	r0, #0
	ldrne	r0, [r0]
	str	r0, [r5, #-4]!
	str	lr, [r9, #THREAD_TOP_ZERO_FRAME]
	str	tmp1, [ip, #JNIHANDLEBLOCK_TOP]
	cmp	istate, #0
	str	r5, [r9, #THREAD_JAVA_SP]
	bne	.fast_native_return
	ldmfd	arm_sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.fast_native_return_short:
	mov	r0, r0, lsl #16
	mov	r0, r0, asr #16
.fast_native_return_w:
	str	r0, [r5, #-4]!
.fast_native_return_void:
	str	lr, [r9, #THREAD_TOP_ZERO_FRAME]
	str	tmp1, [ip, #JNIHANDLEBLOCK_TOP]
.fast_native_exit:
	cmp	istate, #0
	str	r5, [r9, #THREAD_JAVA_SP]
	ldmeqfd	arm_sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.fast_native_return:
	ldr	r2, [istate, #ISTATE_STACK_LIMIT]
	sub	r5, r5, #4
	str	r5, [istate, #ISTATE_STACK]

	ldr	r1, [r9, #THREAD_TOP_ZERO_FRAME]
	add	r2, r2, #4
	str	r2, [r9, #THREAD_JAVA_SP]
	str	r1, [r9, #THREAD_LAST_JAVA_SP]
	ldr	r0, [istate, #ISTATE_THREAD]
	CACHE_STACK
	CACHE_JPC
	ldr	r3, [r0, #THREAD_PENDING_EXC]
	DISPATCH_START	3
	DISPATCH_NEXT
	CACHE_CP
	DISPATCH_NEXT
	cmp	r3, #0
	DISPATCH_NEXT
	bne	invokenative_exception
	DISPATCH_NEXT
	CACHE_LOCALS
	DISPATCH_FINISH

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

	ldrh	r3, [r11, #METHOD_SIZEOFPARAMETERS]
	add	r5, r5, r3, lsl #2
	b	.fast_native_exit

.fast_native_entry_do_special:
	stmdb	arm_sp!, {r0, r1}
	mov	r0, r9
	bl	_ZN10JavaThread40check_special_condition_for_native_transEPS_
	ldmia	arm_sp!, {r0, r1}
	b	.fast_native_entry_do_return
#endif // NATIVE_ENTRY

#include "bytecodes_arm.s"

	Opcode	idiv

	POP	tmp2, tmp1
	DISPATCH_START	1
int_div:
	cmp	tmp2, #0x20
	DISPATCH_NEXT
	adr	r3, .div_table
	DISPATCH_NEXT
	ldrcc	pc, [r3, tmp2, lsl #2]

        ands    a4, tmp2, #0x80000000
        rsbmi   tmp2, tmp2, #0
        eors    lr, a4, tmp1, ASR #32
        rsbcs   tmp1, tmp1, #0
	movs	a3, tmp2
.s_loop:
        cmp     a3, tmp1, LSR #8
        movls   a3, a3, LSL #8
        blo     .s_loop
        cmp     a3, tmp1, LSR #1
        bhi     .s_jump7
        cmp     a3, tmp1, LSR #2
        bhi     .s_jump6
        cmp     a3, tmp1, LSR #3
        bhi     .s_jump5
        cmp     a3, tmp1, LSR #4
        bhi     .s_jump4
        cmp     a3, tmp1, LSR #5
        bhi     .s_jump3
        cmp     a3, tmp1, LSR #6
        bhi     .s_jump2
        cmp     a3, tmp1, LSR #7
        bhi     .s_jump1
.s_loop2:
@ not executed when falling into .s_loop2
        movhi   a3, a3, LSR #8
        cmp     tmp1, a3, LSL #7
        adc     a4, a4, a4
        subcs   tmp1, tmp1, a3, LSL #7
        cmp     tmp1, a3, LSL #6
.s_jump1:
        adc     a4, a4, a4
        subcs   tmp1, tmp1, a3, LSL #6
        cmp     tmp1, a3, LSL #5
.s_jump2:
        adc     a4, a4, a4
        subcs   tmp1, tmp1, a3, LSL #5
        cmp     tmp1, a3, LSL #4
.s_jump3:
        adc     a4, a4, a4
        subcs   tmp1, tmp1, a3, LSL #4
        cmp     tmp1, a3, LSL #3
.s_jump4:
        adc     a4, a4, a4
        subcs   tmp1, tmp1, a3, LSL #3
        cmp     tmp1, a3, LSL #2
.s_jump5:
        adc     a4, a4, a4
        subcs   tmp1, tmp1, a3, LSL #2
        cmp     tmp1, a3, LSL #1
.s_jump6:
        adc     a4, a4, a4
        subcs   tmp1, tmp1, a3, LSL #1
.s_jump7:
        cmp     tmp1, a3
        adc     a4, a4, a4
        subcs   tmp1, tmp1, a3
        cmp     a3, tmp2
        bne     .s_loop2
        movs    lr, lr, lsl #1
	rsbcs	a4, a4, #0
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	a4
	DISPATCH_FINISH

.div_table:
	.word	div_zero_jpc_1
	.word	.divc_1
	.word	.divc_2
	.word	.divc_3
	.word	.divc_4
	.word	.divc_5
	.word	.divc_6
	.word	.divc_7
	.word	.divc_8
	.word	.divc_9
	.word	.divc_10
	.word	.divc_11
	.word	.divc_12
	.word	.divc_13
	.word	.divc_14
	.word	.divc_15
	.word	.divc_16
	.word	.divc_17
	.word	.divc_18
	.word	.divc_19
	.word	.divc_20
	.word	.divc_21
	.word	.divc_22
	.word	.divc_23
	.word	.divc_24
	.word	.divc_25
	.word	.divc_26
	.word	.divc_27
	.word	.divc_28
	.word	.divc_29
	.word	.divc_30
	.word	.divc_31

.divc_1:
	DISPATCH_STATE	3
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUSH	tmp1
	DISPATCH_FINISH
.divc_2:
	DISPATCH_STATE	3
	DISPATCH_NEXT
        add     tmp1, tmp1, tmp1, lsr #31
        mov     tmp2, tmp1, asr #1
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.divc_3:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_3
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        sub	tmp2, a4, tmp1, asr #31
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.divc_4:
	DISPATCH_STATE	3
	movs	a4, tmp1
	DISPATCH_NEXT
        addmi	a4, a4, #3
        mov	tmp2, a4, asr #2
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.divc_5:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_5
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	lr, tmp1, asr #31
        rsb	tmp2, lr, a4, asr #1
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.divc_6:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_6
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        sub	tmp2, a4, tmp1, asr #31
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.divc_7:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_7
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	tmp2, tmp1, asr #31
        add	lr, tmp1, a4
        rsb	tmp2, tmp2, lr, asr #2
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.divc_8:
	DISPATCH_STATE	3
	movs	lr, tmp1
	DISPATCH_NEXT
        addmi	lr, lr, #7
        mov	tmp2, lr, asr #3
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.divc_9:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_9
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	lr, tmp1, asr #31
        rsb	tmp2, lr, a4, asr #1
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.divc_10:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_10
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	lr, tmp1, asr #31
        rsb	tmp2, lr, a4, asr #2
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.divc_11:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_11
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	lr, tmp1, asr #31
        rsb	tmp2, lr, a4, asr #1
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.divc_12:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_12
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	lr, tmp1, asr #31
        rsb	tmp2, lr, a4, asr #1
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.divc_13:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_13
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	lr, tmp1, asr #31
        rsb	tmp2, lr, a4, asr #2
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.divc_14:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_14
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	tmp2, tmp1, asr #31
        add	lr, tmp1, a4
        rsb	tmp2, tmp2, lr, asr #3
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.divc_15:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_15
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	tmp2, tmp1, asr #31
        add	lr, tmp1, a4
        rsb	tmp2, tmp2, lr, asr #3
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.divc_16:
	DISPATCH_STATE	3
	movs	lr, tmp1
	DISPATCH_NEXT
        addmi	lr, lr, #15
        mov	tmp2, lr, asr #4
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.divc_17:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_17
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	lr, tmp1, asr #31
        rsb	tmp2, lr, a4, asr #3
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.divc_18:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_18
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	lr, tmp1, asr #31
        rsb	tmp2, lr, a4, asr #2
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.divc_19:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_19
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	lr, tmp1, asr #31
        rsb	tmp2, lr, a4, asr #3
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.divc_20:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_20
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	lr, tmp1, asr #31
        rsb	tmp2, lr, a4, asr #3
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.divc_21:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_21
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	lr, tmp1, asr #31
        rsb	tmp2, lr, a4, asr #2
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.divc_22:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_22
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	lr, tmp1, asr #31
        rsb	tmp2, lr, a4, asr #2
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.divc_23:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_23
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	tmp2, tmp1, asr #31
        add	lr, tmp1, a4
        rsb	tmp2, tmp2, lr, asr #4
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.divc_24:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_24
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	lr, tmp1, asr #31
        rsb	tmp2, lr, a4, asr #2
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.divc_25:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_25
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	lr, tmp1, asr #31
        rsb	tmp2, lr, a4, asr #3
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.divc_26:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_26
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	lr, tmp1, asr #31
        rsb	tmp2, lr, a4, asr #3
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.divc_27:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_27
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	lr, tmp1, asr #31
        rsb	tmp2, lr, a4, asr #3
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.divc_28:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_28
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	tmp2, tmp1, asr #31
        add	lr, tmp1, a4
        rsb	tmp2, tmp2, lr, asr #4
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.divc_29:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_29
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	tmp2, tmp1, asr #31
        add	lr, tmp1, a4
        rsb	tmp2, tmp2, lr, asr #4
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.divc_30:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_30
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	tmp2, tmp1, asr #31
        add	lr, tmp1, a4
        rsb	tmp2, tmp2, lr, asr #4
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.divc_31:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_31
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	tmp2, tmp1, asr #31
        add	lr, tmp1, a4
        rsb	tmp2, tmp2, lr, asr #4
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.dc_7:
.dc_14:
	.word     0x92492493
.dc_15:
.dc_30:
	.word     0x88888889
.dc_23:
	.word     0xb21642c9
.dc_28:
	.word     0x92492493
.dc_29:
	.word     0x8d3dcb09
.dc_31:
	.word     0x84210843
.dc_6:
.dc_12:
.dc_24:
	.word     0x2aaaaaab
.dc_19:
	.word     0x6bca1af3
.dc_5:
.dc_10:
.dc_20:
	.word     0x66666667
.dc_21:
	.word     0x30c30c31
.dc_11:
.dc_22:
	.word     0x2e8ba2e9
.dc_26:
.dc_13:
	.word     0x4ec4ec4f
.dc_25:
	.word     0x51eb851f
.dc_27:
	.word     0x4bda12f7
.dc_3:
	.word     0x55555556
.dc_17:
	.word     0x78787879
.dc_9:
.dc_18:
	.word     0x38e38e39


	Opcode	irem

	POP	tmp2, tmp1
	DISPATCH_START	1
int_rem:
	cmp	tmp2, #0x20
	DISPATCH_NEXT
	adr	r3, .rem_table
	DISPATCH_NEXT
	ldrcc	pc, [r3, tmp2, lsl #2]

        ands    a4, tmp2, #0x80000000
        rsbmi   tmp2, tmp2, #0
        eors    lr, a4, tmp1, ASR #32
        rsbcs   tmp1, tmp1, #0
	movs	a3, tmp2
.r_loop:
        cmp     a3, tmp1, LSR #8
        movls   a3, a3, LSL #8
        blo     .r_loop
        cmp     a3, tmp1, LSR #1
        bhi     .r_jump7
        cmp     a3, tmp1, LSR #2
        bhi     .r_jump6
        cmp     a3, tmp1, LSR #3
        bhi     .r_jump5
        cmp     a3, tmp1, LSR #4
        bhi     .r_jump4
        cmp     a3, tmp1, LSR #5
        bhi     .r_jump3
        cmp     a3, tmp1, LSR #6
        bhi     .r_jump2
        cmp     a3, tmp1, LSR #7
        bhi     .r_jump1
.r_loop2:
@ not executed when falling into .r_loop2
        movhi   a3, a3, LSR #8
        cmp     tmp1, a3, LSL #7
        adc     a4, a4, a4
        subcs   tmp1, tmp1, a3, LSL #7
        cmp     tmp1, a3, LSL #6
.r_jump1:
        adc     a4, a4, a4
        subcs   tmp1, tmp1, a3, LSL #6
        cmp     tmp1, a3, LSL #5
.r_jump2:
        adc     a4, a4, a4
        subcs   tmp1, tmp1, a3, LSL #5
        cmp     tmp1, a3, LSL #4
.r_jump3:
        adc     a4, a4, a4
        subcs   tmp1, tmp1, a3, LSL #4
        cmp     tmp1, a3, LSL #3
.r_jump4:
        adc     a4, a4, a4
        subcs   tmp1, tmp1, a3, LSL #3
        cmp     tmp1, a3, LSL #2
.r_jump5:
        adc     a4, a4, a4
        subcs   tmp1, tmp1, a3, LSL #2
        cmp     tmp1, a3, LSL #1
.r_jump6:
        adc     a4, a4, a4
        subcs   tmp1, tmp1, a3, LSL #1
.r_jump7:
        cmp     tmp1, a3
        adc     a4, a4, a4
        subcs   tmp1, tmp1, a3
        cmp     a3, tmp2
        bne     .r_loop2
        movs    lr, lr, lsl #1
	DISPATCH_NEXT
	rsbmi	tmp1, tmp1, #0
	DISPATCH_NEXT
	PUSH	tmp1
	DISPATCH_FINISH

.rem_table:
	.word	div_zero_jpc_1
	.word	.remc_1
	.word	.remc_2
	.word	.remc_3
	.word	.remc_4
	.word	.remc_5
	.word	.remc_6
	.word	.remc_7
	.word	.remc_8
	.word	.remc_9
	.word	.remc_10
	.word	.remc_11
	.word	.remc_12
	.word	.remc_13
	.word	.remc_14
	.word	.remc_15
	.word	.remc_16
	.word	.remc_17
	.word	.remc_18
	.word	.remc_19
	.word	.remc_20
	.word	.remc_21
	.word	.remc_22
	.word	.remc_23
	.word	.remc_24
	.word	.remc_25
	.word	.remc_26
	.word	.remc_27
	.word	.remc_28
	.word	.remc_29
	.word	.remc_30
	.word	.remc_31

.remc_1:
	DISPATCH_STATE	3
	DISPATCH_NEXT
	mov	tmp2, #0
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.remc_2:
	DISPATCH_STATE	3
	add	lr, tmp1, tmp1, lsr #31
        mov	tmp2, lr, asr #1
	DISPATCH_NEXT
	sub	tmp2, tmp1, tmp2, lsl #1
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.remc_3:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_3
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        sub	tmp2, a4, tmp1, asr #31
	add	lr, tmp2, tmp2, lsl #1
	sub	tmp2, tmp1, lr
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.remc_4:
	DISPATCH_STATE	3
	movs	lr, tmp1
	DISPATCH_NEXT
        addmi	lr, lr, #3
        mov	tmp2, lr, asr #2
	sub	tmp2, tmp1, tmp2, lsl #2
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.remc_5:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_5
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	lr, tmp1, asr #31
        rsb	tmp2, lr, a4, asr #1
	add	lr, tmp2, tmp2, lsl #2
	sub	tmp2, tmp1, lr
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.remc_6:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_6
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        sub	tmp2, a4, tmp1, asr #31
	add	lr, tmp2, tmp2, lsl #1
	sub	tmp2, tmp1, lr, lsl #1
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.remc_7:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_7
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	tmp2, tmp1, asr #31
        add	lr, tmp1, a4
        rsb	tmp2, tmp2, lr, asr #2
	rsb	lr, tmp2, tmp2, lsl #3
	sub	tmp2, tmp1, lr
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.remc_8:
	DISPATCH_STATE	3
	movs	lr, tmp1
	DISPATCH_NEXT
        addmi	lr, lr, #7
        mov	tmp2, lr, asr #3
	sub	tmp2, tmp1, tmp2, lsl #3
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.remc_9:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_9
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	lr, tmp1, asr #31
        rsb	tmp2, lr, a4, asr #1
	add	lr, tmp2, tmp2, lsl #3
	sub	tmp2, tmp1, lr
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.remc_10:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_10
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	lr, tmp1, asr #31
        rsb	tmp2, lr, a4, asr #2
	add	lr, tmp2, tmp2, lsl #2
	sub	tmp2, tmp1, lr, lsl #1
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.remc_11:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_11
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	lr, tmp1, asr #31
        rsb	tmp2, lr, a4, asr #1
	add	lr, tmp2, tmp2, lsl #2
	add	lr, tmp2, lr, lsl #1
	sub	tmp2, tmp1, lr
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.remc_12:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_12
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	lr, tmp1, asr #31
        rsb	tmp2, lr, a4, asr #1
	add	lr, tmp2, tmp2, lsl #1
	sub	tmp2, tmp1, lr, lsl #2
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.remc_13:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_13
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	lr, tmp1, asr #31
        rsb	tmp2, lr, a4, asr #2
	add	lr, tmp2, tmp2, lsl #1
	add	lr, tmp2, lr, lsl #2
	sub	tmp2, tmp1, lr
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.remc_14:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_14
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	tmp2, tmp1, asr #31
        add	lr, tmp1, a4
        rsb	tmp2, tmp2, lr, asr #3
	rsb	lr, tmp2, tmp2, lsl #3
	sub	tmp2, tmp1, lr, lsl #1
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.remc_15:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_15
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	tmp2, tmp1, asr #31
        add	lr, tmp1, a4
        rsb	tmp2, tmp2, lr, asr #3
	rsb	lr, tmp2, tmp2, lsl #4
	sub	tmp2, tmp1, lr
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.remc_16:
	DISPATCH_STATE	3
	movs	lr, tmp1
	DISPATCH_NEXT
        addmi	lr, lr, #15
        mov	tmp2, lr, asr #4
	sub	tmp2, tmp1, tmp2, lsl #4
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.remc_17:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_17
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	lr, tmp1, asr #31
        rsb	tmp2, lr, a4, asr #3
	add	lr, tmp2, tmp2, lsl #4
	sub	tmp2, tmp1, lr
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.remc_18:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_18
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	lr, tmp1, asr #31
        rsb	tmp2, lr, a4, asr #2
	add	lr, tmp2, tmp2, lsl #3
	sub	tmp2, tmp1, lr, lsl #1
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.remc_19:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_19
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	lr, tmp1, asr #31
        rsb	tmp2, lr, a4, asr #3
	add	lr, tmp2, tmp2, lsl #3
	add	lr, tmp2, lr, lsl #1
	sub	tmp2, tmp1, lr
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.remc_20:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_20
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	lr, tmp1, asr #31
        rsb	tmp2, lr, a4, asr #3
	add	lr, tmp2, tmp2, lsl #2
	sub	tmp2, tmp1, lr, lsl #2
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.remc_21:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_21
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	lr, tmp1, asr #31
        rsb	tmp2, lr, a4, asr #2
	add	lr, tmp2, tmp2, lsl #1
	rsb	lr, lr, lr, lsl #3
	sub	tmp2, tmp1, lr
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.remc_22:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_22
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	lr, tmp1, asr #31
        rsb	tmp2, lr, a4, asr #2
	add	lr, tmp2, tmp2, lsl #2
	add	lr, tmp2, lr, lsl #1
	sub	tmp2, tmp1, lr, lsl #1
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.remc_23:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_23
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	tmp2, tmp1, asr #31
        add	lr, tmp1, a4
        rsb	tmp2, tmp2, lr, asr #4
	add	lr, tmp2, tmp2, lsl #1
	rsb	lr, tmp2, lr, lsl #3
	sub	tmp2, tmp1, lr
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.remc_24:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_24
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	lr, tmp1, asr #31
        rsb	tmp2, lr, a4, asr #2
	add	lr, tmp2, tmp2, lsl #1
	sub	tmp2, tmp1, lr, lsl #3
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.remc_25:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_25
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	lr, tmp1, asr #31
        rsb	tmp2, lr, a4, asr #3
	add	lr, tmp2, tmp2, lsl #2
	add	lr, lr, lr, lsl #2
	sub	tmp2, tmp1, lr
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.remc_26:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_26
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	lr, tmp1, asr #31
        rsb	tmp2, lr, a4, asr #3
	add	lr, tmp2, tmp2, lsl #1
	add	lr, tmp2, lr, lsl #2
	sub	tmp2, tmp1, lr, lsl #1
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.remc_27:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_27
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	lr, tmp1, asr #31
        rsb	tmp2, lr, a4, asr #3
	add	lr, tmp2, tmp2, lsl #1
	add	lr, lr, lr, lsl #3
	sub	tmp2, tmp1, lr
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.remc_28:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_28
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	tmp2, tmp1, asr #31
        add	lr, tmp1, a4
        rsb	tmp2, tmp2, lr, asr #4
	rsb	lr, tmp2, tmp2, lsl #3
	sub	tmp2, tmp1, lr, lsl #2
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.remc_29:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_29
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	tmp2, tmp1, asr #31
        add	lr, tmp1, a4
        rsb	tmp2, tmp2, lr, asr #4
	rsb	lr, tmp2, tmp2, lsl #3
	add	lr, tmp2, lr, lsl #2
	sub	tmp2, tmp1, lr
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.remc_30:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_30
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	tmp2, tmp1, asr #31
        add	lr, tmp1, a4
        rsb	tmp2, tmp2, lr, asr #4
	rsb	lr, tmp2, tmp2, lsl #4
	sub	tmp2, tmp1, lr, lsl #1
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
.remc_31:
	DISPATCH_STATE	3
	ldr	tmp2, .dc_31
	DISPATCH_NEXT
        smull	lr, a4, tmp1, tmp2
        mov	tmp2, tmp1, asr #31
        add	lr, tmp1, a4
        rsb	tmp2, tmp2, lr, asr #4
	rsb	lr, tmp2, tmp2, lsl #5
	sub	tmp2, tmp1, lr
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH

	Opcode	goto
        ldrsb   r1, [jpc, #1]
        ldrb    tmp1, [jpc, #2]
branch_taken:
        orr     tmp1, tmp1, r1, lsl #8
        DISPATCH_START_REG	tmp1
	cmp	tmp1, #0
	ble	do_backedge
	DISPATCH_FINISH

do_backedge:
  USEC	ldr	tmp2, [istate, #ISTATE_METHOD]
  OSR	ldr	lr, [dispatch, #InterpreterInvocationLimit_Address-XXX]
  USEC	ldr	r1, [tmp2, #METHOD_BACKEDGECOUNTER]
  USEC	ldr	ip, [tmp2, #METHOD_INVOCATIONCOUNTER]
  USEC	add	r1, r1, #INVOCATIONCOUNTER_COUNTINCREMENT
  OSR	ldr	lr, [lr]
  USEC	add	ip, ip, #INVOCATIONCOUNTER_COUNTINCREMENT
  USEC	str	r1, [tmp2, #METHOD_BACKEDGECOUNTER]
  OSR	cmp	r1, lr, lsl #2
  USEC	str	ip, [tmp2, #METHOD_INVOCATIONCOUNTER]
  OSR	bcs	do_osr

osr_continue:
	ldr	ip, [dispatch, #SafePointSynchronize_state_Address-XXX]
	ldr	r1, [ip]
	cmp	r1, #1
	beq	do_synchronize
	DISPATCH_STATE	1
	DISPATCH_FINISH


do_synchronize:
	add	r0, istate, #ISTATE_THREAD
	bl	HandleMarkCleanerD
	ldr	r0, [istate, #ISTATE_THREAD]
	DECACHE_JPC
	DECACHE_STACK
	bl	_ZN20SafepointSynchronize5blockEP10JavaThread
	ASSERT_STACK_CACHED
	ASSERT_LOCALS_CACHED
	ldr	r0, [istate, #ISTATE_THREAD]
	CACHE_CP
	ldr	r3, [r0, #THREAD_PENDING_EXC]
	CACHE_JPC
	cmp	r3, #0
	bne	handle_exception
	DISPATCH	0

#ifdef ON_STACK_REPLACEMENT
do_osr:
	ldr	ip, [dispatch, #UseOnStackReplacement_Address-XXX]
	ldrb	ip, [ip]
	cmp	ip, #0
	beq	osr_continue

	ldr	r3, [tmp2, #METHOD_CONSTMETHOD]
	DECACHE_JPC
	ldrh	r3, [r3, #CONSTMETHOD_CODESIZE]
	DECACHE_STACK
	ldr	r0, [istate, #ISTATE_THREAD]
	sub	r1, jpc, tmp1
	cmp	r3, #MAX_FG_METHOD_SIZE
	bcc	1f
	ldr	tmp2, [dispatch, #BackgroundCompilation_Address-XXX]
	mov	r3, #1
	ldr	r5, [tmp2]
	str	r3, [tmp2]
	bl	_ZN18InterpreterRuntime26frequency_counter_overflowEP10JavaThreadPh
	str	r5, [tmp2]
	b	2f
1:
	bl	_ZN18InterpreterRuntime26frequency_counter_overflowEP10JavaThreadPh
2:
	ldr	r3, [istate, #ISTATE_THREAD]
	ASSERT_LOCALS_CACHED
	ASSERT_STACK_CACHED
	CACHE_CP
	ldr	r1, [r3, #THREAD_PENDING_EXC]
	CACHE_JPC
	cmp	r1, #0
	bne	handle_exception
	cmp	r0, #0
	beq	1f
	ldr	r1, [r0, #56]
	cmn	r1, #2
	bne	osr_migrate
1:
	DISPATCH_START	0
	b	osr_continue
#endif

#ifdef ON_STACK_REPLACEMENT
osr_migrate:
	ldr	tmp1, [r0, #128]	@ osr_method->osr_entry()
	ldr	tmp2, [istate, #ISTATE_ADVANCE_PC]
@	ldr	istate, [istate, #ISTATE_NEXT_FRAME]
	mov	r0, r3
	bl	_ZN13SharedRuntime19OSR_migration_beginEP10JavaThread
	mov	r1, r0
	ldr	r0, [istate, #ISTATE_METHOD]
	ldrh	lr, [r0, #METHOD_MAXLOCALS]
	ldrh	ip, [r0, #METHOD_SIZEOFPARAMETERS]
	ldr	r3, [istate, #ISTATE_THREAD]
	sub	lr, lr, ip
	ldr	r2, [r3, #THREAD_TOP_ZERO_FRAME]
	add	ip, r2, #4
	ldr	r2, [r2]
	add	ip, ip, lr, lsl #2
	str	r2, [r3, #THREAD_TOP_ZERO_FRAME]
	str	ip, [r3, #THREAD_JAVA_SP]
	mov	r2, tmp1
@ r0 = method
@ r1 = osr_buf
@ r2 = osr_entry
	mov	lr, pc
	ldr	pc, [tmp1]

	cmp	tmp2, #0
	ldmeqfd	arm_sp!, {regset, pc}

	ldr	istate, [istate, #ISTATE_NEXT_FRAME]
        ldr	lr, [istate, #-ISTATE_NEXT_FRAME+ISTATE_THREAD]!
        CACHE_JPC
        ldr     stack, [lr, #THREAD_JAVA_SP]
        ldr     r2, [istate, #ISTATE_STACK_LIMIT]
        sub     stack, stack, #4

        ldr     r1, [lr, #THREAD_TOP_ZERO_FRAME]
        add     r2, r2, #4
        str     r2, [lr, #THREAD_JAVA_SP]
        str     r1, [lr, #THREAD_LAST_JAVA_SP]
        ldr     r3, [lr, #THREAD_PENDING_EXC]
        DISPATCH_START_REG tmp2
        CACHE_LOCALS
	DISPATCH_NEXT
	DISPATCH_NEXT
        cmp     r3, #0
        DISPATCH_NEXT
        bne     return_exception
	DISPATCH_NEXT
        CACHE_CP
	DISPATCH_FINISH
#endif

	Opcode	ifeq
	Opcode	ifnull
        POP     r3
        ldrsb   r1, [jpc, #1]
        ldrb    tmp1, [jpc, #2]
        cmp     r3, #0
	beq	branch_taken
	DISPATCH	3

	Opcode	ifne
	Opcode	ifnonnull
        POP     r3
        ldrsb   r1, [jpc, #1]
        ldrb    tmp1, [jpc, #2]
        cmp     r3, #0
	bne	branch_taken
	DISPATCH	3

	Opcode	iflt
        POP     r3
        ldrsb   r1, [jpc, #1]
        ldrb    tmp1, [jpc, #2]
        cmp     r3, #0
	blt	branch_taken
	DISPATCH	3

	Opcode	ifge
        POP     r3
        ldrsb   r1, [jpc, #1]
        ldrb    tmp1, [jpc, #2]
        cmp     r3, #0
	bge	branch_taken
	DISPATCH	3

	Opcode	ifgt
        POP     r3
        ldrsb   r1, [jpc, #1]
        ldrb    tmp1, [jpc, #2]
        cmp     r3, #0
	bgt	branch_taken
	DISPATCH	3

	Opcode	ifle
        POP     r3
        ldrsb   r1, [jpc, #1]
        ldrb    tmp1, [jpc, #2]
        cmp     r3, #0
	ble	branch_taken
	DISPATCH	3

	Opcode	if_icmpeq
	Opcode	if_acmpeq
        POP    r2, r3
        ldrsb   r1, [jpc, #1]
        ldrb    tmp1, [jpc, #2]
        cmp     r3, r2
	beq	branch_taken
	DISPATCH	3

	Opcode	if_icmpne
	Opcode	if_acmpne
        POP    r2, r3
        ldrsb   r1, [jpc, #1]
        ldrb    tmp1, [jpc, #2]
        cmp     r3, r2
	bne	branch_taken
	DISPATCH	3

	Opcode	if_icmplt
        POP    r2, r3
        ldrsb   r1, [jpc, #1]
        ldrb    tmp1, [jpc, #2]
        cmp     r3, r2
	blt	branch_taken
	DISPATCH	3

	Opcode	if_icmpge
        POP    r2, r3
        ldrsb   r1, [jpc, #1]
        ldrb    tmp1, [jpc, #2]
        cmp     r3, r2
	bge	branch_taken
	DISPATCH	3

	Opcode	if_icmpgt
        POP    r2, r3
        ldrsb   r1, [jpc, #1]
        ldrb    tmp1, [jpc, #2]
        cmp     r3, r2
	bgt	branch_taken
	DISPATCH	3

	Opcode	if_icmple
        POP    r2, r3
        ldrsb   r1, [jpc, #1]
        ldrb    tmp1, [jpc, #2]
        cmp     r3, r2
	ble	branch_taken
	DISPATCH	3

	Opcode	ireturn
	Opcode	freturn
	Opcode	lreturn
	Opcode	dreturn
	Opcode	areturn
	Opcode	return
	ldr	r3, [dispatch, #SafePointSynchronize_state_Address-XXX]
	ldr	r1, [r3]
	cmp	r1, #1
	bne	handle_return
	add	r0, istate, #ISTATE_THREAD
	bl	HandleMarkCleanerD
	ldr	r0, [istate, #ISTATE_THREAD]
	DECACHE_JPC
	DECACHE_STACK
	bl	_ZN20SafepointSynchronize5blockEP10JavaThread
	ldr	r0, [istate, #ISTATE_THREAD]
	ASSERT_STACK_CACHED
	ldr	r3, [r0, #THREAD_PENDING_EXC]
	CACHE_JPC
@ CACHE_LOCALS & CACHE_CP not require for handle_retuen / handle_exception
	cmp	r3, #0
	beq	handle_return
	b	handle_exception

resolve_get_put:
	mov	r1, r0
	mov	tmp1, lr
        ldr     r0, [istate, #ISTATE_THREAD]
	DECACHE_JPC
        DECACHE_STACK
       	bl      _ZN18InterpreterRuntime15resolve_get_putEP10JavaThreadN9Bytecodes4CodeE
        ASSERT_STACK_CACHED
        ASSERT_LOCALS_CACHED
        ldr     r0, [istate, #ISTATE_THREAD]
	CACHE_JPC
        ldr     r3, [r0, #THREAD_PENDING_EXC]
	CACHE_CP
        cmp     r3, #0
	mov	lr, tmp1
        bne     getfield_exception
@ Now restart the getfield
        ldrb    r3, [jpc, #1]
        ldrb    r2, [jpc, #2]
        orr     r3, r3, r2, lsl #8      @ r3 = index
	add	tmp2, constpool, r3, lsl #4	@ tmp2 = cache
	bx	lr

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
	ldrb	r1, [jpc, #2]
        add     tmp2, constpool, r1, lsl #12
	add	tmp2, tmp2, r2, lsl #4
	ldr	r3, [tmp2, #CP_OFFSET]
        and     r3, r3, #0x00ff0000
        cmp     r3, #opc_getfield << 16
        blne    resolve_get_put
  NFBC	POP	tmp1
        ldr     r2, [tmp2, #CP_OFFSET+12]
  NFBC	cmp	tmp1, #0
  NFBC	beq	null_ptr_exception
  NFBC	ldr	tmp2, [tmp2, #CP_OFFSET+8]
        movs    r2, r2, lsr #29
  FBC	movhi	r0, #opc_igetfield
        bls     getfield_non_w
  NFBC	ldr	tmp2, [tmp1, tmp2]
  NFBC	PUSH	tmp2
  NFBC	DISPATCH 3

#ifdef FAST_BYTECODES
rewrite_bytecode:
	strb	r0, [jpc]
	DISPATCH_BYTECODE
#endif

getfield_non_w:
        bcs     getfield_h              @ C = 1 => R2 = 1
        beq     getfield_sb             @ Z = 1 => R2 = 0
        tst     r2, #2
        bne     getfield_dw

#ifdef FAST_BYTECODES
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
#else
getfield_sh:
	ldrsh	tmp2, [tmp1, tmp2]
	PUSH	tmp2
	DISPATCH 3
getfield_h:
	ldrh	tmp2, [tmp1, tmp2]
	PUSH	tmp2
	DISPATCH 3
getfield_sb:
	ldrsb	tmp2, [tmp1, tmp2]
	PUSH	tmp2
	DISPATCH 3
getfield_dw:
	add	tmp1, tmp1, tmp2
	ldm	tmp1, {r2, tmp2}
	PUSH	r2, tmp2
	DISPATCH 3
#endif

	Opcode	putfield
	ldrb	r1, [jpc, #2]
        add     tmp2, constpool, r1, lsl #12
	add	tmp2, tmp2, r2, lsl #4
	ldr	r3, [tmp2, #CP_OFFSET]
        and     r3, r3, #0xff000000
        cmp     r3, #opc_putfield << 24
        blne    resolve_get_put
        ldr     r2, [tmp2, #CP_OFFSET+12]
  NFBC	ldr	tmp2, [tmp2, #CP_OFFSET+8]
        movs    r2, r2, lsr #29
	bls	putfield_non_w
  FBC   mov	r0, #opc_iputfield
	cmp	r2, #tos_atos >> 1
  FBC	moveq	r0, #opc_aputfield
  FBC	b	rewrite_bytecode
  NFBC	beq	putfield_a
  NFBC	POP	r2, r3
  NFBC	cmp	r3, #0
  NFBC	beq	null_ptr_exception
  NFBC	str	r2, [r3, tmp2]
  NFBC	DISPATCH 3

putfield_non_w:
	bcs	putfield_h
	beq	putfield_sb
	tst	r2, #2
	bne	putfield_dw

#ifdef FAST_BYTECODES
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
#else
putfield_sh:
putfield_h:
	POP	r2, r3
	cmp	r3, #0
	beq	null_ptr_exception
	strh	r2, [r3, tmp2]
	DISPATCH 3
putfield_sb:
	POP	r2, r3
	cmp	r3, #0
	beq	null_ptr_exception
	strb	r2, [r3, tmp2]
	DISPATCH 3
putfield_dw:
	POP	r2, r3, lr
	cmp	lr, #0
	beq	null_ptr_exception
	add	tmp2, lr, tmp2
	stm	tmp2, {r2, r3}
	DISPATCH 3
putfield_a:
	GET_STACK	1, r0
	add	oop_address_tmp, r0, tmp2
	POP	oop_value_tmp
	cmp	r0, #0
	beq	null_ptr_exception
	bl	oop_store
    	ldr r3, [dispatch, #Universe_collectedHeap_Address-XXX]
        POP     r2
	ldr r3, [r3, #0]
	ldr r3, [r3, #12]
	ldr r3, [r3, #76]
        mov     tmp2, #0
        strb    tmp2, [r3, r2, lsr #9]
	DISPATCH 3
#endif

getstatic_sh:
	DISPATCH_START	3
	ldrsh	tmp2, [r3, lr]
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
getstatic_h:
	DISPATCH_START	3
	ldrh	tmp2, [r3, lr]
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
getstatic_sb:
	DISPATCH_START	3
	ldrsb	tmp2, [r3, lr]
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH
getstatic_dw:
	DISPATCH_START	3
	add	r3, r3, lr
	ldm	r3, {r2, tmp2}
	DISPATCH_NEXT
	PUSH	r2, tmp2
	DISPATCH_FINISH
getstatic_w:
	DISPATCH_START	3
	ldr	tmp2, [r3, lr]
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH

putstatic_sh:
putstatic_h:
	DISPATCH_START	3
	POP	tmp2
	DISPATCH_NEXT
	strh	tmp2, [r3, r2]
	DISPATCH_FINISH
putstatic_w:
	cmp	lr, #tos_atos >> 1	@ >> 1 due to lsr #29 above
	beq	putstatic_a
	DISPATCH_START	3
	POP	tmp2
	DISPATCH_NEXT
	str	tmp2, [r3, r2]
	DISPATCH_FINISH
putstatic_sb:
	DISPATCH_START	3
	POP	tmp2
	DISPATCH_NEXT
	strb	tmp2, [r3, r2]
	DISPATCH_FINISH
putstatic_dw:
	DISPATCH_START	3
	add	r2, r2, r3
	POP	r3, tmp2
	DISPATCH_NEXT
	stm	r2, {r3, tmp2}
	DISPATCH_FINISH
putstatic_a:
	POP	oop_value_tmp
	add	oop_address_tmp, r3, r2
	PUSH	r3
       	bl      oop_store
    ldr	r3, [dispatch, #Universe_collectedHeap_Address-XXX]
	DISPATCH_START	3
	POP	r2
    ldr	r3, [r3]
	DISPATCH_NEXT
    ldr	r3, [r3, #12]
	DISPATCH_NEXT
        mov     tmp2, #0
    ldr	r3, [r3, #76]
        strb    tmp2, [r3, r2, lsr #9]
	DISPATCH_FINISH

resolve_invokeinterface:
	mov	r1, #opc_invokeinterface
	b	resolve_invoke
resolve_invokevirtual:
	mov	r1, #opc_invokevirtual
	b	resolve_invoke
resolve_invokespecial:
	mov	r1, #opc_invokespecial
	b	resolve_invoke
resolve_invokestatic:
	mov	r1, #opc_invokestatic
resolve_invoke:
	mov	tmp1, lr
	ldr	r0, [istate, #ISTATE_THREAD]
	DECACHE_JPC
	DECACHE_STACK
	bl	_ZN18InterpreterRuntime14resolve_invokeEP10JavaThreadN9Bytecodes4CodeE
	ASSERT_STACK_CACHED
	ASSERT_LOCALS_CACHED
	ldr	r0, [istate, #ISTATE_THREAD]
	CACHE_JPC
	ldr	r3, [r0, #4]
	CACHE_CP
	cmp	r3, #0
        ldrb    r3, [jpc, #1]
        ldrb    r2, [jpc, #2]
	bne	resolve_exception
        orr     r3, r3, r2, lsl #8      @ r3 = index
	add	r0, constpool, r3, lsl #4	@ r1 = cache
	bx	tmp1

# r2 = [jpc, #1]
# r1 = [jpc, #2]
	Opcode	new
	ldrb	r1, [jpc, #2]
#define k_entry		tmp2
#define new_result	r7
#define top_addr	r7
#define uch		r7
#define obj_size	tmp1
	ldr	r3, [istate, #ISTATE_METHOD]
	orr	r2, r1, r2, lsl #8
	ldr	lr, [r3, #METHOD_CONSTANTS]
	ldr	r1, [lr, #CONSTANTPOOL_TAGS]
	add	r1, r1, #12
	ldrb	r3, [r1, r2]
	cmp	r3, #JVM_CONSTANT_UnresolvedClassInError
	cmpne	r3, #JVM_CONSTANT_UnresolvedClass
	beq	.new_slow_case

	add	r3, lr, #CONSTANTPOOL_BASE
	ldr	k_entry, [r3, r2, lsl #2]

	add	r1, k_entry, #KLASS_PART
	ldr	r3, [r1, #INSTANCEKLASS_INITSTATE]
	cmp	r3, #class_fully_initialized
	bne	.new_slow_case
	ldr	r3, [r1, #4]
	tst	r3, #1
	bne	.new_slow_case

	mov	obj_size, r3, asr #2
.new_retry:
	ldr	r0, [dispatch, #Universe_collectedHeap_Address-XXX]
	ldr	r0, [r0]
	bl	CollectedHeap_top_addr
	mov	top_addr, r0
	ldr	r0, [dispatch, #Universe_collectedHeap_Address-XXX]
	ldr	r0, [r0]
	bl	CollectedHeap_end_addr
	mov	r1, top_addr
	ldr	new_result, [top_addr, #0]
	add	ip, new_result, obj_size, lsl #2
	ldr	r3, [r0, #0]
	cmp	ip, r3
	bhi	.new_slow_case
	mov	r2, new_result
	add	r0, new_result, obj_size, lsl #2
	bl	cmpxchg_ptr
	cmp	r0, new_result
	bne	.new_retry
	subs	r2, obj_size, #2
@ ECN: sub optimimal memset
	tst	r2, #1
	add	r0, new_result, #8
	mov	r1, #0
	mov	ip, #0
	strne	r1, [r0], #4
	tst	r2, #2
	mov	r3, #0
	mov	lr, #0
	stmneia	r0!, {r1, r3}
	bics	r2, r2, #3
	beq	.new_zero_done
1:
	subs	r2, r2, #4
	stmia	r0!, {r1, r3, ip, lr}
	bne	1b
.new_zero_done:
	ldr	r3, [dispatch, #always_do_update_barrier_Address-XXX]
	mov	r2, #1
	ldrb	r1, [r3]	@ zero_extendqisi2
	str	r2, [new_result, #0]
	cmp	r1, #0
	bne	.new_do_update_barrier
	str	k_entry, [new_result, #4]
.new_exit:
	str	new_result, [stack], #-4
	CACHE_LOCALS
	DISPATCH	3
.new_do_update_barrier:
	add	oop_address_tmp, new_result, #4
@	mov	oop_value_tmp, k_entry		@ oop_value_tmp == k_entry
	adr	lr, .new_exit
	b	oop_store
.new_slow_case:
	ldrb	r2, [jpc, #1]
	ldrb	r1, [jpc, #2]
	ldr	r3, [istate, #ISTATE_METHOD]
	DECACHE_JPC
	DECACHE_STACK
	orr	r2, r1, r2, lsl #8
	ldr	r0, [istate, #ISTATE_THREAD]
	ldr	r1, [r3, #METHOD_CONSTANTS]
	bl	_ZN18InterpreterRuntime4_newEP10JavaThreadP19constantPoolOopDesci
	ldr	r0, [istate, #ISTATE_THREAD]
	ASSERT_STACK_CACHED
	ldr	ip, [r0, #THREAD_PENDING_EXC]
	CACHE_JPC
	CACHE_CP
	cmp	ip, #0
	CACHE_LOCALS
	bne	handle_exception
	ldr	r2, [r0, #THREAD_VM_RESULT]
	str	r2, [stack], #-4
	ldr	r3, [istate, #ISTATE_THREAD]
	str	ip, [r3, #THREAD_VM_RESULT]
	DISPATCH	3

bytecode_interpreter_str:
	.ascii  "[Bytecode Interpreter]\000"
	ALIGN_WORD

	Opcode	newarray
	ldrb	r1, [jpc, #1]	@ zero_extendqisi2
	ldr	r2, [stack, #4]
	ldr	r0, [istate, #ISTATE_THREAD]
	DECACHE_JPC
	DECACHE_STACK
	bl	_ZN18InterpreterRuntime8newarrayEP10JavaThread9BasicTypei
	ASSERT_LOCALS_CACHED
	ASSERT_STACK_CACHED
	ldr	r0, [istate, #ISTATE_THREAD]
	CACHE_JPC
	ldr	ip, [r0, #THREAD_PENDING_EXC]
	CACHE_CP
	cmp	ip, #0
	ldr	r2, [r0, #THREAD_VM_RESULT]
	bne	handle_exception
	str	r2, [stack, #4]
	str	ip, [r0, #THREAD_VM_RESULT]
	DISPATCH	2

	Opcode	anewarray
	ldrb	r0, [jpc, #1]	@ zero_extendqisi2
	ldr	r3, [stack, #4]
	ldr	lr, [istate, #ISTATE_METHOD]
	ldrb	r2, [jpc, #2]	@ zero_extendqisi2
	orr	r2, r2, r0, asl #8
	DECACHE_JPC
	DECACHE_STACK
	ldr	r1, [lr, #METHOD_CONSTANTS]
	ldr	r0, [istate, #ISTATE_THREAD]
	bl	_ZN18InterpreterRuntime9anewarrayEP10JavaThreadP19constantPoolOopDescii
	ASSERT_STACK_CACHED
	ASSERT_LOCALS_CACHED
	ldr	r0, [istate, #ISTATE_THREAD]
	CACHE_JPC
	ldr	ip, [r0, #THREAD_PENDING_EXC]
	CACHE_CP
	cmp	ip, #0
	ldr	r2, [r0, #THREAD_VM_RESULT]
	bne	handle_exception
	str	r2, [stack, #4]
	str	ip, [r0, #THREAD_VM_RESULT]
	DISPATCH	3

	Opcode	arraylength
	DISPATCH_START	1
	ldr	r3, [stack, #4]
	DISPATCH_NEXT
	DISPATCH_NEXT
	SW_NPC	cmp	r3, #0
	SW_NPC	beq	null_ptr_exception_jpc_1
.abortentry114:
	ldr	r3, [r3, #8]
	DISPATCH_NEXT
	DISPATCH_NEXT
	str	r3, [stack, #4]
	DISPATCH_FINISH

	Opcode	athrow
	ldr	r1, [stack, #4]
	cmp	r1, #0
	beq	null_ptr_exception
	mov	r2, #0
	ldr	r0, [istate, #ISTATE_THREAD]
	mov	r3, r2
	bl	_ZN12ThreadShadow21set_pending_exceptionEP7oopDescPKci
	b	handle_exception

#define secondary_super_cache_offset_in_bytes	20
#define tmp_chunk	locals
#define tmp_hwm		stack
#define	tmp_max		constpool

# r2 = [jpc, #1]
# r1 = [jpc, #2]
	Opcode	checkcast
	ldrb	r1, [jpc, #2]
	ldr	r3, [istate, #ISTATE_METHOD]
	ldr	r0, [stack, #4]
	ldr	r3, [r3, #METHOD_CONSTANTS]		@ R3 = METHOD->constants()
	cmp	r0, #0
	ldr	ip, [r3, #CONSTANTPOOL_TAGS]
	beq	.checkcast_exit
	add	ip, ip, #12
	orr	tmp2, r1, r2, lsl #8
	ldrb	r2, [ip, tmp2]	@ zero_extendqisi2
	cmp	r2, #JVM_CONSTANT_UnresolvedClassInError
	cmpne	r2, #JVM_CONSTANT_UnresolvedClass
	beq	3f

4:
	ldr	r0, [r0, #4]
	add	r3, r3, tmp2, lsl #2
	ldr	tmp1, [r3, #CONSTANTPOOL_BASE]
	cmp	tmp1, r0
	beq	.checkcast_exit

	ldr	r2, [tmp1, #16]
	add	tmp2, r0, #8
	add	ip, tmp2, r2
	ldr	ip, [ip, #-8]
	cmp	ip, tmp1
	beq	.checkcast_exit

	cmp	r2, #secondary_super_cache_offset_in_bytes
	bne	2f

	mov	r0, tmp2
	mov	r1, tmp1

	bl	_ZNK5Klass23search_secondary_supersEP12klassOopDesc
	cmp	r0, #0
	beq	2f
.checkcast_exit:
	DISPATCH	3

3:
	ldr	r0, [istate, #ISTATE_THREAD]
	DECACHE_JPC
	DECACHE_STACK
	bl	_ZN18InterpreterRuntime13quicken_io_ccEP10JavaThread
	ASSERT_STACK_CACHED
	ASSERT_LOCALS_CACHED
	ldr	r0, [istate, #ISTATE_THREAD]
	CACHE_JPC
	ldr	r3, [r0, #THREAD_PENDING_EXC]
	CACHE_CP
	cmp	r3, #0
	ldr	r3, [istate, #ISTATE_METHOD]
	bne	handle_exception
	ldr	r0, [stack, #4]
	ldr	r3, [r3, #METHOD_CONSTANTS]		@ METHOD->constanst() might have moved
	b	4b

2:
	DECACHE_JPC
	DECACHE_STACK
	mov	r0, tmp2
	ldr	r3, [istate, #ISTATE_THREAD]
	ldr	tmp2, [r3, #THREAD_RESOURCEAREA]

	ldr	tmp_chunk, [tmp2, #RESOURCEAREA_CHUNK]
	ldr	tmp_hwm, [tmp2, #RESOURCEAREA_HWM]
	ldr	tmp_max, [tmp2, #RESOURCEAREA_MAX]

	bl	_ZNK5Klass13external_nameEv
	mov	ip, r0
	add	r0, tmp1, #8
	mov	tmp1, ip
	bl	_ZNK5Klass13external_nameEv
	mov	r1, r0
	mov	r0, tmp1
	bl	SharedRuntime_generate_class_cast_message
	str	r0, [arm_sp, #0]
	ldr	r0, [istate, #ISTATE_THREAD]
	adrl	r1, bytecode_interpreter_str
	mov	r2, #99
	mov	r3, #_thread_in_vm
	str	r3, [r0, #THREAD_STATE]
	ldr	r3, [dispatch, #VmSymbols_symbols_Address-XXX]
	ldr	r3, [r3, #VMSYMBOLS_ClassCastException * 4]
	bl	_ZN10Exceptions10_throw_msgEP6ThreadPKciP13symbolOopDescS3_
	add	r0, istate, #ISTATE_THREAD
	bl	ThreadInVMfromJavaD
	mov	r0, tmp_chunk
	ldr	r3, [r0, #0]
	CACHE_JPC
	cmp	r3, #0
	beq	1f
	bl	_ZN5Chunk9next_chopEv
1:
	str	tmp_hwm, [tmp2, #RESOURCEAREA_HWM]
	str	tmp_max, [tmp2, #RESOURCEAREA_MAX]
	str	tmp_chunk, [tmp2, #RESOURCEAREA_CHUNK]
	b	handle_exception

# r2 = [jpc, #1]
# r1 = [jpc, #2]
	Opcode	instanceof
	ldrb	r1, [jpc, #2]
	ldr	r3, [istate, #ISTATE_METHOD]
	ldr	r0, [stack, #4]
	ldr	r3, [r3, #METHOD_CONSTANTS]
	cmp	r0, #0
	ldr	ip, [r3, #CONSTANTPOOL_TAGS]
	beq	.instanceof_not_instance
	add	ip, ip, #BASE_OFFSET_BYTE
	orr	tmp2, r1, r2, lsl #8
	ldrb	r2, [ip, tmp2]
	cmp	r2, #JVM_CONSTANT_UnresolvedClassInError
	cmpne	r2, #JVM_CONSTANT_UnresolvedClass
	beq	2f

1:
	ldr	r0, [r0, #4]
	add	r3, r3, tmp2, lsl #2
	ldr	tmp1, [r3, #CONSTANTPOOL_BASE]
	cmp	tmp1, r0
	beq	.instanceof_is_instance

	ldr	r2, [tmp1, #16]
	add	tmp2, r0, #8
	add	ip, tmp2, r2
	ldr	ip, [ip, #-8]
	cmp	ip, tmp1
	beq	.instanceof_is_instance

	mov	r0, #0
	cmp	r2, #secondary_super_cache_offset_in_bytes
	bne	.instanceof_not_instance

	mov	r0, tmp2
	mov	r1, tmp1

	bl	_ZNK5Klass23search_secondary_supersEP12klassOopDesc
	cmp	r0, #0
	beq	.instanceof_not_instance

.instanceof_is_instance:
	mov	r0, #1
	str	r0, [stack, #4]
	DISPATCH	3
.instanceof_not_instance:
	mov	r0, #0
	str	r0, [stack, #4]
	DISPATCH	3

2:
	ldr	r0, [istate, #ISTATE_THREAD]
	DECACHE_JPC
	DECACHE_STACK
	bl	_ZN18InterpreterRuntime13quicken_io_ccEP10JavaThread
	ASSERT_STACK_CACHED
	ASSERT_LOCALS_CACHED
	ldr	r0, [istate, #ISTATE_THREAD]
	CACHE_JPC
	ldr	r3, [r0, #THREAD_PENDING_EXC]
	CACHE_CP
	cmp	r3, #0
	bne	handle_exception

	ldr	r3, [istate, #ISTATE_METHOD]
	ldr	r0, [stack, #4]
	ldr	r3, [r3, #METHOD_CONSTANTS]		@ METHOD->constanst() might have moved
	b	1b

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
	bl	cmpxchg_ptr
	cmp	r0, tmp1
	beq	.monitorenter_exit
	ldr	r0, [istate, #ISTATE_THREAD]
	bic	r1, tmp1, #3
	bl	JavaThread_is_lock_owned
	cmp	r0, #0
	movne	lr, #0
	strne	lr, [sl, #0]
	bne	.monitorenter_exit
	mov	r1, sl
	DECACHE_JPC
	DECACHE_STACK
	ldr	r0, [istate, #ISTATE_THREAD]
	bl	_ZN18InterpreterRuntime12monitorenterEP10JavaThreadP15BasicObjectLock
	ASSERT_STACK_CACHED
	ASSERT_LOCALS_CACHED
	ldr	r0, [istate, #ISTATE_THREAD]
	CACHE_JPC
	ldr	r3, [r0, #THREAD_PENDING_EXC]
	cmp	r3, #0
	beq	.monitorenter_exit
	b	handle_exception
.monitorenter_4:
	b	null_ptr_exception
.monitorenter_5:
	mov	lr, #0
	DECACHE_JPC
	DECACHE_STACK
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
	CACHE_STACK
	ldr	sl, [istate, #ISTATE_STACK_BASE]
	ldr	r3, [stack, #4]
	CACHE_JPC
	ASSERT_LOCALS_CACHED
	mov	r1, r3
	str	r3, [sl, #4]
	ldr	r2, [r3, #0]
	mov	r0, sl
	orr	tmp1, r2, #1
	mov	r2, tmp1
	str	tmp1, [sl, #0]
	bl	cmpxchg_ptr
	cmp	r0, tmp1
	beq	.monitorenter_exit
	ldr	r0, [istate, #ISTATE_THREAD]
	bic	r1, tmp1, #3
	bl	JavaThread_is_lock_owned
	cmp	r0, #0
	movne	ip, #0
	strne	ip, [sl, #0]
	bne	.monitorenter_exit
	mov	r1, sl
	ldr	r0, [istate, #ISTATE_THREAD]
	DECACHE_JPC
	DECACHE_STACK
	bl	_ZN18InterpreterRuntime12monitorenterEP10JavaThreadP15BasicObjectLock
	ASSERT_STACK_CACHED
	ASSERT_LOCALS_CACHED
	ldr	r0, [istate, #ISTATE_THREAD]
	CACHE_JPC
	ldr	r3, [r0, #THREAD_PENDING_EXC]
	cmp	r3, #0
	beq	.monitorenter_exit
	b	handle_exception
.monitorenter_exit:
	CACHE_CP
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
	bl	cmpxchg_ptr
	cmp	tmp1, r0
	beq	.monitorexit_exit
	str	sl, [tmp1, #4]
	mov	r1, tmp1
	DECACHE_JPC
	DECACHE_STACK
	ldr	r0, [istate, #ISTATE_THREAD]
	bl	_ZN18InterpreterRuntime11monitorexitEP10JavaThreadP15BasicObjectLock
	ldr	r0, [istate, #ISTATE_THREAD]
	ASSERT_STACK_CACHED
	ASSERT_LOCALS_CACHED
	ldr	r3, [r0, #THREAD_PENDING_EXC]
	CACHE_JPC
	cmp	r3, #0
	beq	.monitorexit_exit
	b	handle_exception
.monitorexit_3:
	b	null_ptr_exception
.monitorexit_4:
	ldr	r0, [istate, #ISTATE_THREAD]
	DECACHE_JPC
	DECACHE_STACK
	bl	_ZN18InterpreterRuntime37throw_illegal_monitor_state_exceptionEP10JavaThread
	b	handle_exception_with_bcp
.monitorexit_exit:
	add	stack, stack, #4
	CACHE_CP
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
	ldr	tmp1, [stack, #12]	@ arrObj
	ldr	tmp_vvv, [stack, #8]
	SW_NPC	cmp	tmp1, #0
	ldr	sl, [stack, #4]
	SW_NPC	beq	null_ptr_exception
.abortentry115:
	ldr	r3, [tmp1, #8]
	cmp	tmp_vvv, r3
	bcs	array_bounds_exception
	cmp	sl, #0
	beq	.aastore_exit
	ldr	r3, [tmp1, #4]		@ arrObj->klass()
	ldr	r0, [sl, #4]
	ldr	r1, [r3, #KLASS_PART+OBJARRAYKLASS_ELEMENTKLASS]
	cmp	r0, r1
	beq	.aastore_exit
	add	r0, r0, #8
	bl	is_subtype_of
	cmp	r0, #0
	moveq	r0, #VMSYMBOLS_ArrayStoreException
	beq	raise_exception
.aastore_exit:
    ldr r2, [dispatch, #Universe_collectedHeap_Address-XXX]
	add	r1, tmp1, #BASE_OFFSET_WORD
	str	sl, [r1, tmp_vvv, asl #2]!
    ldr	r3, [r2]
	mov	lr, #0
    ldr	r3, [r3, #12]
	add	stack, stack, #12
    ldr	r3, [r3, #76]
	strb	lr, [r3, r1, lsr #9]
	CACHE_CP
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
case_wide_astore:
	POP	r2
	str	r2, [locals, -r1, lsl #2]
	DISPATCH	4
case_wide_dload:
case_wide_lload:
	sub	r1, locals, r1, lsl #2
	ldmda	r1, {r1, r2}
	PUSH	r1, r2
	DISPATCH	4
case_wide_dstore:
case_wide_lstore:
	POP	r2, r3
	sub	r1, locals, r1, lsl #2
	stmda	r1, {r2, r3}
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
	DECACHE_JPC
	DECACHE_STACK
	bl	_ZN18InterpreterRuntime14multianewarrayEP10JavaThreadPi
	ASSERT_STACK_CACHED
	ASSERT_LOCALS_CACHED
	ldr	r0, [istate, #ISTATE_THREAD]
	CACHE_JPC
	ldr	r1, [r0, #THREAD_PENDING_EXC]
	CACHE_CP
	cmp	r1, #0
	ldr	r3, [r0, #THREAD_VM_RESULT]
	bne	handle_exception
	str	r3, [stack, tmp1, asl #2]!
	str	r1, [r0, #THREAD_VM_RESULT]
	sub	stack, stack, #4
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
	add	r0, istate, #ISTATE_THREAD
	bl	HandleMarkCleanerD
	ldr	r0, [istate, #ISTATE_THREAD]
	DECACHE_JPC
	DECACHE_STACK
	bl	_ZN20SafepointSynchronize5blockEP10JavaThread
	ASSERT_STACK_CACHED
	ASSERT_LOCALS_CACHED
	ldr	r0, [istate, #ISTATE_THREAD]
	CACHE_JPC
	ldr	r3, [r0, #THREAD_PENDING_EXC]
	CACHE_CP
	cmp	r3, #0
	bne	handle_exception
1:
	DISPATCH	0

	Opcode	breakpoint
	mov	r2, jpc
	DECACHE_STACK
	DECACHE_JPC
	ldr	r0, [istate, #ISTATE_THREAD]
	ldr	r1, [istate, #ISTATE_METHOD]
	bl	_ZN18InterpreterRuntime24get_original_bytecode_atEP10JavaThreadP13methodOopDescPh
	mov	tmp1, r0
	ldr	r0, [istate, #ISTATE_THREAD]
	ldr	r3, [r0, #THREAD_PENDING_EXC]
	cmp	r3, #0
	bne	handle_exception
	ldr	r2, [istate, #ISTATE_BCP]
	ldr	r1, [istate, #ISTATE_METHOD]
	bl	_ZN18InterpreterRuntime11_breakpointEP10JavaThreadP13methodOopDescPh
	ASSERT_STACK_CACHED
	ASSERT_LOCALS_CACHED
	ldr	r0, [istate, #ISTATE_THREAD]
	CACHE_JPC
	ldr	r3, [r0, #THREAD_PENDING_EXC]
	CACHE_CP
	cmp	r3, #0
	and	r0, tmp1, #255
	bne	handle_exception
	DISPATCH_BYTECODE

#ifndef FAST_BYTECODES
	Opcode	bgetfield
	Opcode	cgetfield
	Opcode	igetfield
	Opcode	lgetfield
	Opcode	sgetfield
	Opcode	aputfield
	Opcode	bputfield
	Opcode	cputfield
	Opcode	iputfield
	Opcode	lputfield
	Opcode	invokevfinal
	Opcode	invokeresolved
	Opcode	invokespecialresolved
	Opcode	invokestaticresolved
	Opcode	iaccess_0
	Opcode	iload_0_iconst_N
	Opcode	iload_iconst_N
	Opcode	iadd_istore_N
	Opcode	isub_istore_N
	Opcode	iand_istore_N
	Opcode	ior_istore_N
	Opcode	ixor_istore_N
	Opcode	iadd_u4store
	Opcode	isub_u4store
	Opcode	iand_u4store
	Opcode	ior_u4store
	Opcode	ixor_u4store
	Opcode	fast_iload_iload
	Opcode	fast_iload_iload_N
	Opcode	fast_iload_N_iload
	Opcode	fast_iload_N_iload_N
#endif
	Opcode	undefined
	ldr	r2, [dispatch, #Bytecodes_name_Address-XXX]
	ldrb	r3, [jpc, #0]	@ zero_extendqisi2
	adrl	r0, bytecode_interpreter_str
	cmp	r3, #last_implemented_bytecode+1
	adrcs	ip, unknown_bytecode
	ldrcc	ip, [r2, r3, asl #2]
	adr	r2, unimplemented_opcode_msg
	mov	r1, #99
	str	ip, [arm_sp, #0]
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
	ldr	r2, [r3, #KLASS_PART+KLASS_ACCESSFLAGS]
	tst	r2, #JVM_ACC_HAS_FINALIZER
	beq	handle_return
	DECACHE_JPC
	DECACHE_STACK
	ldr	r0, [istate, #ISTATE_THREAD]
	bl	_ZN18InterpreterRuntime18register_finalizerEP10JavaThreadP7oopDesc
	ASSERT_STACK_CACHED
	ldr	r0, [istate, #ISTATE_THREAD]
	CACHE_JPC
	ldr	r3, [r0, #THREAD_PENDING_EXC]
@ CACHE_LOCALS & CACHE_CP not require for handle_retuen / handle_exception
	cmp	r3, #0
	beq	handle_return
	b	handle_exception

@ ECN: normal_entry_synchronized doesn't really mean synchronized. It means
@ may or may not be synchronized. So we still have to check the synchronized
@ flag in the synchronized path, otherwise we may get an IllegalMonitor.
normal_entry_synchronized:
	stmfd	arm_sp!, {regset, lr}
	mov	sl, r0
	mov	tmp1, r2

	ldr	r0, [tmp1, #THREAD_STACK_SIZE]
	ldr	r3, [tmp1, #THREAD_STACK_BASE]
	rsb	r3, r0, r3
	rsb	r3, r3, arm_sp
	cmp	r3, #32768
	blt	stack_overflow_no_frame

	ldrh	r2, [sl, #METHOD_MAXLOCALS]
	ldrh	r3, [sl, #METHOD_SIZEOFPARAMETERS]
	rsb	r8, r3, r2

	ldr	r1, [tmp1, #THREAD_JAVA_SP]
	ldrh	r0, [sl, #METHOD_MAXSTACK]
	ldr	r3, [tmp1, #THREAD_JAVA_STACK_BASE]

	sub	r5, r1, r8, lsl #2
	sub	r5, r5, #FRAME_SIZE+4
	sub	r5, r5, r0, lsl #2
	cmp	r3, r5
	bcs	stack_overflow_no_frame

	cmp	r8, #0
	ble	.normal_entry_synchronized_no_locals

	mov	r2, #0
.zero_locals_synchronized:
	subs	r8, r8, #1
	str	r2, [r1, #-4]!
	bgt	.zero_locals_synchronized
	str	r1, [tmp1, #THREAD_JAVA_SP]

.normal_entry_synchronized_no_locals:
	mov	r2, tmp1
	mov	r1, sl
	add	r0, tmp1, #THREAD_JAVA_STACK_BASE
	bl	build_frame
	mov	tmp_vvv, r0
	ldr	r3, [tmp1, #THREAD_TOP_ZERO_FRAME]
	sub	r0, r0, #72
	mov	istate, r0
	str	r3, [tmp_vvv, #0]
	adrl	ip, dispatch_init_adcon
	ldm	ip, {r0, r1}
	add	r0, r0, ip
	str	tmp_vvv, [tmp1, #THREAD_TOP_ZERO_FRAME]
	CACHE_JPC
	str	tmp_vvv, [tmp1, #THREAD_LAST_JAVA_SP]
	add	dispatch, r1, r0
	ldr	r0, [istate, #ISTATE_METHOD]
	CACHE_STACK
  USEC	ldr	r2, [r0, #METHOD_INVOCATIONCOUNTER]
  USEC	ldr	lr, [dispatch, #InterpreterInvocationLimit_Address-XXX]
  USEC	add	r2, r2, #INVOCATIONCOUNTER_COUNTINCREMENT
  USEC	ldr	lr, [lr]
  USEC	str	r2, [r0, #METHOD_INVOCATIONCOUNTER]
  USEC	cmp	r2, lr
	ldr	r3, [r0, #METHOD_ACCESSFLAGS]
  USEC	bcs	sync_method_entry_freq_count_overflow
	CACHE_LOCALS
	tst	r3, #JVM_ACC_SYNCHRONIZED
	CACHE_CP
	bne	normal_do_synchronization
	DISPATCH	0

#ifdef USE_COMPILER
sync_method_entry_freq_count_overflow:
        ldr     r3, [r0, #METHOD_CONSTMETHOD]
        ldrh    r3, [r3, #CONSTMETHOD_CODESIZE]
	mov	r1, #0
	mov	r0, tmp1
        cmp     r3, #MAX_FG_METHOD_SIZE
        bcc     1f
        ldr     tmp2, [dispatch, #BackgroundCompilation_Address-XXX]
        mov     r3, #1
        ldr     r5, [tmp2]
        str     r3, [tmp2]
        bl      _ZN18InterpreterRuntime26frequency_counter_overflowEP10JavaThreadPh
        str     r5, [tmp2]
        b       2f
1:
	bl	_ZN18InterpreterRuntime26frequency_counter_overflowEP10JavaThreadPh
2:
	ldr	r0, [istate, #ISTATE_METHOD]
	CACHE_JPC
	ldr	r3, [r0, #METHOD_ACCESSFLAGS]
	CACHE_LOCALS
	tst	r3, #JVM_ACC_SYNCHRONIZED
	CACHE_CP
	bne	normal_do_synchronization
	DISPATCH	0
#endif

do_execute_java_bytecodes_restore_locals_and_jpc:
	CACHE_JPC
do_execute_java_bytecodes_restore_locals:
	CACHE_LOCALS
	CACHE_CP
	DISPATCH	0

normal_do_synchronization:
	tst	r3, #JVM_ACC_STATIC
	ldrne	r3, [r0, #METHOD_CONSTANTS]
	ldreq	sl, [locals, #0]
	ldrne	r2, [r3, #16]
	ldr	tmp1, [istate, #ISTATE_MONITOR_BASE]
	ldrne	sl, [r2, #60]
	ldr	r3, [sl, #0]
	orr	tmp_xxx, r3, #1
	str	tmp_xxx, [tmp1, #-8]!
.normal_do_synchronisation_2:
	ldr	tmp_vvv, [sl, #0]
	cmp	tmp_xxx, tmp_vvv
	bne	.normal_do_synchronisation_3
	mov	r0, tmp_xxx
	mov	r1, tmp1
	mov	r2, sl
	mov	r3, #0xffffffc0
	bic	r3, r3, #0xf000
	blx	r3
	cmp	r0, #0
	bne	.normal_do_synchronisation_2
.normal_do_synchronisation_3:
	cmp	tmp_xxx, tmp_vvv
	beq	do_execute_java_bytecodes_restore_locals
	ldr	r0, [istate, #ISTATE_THREAD]
	bic	r1, tmp_xxx, #3
	bl	JavaThread_is_lock_owned
	cmp	r0, #0
	beq	.normal_do_synchronisation_4
	mov	r3, #0
	str	r3, [tmp1]
	b	do_execute_java_bytecodes_restore_locals
.normal_do_synchronisation_4:
	mov	r1, tmp1
	DECACHE_STACK
	ldr	r0, [istate, #ISTATE_THREAD]
	bl	_ZN18InterpreterRuntime12monitorenterEP10JavaThreadP15BasicObjectLock
	ldr	r0, [istate, #ISTATE_THREAD]
	ASSERT_STACK_CACHED
	ldr	r3, [r0, #THREAD_PENDING_EXC]
	cmp	r3, #0
	mov	r2, r0
	beq	do_execute_java_bytecodes_restore_locals_and_jpc
	b	handle_exception_do_not_unlock

# r2 = [jpc, #1]
# r1 = [jpc, #2]
	Opcode	invokeinterface
	ldrb	r1, [jpc, #2]
	DECACHE_STACK
        add     r0, constpool, r1, lsl #12
	add	r0, r0, r2, asl #4
	DECACHE_JPC
        ldr     r2, [r0, #CP_OFFSET]
        and     r2, r2, #0x00ff0000
        cmp     r2, #opc_invokeinterface << 16
        blne    resolve_invokeinterface

	ldr	r3, [r0, #CP_OFFSET+12]
	and	r2, r3, #255
	ldr	r2, [stack, r2, lsl #2]
	SW_NPC	cmp	r2, #0
	SW_NPC	beq	null_ptr_exception
.abortentry110:
	ldr	tmp2, [r2, #4]				@ rcvr->klass()
	tst	r3, #flag_methodInterface
	bne	.invokeinterface_methodInterface

	ldr	lr, [r0, #CP_OFFSET+4]			@ lr = iclass

	add	r1, tmp2, #INSTANCEKLASS_VTABLE_OFFSET
	ldr	r2, [tmp2, #KLASS_PART+INSTANCEKLASS_VTABLE_LEN]
	ldr	ip, [tmp2, #KLASS_PART+INSTANCEKLASS_ITABLE_LEN]
	add	r2, r2, #1
	bic	r2, r2, #1

	add	r1, r1, r2, lsl #2

	mov	r2, #0
1:
	cmp	r2, ip
	beq	incompatibleclass_exception
	ldr	r3, [r1], #8
	add	r2, r2, #1
	cmp	lr, r3
	bne	1b

	ldr	r3, [r0, #CP_OFFSET+8]
	ldr	r2, [r1, #-4]
	add	r3, tmp2, r3, lsl #2
	ldr	tmp2, [r3, r2]
	SW_NPC	cmp	tmp2, #0
	SW_NPC	beq	abstractmethod_exception
.invokeinterface_invoke:
	ldr	tmp1, [istate, #ISTATE_THREAD]
@	str	tmp2, [istate, #ISTATE_CALLEE]
.abortentry116:
	ldr	ip, [tmp2, #METHOD_FROM_INTERPRETED]
	mov	r1, #0
	str	ip, [istate, #36]
	str	r1, [tmp1, #THREAD_LAST_JAVA_SP]

	add	stack, stack, #4
	str	stack, [tmp1, #THREAD_JAVA_SP]

	ldr	r3, [ip]

	mov	tmp_invoke_len, #5

#ifdef FASTPATH_ENTRY
	adr	r0, normal_entry
	cmp	r3, r0
	beq	fast_normal_entry_with_len
#endif

	mov	r0, tmp2
	mov	r1, ip
	mov	r2, tmp1
	blx	r3

	ASSERT_LOCALS_CACHED

	ldr	ip, [istate, #ISTATE_THREAD]
	CACHE_JPC
	ldr	stack, [ip, #THREAD_JAVA_SP]
	ldr	r2, [istate, #ISTATE_STACK_LIMIT]
	sub	stack, stack, #4

	ldr	r1, [ip, #THREAD_TOP_ZERO_FRAME]
	add	r2, r2, #4
	str	r2, [ip, #THREAD_JAVA_SP]
	str	r1, [ip, #THREAD_LAST_JAVA_SP]
	DISPATCH_START	5
	ldr	r3, [ip, #4]
	DISPATCH_NEXT
	DISPATCH_NEXT
	cmp	r3, #0
	DISPATCH_NEXT
	bne	invokeinterface_exception_fix
	DISPATCH_NEXT
	CACHE_CP
	DISPATCH_FINISH

.invokeinterface_methodInterface:
	tst	r3, #flag_vfinalMethod
	ldrne	tmp2, [r0, #CP_OFFSET+8]
	bne	.invokeinterface_invoke
	ldr	r1, [r0, #CP_OFFSET+8]
	add	r3, tmp2, r1, lsl #2
	ldr	tmp2, [r3, #INSTANCEKLASS_VTABLE_OFFSET]
	b	.invokeinterface_invoke

#ifdef FAST_BYTECODES
# r2 = [jpc, #1]
# r1 = [jpc, #2]
	Opcode	invokevfinal
	ldrb	r1, [jpc, #2]
	DECACHE_STACK
	add	r0, constpool, r1, lsl #12
	DECACHE_JPC
	add	r0, r2, asl #4
	ldr	r3, [r0, #CP_OFFSET+12]
	ldr	tmp1, [istate, #ISTATE_THREAD]
	and	r1, r3, #255
	ldr	r2, [stack, r1, asl #2]
	mov	r1, #0
	SW_NPC	cmp	r2, #0
	SW_NPC	beq	null_ptr_exception
.abortentry117:
	HW_NPC	ldr	r3, [r2]		@ Only to provoke abort

	ldr	tmp2, [r0, #CP_OFFSET+8]

@	str	tmp2, [istate, #ISTATE_CALLEE]
	ldr	ip, [tmp2, #METHOD_FROM_INTERPRETED]
	str	r1, [tmp1, #THREAD_LAST_JAVA_SP]
	str	ip, [istate, #36]

	add	stack, stack, #4
	str	stack, [tmp1, #THREAD_JAVA_SP]

	ldr	r3, [ip, #0]
#ifdef FASTPATH_ENTRY
	adr	r0, normal_entry
	cmp	r3, r0
	beq	fast_normal_entry
#ifdef NATIVE_ENTRY
	adrl	r0, native_entry
	cmp	r3, r0
	beq	fast_native_entry
#endif
	adr	r0, accessor_entry
	cmp	r3, r0
	beq	fast_accessor_entry
#endif
	b	normal_dispatch_and_return
#endif // FAST_BYTECODES

# r2 = [jpc, #1]
# r1 = [jpc, #2]
        Opcode  invokevirtual
	ldrb	r1, [jpc, #2]
        add     r0, constpool, r1, lsl #12
	add	r0, r0, r2, asl #4
        ldr     r2, [r0, #CP_OFFSET]
        and     r2, r2, #0xff000000
        cmp     r2, #opc_invokevirtual << 24
        blne    resolve_invokevirtual
        ldr     r3, [r0, #CP_OFFSET+12]
#ifdef FAST_BYTECODES
        mov     r0, #opc_invokeresolved
        tst     r3, #flag_vfinalMethod
        movne   r0, #opc_invokevfinal
        b       rewrite_bytecode
#else
        DECACHE_STACK
	DECACHE_JPC
        ldr     tmp1, [istate, #ISTATE_THREAD]
        and     r1, r3, #255
        ldr     r2, [stack, r1, asl #2]
        mov     r1, #0
        cmp     r2, #0
        beq     null_ptr_exception

        ldr     tmp2, [r0, #CP_OFFSET+8]
        tst     r3, #flag_vfinalMethod
        bne     1f

        ldr     r3, [r2, #4]
        add     r3, r3, tmp2, lsl #2
        ldr     tmp2, [r3, #INSTANCEKLASS_VTABLE_OFFSET]
1:
#endif // FAST_BYTECODES

#ifdef FAST_BYTECODES
# r2 = [jpc, #1]
# r1 = [jpc, #2]
        Opcode  invokeresolved
	ldrb	r1, [jpc, #2]
        DECACHE_STACK
        add     r0, constpool, r1, lsl #12
	DECACHE_JPC
        add     r0, r0, r2, asl #4
        ldr     r3, [r0, #CP_OFFSET+12]
        ldr     tmp1, [istate, #ISTATE_THREAD]
        and     r1, r3, #255
        ldr     r2, [stack, r1, asl #2]
        mov     r1, #0
        SW_NPC	cmp     r2, #0
        SW_NPC	beq     null_ptr_exception_jpc_0

        ldr     tmp2, [r0, #CP_OFFSET+8]
.abortentry104:
        ldr     r3, [r2, #4]
        add     r3, r3, tmp2, lsl #2
        ldr     tmp2, [r3, #INSTANCEKLASS_VTABLE_OFFSET]
#endif // FAST_BYTECODES

@        str     tmp2, [istate, #ISTATE_CALLEE]
        ldr     ip, [tmp2, #METHOD_FROM_INTERPRETED]
        str     r1, [tmp1, #THREAD_LAST_JAVA_SP]
        str     ip, [istate, #36]

        add     stack, stack, #4
        str     stack, [tmp1, #THREAD_JAVA_SP]

        ldr     r3, [ip, #0]
#ifdef FASTPATH_ENTRY
        adr     r0, normal_entry
        cmp     r3, r0
        beq     fast_normal_entry
#ifdef NATIVE_ENTRY
        adr     r0, native_entry
        cmp     r3, r0
        beq     fast_native_entry
#endif
        adr     r0, accessor_entry
        cmp     r3, r0
        beq     fast_accessor_entry
#endif

normal_dispatch_and_return:
	mov	r0, tmp2
	mov	r1, ip
	mov	r2, tmp1
	ldr	r2, [istate, #ISTATE_THREAD]
	blx	r3

	ASSERT_LOCALS_CACHED

	ldr	ip, [istate, #ISTATE_THREAD]
	CACHE_JPC
	ldr	stack, [ip, #THREAD_JAVA_SP]
	ldr	r2, [istate, #ISTATE_STACK_LIMIT]
	sub	stack, stack, #4

	ldr	r1, [ip, #THREAD_TOP_ZERO_FRAME]
	add	r2, r2, #4
	str	r2, [ip, #THREAD_JAVA_SP]
	str	r1, [ip, #THREAD_LAST_JAVA_SP]
	DISPATCH_START	3
	ldr	r3, [ip, #4]
	DISPATCH_NEXT
	DISPATCH_NEXT
	cmp	r3, #0
	DISPATCH_NEXT
	bne	invoke_exception_fix
	DISPATCH_NEXT
	CACHE_CP
	DISPATCH_FINISH

	Opcode	invokestatic
	ldrb	r1, [jpc, #2]
        add     r0, constpool, r1, lsl #12
	add	r0, r0, r2, asl #4
        ldr     r2, [r0, #CP_OFFSET]
	and	r2, r2, #0x00ff0000
	cmp	r2, #opc_invokestatic << 16
	blne	resolve_invokestatic
  FBC	mov	r0, #opc_invokestaticresolved
  FBC	b	rewrite_bytecode

  FBC	Opcode	invokestaticresolved
  FBC	ldrb	r1, [jpc, #2]
        DECACHE_STACK
  FBC   add     r0, constpool, r1, lsl #12
	DECACHE_JPC
  FBC	add	r0, r2, asl #4

	ldr	tmp2, [r0, #CP_OFFSET+4]
	mov	r1, #0
@	str	tmp2, [istate, #ISTATE_CALLEE]
	ldr	r3, [tmp2, #METHOD_FROM_INTERPRETED]
	ldr	tmp1, [istate, #ISTATE_THREAD]
	str	r3, [istate, #36]
	str	r1, [tmp1, #THREAD_LAST_JAVA_SP]

	add	stack, stack, #4
	str	stack, [tmp1, #THREAD_JAVA_SP]

	ldr	ip, [istate, #36]
	ldr	r3, [ip, #0]
#ifdef FASTPATH_ENTRY
	adr	r0, normal_entry
	cmp	r3, r0
	beq	fast_normal_entry
#ifdef NATIVE_ENTRY
	adr	r0, native_entry
	cmp	r3, r0
	beq	fast_native_entry
#endif
	adr	r0, accessor_entry
	cmp	r3, r0
	beq	fast_accessor_entry
#endif
	b	normal_dispatch_and_return

	ALIGN_CODE
normal_entry:
	adrl	ip, dispatch_init_adcon
	stmfd	arm_sp!, {regset, lr}
	mov	tmp2, r0
	ldm	ip, {r0, r1}

	mov	tmp_invoke_len, #0
	mov	tmp1, r2

	add	r0, r0, ip
	add	dispatch, r1, r0

  USEC  ldr     r2, [r10, #METHOD_INVOCATIONCOUNTER]

	ldr	stack, [tmp1, #THREAD_JAVA_SP]

	ldr	r0, [tmp1, #THREAD_STACK_SIZE]
  USEC  add     r2, r2, #INVOCATIONCOUNTER_COUNTINCREMENT * 4
	ldr	r3, [tmp1, #THREAD_STACK_BASE]
	rsb	r3, r0, r3
	rsb	r3, r3, arm_sp
  USEC  str     r2, [tmp2, #METHOD_INVOCATIONCOUNTER]
	cmp	r3, #32768
	bge	fast_normal_entry_with_len

	b	stack_overflow_before_frame

	Opcode	invokespecial
     	ldrb	r1, [jpc, #2]
        add     r0, constpool, r1, lsl #12
	add	r0, r0, r2, asl #4
        ldr     r2, [r0, #CP_OFFSET]
        and     r2, r2, #0x00ff0000
        cmp     r2, #opc_invokespecial << 16
        blne     resolve_invokespecial
  FBC	mov	r0, #opc_invokespecialresolved
  FBC	b	rewrite_bytecode

  FBC	Opcode	invokespecialresolved
  FBC	ldrb	r1, [jpc, #2]
        DECACHE_STACK
  FBC   add     r0, constpool, r1, lsl #12
	DECACHE_JPC
  FBC	add	r0, r2, asl #4

	ldr	r3, [r0, #CP_OFFSET+12]
	ldr	tmp1, [istate, #ISTATE_THREAD]
	and	r3, r3, #255
	ldr	r2, [stack, r3, asl #2]
	mov	r1, #0
	SW_NPC	cmp	r2, #0
	SW_NPC	beq	null_ptr_exception
.abortentry118:
	HW_NPC	ldr	r3, [r2]		@ Only to provoke abort

	ldr	tmp2, [r0, #CP_OFFSET+4]

@	str	tmp2, [istate, #ISTATE_CALLEE]
	ldr	ip, [tmp2, #METHOD_FROM_INTERPRETED]
	str	r1, [tmp1, #THREAD_LAST_JAVA_SP]
	str	ip, [istate, #36]

	add	stack, stack, #4
	str	stack, [tmp1, #THREAD_JAVA_SP]

	ldr	r3, [ip, #0]
#ifdef FASTPATH_ENTRY
	adr	r0, normal_entry
	cmp	r3, r0
	beq	fast_normal_entry
#ifdef NATIVE_ENTRY
	adr	r0, native_entry
	cmp	r3, r0
	beq	fast_native_entry
#endif
	adr	r0, accessor_entry
	cmp	r3, r0
	beq	fast_accessor_entry
#endif
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
	cmp	r3, #opc_getfield << 16
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

#ifdef NATIVE_ENTRY
	ALIGN_CODE
native_entry:
	adrl	ip, dispatch_init_adcon
	stmfd	arm_sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}

	ldm	ip, {dispatch, r7}
	mov	r11, r0
	add	dispatch, dispatch, ip
	add	dispatch, dispatch, r7

	mov	istate, #0

	b	fast_native_entry_with_args
#endif

@ tmp1 = thread
@ tmp2 == method
@ stack == THREAD_JAVA_SP (=> FULL stack)
	ALIGN_CODE
fast_normal_entry:
	mov	tmp_invoke_len, #3
fast_normal_entry_with_len:
	ldrh	r0, [tmp2, #METHOD_MAXLOCALS]
	mov	r1, #0
	ldrh	r3, [tmp2, #METHOD_SIZEOFPARAMETERS]
        mov     ip, #INTERPRETER_FRAME
	ldrh	r2, [tmp2, #METHOD_MAXSTACK]
        sub     r7, r0, r3

	ldr	r3, [tmp1, #THREAD_JAVA_STACK_BASE]
	sub	r5, stack, r7, lsl #2
	sub	r5, r5, #FRAME_SIZE+4
	sub	r5, r5, r2, lsl #2
	cmp	r3, r5
	bcs	stack_overflow_before_frame

        subs    r5, r7, #2
        tst     r7, #1
        strne   r1, [stack, #-4]!
        bcc     3f
1:
        str     r1, [stack, #-4]
        str     r1, [stack, #-8]!
        subs    r5, r5, #2
        bcs     1b
3:
	ldr	r3, [tmp1, #THREAD_TOP_ZERO_FRAME]
        sub     istate, stack, #FRAME_SIZE
        sub     r2, istate, r2, lsl #2
        str     tmp_invoke_len, [istate, #ISTATE_ADVANCE_PC]
	str	r2, [tmp1, #THREAD_JAVA_SP]
        sub     r5, r2, #4                      @ stack limit = istate - stackwords - 4
	str	r3, [istate, #ISTATE_NEXT_FRAME]
	str	ip, [istate, #ISTATE_FRAME_TYPE]
@	str	istate, [istate, #ISTATE_SELF_LINK]
	str	istate, [istate, #ISTATE_MONITOR_BASE]
	str	r5, [istate, #ISTATE_STACK_LIMIT]
	str	istate, [istate, #ISTATE_STACK_BASE]
        sub     locals, stack, #4
	str	r1, [istate, #ISTATE_OOP_TEMP]
        add     locals, locals, r0, lsl #2
        sub     stack, istate, #4
        ldr     jpc, [tmp2, #METHOD_CONSTMETHOD]
        ldr     constpool, [tmp2, #METHOD_CONSTANTS]
        add     ip, istate, #ISTATE_NEXT_FRAME
	DISPATCH_START	48
        ldr     constpool, [constpool, #CONSTANTPOOL_CACHE]
        str     ip, [tmp1, #THREAD_TOP_ZERO_FRAME]
  USEC	ldr	r3, [r10, #METHOD_INVOCATIONCOUNTER]
        str     ip, [tmp1, #THREAD_LAST_JAVA_SP]
	DISPATCH_NEXT
  USEC	ldr	lr, [dispatch, #InterpreterInvocationLimit_Address-XXX]
  USEC	add	r3, r3, #INVOCATIONCOUNTER_COUNTINCREMENT
        str     tmp1, [istate, #ISTATE_THREAD]
  USEC	ldr	lr, [lr]
  USEC	str	r3, [tmp2, #METHOD_INVOCATIONCOUNTER]
	str	locals, [istate, #ISTATE_LOCALS]
  USEC	cmp	r3, lr
	str	constpool, [istate, #ISTATE_CONSTANTS]
  USEC	bcs	method_entry_freq_count_overflow
	DISPATCH_NEXT
	DISPATCH_NEXT
	DISPATCH_NEXT
	str	r10, [istate, #ISTATE_METHOD]
@	mov	lr, #0
@        str     lr, [istate, #ISTATE_PREV_LINK]
@	str	lr, [istate, #ISTATE_CALLEE]
	DISPATCH_FINISH
#ifdef USE_COMPILER
method_entry_freq_count_overflow:
        ldr     r3, [r10, #METHOD_CONSTMETHOD]
	DECACHE_JPC
        ldrh    r3, [r3, #CONSTMETHOD_CODESIZE]
	str	r10, [istate, #ISTATE_METHOD]
	mov	r1, #0
	mov	r0, tmp1
        cmp     r3, #MAX_FG_METHOD_SIZE
        bcc     1f
        ldr     tmp2, [dispatch, #BackgroundCompilation_Address-XXX]
        mov     r3, #1
        ldr     r5, [tmp2]
        str     r3, [tmp2]
        bl      _ZN18InterpreterRuntime26frequency_counter_overflowEP10JavaThreadPh
        str     r5, [tmp2]
        b       2f
1:
	bl	_ZN18InterpreterRuntime26frequency_counter_overflowEP10JavaThreadPh
2:
	CACHE_JPC
	CACHE_CP
	DISPATCH	0
#endif


handle_return:
@	CHECK_CONSTPOOL
@	CHECK_BACKTRACE

	ldr	tmp2, [istate, #ISTATE_MONITOR_BASE]	@ tmp2 = base

	ldr	tmp1, [istate, #ISTATE_STACK_BASE]	@ tmp1 = end
	ldr	tmp_xxx, [istate, #ISTATE_THREAD]

	cmp	tmp1, tmp2
	blcc	return_check_monitors

@	CHECK_CONSTPOOL
@	CHECK_BACKTRACE

	mov	r3, #0
	ldrb	lr, [jpc, #0]

	ldr	r2, [tmp_xxx, #THREAD_TOP_ZERO_FRAME]
	str	r3, [tmp_xxx, #THREAD_LAST_JAVA_SP]
	ldr	r0, [istate, #ISTATE_METHOD]
	ldr	r3, [r2, #0]
	ldrh	r0, [r0, #40]
	add	r1, r2, #4
	str	r3, [tmp_xxx, #THREAD_TOP_ZERO_FRAME]

	ldr	ip, [istate, #ISTATE_ADVANCE_PC]
	ldr	istate, [istate, #ISTATE_NEXT_FRAME]

	add	r1, r1, r0, lsl #2

	cmp	lr, #opc_lreturn
	cmpne	lr, #opc_dreturn
	ldreq	r0, [stack, #8]
	streq	r0, [r1, #-4]!
	cmpne	lr, #opc_ireturn
	cmpne	lr, #opc_freturn
	cmpne	lr, #opc_areturn
	ldreq	r0, [stack, #4]
	streq	r0, [r1, #-4]!

	str	r1, [tmp_xxx, #THREAD_JAVA_SP]

	cmp	ip, #0

	ldmeqfd	arm_sp!, {regset, pc}

        ldr	lr, [istate, #-ISTATE_NEXT_FRAME+ISTATE_THREAD]!
        CACHE_JPC
        ldr     stack, [lr, #THREAD_JAVA_SP]
        ldr     r2, [istate, #ISTATE_STACK_LIMIT]
        sub     stack, stack, #4

        ldr     r1, [lr, #THREAD_TOP_ZERO_FRAME]
        add     r2, r2, #4
        str     r2, [lr, #THREAD_JAVA_SP]
        str     r1, [lr, #THREAD_LAST_JAVA_SP]
        ldr     r3, [lr, #THREAD_PENDING_EXC]
        DISPATCH_START_REG ip
        CACHE_LOCALS
        DISPATCH_NEXT
        DISPATCH_NEXT
        cmp     r3, #0
        DISPATCH_NEXT
        bne     return_exception
	DISPATCH_NEXT
        CACHE_CP
        DISPATCH_FINISH

@ ip = PC ADVANCE
fast_handle_return:
        ldr	lr, [istate, #-ISTATE_NEXT_FRAME+ISTATE_THREAD]!
        CACHE_JPC
        ldr     stack, [lr, #THREAD_JAVA_SP]
        ldr     r2, [istate, #ISTATE_STACK_LIMIT]
        sub     stack, stack, #4

        ldr     r1, [lr, #THREAD_TOP_ZERO_FRAME]
        add     r2, r2, #4
        str     r2, [lr, #THREAD_JAVA_SP]
        str     r1, [lr, #THREAD_LAST_JAVA_SP]
        ldr     r3, [lr, #THREAD_PENDING_EXC]
        DISPATCH_START_REG ip
        CACHE_LOCALS
        DISPATCH_NEXT
        DISPATCH_NEXT
        cmp     r3, #0
        DISPATCH_NEXT
        bne     return_exception
	DISPATCH_NEXT
        CACHE_CP
        DISPATCH_FINISH

normal_return:
        str   stack, [tmp_xxx, #THREAD_JAVA_SP]
        ldmfd arm_sp!, {regset, pc}

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

#define RETURN_STACKSIZE	SIZEOF_HANDLEMARK

.return_unlock:
	tst	r0, #1<<5
	bxeq	lr

	ldr	tmp1, [tmp2, #4]		@ base->obj == NULL
	SW_NPC	cmp	tmp1, #0
	SW_NPC	beq	return_throw_illegal_monitor_state
.abortentry119:
	HW_NPC	ldr	ip, [tmp1]		@ Only to provoke abort

	ldr	r0, [tmp2, #0]			@ r0 = header
	mov	r3, #0
	cmp	r0, #0
	str	r3, [tmp2, #4]			@ base->obj = NULL
	bxeq	lr

	mov	tmp_vvv, lr
	mov	r1, tmp1
	mov	r2, tmp2
	bl	cmpxchg_ptr
	cmp	tmp2, r0
	bxeq	tmp_vvv

	str	tmp1, [tmp2, #4]
	sub	arm_sp, arm_sp, #RETURN_STACKSIZE
	mov	r0, arm_sp
	mov	r1, tmp_xxx
	bl	_ZN10HandleMark10initializeEP6Thread
	mov	r1, tmp2
	mov	r0, tmp_xxx
	DECACHE_JPC
	DECACHE_STACK
	bl	_ZN18InterpreterRuntime11monitorexitEP10JavaThreadP15BasicObjectLock
	ASSERT_STACK_CACHED
	CACHE_JPC
	mov	r0, arm_sp
	bl	_ZN10HandleMarkD1Ev
	add	arm_sp, arm_sp, #RETURN_STACKSIZE
	ldr	r3, [tmp_xxx, #THREAD_PENDING_EXC]
	cmp	r3, #0
	bne	handle_exception
	mov	lr, tmp_vvv
	bx	lr

return_throw_illegal_monitor_state:
	sub	arm_sp, arm_sp, #RETURN_STACKSIZE
	mov	r0, arm_sp
	mov	r1, tmp_xxx
	bl	_ZN10HandleMark10initializeEP6Thread
	DECACHE_JPC
	DECACHE_STACK
	mov	r0, tmp_xxx
	bl	_ZN18InterpreterRuntime37throw_illegal_monitor_state_exceptionEP10JavaThread
	mov	r0, arm_sp
	bl	_ZN10HandleMarkD1Ev
	add	arm_sp, arm_sp, #RETURN_STACKSIZE
	b	handle_exception_with_bcp

@ ----------------------------------------------------------------------------------------
stack_overflow_no_frame:
	mov	tmp_invoke_len, #0
stack_overflow_before_frame:
	mov	r0, tmp1
	ldr	ip, [r0, #THREAD_TOP_ZERO_FRAME]
	str	ip, [r0, #THREAD_LAST_JAVA_SP]
	mov	tmp1, tmp_invoke_len
	bl	_ZN18InterpreterRuntime24throw_StackOverflowErrorEP10JavaThread
	cmp	tmp1, #0
	bne	handle_exception_with_bcp
	ldmfd	arm_sp!, {regset, pc}

handle_exception_do_not_unlock:
	mov	r3, #1
	strb	r3, [r2, #THREAD_DO_NOT_UNLOCK]
	b	handle_exception

abstractmethod_exception:
	mov	r0, #VMSYMBOLS_AbstractMethodError
	b	raise_exception
incompatibleclass_exception:
	mov	r0, #VMSYMBOLS_IncompatibleClassChangeError
raise_exception:
	adr	r1, null_str
raise_exception_with_msg:
	str	r1, [arm_sp]
	ldr	r3, [dispatch, #VmSymbols_symbols_Address-XXX]
	ldr	r3, [r3, r0, lsl #2]
        ldr     r0, [istate, #ISTATE_THREAD]
	DECACHE_JPC
        DECACHE_STACK
        mov     ip, #_thread_in_vm
        str     ip, [r0, #THREAD_STATE]
        mov     r2, #99
        adrl    r1, bytecode_interpreter_str
       	bl      _ZN10Exceptions10_throw_msgEP6ThreadPKciP13symbolOopDescS3_
	add	r0, istate, #ISTATE_THREAD
       	bl      ThreadInVMfromJavaD
        b       handle_exception_with_bcp
null_str:
	.byte	0
	ALIGN_WORD

#define EXCEPTION_HANDLEMARK		0
#define EXCEPTION_THREAD		EXCEPTION_HANDLEMARK + SIZEOF_HANDLEMARK
#define EXCEPTION_EXCEPTION		EXCEPTION_THREAD + 4
#define EXCEPTION_EXCEPTION2		EXCEPTION_EXCEPTION + 4
#define EXCEPTION_MONITORBASE		EXCEPTION_EXCEPTION2 + 4
#define EXCEPTION_TMP1			EXCEPTION_MONITORBASE + 4
#define EXCEPTION_HANDLEMARK2		EXCEPTION_TMP1 + 4
#define EXCEPTION_HANDLE		EXCEPTION_HANDLEMARK2 + SIZEOF_HANDLEMARK
#define EXCEPTION_HANDLE2		EXCEPTION_HANDLE + 4
#define EXCEPTION_HANDLE3		EXCEPTION_HANDLE2 + 4

#define EXCEPTION_STACKSIZE		EXCEPTION_HANDLE3 + 4

#define except_sp	r13

invokeinterface_exception_fix:
	sub	jpc, jpc, #2
invoke_exception_fix:
invokenative_exception:
return_exception:
	sub	jpc, jpc, #3
resolve_exception:
putfield_exception:
getfield_exception:
handle_exception:
@ jpc = Exception PC
@ stack = garbage
@ locals = garbage
@ constpool = garbage
	DECACHE_JPC
handle_exception_with_bcp:
	sub	except_sp, except_sp, #EXCEPTION_STACKSIZE
	ldr	stack, [istate, #ISTATE_STACK_BASE]
	sub	stack, stack, #4
	DECACHE_STACK
	ldr	r0, [istate, #ISTATE_THREAD]
handle_exception_1:
	ldr	sl, [r0, #4]
	str	r0, [except_sp, #EXCEPTION_THREAD]
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
	add	r0, except_sp, #EXCEPTION_HANDLEMARK
	bl	_ZN10HandleMark10initializeEP6Thread
	ldr	r0, [istate, #ISTATE_THREAD]
	bl	_ZN12ThreadShadow23clear_pending_exceptionEv
	ldr	r1, [istate, #ISTATE_STACK_BASE]
	ldr	r0, [istate, #ISTATE_THREAD]
	cmp	tmp_yyy, #0
	sub	stack, r1, #4
	moveq	r1, tmp_yyy
	DECACHE_STACK
	ldrne	r1, [tmp_yyy, #0]
	bl	_ZN18InterpreterRuntime31exception_handler_for_exceptionEP10JavaThreadP7oopDesc
	ASSERT_STACK_CACHED
	mov	sl, r0
	ldr	r0, [istate, #ISTATE_THREAD]
	ldr	r3, [r0, #THREAD_PENDING_EXC]
	cmp	r3, #0
	beq	.handle_exception_5
	add	r0, except_sp, #EXCEPTION_HANDLEMARK
	bl	_ZN10HandleMarkD1Ev
	ldr	r1, [except_sp, #EXCEPTION_THREAD]
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
	add	r0, except_sp, #EXCEPTION_HANDLEMARK
	ldr	r2, [r3, #8]
	add	r2, r2, #48
	add	ip, r2, sl
	str	ip, [istate, #ISTATE_BCP]
	bl	_ZN10HandleMarkD1Ev
	ldr	r1, [except_sp, #EXCEPTION_THREAD]
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
	add	except_sp, except_sp, #EXCEPTION_STACKSIZE
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
	streq	tmp_yyy, [except_sp, #EXCEPTION_EXCEPTION]
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
	str	r3, [except_sp, #EXCEPTION_EXCEPTION]
.handle_exception_11:
	bl	_ZN12ThreadShadow23clear_pending_exceptionEv
	mov	r1, #0
	ldr	r0, [istate, #ISTATE_THREAD]
	str	r1, [except_sp, #EXCEPTION_EXCEPTION2]
	ldrb	r3, [r0, #THREAD_DO_NOT_UNLOCK]	@ zero_extendqisi2
	cmp	r3, r1
	beq	.handle_exception_15
	strb	r1, [r0, #THREAD_DO_NOT_UNLOCK]
	ldr	r0, [istate, #ISTATE_THREAD]
.handle_exception_12:
	ldr	r1, [except_sp, #EXCEPTION_EXCEPTION]
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
	DECACHE_STACK
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
	add	r0, except_sp, #EXCEPTION_HANDLEMARK
	mov	r3, r3, asl #2
	add	r2, r2, r3
	str	r2, [lr, #THREAD_JAVA_SP]
	bl	_ZN10HandleMarkD1Ev
	ldr	r0, [except_sp, #EXCEPTION_THREAD]
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
	add	except_sp, except_sp, #EXCEPTION_STACKSIZE
	ldr	ip, [istate, #ISTATE_ADVANCE_PC]
	ldr	istate, [istate, #ISTATE_NEXT_FRAME]
	cmp	ip, #0
	bne	fast_handle_return
	ldmfd	arm_sp!, {regset, pc}
.handle_exception_15:
	ldr	ip, [istate, #ISTATE_MONITOR_BASE]
	ldr	r2, [istate, #ISTATE_METHOD]
	str	ip, [except_sp, #EXCEPTION_MONITORBASE]
	ldr	tmp_vvv, [istate, #ISTATE_STACK_BASE]
	ldr	r3, [r2, #24]
	mov	r3, r3, lsr #5
	ands	r3, r3, #1
	subne	ip, ip, #8
	strne	ip, [except_sp, #EXCEPTION_MONITORBASE]
	ldr	lr, [except_sp, #EXCEPTION_MONITORBASE]
	str	r3, [except_sp, #EXCEPTION_TMP1]
	cmp	tmp_vvv, lr
	bcs	.handle_exception_21

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
	add	r0, except_sp, #EXCEPTION_HANDLEMARK2
	ldr	r1, [istate, #ISTATE_THREAD]
	bl	_ZN10HandleMark10initializeEP6Thread
	mov	r1, tmp_vvv
	ldr	r0, [istate, #ISTATE_THREAD]
	DECACHE_STACK
	bl	_ZN18InterpreterRuntime11monitorexitEP10JavaThreadP15BasicObjectLock
	ASSERT_STACK_CACHED
	add	r0, except_sp, #EXCEPTION_HANDLEMARK2
	bl	_ZN10HandleMarkD1Ev
.handle_exception_19:
	ldr	r1, [except_sp, #EXCEPTION_EXCEPTION2]
	cmp	r1, #0
	beq	.handle_exception_27
	ldr	r3, [r1, #0]
	cmp	r3, #0
	beq	.handle_exception_27
.handle_exception_20:
	ldr	r3, [except_sp, #EXCEPTION_MONITORBASE]
	add	tmp_vvv, tmp_vvv, #8
	cmp	tmp_vvv, r3
	bcc	.handle_exception_16
.handle_exception_21:
	ldr	ip, [except_sp, #EXCEPTION_TMP1]
	cmp	ip, #0
	beq	.handle_exception_23
	ldr	r0, [except_sp, #EXCEPTION_MONITORBASE]
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
	ldr	r2, [except_sp, #EXCEPTION_MONITORBASE]
	bl	cmpxchg_ptr
	ldr	r1, [except_sp, #EXCEPTION_MONITORBASE]
	cmp	r1, r0
	beq	.handle_exception_22
	ldr	r3, [except_sp, #EXCEPTION_MONITORBASE]
	add	tmp_yyy, except_sp, #EXCEPTION_HANDLEMARK2
	mov	r0, tmp_yyy
	str	sl, [r3, #4]
	ldr	r1, [istate, #ISTATE_THREAD]
	bl	_ZN10HandleMark10initializeEP6Thread
	ldr	r1, [except_sp, #EXCEPTION_MONITORBASE]
	ldr	r0, [istate, #ISTATE_THREAD]
	DECACHE_STACK
	bl	_ZN18InterpreterRuntime11monitorexitEP10JavaThreadP15BasicObjectLock
	mov	r0, tmp_yyy
	ASSERT_STACK_CACHED
	bl	_ZN10HandleMarkD1Ev
	ldr	r0, [istate, #ISTATE_THREAD]
	ldr	r1, [r0, #4]
	cmp	r1, #0
	beq	.handle_exception_24
	add	r0, except_sp, #EXCEPTION_HANDLE2
	bl	HandleC
	ldr	r1, [except_sp, #EXCEPTION_HANDLE2]
	ldr	r0, [istate, #ISTATE_THREAD]
	str	r1, [except_sp, #EXCEPTION_EXCEPTION2]
	bl	_ZN12ThreadShadow23clear_pending_exceptionEv
.handle_exception_22:
	ldr	r0, [istate, #ISTATE_THREAD]
	b	.handle_exception_24
.handle_exception_23:
	ldr	r0, [istate, #ISTATE_THREAD]
.handle_exception_24:
	ldr	r3, [except_sp, #EXCEPTION_EXCEPTION2]
	cmp	r3, #0
	beq	.handle_exception_12
.handle_exception_25:
	ldr	lr, [except_sp, #EXCEPTION_EXCEPTION2]
	ldr	r1, [lr, #0]
	cmp	r1, #0
	bne	.handle_exception_13
	b	.handle_exception_12
.handle_exception_26:
	ldr	r1, [except_sp, #EXCEPTION_EXCEPTION2]
	cmp	r1, #0
	beq	.handle_exception_29
	ldr	r3, [r1, #0]
	cmp	r3, #0
	beq	.handle_exception_29
	ldr	r0, [istate, #ISTATE_THREAD]
	b	.handle_exception_25

.handle_exception_27:
	add	r0, except_sp, #EXCEPTION_HANDLEMARK2
	ldr	r1, [istate, #ISTATE_THREAD]
	bl	_ZN10HandleMark10initializeEP6Thread
	ldr	r0, [istate, #ISTATE_THREAD]
	DECACHE_STACK
	bl	_ZN18InterpreterRuntime37throw_illegal_monitor_state_exceptionEP10JavaThread
	add	r0, except_sp, #EXCEPTION_HANDLEMARK2
	ASSERT_STACK_CACHED
	bl	_ZN10HandleMarkD1Ev
	add	r0, except_sp, #EXCEPTION_HANDLE
	ldr	r3, [istate, #ISTATE_THREAD]
	ldr	r1, [r3, #4]
	bl	HandleC
	ldr	r2, [except_sp, #EXCEPTION_HANDLE]
	ldr	r0, [istate, #ISTATE_THREAD]
	str	r2, [except_sp, #EXCEPTION_EXCEPTION2]
	bl	_ZN12ThreadShadow23clear_pending_exceptionEv
	b	.handle_exception_20
.handle_exception_29:
	add	tmp_yyy, except_sp, #EXCEPTION_HANDLEMARK2
	mov	r0, tmp_yyy
	ldr	r1, [istate, #ISTATE_THREAD]
	bl	_ZN10HandleMark10initializeEP6Thread
	ldr	r0, [istate, #ISTATE_THREAD]
	DECACHE_STACK
	bl	_ZN18InterpreterRuntime37throw_illegal_monitor_state_exceptionEP10JavaThread
	mov	r0, tmp_yyy
	ASSERT_STACK_CACHED
	bl	_ZN10HandleMarkD1Ev
	ldr	r3, [istate, #ISTATE_THREAD]
	add	r0, except_sp, #EXCEPTION_HANDLE3
	ldr	r1, [r3, #4]
	bl	HandleC
	ldr	r2, [except_sp, #EXCEPTION_HANDLE3]
	ldr	r0, [istate, #ISTATE_THREAD]
	str	r2, [except_sp, #EXCEPTION_EXCEPTION2]
	bl	_ZN12ThreadShadow23clear_pending_exceptionEv
	ldr	r0, [istate, #ISTATE_THREAD]
	b	.handle_exception_24

#ifdef FASTPATH_ENTRY

	ALIGN_CODE
fast_accessor_entry:
	ldr	ip, [dispatch, #SafePointSynchronize_state_Address-XXX]
	ldr	r3, [tmp2, #8]
	ldr	ip, [ip, #0]
	ldrb	r2, [r3, #50]
	ldrb	r3, [r3, #51]
	cmp	ip, #0
	ldr	ip, [tmp2, #12]
	bne	fast_normal_entry
	ldr	ip, [ip, #12]

	DISPATCH_START	3

	orr	r2, r2, r3, lsl #8		@ r2 = index
	add	r3, ip, #16
	ldr	r2, [r3, r2, lsl #4]!		@ r3 = cache, r2 = flags

	DISPATCH_NEXT

	cmp	r2, #opc_getfield << 16
	GET_STACK	0, r2
	bne	fast_normal_entry

	cmp	r2, #0
	beq	fast_normal_entry


	ldr	lr, [r3, #12]
	ldr	r3, [r3, #8]
	movs	lr, lr, lsr #29
	bls	.fast_accessor_non_w

	DISPATCH_NEXT

	ldr	tmp1, [r2, r3]

	DISPATCH_NEXT
	DISPATCH_NEXT

	PUT_STACK	0, tmp1

	DISPATCH_FINISH

.fast_accessor_non_w:
	bcs	.fast_accessor_h
	beq	.fast_accessor_sb
	tst	lr, #2
	bne	.fast_accessor_dw
.fast_accessor_sh:
	DISPATCH_STATE	2
	DISPATCH_NEXT
	ldrsh	tmp1, [r2, r3]
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUT_STACK	0, tmp1
	DISPATCH_FINISH
.fast_accessor_h:
	DISPATCH_STATE	2
	DISPATCH_NEXT
	ldrh	tmp1, [r2, r3]
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUT_STACK	0, tmp1
	DISPATCH_FINISH
.fast_accessor_sb:
	DISPATCH_STATE	2
	DISPATCH_NEXT
	ldrsb	tmp1, [r2, r3]
	DISPATCH_NEXT
	DISPATCH_NEXT
	PUT_STACK	0, tmp1
	DISPATCH_FINISH
.fast_accessor_dw:
	DISPATCH_STATE	2
	add	tmp1, r2, r3
	DISPATCH_NEXT
	ldm	tmp1, {tmp2, tmp1}
	DISPATCH_NEXT
	PUT_STACK	0, tmp1
	DISPATCH_NEXT
	PUSH	tmp2
	DISPATCH_FINISH

#endif // FASTPATH_ENTRY

div_zero_jpc_1:
	sub	jpc, jpc, #1			@ Point to idiv
.lrem_0:
.ldiv_0:
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
	sub	arm_sp, arm_sp, #16
	add	r0, arm_sp, #4
	bl	sprintf
	add	r1, arm_sp, #4
	mov	r0, #VMSYMBOLS_ArrayIndexOutOfBounds
	str	r1, [arm_sp]
	ldr	r3, [dispatch, #VmSymbols_symbols_Address-XXX]
	ldr	r3, [r3, r0, lsl #2]
        ldr     r0, [istate, #ISTATE_THREAD]
	DECACHE_JPC
        DECACHE_STACK
        mov     ip, #_thread_in_vm
        str     ip, [r0, #THREAD_STATE]
        mov     r2, #99
        adrl    r1, bytecode_interpreter_str
       	bl      _ZN10Exceptions10_throw_msgEP6ThreadPKciP13symbolOopDescS3_
	add	r0, istate, #ISTATE_THREAD
       	bl      ThreadInVMfromJavaD
	add	arm_sp, arm_sp, #16
        b       handle_exception_with_bcp
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

@ ==== SW FP ==============================================================================

	Opcode	fadd
	POP	r0, r1
        bl      __aeabi_fadd
	PUSH	r0
	DISPATCH	1

	Opcode	fsub
	POP	r1
	POP	r0
        bl      __aeabi_fsub
	PUSH	r0
	DISPATCH	1

	Opcode	fmul
	POP	r0, r1
        bl      __aeabi_fmul
	PUSH	r0
	DISPATCH	1

	Opcode	fdiv
	POP	r1
	POP	r0
        bl      __aeabi_fdiv
	PUSH	r0
	DISPATCH	1

	Opcode	ddiv
	POP	r2, r3
	POP	r0, r1
        bl      __aeabi_ddiv
	PUSH	r0, r1
	DISPATCH	1

	Opcode	fcmpl
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
	DISPATCH_START	1
	add	stack, stack, #8
	DISPATCH_NEXT
	PUSH	r3
	DISPATCH_FINISH

	Opcode	fcmpg
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
	DISPATCH_START	1
	add	stack, stack, #8
	DISPATCH_NEXT
	PUSH	r3
	DISPATCH_FINISH

	Opcode	dcmpl
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
	DISPATCH_START	1
	add	stack, stack, #16
	DISPATCH_NEXT
	PUSH	r3
	DISPATCH_FINISH

	Opcode	dcmpg
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
	DISPATCH_START	1
	add	stack, stack, #16
	DISPATCH_NEXT
	PUSH	r3
	DISPATCH_FINISH

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
	POP	al, ah, bl, bh
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
	PUSH	al, ah
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
	POP	al, ah, bl, bh
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
	PUSH	al, ah
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
	POP	al, ah, bl, bh
	stmdb	arm_sp!, {r4, r5}
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
	ldmia	arm_sp!, {r4, r5}
	PUSH	al, ah
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
	ldmia	arm_sp!, {r4, r5}
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
	ldmia	arm_sp!, {r4, r5}
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
#ifdef NOTICE_SAFEPOINTS
	adrl	ip, dispatch_init_adcon
	ldm	ip, {r2, r3}
	add	r2, r2, ip
	add	ip, r3, r2
	ldr	r2, [ip, #AbstractInterpreter_notice_safepoints-XXX]
	ldrb	r1, [r2, #0]	@ zero_extendqisi2
	cmp	r1, #0
	bxeq	lr
	mov	r3, #0
	strb	r3, [r2, #0]
	adrl	r3, main_dispatch_table
#ifdef HW_FP
	ldr	r0, [ip, #VFP_Flag-XXX]
	cmp	r0, #0
	bne	2f
#endif
	mov	r2, #256
1:
	ldr	r1, [r3], #4
	str	r1, [ip], #4
	subs	r2, r2, #1
	bne	1b
	bx	lr

@ No HW FP - must update the table from a combination main_dispatch_table and
@ vfp_table. Previously this updated from main_dispatch_table first, and then
@ overwrite the updated entries with those from vfp_table. However, this creates
@ a window where the jump table has vfp entries, so in a multithreaded world we
@ can get undefined VFP instructions.
@ The code below updates from both tables simultaneously. Note: this relies on
@ the enties in vfp_table being in opcode order.
#ifdef HW_FP
2:
	stmdb	arm_sp!, {r4, lr}
	mov	r2, #0
	adrl	r0, vfp_table
	ldr	r4, [r0], #4
3:
	ldr	r1, [r3], #4
	cmp	r2, r4
	ldreq	r1, [r0], #4
	ldreq	r4, [r0], #4
	str	r1, [ip], #4
	add	r2, r2, #1
	cmp	r2, #256
	bcc	3b
	ldmia	arm_sp!, {r4, lr}
#endif // HW_FP
#endif // NOTICE_SAFEPOINTS
	bx	lr

@ --- notice_safepoints ---------------------------------------------------------------------------
	.global	_ZN14CppInterpreter17notice_safepointsEv
	.type	_ZN14CppInterpreter17notice_safepointsEv, %function
_ZN14CppInterpreter17notice_safepointsEv:
#ifdef NOTICE_SAFEPOINTS
	adrl	ip, dispatch_init_adcon
	ldm	ip, {r2, r3}
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
#endif
	bx	lr

@ --- END execute.s ----------------------------------------------------------------------------

	ALIGN_CODE
bci_init:
        stmfd   sp!, {r4, lr}

	adrl	r3, dispatch_init_adcon
	ldm	r3, {r0, r1}
	add	r0, r0, r3
        add     r4, r1, r0
	adrl	r2, adcon_init_table
        mov     r1, r4
1:
	ldr	ip, [r2], #4
	cmp	ip, #0
	ldrne	ip, [r0, ip]
	strne	ip, [r1, #-4]!
	bne	1b
	adrl	r2, main_dispatch_table
	mov	r1, #256
        mov     r3, r4
2:
	ldr	ip, [r2], #4
	str	ip, [r3], #4
	subs	r1, r1, #1
	bne	2b

#ifdef USE_COMPILER

#define NPROCESSORS_CONF        83

        mov     r0, #NPROCESSORS_CONF
        bl      sysconf
        cmp     r0, #2

#ifdef DISABLE_BG_COMP_ON_NON_MP
        movcc   r0, #0
        ldrcc   r1, [r4, #BackgroundCompilation_Address-XXX]
        strccb  r0, [r1]
#endif

        movcs   r0, #MP_COMPILE_THRESHOLD
        movcc   r0, #UP_COMPILE_THRESHOLD
        ldr     r1, [r4, #CompileThreshold_Address-XXX]
        str     r0, [r1]


#endif // USE_COMPILER

        ldmfd   sp!, {r4, lr}

#ifdef HW_FP
vfp_init:
	stmfd	sp!, {r4, r5, lr}
	sub	sp, sp, #132
	mov	r4, #0
	adr	r0, proc_self_auxv
	mov	r1, #0
	bl	open
	subs	r5, r0, #0
	blt	.exit_vfp_init
.vfp_init_read_loop:
	mov	r2, #128
	mov	r0, r5
	mov	r1, sp
	bl	read
	mov	r2, sp
	mov	r3, r0, lsr #3
	b	.vfp_init_1
.vfp_init_vec_loop:
	ldmia	r2!, {r1, ip}
	cmp	r1, #0
	beq	.fini_vfp_init
	cmp	r1, #16
	bne	.vfp_init_1
	tst	ip, #64
	movne	r4, #1
	bne	.fini_vfp_init
.vfp_init_1:
	subs	r3, r3, #1
	bpl	.vfp_init_vec_loop
	cmp	r0, #128
	beq	.vfp_init_read_loop
.fini_vfp_init:
	mov	r0, r5
	bl	close
.exit_vfp_init:
	movs	r0, r4
	add	sp, sp, #132
	ldmfd	sp!, {r4, r5, lr}
	bxne	lr		@ We have HW FP - just exit

@ No HW FP - replace the HW FP entries with SW entries
update_vfp_table:
	adr	r0, vfp_table
	adrl	ip, dispatch_init_adcon
	ldm	ip, {r2, r3}
	add	r2, r2, ip
	add	ip, r3, r2
	mov	r1, #1
	str	r1, [ip, #VFP_Flag-XXX]
.update_vfp_loop:
	ldr	r1, [r0], #4
	cmp	r1, #0
	ldrne	r2, [r0], #4
	strne	r2, [ip, r1, lsl #2]
	bne	.update_vfp_loop
#endif // HW_FP

	bx	lr

#ifdef HW_FP
vfp_table:
	.word	opc_fadd,	do_fadd
	.word	opc_dadd,	do_dadd
	.word	opc_fsub,	do_fsub
	.word	opc_dsub,	do_dsub
	.word	opc_fmul,	do_fmul
	.word	opc_dmul,	do_dmul
	.word	opc_fdiv,	do_fdiv
	.word	opc_ddiv,	do_ddiv
	.word	opc_fcmpl,	do_fcmpl
	.word	opc_fcmpg,	do_fcmpg
	.word	opc_dcmpl,	do_dcmpl
	.word	opc_dcmpg,	do_dcmpg
	.word	0

proc_self_auxv:
	.ascii	"/proc/self/auxv\000"
	.align	2

#endif // HW_FP

	ALIGN_DATA
dispatch_init_adcon:
	.word	_GLOBAL_OFFSET_TABLE_-dispatch_init_adcon, opclabels_data(GOTOFF)
adcon_init_table:
	.word	_ZN18InterpreterRuntime22slow_signature_handlerEP10JavaThreadP13methodOopDescPiS4_(GOT)
	.word	_ZN20SafepointSynchronize6_stateE(GOT)
	.word	_ZN9vmSymbols8_symbolsE(GOT)
	.word	always_do_update_barrier(GOT)
	.word	_ZN8Universe14_collectedHeapE(GOT)
	.word	_ZN9Bytecodes5_nameE(GOT)
	.word	_ZN19AbstractInterpreter18_notice_safepointsE(GOT)
	.word	_ZN18ThreadLocalStorage13_thread_indexE(GOT)
	.word	_ZN7oopDesc3_bsE(GOT)
	.word	PrintCommandLineFlags(GOT)
	.word	_ZN11JvmtiExport28_can_post_interpreter_eventsE(GOT)
	.word	UseCompiler(GOT)
	.word	_ZN17InvocationCounter26InterpreterInvocationLimitE(GOT)
        .word   CompileThreshold(GOT)
        .word   BackgroundCompilation(GOT)
        .word   UseOnStackReplacement(GOT)
	.word	0

	ALIGN_DATA
main_dispatch_table:
	MAIN_DISPATCH_TABLE

@ ECN: Strange logic here! We don't need the safe_dispatch_table if NOTICE_SAFEPOINTS is
@      disabled because in this case the main_dispatch_table must be safepoint safe.
#ifdef NOTICE_SAFEPOINTS
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
	.word	do_ifeq
	.word	do_ifne
	.word	do_iflt
	.word	do_ifge
	.word	do_ifgt
	.word	do_ifle
	.word	do_if_icmpeq
	.word	do_if_icmpne
	.word	do_if_icmplt
	.word	do_if_icmpge
	.word	do_if_icmpgt
	.word	do_if_icmple
	.word	do_if_icmpeq
	.word	do_if_icmpne
	.word	do_goto
	.word	do_jsr
	.word	do_ret
	.word	do_tableswitch
	.word	do_lookupswitch
	.word	do_ireturn
	.word	do_lreturn
	.word	do_ireturn
	.word	do_lreturn
	.word	do_ireturn
	.word	do_return
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
	.word	do_ifeq
	.word	do_ifne
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
	.word	do_invokeresolved
	.word	do_invokespecialresolved
	.word	do_invokestaticresolved
	.word	do_invokevfinal
	.word	do_fast_iload_iload
	.word	do_fast_iload_iload_N
	.word	do_return_register_finalizer
	.word	do_undefined
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_0_iconst_N
	.word	do_iload_iconst_N
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
	.word	do_fast_iload_N_iload
	.word	do_fast_iload_N_iload
	.word	do_fast_iload_N_iload
	.word	do_fast_iload_N_iload
	.word	do_fast_iload_N_iload_N
	.word	do_fast_iload_N_iload_N
	.word	do_fast_iload_N_iload_N
	.word	do_fast_iload_N_iload_N
	.word	do_undefined
	.word	do_undefined
#endif

	SUB_DISPATCH_TABLES

	.section	.init_array,"aw",%init_array
	.word	bci_init(target1)

	.data
	ALIGN_DATA
#ifdef CODETRACE
CodeTrace_Buffer_Base:
	.space	CODETRACE_BUFFER_SIZE
#endif
        .word   0, 0, 0, 0, 0, 0, 0, 0
        .word   0, 0, 0, 0, 0
DispatchBreakPoint:					.word	0
VFP_Flag:						.word	0
CodeTrace_Idx:						.word	0
UseOnStackReplacement_Address:                          .word   0
BackgroundCompilation_Address:                          .word   0
CompileThreshold_Address:                               .word   0
InterpreterInvocationLimit_Address:			.word	0
UseCompiler_Address:					.word	0
can_post_interpreter_events:				.word	0
PrintCommandLineFlags_Address:				.word	0
oopDesc_Address:					.word	0
ThreadLocalStorage_thread_index:			.word	0
AbstractInterpreter_notice_safepoints:			.word	0
Bytecodes_name_Address:					.word	0
Universe_collectedHeap_Address:				.word	0
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
#endif
