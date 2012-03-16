#ifdef __ARM_ARCH_7A__
@	jlong
@	arm_val_compare_and_swap_long(volatile void *ptr,
@				 jlong oldval,
@				 jlong newval) {
	.pushsection .text
	.global arm_val_compare_and_swap_long
#ifdef __thumb__
	.syntax	unified
	.thumb_func
#endif
	.type arm_val_compare_and_swap_long, %function
arm_val_compare_and_swap_long:
	stmfd	sp!, {r4, r5, r6, r7}
	ldrd	r4, [sp, #16]
	dmb	sy
0:	ldrexd	r6, [r0]
	cmp	r6, r2
	it	eq
	cmpeq	r7, r3
	bne	1f
	strexd	r1, r4, [r0]
	cmp	r1, #0
	bne	0b
	dmb	sy
1:	mov	r0, r6
	mov	r1, r7
	ldmfd	sp!, {r4, r5, r6, r7}
	bx	lr
	.popsection
#endif // __ARM_ARCH_7A__
