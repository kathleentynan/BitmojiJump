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
	.file	"myLib.c"
	.text
	.align	2
	.global	loadPalette
	.type	loadPalette, %function
loadPalette:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #83886080
	ldr	r3, .L2
	ldr	r2, .L2+4
	ldr	r3, [r3]
	str	r0, [r3, #36]
	str	r1, [r3, #40]
	str	r2, [r3, #44]
	bx	lr
.L3:
	.align	2
.L2:
	.word	.LANCHOR0
	.word	-2147483392
	.size	loadPalette, .-loadPalette
	.align	2
	.global	DMANow
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L6
	str	lr, [sp, #-4]!
	add	r0, r0, r0, lsl #1
	ldr	lr, [ip]
	mov	r0, r0, asl #2
	add	ip, lr, r0
	orr	r3, r3, #-2147483648
	str	r1, [lr, r0]
	str	r2, [ip, #4]
	ldr	lr, [sp], #4
	str	r3, [ip, #8]
	bx	lr
.L7:
	.align	2
.L6:
	.word	.LANCHOR0
	.size	DMANow, .-DMANow
	.align	2
	.global	waitForVblank
	.type	waitForVblank, %function
waitForVblank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L9:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L9
	mov	r2, #67108864
.L11:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L11
	bx	lr
	.size	waitForVblank, .-waitForVblank
	.align	2
	.global	flipPage
	.type	flipPage, %function
flipPage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
	ldrh	r3, [r2]
	ldr	r1, .L18
	tst	r3, #16
	ldrne	r0, [r1, #8]
	ldreq	r0, [r1, #12]
	bicne	r3, r3, #16
	orreq	r3, r3, #16
	strh	r3, [r2]	@ movhi
	str	r0, [r1, #4]
	bx	lr
.L19:
	.align	2
.L18:
	.word	.LANCHOR0
	.size	flipPage, .-flipPage
	.align	2
	.global	setPixel4
	.type	setPixel4, %function
setPixel4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L23
	rsb	r0, r0, r0, lsl #4
	add	r0, r1, r0, lsl #4
	ldr	ip, [r3, #4]
	add	r0, r0, r0, lsr #31
	bic	r0, r0, #1
	ldrh	r3, [ip, r0]
	tst	r1, #1
	biceq	r3, r3, #255
	andne	r3, r3, #255
	orrne	r2, r3, r2, asl #8
	orreq	r3, r3, r2
	strneh	r2, [ip, r0]	@ movhi
	streqh	r3, [ip, r0]	@ movhi
	bx	lr
.L24:
	.align	2
.L23:
	.word	.LANCHOR0
	.size	setPixel4, .-setPixel4
	.align	2
	.global	drawRect4
	.type	drawRect4, %function
drawRect4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #20
	ldrb	lr, [sp, #56]	@ zero_extendqisi2
	ldrb	ip, [sp, #56]	@ zero_extendqisi2
	cmp	r2, #0
	orr	ip, ip, lr, asl #8
	strh	ip, [sp, #14]	@ movhi
	ble	.L25
	add	r8, r3, r3, lsr #31
	ldr	ip, .L41
	mov	r8, r8, asr #1
	add	fp, r1, r3
	sub	r7, r8, #1
	rsb	r0, r0, r0, lsl #4
	mov	r0, r0, asl #4
	add	r6, r1, #1
	sub	fp, fp, #1
	ldmia	ip, {r4, r5}
	and	r9, r3, #1
	orr	ip, r7, #-2130706432
	sub	r3, r3, #1
	str	ip, [sp, #4]
	mov	lr, #0
	add	ip, r1, r0
	orr	r8, r8, #-2130706432
	add	r0, r6, r0
	and	fp, fp, #1
	and	r1, r1, #1
	str	r3, [sp]
	add	r10, sp, #14
	b	.L33
.L40:
	ldrb	r6, [r5, r3]	@ zero_extendqisi2
	ldrb	r7, [sp, #56]	@ zero_extendqisi2
	orr	r6, r6, r7, asl #8
	strh	r6, [r5, r3]	@ movhi
	add	r3, r0, r0, lsr #31
	bic	r3, r3, #1
	cmp	r9, #0
	add	r3, r5, r3
	str	r10, [r4, #36]
	str	r3, [r4, #40]
	strne	r8, [r4, #44]
	bne	.L29
	ldr	r3, [sp, #4]
	str	r3, [r4, #44]
.L39:
	ldr	r3, [sp]
	add	r3, r3, ip
	add	r3, r3, r3, lsr #31
	bic	r3, r3, #1
	ldrh	r7, [r5, r3]
	ldrb	r6, [sp, #56]	@ zero_extendqisi2
	cmp	fp, #0
	and	r6, r6, #255
	andne	r7, r7, #255
	biceq	r7, r7, #255
	orrne	r7, r7, r6, asl #8
	orreq	r7, r7, r6
	strh	r7, [r5, r3]	@ movhi
.L29:
	add	lr, lr, #1
	cmp	r2, lr
	add	ip, ip, #240
	add	r0, r0, #240
	beq	.L25
.L33:
	add	r3, ip, ip, lsr #31
	cmp	r1, #0
	bic	r3, r3, #1
	bne	.L40
	add	r3, r5, r3
	cmp	r9, #0
	str	r10, [r4, #36]
	str	r3, [r4, #40]
	str	r8, [r4, #44]
	beq	.L29
	b	.L39
.L25:
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L42:
	.align	2
.L41:
	.word	.LANCHOR0
	.size	drawRect4, .-drawRect4
	.align	2
	.global	drawBackgroundImage4
	.type	drawBackgroundImage4, %function
drawBackgroundImage4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L44
	ldr	r1, .L44+4
	ldr	r3, [r2]
	ldr	r2, [r2, #4]
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	bx	lr
.L45:
	.align	2
.L44:
	.word	.LANCHOR0
	.word	-2147464448
	.size	drawBackgroundImage4, .-drawBackgroundImage4
	.align	2
	.global	drawImage4
	.type	drawImage4, %function
drawImage4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	tst	r2, #1
	stmfd	sp!, {r4, r5, r6, lr}
	addne	r2, r2, #1
	cmp	r3, #0
	ldr	ip, [sp, #16]
	ble	.L46
	ldr	lr, .L56
	add	ip, ip, ip, lsr #31
	add	r3, r1, r3
	mov	r4, ip, asr #1
	rsb	r1, r1, r1, lsl #4
	rsb	r3, r3, r3, lsl #4
	ldr	r6, [lr, #4]
	ldr	ip, [lr]
	orr	r5, r4, #-2147483648
	add	lr, r2, r3, lsl #4
	add	r2, r2, r1, lsl #4
	mov	r1, r4, asl #1
.L49:
	add	r3, r2, r2, lsr #31
	bic	r3, r3, #1
	add	r2, r2, #240
	add	r3, r6, r3
	cmp	r2, lr
	str	r0, [ip, #36]
	str	r3, [ip, #40]
	add	r0, r0, r1
	str	r5, [ip, #44]
	bne	.L49
.L46:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L57:
	.align	2
.L56:
	.word	.LANCHOR0
	.size	drawImage4, .-drawImage4
	.align	2
	.global	fillScreen4
	.type	fillScreen4, %function
fillScreen4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L60
	sub	sp, sp, #8
	add	r2, sp, #8
	orr	r0, r0, r0, asl #8
	strh	r0, [r2, #-2]!	@ movhi
	ldr	r3, [r1]
	ldr	r0, [r1, #4]
	ldr	r1, .L60+4
	str	r2, [r3, #36]
	str	r0, [r3, #40]
	str	r1, [r3, #44]
	add	sp, sp, #8
	@ sp needed
	bx	lr
.L61:
	.align	2
.L60:
	.word	.LANCHOR0
	.word	-2130687232
	.size	fillScreen4, .-fillScreen4
	.global	dma
	.global	backBuffer
	.global	frontBuffer
	.global	videoBuffer
	.comm	fontdata_6x8,12288,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	dma, %object
	.size	dma, 4
dma:
	.word	67109040
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.type	backBuffer, %object
	.size	backBuffer, 4
backBuffer:
	.word	100704256
	.type	frontBuffer, %object
	.size	frontBuffer, 4
frontBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 45) 5.3.0"
