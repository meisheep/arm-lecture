	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r3, r4, r5, r6, lr}

	mov r3, #1 @ result = 1
	mov r4, #-1 @ previous = -1
	mov r5, #0 @ sum = 0
	mov r6, #0 @ index =0

.loop:
	add r5, r3, r4 @ sum = result + previous
	mov r4, r3 @ previous = result
	mov r3, r5 @ result = sum
	add r6, r6, #1 @ index += 1

	cmp r6, r0
	it le @ if less or equal then
	ble .loop @ continue loop

	mov r0, r3 @ R0 = R3
	pop {r3, r4, r5, r6, pc} @ return result

	.size fibonacci, .-fibonacci
	.end
