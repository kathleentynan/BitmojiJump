	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.arm
	.syntax divided
	.file	"platforms.c"
	.global	__aeabi_idiv
	.text
	.align	2
	.global	handlePlatforms
	.type	handlePlatforms, %function
handlePlatforms:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r8, #0
	ldr	r5, .L19
	ldr	r6, .L19+4
	ldr	r7, .L19+8
	add	r4, r0, #24
	add	r10, r0, #276
	b	.L10
.L6:
	add	r4, r4, #28
	cmp	r4, r10
	beq	.L17
.L10:
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L3
	ldr	r3, [r4, #-4]
	cmp	r3, #2
	beq	.L18
.L3:
	ldr	r3, [r4, #-24]
	cmp	r3, #145
	ble	.L6
	ldr	r9, [r4, #-16]
	mov	lr, pc
	bx	r5
	rsb	r1, r9, #240
	mov	fp, r0
	mvn	r0, #-2147483648
	mov	lr, pc
	bx	r6
	add	r1, r0, #1
	mov	r0, fp
	mov	lr, pc
	bx	r6
	str	r8, [r4, #-24]
	str	r0, [r4, #-20]
	mov	lr, pc
	bx	r5
	smull	r3, r2, r7, r0
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #1
	add	r3, r3, r3, lsl #2
	cmp	r0, r3
	bne	.L7
	mov	r3, #4
	add	r4, r4, #28
	str	r3, [r4, #-32]
	cmp	r4, r10
	bne	.L10
.L17:
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L18:
	ldr	r3, [r4, #-20]
	ldr	r2, [r4, #-8]
	add	r3, r2, r3
	cmp	r3, #2
	str	r3, [r4, #-20]
	ble	.L5
	ldr	r1, [r4, #-16]
	add	r3, r3, r1
	cmp	r3, #243
	ble	.L3
.L5:
	rsb	r2, r2, #0
	str	r2, [r4, #-8]
	b	.L3
.L7:
	mov	lr, pc
	bx	r5
	smull	r2, r3, r7, r0
	mov	r2, r0, asr #31
	rsb	r3, r2, r3, asr #1
	add	r3, r3, r3, lsl #2
	rsb	r3, r3, r0
	cmp	r3, #1
	beq	.L9
	mov	lr, pc
	bx	r5
	smull	r2, r3, r7, r0
	mov	r2, r0, asr #31
	rsb	r3, r2, r3, asr #1
	add	r3, r3, r3, lsl #2
	rsb	r3, r3, r0
	cmp	r3, #2
	strne	r8, [r4, #-4]
	bne	.L6
.L9:
	mov	r3, #2
	str	r3, [r4, #-4]
	b	.L6
.L20:
	.align	2
.L19:
	.word	rand
	.word	__aeabi_idiv
	.word	1717986919
	.size	handlePlatforms, .-handlePlatforms
	.align	2
	.global	random
	.type	random, %function
random:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r3, .L23
	mov	r5, r0
	mov	r4, r1
	mov	lr, pc
	bx	r3
	rsb	r1, r5, r4
	mov	r6, r0
	ldr	r4, .L23+4
	add	r1, r1, #1
	mvn	r0, #-2147483648
	mov	lr, pc
	bx	r4
	add	r1, r0, #1
	mov	r0, r6
	mov	lr, pc
	bx	r4
	add	r0, r0, r5
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L24:
	.align	2
.L23:
	.word	rand
	.word	__aeabi_idiv
	.size	random, .-random
	.comm	fontdata_6x8,12288,4
	.comm	state,4,4
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.ident	"GCC: (devkitARM release 45) 5.3.0"
