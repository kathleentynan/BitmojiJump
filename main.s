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
	.file	"main.c"
	.text
	.align	2
	.global	goToSplash
	.type	goToSplash, %function
goToSplash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #1
	stmfd	sp!, {r4, r5, lr}
	mov	r5, #0
	ldr	r4, .L3
	ldr	lr, .L3+4
	sub	sp, sp, #12
	mov	r3, ip
	str	ip, [r4]
	ldr	r1, .L3+8
	ldr	r2, .L3+12
	ldr	r0, .L3+16
	ldr	r4, .L3+20
	str	r5, [lr]
	mov	lr, pc
	bx	r4
	ldr	r0, .L3+24
	ldr	r3, .L3+28
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldr	r2, .L3+32
	ldr	r0, .L3+36
	strh	r2, [r3]	@ movhi
	ldr	r3, .L3+40
	mov	lr, pc
	bx	r3
	mov	r2, #5
	mov	r1, #12
	str	r2, [sp]
	mov	r0, #115
	mov	r2, #4
	mov	r3, #40
	ldr	r4, .L3+44
	mov	lr, pc
	bx	r4
	ldr	r3, .L3+48
	mov	lr, pc
	bx	r3
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L4:
	.align	2
.L3:
	.word	startInstr
	.word	state
	.word	194316
	.word	11025
	.word	introsong
	.word	playSoundA
	.word	startPal
	.word	loadPalette
	.word	1044
	.word	startBitmap
	.word	drawBackgroundImage4
	.word	drawRect4
	.word	flipPage
	.size	goToSplash, .-goToSplash
	.align	2
	.type	updateWinLose.part.1, %function
updateWinLose.part.1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L9
	ldr	r3, [r3]
	tst	r3, #8
	bxne	lr
	stmfd	sp!, {r4, lr}
	ldr	r3, .L9+4
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	b	goToSplash
.L10:
	.align	2
.L9:
	.word	buttons
	.word	flipPage
	.size	updateWinLose.part.1, .-updateWinLose.part.1
	.align	2
	.global	goToInstructions
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #1
	stmfd	sp!, {r4, lr}
	ldr	r2, .L13
	ldr	r0, .L13+4
	ldr	r3, .L13+8
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r0, .L13+12
	ldr	r3, .L13+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L13+20
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	state
	.word	instructionsPal
	.word	loadPalette
	.word	instructionsBitmap
	.word	drawBackgroundImage4
	.word	flipPage
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	updateInstructions
	.type	updateInstructions, %function
updateInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r4, .L32
	ldr	r3, [r4]
	tst	r3, #2
	beq	.L16
	ldr	r2, .L32+4
	ldr	r0, [r2]
	ands	r5, r0, #2
	beq	.L29
.L16:
	tst	r3, #16
	beq	.L17
	ldr	r2, .L32+4
	ldr	r0, [r2]
	ands	r5, r0, #16
	beq	.L30
.L17:
	tst	r3, #32
	beq	.L15
	ldr	r3, .L32+4
	ldr	r0, [r3]
	ands	r4, r0, #32
	beq	.L31
.L15:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L31:
	ldr	r0, .L32+8
	ldr	r3, .L32+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L32+16
	mov	lr, pc
	bx	r3
	mov	r0, r4
	ldr	r3, .L32+20
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L30:
	ldr	r0, .L32+24
	ldr	r3, .L32+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L32+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L32+20
	mov	r0, r5
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	b	.L17
.L29:
	ldr	r3, .L32+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L32+20
	mov	r0, r5
	mov	lr, pc
	bx	r3
	bl	goToSplash
	ldr	r3, [r4]
	b	.L16
.L33:
	.align	2
.L32:
	.word	oldButtons
	.word	buttons
	.word	instructionsBitmap
	.word	drawBackgroundImage4
	.word	flipPage
	.word	fillScreen4
	.word	instructions2Bitmap
	.size	updateInstructions, .-updateInstructions
	.align	2
	.global	goToGame
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #2
	ldr	r2, .L38
	stmfd	sp!, {r4, lr}
	ldr	r0, .L38+4
	ldr	r3, .L38+8
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	mov	lr, #5888
	mov	r3, #67108864
	ldr	ip, .L38+12
	ldr	r4, .L38+16
	ldr	r1, .L38+20
	ldr	r0, .L38+24
	ldr	r2, .L38+28
	strh	lr, [r3]	@ movhi
	strh	r4, [r3, #12]	@ movhi
	strh	r0, [r3, #80]	@ movhi
	strh	ip, [r3, #10]	@ movhi
	ldr	r4, .L38+32
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #82]	@ movhi
	ldr	r1, .L38+36
	mov	r3, #2544
	mov	r2, #100663296
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L38+40
	ldr	r1, .L38+44
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2448
	ldr	r2, .L38+48
	ldr	r1, .L38+52
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L38+56
	ldr	r1, .L38+60
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #64
	ldr	r2, .L38+64
	ldr	r1, .L38+68
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L38+72
	ldr	r1, .L38+76
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	ldr	r2, .L38+80
	ldr	r1, .L38+84
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	ldr	r2, .L38+88
	ldr	r1, .L38+92
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #0
	mov	r1, #512
	ldr	ip, .L38+96
	ldr	r0, .L38+100
	mov	r3, r2
	str	r2, [ip]
	str	r2, [r0]
	ldr	r2, .L38+104
.L35:
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L35
	ldmfd	sp!, {r4, lr}
	bx	lr
.L39:
	.align	2
.L38:
	.word	state
	.word	cloudsPal
	.word	loadPalette
	.word	-25595
	.word	7938
	.word	6920
	.word	13378
	.word	2313
	.word	DMANow
	.word	backgroundTiles
	.word	100726784
	.word	backgroundMap
	.word	100679680
	.word	cloudsTiles
	.word	100720640
	.word	cloudsMap
	.word	100696064
	.word	scorebgTiles
	.word	100718592
	.word	scorebgMap
	.word	100728832
	.word	spritesTiles
	.word	83886592
	.word	spritesPal
	.word	vOff
	.word	hOff
	.word	shadowOAM
	.size	goToGame, .-goToGame
	.align	2
	.global	goToPause
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r0, #3
	ldr	r1, .L42
	ldr	r3, .L42+4
	stmfd	sp!, {r4, lr}
	str	r0, [r3]
	strh	r1, [r2]	@ movhi
	ldr	r3, .L42+8
	mov	lr, pc
	bx	r3
	ldr	r0, .L42+12
	ldr	r3, .L42+16
	mov	lr, pc
	bx	r3
	ldr	r0, .L42+20
	ldr	r3, .L42+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L42+28
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	bx	lr
.L43:
	.align	2
.L42:
	.word	1044
	.word	state
	.word	pauseSound
	.word	pausePal
	.word	loadPalette
	.word	pauseBitmap
	.word	drawBackgroundImage4
	.word	flipPage
	.size	goToPause, .-goToPause
	.align	2
	.global	updatePause
	.type	updatePause, %function
updatePause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r4, .L56
	ldr	r3, [r4]
	tst	r3, #4
	beq	.L45
	ldr	r2, .L56+4
	ldr	r0, [r2]
	ands	r5, r0, #4
	beq	.L54
.L45:
	tst	r3, #8
	beq	.L44
	ldr	r3, .L56+4
	ldr	r0, [r3]
	ands	r4, r0, #8
	beq	.L55
.L44:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L55:
	ldr	r3, .L56+8
	mov	lr, pc
	bx	r3
	mov	r0, r4
	ldr	r3, .L56+12
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, r5, r6, lr}
	b	goToSplash
.L54:
	ldr	r3, .L56+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L56+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L56+12
	mov	r0, r5
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, [r4]
	b	.L45
.L57:
	.align	2
.L56:
	.word	oldButtons
	.word	buttons
	.word	flipPage
	.word	fillScreen4
	.word	unpauseSound
	.size	updatePause, .-updatePause
	.align	2
	.global	goToWinLose
	.type	goToWinLose, %function
goToWinLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #4
	mov	r3, #67108864
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r1, .L69
	ldr	r4, .L69+4
	str	r0, [r1]
	ldr	r1, [r4]
	ldr	r2, .L69+8
	cmp	r1, #200
	sub	sp, sp, #48
	strh	r2, [r3]	@ movhi
	ldr	r5, .L69+12
	ble	.L59
	ldr	r3, [r5]
	cmp	r3, #0
	beq	.L59
	ldr	r0, .L69+16
	cmp	r3, #2
	cmpgt	r1, r0
	ble	.L68
	cmp	r3, #4
	movgt	r2, #0
	movle	r2, #1
	sub	r1, r1, #600
	cmp	r1, r0
	movhi	r3, r2
	orrls	r3, r2, #1
	cmp	r3, #0
	beq	.L63
	ldr	r0, .L69+20
	ldr	r3, .L69+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L69+28
	ldr	r0, .L69+32
	mov	lr, pc
	bx	r3
	ldr	r6, .L69+36
	ldr	r2, [r4]
	ldr	r1, .L69+40
	add	r0, sp, #4
	mov	lr, pc
	bx	r6
	ldr	r4, .L69+44
	mov	r3, #7
	add	r2, sp, #4
	mov	r1, #170
	mov	r0, #70
	mov	lr, pc
	bx	r4
	ldr	r2, [r5]
	add	r0, sp, #4
	ldr	r1, .L69+40
	mov	lr, pc
	bx	r6
	add	r2, sp, #4
	mov	r3, #7
	b	.L67
.L59:
	ldr	r0, .L69+48
	ldr	r3, .L69+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L69+28
	ldr	r0, .L69+52
	mov	lr, pc
	bx	r3
	ldr	r6, .L69+36
	ldr	r2, [r4]
	ldr	r1, .L69+40
	add	r0, sp, #4
	mov	lr, pc
	bx	r6
	ldr	r4, .L69+44
	mov	r3, #4
	add	r2, sp, #4
	mov	r1, #170
	mov	r0, #70
	mov	lr, pc
	bx	r4
	ldr	r2, [r5]
	add	r0, sp, #4
	ldr	r1, .L69+40
	mov	lr, pc
	bx	r6
	mov	r3, #4
	add	r2, sp, #4
.L67:
	mov	r1, #180
	mov	r0, #110
	mov	lr, pc
	bx	r4
	ldr	r3, .L69+56
	mov	lr, pc
	bx	r3
.L58:
	add	sp, sp, #48
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L68:
	ldr	r0, .L69+60
	ldr	r3, .L69+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L69+28
	ldr	r0, .L69+64
	mov	lr, pc
	bx	r3
	ldr	r6, .L69+36
	ldr	r2, [r4]
	ldr	r1, .L69+40
	add	r0, sp, #4
	mov	lr, pc
	bx	r6
	ldr	r4, .L69+44
	mov	r3, #6
	add	r2, sp, #4
	mov	r1, #170
	mov	r0, #70
	mov	lr, pc
	bx	r4
	ldr	r2, [r5]
	add	r0, sp, #4
	ldr	r1, .L69+40
	mov	lr, pc
	bx	r6
	add	r2, sp, #4
	mov	r3, #6
	b	.L67
.L63:
	ldr	r0, .L69+68
	ldr	r3, .L69+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L69+28
	ldr	r0, .L69+72
	mov	lr, pc
	bx	r3
	ldr	r6, .L69+36
	ldr	r2, [r4]
	add	r0, sp, #4
	ldr	r1, .L69+40
	mov	lr, pc
	bx	r6
	ldr	r4, .L69+44
	add	r2, sp, #4
	mov	r3, #3
	mov	r1, #50
	mov	r0, #70
	mov	lr, pc
	bx	r4
	ldr	r2, [r5]
	add	r0, sp, #4
	ldr	r1, .L69+40
	mov	lr, pc
	bx	r6
	add	r2, sp, #4
	mov	r3, #3
	mov	r1, #55
	mov	r0, #110
	mov	lr, pc
	bx	r4
	ldr	r3, .L69+56
	mov	lr, pc
	bx	r3
	b	.L58
.L70:
	.align	2
.L69:
	.word	state
	.word	height
	.word	1044
	.word	score
	.word	599
	.word	okPal
	.word	loadPalette
	.word	drawBackgroundImage4
	.word	okBitmap
	.word	sprintf
	.word	.LC0
	.word	drawString
	.word	realbadPal
	.word	realbadBitmap
	.word	flipPage
	.word	badPal
	.word	badBitmap
	.word	awesomePal
	.word	awesomeBitmap
	.size	goToWinLose, .-goToWinLose
	.align	2
	.global	updateWinLose
	.type	updateWinLose, %function
updateWinLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L73
	ldr	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	updateWinLose.part.1
.L74:
	.align	2
.L73:
	.word	oldButtons
	.size	updateWinLose, .-updateWinLose
	.global	__aeabi_i2d
	.global	__aeabi_ddiv
	.global	__aeabi_d2iz
	.align	2
	.global	getDigit
	.type	getDigit, %function
getDigit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	mov	r5, r0
	ldr	r4, .L77
	mov	r0, r1
	mov	lr, pc
	bx	r4
	ldr	r6, .L77+4
	mov	r2, r0
	mov	r3, r1
	mov	r0, #0
	ldr	r1, .L77+8
	mov	lr, pc
	bx	r6
	mov	r6, r0
	mov	r7, r1
	mov	r0, r5
	mov	lr, pc
	bx	r4
	mov	r2, r6
	mov	r3, r7
	ldr	r4, .L77+12
	mov	lr, pc
	bx	r4
	ldr	r3, .L77+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L77+20
	smull	r1, r2, r3, r0
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #2
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, asl #1
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L78:
	.align	2
.L77:
	.word	__aeabi_i2d
	.word	pow
	.word	1076101120
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.word	1717986919
	.size	getDigit, .-getDigit
	.align	2
	.global	updateOAM
	.type	updateOAM, %function
updateOAM:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L105
	ldr	r2, [r3, #48]
	cmp	r2, #0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	beq	.L80
	ldr	r2, [r3, #8]
	mvn	r2, r2, asl #17
	mvn	r2, r2, lsr #17
	ldr	r1, [r3]
	ldr	r3, [r3, #28]
	ldr	ip, .L105+4
	mov	r1, r1, asr #8
	orr	r3, r3, #2048
	strh	r2, [ip, #34]	@ movhi
	strh	r1, [ip, #32]	@ movhi
	strh	r3, [ip, #36]	@ movhi
.L81:
	ldr	r5, .L105+4
	mov	r6, #512
	mov	ip, r5
	mov	r3, r5
	ldr	r2, .L105+8
	add	lr, r5, #72
.L84:
	ldr	r1, [r2]
	cmp	r1, #0
	ldrne	r1, [r2, #-4]
	ldrne	r0, [r2, #-20]
	addne	r1, r1, #128
	ldrne	r4, [r2, #-24]
	orrne	r1, r1, #2048
	orrne	r0, r0, #16384
	strneh	r1, [r3, #44]	@ movhi
	strneh	r0, [r3, #42]	@ movhi
	strneh	r4, [r3, #40]	@ movhi
	streqh	r6, [r3, #40]	@ movhi
	add	r3, r3, #8
	cmp	r3, lr
	add	r2, r2, #28
	bne	.L84
	mov	r6, #512
	ldr	r3, .L105+12
	ldr	r2, .L105+4
	add	r0, r3, #100
.L87:
	ldr	r1, [r3, #12]
	cmp	r1, #0
	ldrne	r1, [r3, #16]
	ldrne	r4, [r3]
	addne	r1, r1, #256
	ldrne	lr, [r3, #4]
	orrne	r1, r1, #2048
	add	r3, r3, #20
	strneh	r1, [r2, #124]	@ movhi
	strneh	r4, [r2, #120]	@ movhi
	strneh	lr, [r2, #122]	@ movhi
	streqh	r6, [r2, #120]	@ movhi
	cmp	r3, r0
	add	r2, r2, #8
	bne	.L87
	mov	r1, #202
	ldr	r7, .L105+16
	ldr	r0, [r7]
	mov	r3, #145
	cmp	r0, #7
	strh	r1, [ip, #4]	@ movhi
	moveq	r1, #512
	strh	r3, [ip, #16]	@ movhi
	ldrne	r1, .L105+20
	strh	r3, [ip]	@ movhi
	strh	r3, [ip, #8]	@ movhi
	ldr	r3, .L105+4
	ldr	r2, .L105+24
	streqh	r1, [r3, #16]	@ movhi
	strneh	r1, [r3, #10]	@ movhi
	mov	r1, #288
	strh	r2, [ip, #2]	@ movhi
	ldrne	r2, .L105+28
	addeq	r2, r2, #145
	streqh	r2, [r3, #10]	@ movhi
	strneh	r2, [r3, #18]	@ movhi
	mov	r0, #206
	mov	r2, #142
	mov	r4, #50
	mov	r10, #0
	mov	r8, #145
	ldr	r3, .L105+32
	ldr	r3, [r3]
	add	r3, r3, r1
	strh	r3, [ip, #28]	@ movhi
	ldr	r3, .L105+36
	strh	r0, [ip, #12]	@ movhi
	strh	r1, [ip, #20]	@ movhi
	strh	r2, [ip, #24]	@ movhi
	strh	r3, [ip, #26]	@ movhi
	ldr	r6, .L105+4
	ldr	r9, .L105+40
.L90:
	strh	r4, [r6, #170]	@ movhi
	mov	r1, r10
	strh	r8, [r6, #168]	@ movhi
	ldr	r0, [r9]
	bl	getDigit
	add	r10, r10, #1
	sub	r4, r4, #8
	add	r0, r0, #192
	mov	r4, r4, asl #16
	cmp	r10, #3
	strh	r0, [r6, #172]	@ movhi
	mov	r4, r4, lsr #16
	add	r6, r6, #8
	bne	.L90
	ldr	r3, [r7]
	cmp	r3, #0
	ble	.L94
	mov	r4, #230
	mov	r6, #0
	mov	r9, #145
	ldr	r8, .L105+44
.L91:
	mov	r1, r6
	ldr	r0, [r8]
	strh	r4, [r5, #202]	@ movhi
	strh	r9, [r5, #200]	@ movhi
	bl	getDigit
	ldr	r3, [r7]
	add	r6, r6, #1
	sub	r4, r4, #8
	add	r0, r0, #192
	mov	r4, r4, asl #16
	cmp	r3, r6
	strh	r0, [r5, #204]	@ movhi
	mov	r4, r4, lsr #16
	add	r5, r5, #8
	bgt	.L91
.L94:
	ldr	r3, .L105+48
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L104
	mov	r2, #512
	ldr	r3, .L105+52
	strh	r2, [r3], #8	@ movhi
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	strh	r2, [r3]	@ movhi
	bx	lr
.L80:
	mov	r3, #512
	ldr	ip, .L105+4
	strh	r3, [ip, #32]	@ movhi
	b	.L81
.L104:
	ldr	r3, .L105+52
	mov	r1, #40
	mov	r2, r3
	mov	lr, #352
	mov	ip, #360
	ldr	r4, .L105+56
	strh	r1, [r2, #8]!	@ movhi
	ldr	r0, .L105+60
	strh	r4, [r3, #2]	@ movhi
	strh	lr, [r3, #4]	@ movhi
	strh	ip, [r3, #12]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r0, [r2, #2]	@ movhi
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L106:
	.align	2
.L105:
	.word	player
	.word	shadowOAM
	.word	platforms+24
	.word	stars
	.word	cheat
	.word	-32628
	.word	-32763
	.word	-32678
	.word	soundSprite
	.word	16454
	.word	score
	.word	height
	.word	startGame
	.word	shadowOAM+480
	.word	-16324
	.word	-16259
	.size	updateOAM, .-updateOAM
	.global	__aeabi_idivmod
	.align	2
	.global	updateGame
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	mov	r1, #512
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r5, .L192
	ldr	r2, [r5]
	add	r2, r2, #1
	str	r2, [r5]
	ldr	r2, .L192+4
	sub	sp, sp, #12
.L108:
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L108
	ldr	r6, .L192+8
	ldr	r3, [r6]
	cmp	r3, #0
	beq	.L109
	ldr	r4, .L192+12
	ldr	r7, .L192+16
	ldr	r2, [r4, #16]
.L110:
	ldr	r0, [r4, #36]
	ldr	r1, [r4]
	ldr	r3, [r4, #12]
	add	r2, r2, r0
	add	r1, r2, r1
	rsb	r3, r3, #142
	cmp	r3, r1, asr #8
	str	r2, [r4, #16]
	str	r1, [r4]
	ldr	r2, .L192+12
	movle	r1, #0
	movle	r3, r3, asl #8
	strle	r3, [r2]
	strle	r1, [r2, #16]
.L147:
	ldr	r8, .L192+12
	ldr	r1, .L192+20
	mov	r0, r8
	ldr	r3, .L192+24
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	beq	.L182
	ldr	r3, .L192+28
	ldr	r2, [r8, #40]
	ldr	r3, [r3]
	rsb	r2, r2, #0
	cmp	r3, #0
	str	r2, [r8, #16]
	bne	.L115
	ldr	r2, .L192+32
	ldr	r1, .L192+36
	ldr	r0, .L192+40
	ldr	r9, .L192+44
	mov	lr, pc
	bx	r9
.L182:
	ldr	r2, [r8, #16]
	cmp	r2, #100
	bgt	.L185
.L116:
	ldr	r1, [r4]
	mov	r3, r2, lsr #31
	cmp	r1, #13568
	movge	r1, #0
	andlt	r1, r3, #1
.L148:
	mov	r3, #0
	cmp	r1, r3
	str	r3, [r4, #28]
	beq	.L186
	mov	r1, r3
	mov	fp, r3
	ldr	r10, .L192+48
	ldr	r8, .L192+52
	ldr	r0, [r10]
	str	r0, [sp]
	ldr	r0, [r8]
	ldr	ip, .L192+20
	str	r0, [sp, #4]
	ldr	r0, .L192+56
	mov	r2, r2, asr #8
.L124:
	ldr	lr, [ip, r3]
	cmp	r1, #4
	rsb	lr, r2, lr
	str	lr, [ip, r3]
	bgt	.L122
	ldr	lr, [r0, #4]
	cmp	lr, #0
	beq	.L122
	ldr	r9, [r0, #-8]
	ldr	lr, [r0]
	add	lr, r9, lr
	cmp	lr, #160
	rsble	r9, r2, r9
	strgt	fp, [r0, #4]
	strle	r9, [r0, #-8]
.L122:
	add	r1, r1, #1
	cmp	r1, #9
	add	r3, r3, #28
	add	r0, r0, #20
	bne	.L124
	ldr	r3, [sp]
	add	r2, r3, #9
	ldr	r3, [sp, #4]
	sub	r3, r3, #9
	str	r2, [r10]
	str	r3, [r8]
	b	.L125
.L109:
	ldr	r7, .L192+16
	ldr	r3, [r7]
	tst	r3, #1
	bne	.L187
.L183:
	ldr	r4, .L192+12
	ldr	r0, [r4, #16]
	ldr	r2, [r4, #36]
	ldr	r1, [r4]
	ldr	r3, [r4, #12]
	add	r2, r0, r2
	add	r1, r2, r1
	rsb	r3, r3, #142
	cmp	r3, r1, asr #8
	str	r1, [r4]
	str	r2, [r4, #16]
	ldr	r1, .L192+12
	ble	.L188
.L115:
	cmp	r2, #100
	ble	.L116
.L185:
	cmp	r2, #1000
	movgt	r3, #8
	movle	r3, #4
	ldr	r8, .L192+52
	str	r3, [r4, #28]
.L125:
	ldr	r3, [r5, #4]
	ldr	r2, .L192+60
	add	r3, r3, #1
	smull	r0, r1, r2, r3
	mov	r2, r3, asr #31
	rsb	r2, r2, r1, asr #2
	add	r2, r2, r2, lsl #2
	cmp	r3, r2, asl #1
	str	r3, [r5, #4]
	bne	.L121
	ldr	r1, .L192+64
	ldr	ip, .L192+68
	add	r0, r1, #100
.L129:
	ldr	r3, [r1, #12]
	cmp	r3, #0
	beq	.L128
	ldr	r3, [r1, #16]
	add	r3, r3, #1
	smull	lr, r2, ip, r3
	sub	r2, r2, r3, asr #31
	add	r2, r2, r2, lsl #1
	rsb	r3, r2, r3
	str	r3, [r1, #16]
.L128:
	add	r1, r1, #20
	cmp	r0, r1
	bne	.L129
.L121:
	ldr	r2, .L192+72
	ldr	r3, [r2]
	ldr	r9, .L192+76
	add	r3, r3, #1
	mov	r0, r3
	str	r3, [r2]
	ldr	r1, [r9]
	ldr	r3, .L192+80
	mov	lr, pc
	bx	r3
	cmp	r1, #0
	bne	.L127
	ldr	fp, .L192+64
	mov	r3, fp
.L131:
	ldr	r10, [r3, #12]
	cmp	r10, #0
	beq	.L189
	add	r1, r1, #1
	cmp	r1, #5
	add	r3, r3, #20
	bne	.L131
.L127:
	ldr	r1, .L192+64
	ldr	r0, .L192+12
	ldr	r3, .L192+84
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	beq	.L133
	ldr	r1, .L192+88
	ldr	r3, .L192+28
	ldr	r2, [r1]
	ldr	r3, [r3]
	add	r2, r2, #1
	cmp	r3, #0
	str	r2, [r1]
	beq	.L190
.L133:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	bne	.L135
	ldr	r3, [r4, #8]
	ldr	r2, .L192+12
	cmp	r3, #0
	ldrle	r3, [r2, #12]
	subgt	r3, r3, #3
	rsble	r3, r3, #239
	str	r3, [r2, #8]
.L135:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	bne	.L137
	add	r2, r4, #8
	ldmia	r2, {r2, r3}
	add	r3, r2, r3
	cmp	r3, #239
	movgt	r2, #0
	ldr	r3, .L192+12
	addle	r2, r2, #3
	str	r2, [r3, #8]
.L137:
	ldr	r3, [r7]
	tst	r3, #4
	ldr	r5, .L192+16
	beq	.L139
	ldr	r2, .L192+92
	ldr	r2, [r2]
	tst	r2, #4
	beq	.L191
.L139:
	tst	r3, #2
	beq	.L140
	ldr	r2, .L192+92
	ldr	r2, [r2]
	tst	r2, #2
	bne	.L140
	ldr	r2, .L192+96
	ldr	r1, [r2]
	cmp	r1, #7
	moveq	r1, #8
	movne	r1, #7
	str	r1, [r2]
.L140:
	tst	r3, #256
	beq	.L142
	ldr	r3, .L192+92
	ldr	r3, [r3]
	ands	r5, r3, #256
	bne	.L142
	ldr	r7, .L192+28
	ldr	r3, [r7]
	cmp	r3, #0
	bne	.L143
	ldr	r3, .L192+100
	mov	lr, pc
	bx	r3
	mov	r2, #6
	mov	r1, #1
	ldr	r3, .L192+104
	str	r1, [r7]
	str	r2, [r3]
.L142:
	ldr	r3, [r6]
	cmp	r3, #0
	beq	.L144
	ldr	r3, [r4, #48]
	cmp	r3, #0
	ldr	r2, .L192+12
	beq	.L145
	ldr	r1, [r2]
	ldr	r3, [r2, #12]
	add	r3, r3, r1, asr #8
	cmp	r3, #141
	ble	.L144
.L145:
	bl	goToWinLose
.L144:
	ldr	r0, .L192+20
	ldr	r3, .L192+108
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	mov	r3, r3, asr #8
	str	r3, [r4, #4]
	bl	updateOAM
	ldr	r4, .L192+112
	mov	r2, #117440512
	ldr	r1, .L192+4
	mov	r0, #3
	mov	r3, #512
	mov	lr, pc
	bx	r4
	ldr	r3, .L192+116
	mov	lr, pc
	bx	r3
	ldr	r3, [r8]
	cmp	r3, #0
	add	r2, r3, #3
	movge	r2, r3
	mov	r0, #67108864
	ldr	ip, .L192+120
	mov	r2, r2, asl #14
	ldr	r1, [ip]
	mov	r2, r2, lsr #16
	strh	r2, [r0, #22]	@ movhi
	add	r3, r3, r3, lsr #31
	add	r2, r1, r1, lsr #31
	mov	r3, r3, asl #15
	mov	r2, r2, asl #15
	mov	r3, r3, lsr #16
	add	r1, r1, #1
	mov	r2, r2, lsr #16
	str	r1, [ip]
	strh	r2, [r0, #20]	@ movhi
	strh	r3, [r0, #26]	@ movhi
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L187:
	ldr	r3, .L192+92
	ldr	r3, [r3]
	tst	r3, #1
	bne	.L183
	mov	r3, #1
	ldr	r4, .L192+12
	ldr	r2, [r4, #40]
	str	r3, [r6]
	rsb	r2, r2, #0
	b	.L110
.L143:
	ldr	r3, .L192+124
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L192+104
	str	r5, [r7]
	str	r2, [r3]
	b	.L142
.L191:
	bl	goToPause
	ldr	r3, [r5]
	b	.L139
.L190:
	ldr	r2, .L192+32
	ldr	r1, .L192+128
	ldr	r0, .L192+132
	ldr	r5, .L192+44
	mov	lr, pc
	bx	r5
	b	.L133
.L186:
	ldr	r8, .L192+52
	b	.L125
.L189:
	mov	ip, #1
	add	r1, r1, r1, lsl #2
	mov	r3, r1, asl #2
	add	r5, fp, r3
	ldr	r2, .L192+136
	str	ip, [r5, #12]
	mov	r1, #80
	mov	r0, r10
	str	r3, [sp, #4]
	str	r2, [sp]
	mov	lr, pc
	bx	r2
	ldr	r3, [sp, #4]
	ldr	r1, [r5, #8]
	str	r0, [fp, r3]
	rsb	r1, r1, #240
	ldr	r2, [sp]
	mov	r0, r10
	mov	lr, pc
	bx	r2
	ldr	r2, .L192+140
	str	r0, [r5, #4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L192+144
	smull	r1, r2, r3, r0
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #7
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, asl #4
	str	r3, [r9]
	b	.L127
.L188:
	mov	r0, #0
	mov	r3, r3, asl #8
	str	r3, [r1]
	str	r0, [r1, #16]
	mov	r2, r0
	mov	r1, r0
	b	.L148
.L193:
	.align	2
.L192:
	.word	.LANCHOR0
	.word	shadowOAM
	.word	startGame
	.word	player
	.word	oldButtons
	.word	platforms
	.word	platformCollisions
	.word	mute
	.word	11025
	.word	3308
	.word	jump
	.word	playSoundB
	.word	height
	.word	vOff
	.word	stars+8
	.word	1717986919
	.word	stars
	.word	1431655766
	.word	time
	.word	timeToNextObstacle
	.word	__aeabi_idivmod
	.word	starCollision
	.word	score
	.word	buttons
	.word	cheat
	.word	pauseSound
	.word	soundSprite
	.word	handlePlatforms
	.word	DMANow
	.word	waitForVblank
	.word	hOff
	.word	unpauseSound
	.word	5781
	.word	yeah
	.word	random
	.word	rand
	.word	1374389535
	.size	updateGame, .-updateGame
	.align	2
	.global	hideSprites
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	mov	r1, #512
	ldr	r2, .L197
.L195:
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L195
	bx	lr
.L198:
	.align	2
.L197:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.align	2
	.global	initialize
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, #1536
	mov	ip, #1
	mov	fp, #32
	mov	r10, #24832
	mov	r9, #128
	mov	r8, #104
	mov	r7, #120
	mov	r6, #3
	mov	r5, #4
	mov	lr, #7
	mov	r0, #8
	ldr	r3, .L213
	str	r1, [r3]
	ldr	r3, .L213+4
	str	r1, [r3]
	ldr	r3, .L213+8
	str	r1, [r3]
	ldr	r3, .L213+12
	str	r1, [r3]
	ldr	r3, .L213+16
	str	r4, [r3, #40]
	ldr	r4, .L213+20
	str	r1, [r3, #28]
	mov	r2, r1
	str	fp, [r3, #12]
	ldr	r1, .L213+24
	str	r10, [r3]
	str	r9, [r3, #4]
	str	r8, [r3, #8]
	str	r7, [r3, #36]
	str	r6, [r3, #44]
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	str	ip, [r3, #48]
	ldr	r3, .L213+28
	str	r5, [r4]
	str	lr, [r1]
	add	r1, r3, #100
.L200:
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r0, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #16]
	add	r3, r3, #20
	cmp	r3, r1
	bne	.L200
	ldr	r8, .L213+32
	mov	r4, #0
	mov	r10, #16
	mov	r6, #4
	mov	r5, #1
	ldr	fp, .L213+36
	ldr	r9, .L213+40
	ldr	r7, .L213+44
	b	.L205
.L202:
	add	r4, r4, #18
	cmp	r4, #162
	add	fp, fp, #28
	beq	.L212
.L205:
	mov	r1, #223
	mov	r0, #0
	str	r10, [fp]
	str	r6, [fp, #4]
	str	r5, [fp, #8]
	str	r5, [fp, #16]
	mov	lr, pc
	bx	r9
	str	r4, [fp, #-8]
	str	r0, [fp, #-4]
	mov	lr, pc
	bx	r8
	smull	r3, r1, r7, r0
	mov	r2, r0, asr #31
	rsb	r2, r2, r1, asr #1
	add	r2, r2, r2, lsl #2
	cmp	r0, r2
	streq	r6, [fp, #12]
	beq	.L202
	ldr	r3, .L213+32
	mov	lr, pc
	bx	r3
	smull	r3, r2, r7, r0
	mov	r1, r0, asr #31
	rsb	r2, r1, r2, asr #1
	add	r2, r2, r2, lsl #2
	rsb	r2, r2, r0
	cmp	r2, #1
	beq	.L204
	ldr	r3, .L213+32
	mov	lr, pc
	bx	r3
	smull	r3, r2, r7, r0
	mov	r1, r0, asr #31
	rsb	r2, r1, r2, asr #1
	add	r2, r2, r2, lsl #2
	rsb	r2, r2, r0
	cmp	r2, #2
	beq	.L204
	mov	r2, #0
	add	r4, r4, #18
	cmp	r4, #162
	str	r2, [fp, #12]
	add	fp, fp, #28
	bne	.L205
.L212:
	mov	r2, #0
	ldr	r3, .L213+48
	str	r2, [r3]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L204:
	mov	r2, #2
	str	r2, [fp, #12]
	b	.L202
.L214:
	.align	2
.L213:
	.word	height
	.word	score
	.word	startGame
	.word	mute
	.word	player
	.word	soundSprite
	.word	cheat
	.word	stars
	.word	rand
	.word	platforms+8
	.word	random
	.word	1717986919
	.word	time
	.size	initialize, .-initialize
	.align	2
	.global	updateSplash
	.type	updateSplash, %function
updateSplash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r4, .L233
	ldr	r5, .L233+4
	ldr	r2, [r4, #8]
	ldr	r3, [r5]
	add	r2, r2, #1
	tst	r3, #8
	sub	sp, sp, #8
	str	r2, [r4, #8]
	beq	.L216
	ldr	r2, .L233+8
	ldr	r0, [r2]
	ands	r6, r0, #8
	beq	.L230
.L216:
	tst	r3, #128
	beq	.L218
	ldr	r2, .L233+8
	ldr	r2, [r2]
	ands	r4, r2, #128
	beq	.L231
.L218:
	tst	r3, #64
	beq	.L215
	ldr	r3, .L233+8
	ldr	r3, [r3]
	tst	r3, #64
	beq	.L232
.L215:
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L230:
	ldr	r3, .L233+12
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L217
	ldr	r3, .L233+16
	mov	lr, pc
	bx	r3
	ldr	r0, [r4, #8]
	ldr	r3, .L233+20
	mov	lr, pc
	bx	r3
	mov	r0, r6
	ldr	r3, .L233+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L233+28
	mov	lr, pc
	bx	r3
	ldr	r4, .L233+32
	bl	initialize
	mov	r3, #1
	ldr	r2, .L233+36
	ldr	r1, .L233+40
	ldr	r0, .L233+44
	mov	lr, pc
	bx	r4
	bl	goToGame
	ldr	r3, [r5]
	b	.L216
.L232:
	ldr	r0, .L233+48
	ldr	r3, .L233+52
	mov	lr, pc
	bx	r3
	mov	r2, #5
	mov	r0, #115
	str	r2, [sp]
	mov	r3, #40
	mov	r2, #4
	mov	r1, #10
	ldr	r4, .L233+56
	mov	lr, pc
	bx	r4
	mov	r1, #1
	ldr	r2, .L233+12
	ldr	r3, .L233+16
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L231:
	ldr	r0, .L233+48
	ldr	r3, .L233+52
	mov	lr, pc
	bx	r3
	mov	r2, #5
	mov	r3, #100
	str	r2, [sp]
	mov	r1, #10
	mov	r2, #4
	mov	r0, #145
	ldr	r6, .L233+56
	mov	lr, pc
	bx	r6
	ldr	r2, .L233+12
	ldr	r3, .L233+16
	str	r4, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, [r5]
	b	.L218
.L217:
	bl	goToInstructions
	ldr	r3, [r5]
	b	.L216
.L234:
	.align	2
.L233:
	.word	.LANCHOR0
	.word	oldButtons
	.word	buttons
	.word	startInstr
	.word	flipPage
	.word	srand
	.word	fillScreen4
	.word	stopSound
	.word	playSoundA
	.word	11025
	.word	350754
	.word	happy
	.word	startBitmap
	.word	drawBackgroundImage4
	.word	drawRect4
	.size	updateSplash, .-updateSplash
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r10, .L248
	stmfd	sp!, {r4, r7, fp, lr}
	ldr	r3, .L248+4
	str	r2, [r10]
	mov	lr, pc
	bx	r3
	ldr	r3, .L248+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L248+12
	mov	lr, pc
	bx	r3
	mov	r5, #67108864
	ldr	fp, .L248+16
	ldr	r4, .L248+20
	ldr	r9, .L248+24
	ldr	r8, .L248+28
	ldr	r7, .L248+32
	ldr	r6, .L248+36
.L236:
	ldr	r2, [fp]
	str	r2, [r4]
	ldr	r3, [r10]
	ldr	r1, [r5, #304]
	str	r1, [fp]
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L236
.L239:
	.word	.L238
	.word	.L240
	.word	.L241
	.word	.L242
	.word	.L243
.L243:
	tst	r2, #8
	beq	.L236
	ldr	r3, .L248+40
	mov	lr, pc
	bx	r3
	b	.L236
.L242:
	mov	lr, pc
	bx	r6
	b	.L236
.L240:
	mov	lr, pc
	bx	r8
	b	.L236
.L238:
	mov	lr, pc
	bx	r9
	b	.L236
.L241:
	mov	lr, pc
	bx	r7
	b	.L236
.L249:
	.align	2
.L248:
	.word	state
	.word	goToSplash
	.word	setupInterrupts
	.word	setupSounds
	.word	buttons
	.word	oldButtons
	.word	updateSplash
	.word	updateInstructions
	.word	updateGame
	.word	updatePause
	.word	updateWinLose.part.1
	.size	main, .-main
	.comm	stars,100,4
	.comm	platforms,252,4
	.comm	player,52,4
	.comm	soundSprite,4,4
	.comm	mute,4,4
	.comm	cheat,4,4
	.comm	startGame,4,4
	.comm	time,4,4
	.comm	timeToNextObstacle,4,4
	.comm	hOff,4,4
	.comm	vOff,4,4
	.comm	score,4,4
	.comm	height,4,4
	.global	seed
	.comm	startInstr,4,4
	.global	move
	.global	ani
	.global	timer
	.comm	shadowOAM,1024,4
	.comm	fontdata_6x8,12288,4
	.comm	state,4,4
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.data
	.align	2
	.type	move, %object
	.size	move, 4
move:
	.word	1
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"%d\000"
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	timer, %object
	.size	timer, 4
timer:
	.space	4
	.type	ani, %object
	.size	ani, 4
ani:
	.space	4
	.type	seed, %object
	.size	seed, 4
seed:
	.space	4
	.ident	"GCC: (devkitARM release 45) 5.3.0"
