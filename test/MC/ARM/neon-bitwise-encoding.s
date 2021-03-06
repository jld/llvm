@ RUN: llvm-mc -mcpu=cortex-a8 -triple arm-unknown-unknown -show-encoding < %s | FileCheck %s

	vand	d16, d17, d16
	vand	q8, q8, q9

@ CHECK: vand	d16, d17, d16           @ encoding: [0xb0,0x01,0x41,0xf2]
@ CHECK: vand	q8, q8, q9              @ encoding: [0xf2,0x01,0x40,0xf2]

	veor	d16, d17, d16
	veor	q8, q8, q9

@ CHECK: veor	d16, d17, d16           @ encoding: [0xb0,0x01,0x41,0xf3]
@ CHECK: veor	q8, q8, q9              @ encoding: [0xf2,0x01,0x40,0xf3]

	vorr	d16, d17, d16
	vorr	q8, q8, q9

@ CHECK: vorr	d16, d17, d16           @ encoding: [0xb0,0x01,0x61,0xf2]
@ CHECK: vorr	q8, q8, q9              @ encoding: [0xf2,0x01,0x60,0xf2]

	vorr.i32	d16, #0x1000000
	vorr.i32	q8, #0x1000000
	vorr.i32	q8, #0x0

@ CHECK: vorr.i32	d16, #0x1000000 @ encoding: [0x11,0x07,0xc0,0xf2]
@ CHECK: vorr.i32	q8, #0x1000000  @ encoding: [0x51,0x07,0xc0,0xf2]
@ CHECK: vorr.i32	q8, #0x0        @ encoding: [0x50,0x01,0xc0,0xf2]

	vbic	d16, d17, d16
	vbic	q8, q8, q9
	vbic.i32	d16, #0xFF000000
	vbic.i32	q8, #0xFF000000

@ CHECK: vbic	d16, d17, d16           @ encoding: [0xb0,0x01,0x51,0xf2]
@ CHECK: vbic	q8, q8, q9              @ encoding: [0xf2,0x01,0x50,0xf2]
@ CHECK: vbic.i32	d16, #0xff000000 @ encoding: [0x3f,0x07,0xc7,0xf3]
@ CHECK: vbic.i32	q8, #0xff000000 @ encoding: [0x7f,0x07,0xc7,0xf3]

	vorn	d16, d17, d16
	vorn	q8, q8, q9

@ CHECK: vorn	d16, d17, d16           @ encoding: [0xb0,0x01,0x71,0xf2]
@ CHECK: vorn	q8, q8, q9              @ encoding: [0xf2,0x01,0x70,0xf2]

	vmvn	d16, d16
	vmvn	q8, q8

@ CHECK: vmvn	d16, d16                @ encoding: [0xa0,0x05,0xf0,0xf3]
@ CHECK: vmvn	q8, q8                  @ encoding: [0xe0,0x05,0xf0,0xf3]

	vbsl	d18, d17, d16
	vbsl	q8, q10, q9

@ CHECK: vbsl	d18, d17, d16           @ encoding: [0xb0,0x21,0x51,0xf3]
@ CHECK: vbsl	q8, q10, q9             @ encoding: [0xf2,0x01,0x54,0xf3]


@ Size suffices are optional.
        veor q4, q7, q3
        veor.8 q4, q7, q3
        veor.16 q4, q7, q3
        veor.32 q4, q7, q3
        veor.64 q4, q7, q3

        veor.i8 q4, q7, q3
        veor.i16 q4, q7, q3
        veor.i32 q4, q7, q3
        veor.i64 q4, q7, q3

        veor.s8 q4, q7, q3
        veor.s16 q4, q7, q3
        veor.s32 q4, q7, q3
        veor.s64 q4, q7, q3

        veor.u8 q4, q7, q3
        veor.u16 q4, q7, q3
        veor.u32 q4, q7, q3
        veor.u64 q4, q7, q3

        veor.p8 q4, q7, q3
        veor.p16 q4, q7, q3
        veor.f32 q4, q7, q3
        veor.f64 q4, q7, q3

        veor.f q4, q7, q3
        veor.d q4, q7, q3

@ CHECK: veor	q4, q7, q3              @ encoding: [0x56,0x81,0x0e,0xf3]
@ CHECK: veor	q4, q7, q3              @ encoding: [0x56,0x81,0x0e,0xf3]
@ CHECK: veor	q4, q7, q3              @ encoding: [0x56,0x81,0x0e,0xf3]
@ CHECK: veor	q4, q7, q3              @ encoding: [0x56,0x81,0x0e,0xf3]
@ CHECK: veor	q4, q7, q3              @ encoding: [0x56,0x81,0x0e,0xf3]

@ CHECK: veor	q4, q7, q3              @ encoding: [0x56,0x81,0x0e,0xf3]
@ CHECK: veor	q4, q7, q3              @ encoding: [0x56,0x81,0x0e,0xf3]
@ CHECK: veor	q4, q7, q3              @ encoding: [0x56,0x81,0x0e,0xf3]
@ CHECK: veor	q4, q7, q3              @ encoding: [0x56,0x81,0x0e,0xf3]

@ CHECK: veor	q4, q7, q3              @ encoding: [0x56,0x81,0x0e,0xf3]
@ CHECK: veor	q4, q7, q3              @ encoding: [0x56,0x81,0x0e,0xf3]
@ CHECK: veor	q4, q7, q3              @ encoding: [0x56,0x81,0x0e,0xf3]
@ CHECK: veor	q4, q7, q3              @ encoding: [0x56,0x81,0x0e,0xf3]

@ CHECK: veor	q4, q7, q3              @ encoding: [0x56,0x81,0x0e,0xf3]
@ CHECK: veor	q4, q7, q3              @ encoding: [0x56,0x81,0x0e,0xf3]
@ CHECK: veor	q4, q7, q3              @ encoding: [0x56,0x81,0x0e,0xf3]
@ CHECK: veor	q4, q7, q3              @ encoding: [0x56,0x81,0x0e,0xf3]

@ CHECK: veor	q4, q7, q3              @ encoding: [0x56,0x81,0x0e,0xf3]
@ CHECK: veor	q4, q7, q3              @ encoding: [0x56,0x81,0x0e,0xf3]
@ CHECK: veor	q4, q7, q3              @ encoding: [0x56,0x81,0x0e,0xf3]
@ CHECK: veor	q4, q7, q3              @ encoding: [0x56,0x81,0x0e,0xf3]

@ CHECK: veor	q4, q7, q3              @ encoding: [0x56,0x81,0x0e,0xf3]
@ CHECK: veor	q4, q7, q3              @ encoding: [0x56,0x81,0x0e,0xf3]


        vand d4, d7, d3
        vand.8 d4, d7, d3
        vand.16 d4, d7, d3
        vand.32 d4, d7, d3
        vand.64 d4, d7, d3

        vand.i8 d4, d7, d3
        vand.i16 d4, d7, d3
        vand.i32 d4, d7, d3
        vand.i64 d4, d7, d3

        vand.s8 d4, d7, d3
        vand.s16 d4, d7, d3
        vand.s32 d4, d7, d3
        vand.s64 d4, d7, d3

        vand.u8 d4, d7, d3
        vand.u16 d4, d7, d3
        vand.u32 d4, d7, d3
        vand.u64 d4, d7, d3

        vand.p8 d4, d7, d3
        vand.p16 d4, d7, d3
        vand.f32 d4, d7, d3
        vand.f64 d4, d7, d3

        vand.f d4, d7, d3
        vand.d d4, d7, d3

@ CHECK: vand	d4, d7, d3              @ encoding: [0x13,0x41,0x07,0xf2]
@ CHECK: vand	d4, d7, d3              @ encoding: [0x13,0x41,0x07,0xf2]
@ CHECK: vand	d4, d7, d3              @ encoding: [0x13,0x41,0x07,0xf2]
@ CHECK: vand	d4, d7, d3              @ encoding: [0x13,0x41,0x07,0xf2]
@ CHECK: vand	d4, d7, d3              @ encoding: [0x13,0x41,0x07,0xf2]

@ CHECK: vand	d4, d7, d3              @ encoding: [0x13,0x41,0x07,0xf2]
@ CHECK: vand	d4, d7, d3              @ encoding: [0x13,0x41,0x07,0xf2]
@ CHECK: vand	d4, d7, d3              @ encoding: [0x13,0x41,0x07,0xf2]
@ CHECK: vand	d4, d7, d3              @ encoding: [0x13,0x41,0x07,0xf2]

@ CHECK: vand	d4, d7, d3              @ encoding: [0x13,0x41,0x07,0xf2]
@ CHECK: vand	d4, d7, d3              @ encoding: [0x13,0x41,0x07,0xf2]
@ CHECK: vand	d4, d7, d3              @ encoding: [0x13,0x41,0x07,0xf2]
@ CHECK: vand	d4, d7, d3              @ encoding: [0x13,0x41,0x07,0xf2]

@ CHECK: vand	d4, d7, d3              @ encoding: [0x13,0x41,0x07,0xf2]
@ CHECK: vand	d4, d7, d3              @ encoding: [0x13,0x41,0x07,0xf2]
@ CHECK: vand	d4, d7, d3              @ encoding: [0x13,0x41,0x07,0xf2]
@ CHECK: vand	d4, d7, d3              @ encoding: [0x13,0x41,0x07,0xf2]

@ CHECK: vand	d4, d7, d3              @ encoding: [0x13,0x41,0x07,0xf2]
@ CHECK: vand	d4, d7, d3              @ encoding: [0x13,0x41,0x07,0xf2]
@ CHECK: vand	d4, d7, d3              @ encoding: [0x13,0x41,0x07,0xf2]
@ CHECK: vand	d4, d7, d3              @ encoding: [0x13,0x41,0x07,0xf2]

@ CHECK: vand	d4, d7, d3              @ encoding: [0x13,0x41,0x07,0xf2]
@ CHECK: vand	d4, d7, d3              @ encoding: [0x13,0x41,0x07,0xf2]

        vorr d4, d7, d3
        vorr.8 d4, d7, d3
        vorr.16 d4, d7, d3
        vorr.32 d4, d7, d3
        vorr.64 d4, d7, d3

        vorr.i8 d4, d7, d3
        vorr.i16 d4, d7, d3
        vorr.i32 d4, d7, d3
        vorr.i64 d4, d7, d3

        vorr.s8 d4, d7, d3
        vorr.s16 d4, d7, d3
        vorr.s32 q4, q7, q3
        vorr.s64 q4, q7, q3

        vorr.u8 q4, q7, q3
        vorr.u16 q4, q7, q3
        vorr.u32 q4, q7, q3
        vorr.u64 q4, q7, q3

        vorr.p8 q4, q7, q3
        vorr.p16 q4, q7, q3
        vorr.f32 q4, q7, q3
        vorr.f64 q4, q7, q3

        vorr.f q4, q7, q3
        vorr.d q4, q7, q3

@ CHECK: vorr	d4, d7, d3              @ encoding: [0x13,0x41,0x27,0xf2]
@ CHECK: vorr	d4, d7, d3              @ encoding: [0x13,0x41,0x27,0xf2]
@ CHECK: vorr	d4, d7, d3              @ encoding: [0x13,0x41,0x27,0xf2]
@ CHECK: vorr	d4, d7, d3              @ encoding: [0x13,0x41,0x27,0xf2]
@ CHECK: vorr	d4, d7, d3              @ encoding: [0x13,0x41,0x27,0xf2]

@ CHECK: vorr	d4, d7, d3              @ encoding: [0x13,0x41,0x27,0xf2]
@ CHECK: vorr	d4, d7, d3              @ encoding: [0x13,0x41,0x27,0xf2]
@ CHECK: vorr	d4, d7, d3              @ encoding: [0x13,0x41,0x27,0xf2]
@ CHECK: vorr	d4, d7, d3              @ encoding: [0x13,0x41,0x27,0xf2]

@ CHECK: vorr	d4, d7, d3              @ encoding: [0x13,0x41,0x27,0xf2]
@ CHECK: vorr	d4, d7, d3              @ encoding: [0x13,0x41,0x27,0xf2]
@ CHECK: vorr	q4, q7, q3              @ encoding: [0x56,0x81,0x2e,0xf2]
@ CHECK: vorr	q4, q7, q3              @ encoding: [0x56,0x81,0x2e,0xf2]

@ CHECK: vorr	q4, q7, q3              @ encoding: [0x56,0x81,0x2e,0xf2]
@ CHECK: vorr	q4, q7, q3              @ encoding: [0x56,0x81,0x2e,0xf2]
@ CHECK: vorr	q4, q7, q3              @ encoding: [0x56,0x81,0x2e,0xf2]
@ CHECK: vorr	q4, q7, q3              @ encoding: [0x56,0x81,0x2e,0xf2]

@ CHECK: vorr	q4, q7, q3              @ encoding: [0x56,0x81,0x2e,0xf2]
@ CHECK: vorr	q4, q7, q3              @ encoding: [0x56,0x81,0x2e,0xf2]
@ CHECK: vorr	q4, q7, q3              @ encoding: [0x56,0x81,0x2e,0xf2]
@ CHECK: vorr	q4, q7, q3              @ encoding: [0x56,0x81,0x2e,0xf2]

@ CHECK: vorr	q4, q7, q3              @ encoding: [0x56,0x81,0x2e,0xf2]
@ CHECK: vorr	q4, q7, q3              @ encoding: [0x56,0x81,0x2e,0xf2]

@ Two-operand aliases
	vand  q6, q5
	vand.s8  q6, q5
	vand.s16 q7, q1
	vand.s32 q8, q2
	vand.f64 q8, q2

	veor   q6, q5
	veor.8   q6, q5
	veor.p16 q7, q1
	veor.u32 q8, q2
	veor.d   q8, q2

	veor  q6, q5
	veor.i8  q6, q5
	veor.16  q7, q1
	veor.f   q8, q2
	veor.i64 q8, q2

@ CHECK: vand	q6, q6, q5              @ encoding: [0x5a,0xc1,0x0c,0xf2]
@ CHECK: vand	q6, q6, q5              @ encoding: [0x5a,0xc1,0x0c,0xf2]
@ CHECK: vand	q7, q7, q1              @ encoding: [0x52,0xe1,0x0e,0xf2]
@ CHECK: vand	q8, q8, q2              @ encoding: [0xd4,0x01,0x40,0xf2]
@ CHECK: vand	q8, q8, q2              @ encoding: [0xd4,0x01,0x40,0xf2]

@ CHECK: veor	q6, q6, q5              @ encoding: [0x5a,0xc1,0x0c,0xf3]
@ CHECK: veor	q6, q6, q5              @ encoding: [0x5a,0xc1,0x0c,0xf3]
@ CHECK: veor	q7, q7, q1              @ encoding: [0x52,0xe1,0x0e,0xf3]
@ CHECK: veor	q8, q8, q2              @ encoding: [0xd4,0x01,0x40,0xf3]
@ CHECK: veor	q8, q8, q2              @ encoding: [0xd4,0x01,0x40,0xf3]

@ CHECK: veor	q6, q6, q5              @ encoding: [0x5a,0xc1,0x0c,0xf3]
@ CHECK: veor	q6, q6, q5              @ encoding: [0x5a,0xc1,0x0c,0xf3]
@ CHECK: veor	q7, q7, q1              @ encoding: [0x52,0xe1,0x0e,0xf3]
@ CHECK: veor	q8, q8, q2              @ encoding: [0xd4,0x01,0x40,0xf3]
@ CHECK: veor	q8, q8, q2              @ encoding: [0xd4,0x01,0x40,0xf3]
