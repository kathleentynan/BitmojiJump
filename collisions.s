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
	.file	"collisions.c"
	.text
	.align	2
	.global	genericCollision
	.type	genericCollision, %function
genericCollision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	ldr	r4, [sp, #20]
	ldr	ip, [sp, #32]
	add	r5, sp, #24
	ldmia	r5, {r5, lr}
	cmp	r4, r0
	add	ip, r4, ip
	movgt	r6, #0
	movle	r6, #1
	add	lr, r5, lr
	cmp	ip, r0
	movlt	r6, #0
	cmp	lr, r1
	ble	.L2
	add	r7, r1, r2
	cmp	r5, r7
	bge	.L2
	cmp	r6, #0
	movne	r0, #0
	beq	.L17
.L13:
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	bx	lr
.L2:
	add	r3, r0, r3
.L6:
	cmp	r5, r1
	movgt	r6, #0
	movle	r6, #1
	cmp	lr, r1
	movlt	r6, #0
	cmp	ip, r0
	movle	r0, #0
	movgt	r0, #1
	cmp	r4, r3
	movge	r0, #0
	cmp	r6, #0
	bne	.L18
	add	r2, r1, r2
	cmp	r5, r2
	movgt	r5, #0
	movle	r5, #1
	cmp	lr, r2
	movlt	r5, #0
	cmp	r5, #0
	mvneq	r0, #0
	beq	.L13
	cmp	r0, #0
	mvneq	r0, #0
	movne	r0, #1
	b	.L13
.L18:
	cmp	r0, #0
	mvneq	r0, #0
	movne	r0, #3
	b	.L13
.L17:
	add	r3, r0, r3
	cmp	ip, r3
	movlt	r6, #0
	movge	r6, #1
	cmp	r4, r3
	movgt	r6, #0
	cmp	r6, #0
	movne	r0, #2
	bne	.L13
	b	.L6
	.size	genericCollision, .-genericCollision
	.align	2
	.global	platformCollisions
	.type	platformCollisions, %function
platformCollisions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	mov	r4, r1
	mov	r6, r0
	sub	sp, sp, #16
	add	r5, r1, #252
.L22:
	ldr	r0, [r4]
	cmp	r0, #60
	ble	.L20
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L20
	ldr	r8, [r4, #20]
	cmp	r8, #6
	beq	.L20
	ldr	r7, [r6, #12]
	ldr	lr, [r6]
	ldmib	r4, {r1, r2, r3}
	str	r7, [sp, #8]
	add	ip, r7, r7, lsr #31
	mov	ip, ip, asr #1
	ldr	r7, [r6, #8]
	add	lr, ip, lr, asr #8
	str	ip, [sp, #12]
	str	lr, [sp]
	str	r7, [sp, #4]
	bl	genericCollision
	cmp	r0, #0
	bne	.L20
	ldr	r3, [r6, #16]
	cmp	r3, #100
	bgt	.L32
.L20:
	add	r4, r4, #28
	cmp	r5, r4
	bne	.L22
	mov	r0, #0
.L21:
	add	sp, sp, #16
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L32:
	cmp	r8, #4
	moveq	r3, #6
	moveq	r0, #1
	streq	r3, [r4, #20]
	movne	r0, #1
	b	.L21
	.size	platformCollisions, .-platformCollisions
	.align	2
	.global	starCollision
	.type	starCollision, %function
starCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r4, r1
	mov	r5, r0
	sub	sp, sp, #16
	add	r6, r1, #100
.L36:
	ldr	r3, [r4, #12]
	cmp	r3, #0
	beq	.L34
	ldr	r2, [r5]
	ldmib	r4, {r1, r3}
	ldr	ip, [r5, #12]
	ldr	lr, [r5, #8]
	mov	r2, r2, asr #8
	ldr	r0, [r4]
	str	r2, [sp]
	str	ip, [sp, #12]
	mov	r2, r3
	str	ip, [sp, #8]
	str	lr, [sp, #4]
	bl	genericCollision
	cmp	r0, #3
	bls	.L42
.L34:
	add	r4, r4, #20
	cmp	r6, r4
	bne	.L36
	mov	r0, #0
	add	sp, sp, #16
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L42:
	mov	r3, #0
	mov	r0, #1
	str	r3, [r4, #12]
	add	sp, sp, #16
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
	.size	starCollision, .-starCollision
	.comm	fontdata_6x8,12288,4
	.comm	state,4,4
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.ident	"GCC: (devkitARM release 45) 5.3.0"
