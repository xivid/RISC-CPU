/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "Function conv_seg ended without a return statement";
static const char *ng1 = "C:/Users/Administrator/CPU/RISC-CPU/RISC-CPU/CPU.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1690584930_503743352(char *, unsigned char );


char *work_a_1415465652_3212880686_sub_481989754_3057020925(char *t1, char *t2, char *t3, char *t4)
{
    char t6[24];
    char *t0;
    char *t7;
    unsigned char t8;
    char *t9;
    char *t10;
    int t12;
    char *t13;
    char *t14;
    int t15;
    char *t16;
    int t18;
    char *t19;
    int t21;
    char *t22;
    int t24;
    char *t25;
    int t27;
    char *t28;
    int t30;
    char *t31;
    int t33;
    char *t34;
    int t36;
    char *t37;
    int t39;
    char *t40;
    int t42;
    char *t43;
    int t45;
    char *t46;
    int t48;
    char *t49;
    int t51;
    char *t52;
    int t54;
    char *t55;
    int t57;
    char *t58;
    char *t60;
    char *t61;
    int t62;
    unsigned int t63;

LAB0:    t7 = (t6 + 4U);
    t8 = (t3 != 0);
    if (t8 == 1)
        goto LAB3;

LAB2:    t9 = (t6 + 12U);
    *((char **)t9) = t4;
    t10 = (t1 + 17175);
    t12 = xsi_mem_cmp(t10, t3, 4U);
    if (t12 == 1)
        goto LAB5;

LAB22:    t13 = (t1 + 17179);
    t15 = xsi_mem_cmp(t13, t3, 4U);
    if (t15 == 1)
        goto LAB6;

LAB23:    t16 = (t1 + 17183);
    t18 = xsi_mem_cmp(t16, t3, 4U);
    if (t18 == 1)
        goto LAB7;

LAB24:    t19 = (t1 + 17187);
    t21 = xsi_mem_cmp(t19, t3, 4U);
    if (t21 == 1)
        goto LAB8;

LAB25:    t22 = (t1 + 17191);
    t24 = xsi_mem_cmp(t22, t3, 4U);
    if (t24 == 1)
        goto LAB9;

LAB26:    t25 = (t1 + 17195);
    t27 = xsi_mem_cmp(t25, t3, 4U);
    if (t27 == 1)
        goto LAB10;

LAB27:    t28 = (t1 + 17199);
    t30 = xsi_mem_cmp(t28, t3, 4U);
    if (t30 == 1)
        goto LAB11;

LAB28:    t31 = (t1 + 17203);
    t33 = xsi_mem_cmp(t31, t3, 4U);
    if (t33 == 1)
        goto LAB12;

LAB29:    t34 = (t1 + 17207);
    t36 = xsi_mem_cmp(t34, t3, 4U);
    if (t36 == 1)
        goto LAB13;

LAB30:    t37 = (t1 + 17211);
    t39 = xsi_mem_cmp(t37, t3, 4U);
    if (t39 == 1)
        goto LAB14;

LAB31:    t40 = (t1 + 17215);
    t42 = xsi_mem_cmp(t40, t3, 4U);
    if (t42 == 1)
        goto LAB15;

LAB32:    t43 = (t1 + 17219);
    t45 = xsi_mem_cmp(t43, t3, 4U);
    if (t45 == 1)
        goto LAB16;

LAB33:    t46 = (t1 + 17223);
    t48 = xsi_mem_cmp(t46, t3, 4U);
    if (t48 == 1)
        goto LAB17;

LAB34:    t49 = (t1 + 17227);
    t51 = xsi_mem_cmp(t49, t3, 4U);
    if (t51 == 1)
        goto LAB18;

LAB35:    t52 = (t1 + 17231);
    t54 = xsi_mem_cmp(t52, t3, 4U);
    if (t54 == 1)
        goto LAB19;

LAB36:    t55 = (t1 + 17235);
    t57 = xsi_mem_cmp(t55, t3, 4U);
    if (t57 == 1)
        goto LAB20;

LAB37:
LAB21:    t10 = (t1 + 17351);
    t0 = xsi_get_transient_memory(7U);
    memcpy(t0, t10, 7U);
    t13 = (t2 + 0U);
    t14 = (t13 + 0U);
    *((int *)t14) = 1;
    t14 = (t13 + 4U);
    *((int *)t14) = 7;
    t14 = (t13 + 8U);
    *((int *)t14) = 1;
    t12 = (7 - 1);
    t63 = (t12 * 1);
    t63 = (t63 + 1);
    t14 = (t13 + 12U);
    *((unsigned int *)t14) = t63;

LAB1:    return t0;
LAB3:    *((char **)t7) = t3;
    goto LAB2;

LAB4:    xsi_error(ng0);
    t0 = 0;
    goto LAB1;

LAB5:    t58 = (t1 + 17239);
    t0 = xsi_get_transient_memory(7U);
    memcpy(t0, t58, 7U);
    t60 = (t2 + 0U);
    t61 = (t60 + 0U);
    *((int *)t61) = 1;
    t61 = (t60 + 4U);
    *((int *)t61) = 7;
    t61 = (t60 + 8U);
    *((int *)t61) = 1;
    t62 = (7 - 1);
    t63 = (t62 * 1);
    t63 = (t63 + 1);
    t61 = (t60 + 12U);
    *((unsigned int *)t61) = t63;
    goto LAB1;

LAB6:    t10 = (t1 + 17246);
    t0 = xsi_get_transient_memory(7U);
    memcpy(t0, t10, 7U);
    t13 = (t2 + 0U);
    t14 = (t13 + 0U);
    *((int *)t14) = 1;
    t14 = (t13 + 4U);
    *((int *)t14) = 7;
    t14 = (t13 + 8U);
    *((int *)t14) = 1;
    t12 = (7 - 1);
    t63 = (t12 * 1);
    t63 = (t63 + 1);
    t14 = (t13 + 12U);
    *((unsigned int *)t14) = t63;
    goto LAB1;

LAB7:    t10 = (t1 + 17253);
    t0 = xsi_get_transient_memory(7U);
    memcpy(t0, t10, 7U);
    t13 = (t2 + 0U);
    t14 = (t13 + 0U);
    *((int *)t14) = 1;
    t14 = (t13 + 4U);
    *((int *)t14) = 7;
    t14 = (t13 + 8U);
    *((int *)t14) = 1;
    t12 = (7 - 1);
    t63 = (t12 * 1);
    t63 = (t63 + 1);
    t14 = (t13 + 12U);
    *((unsigned int *)t14) = t63;
    goto LAB1;

LAB8:    t10 = (t1 + 17260);
    t0 = xsi_get_transient_memory(7U);
    memcpy(t0, t10, 7U);
    t13 = (t2 + 0U);
    t14 = (t13 + 0U);
    *((int *)t14) = 1;
    t14 = (t13 + 4U);
    *((int *)t14) = 7;
    t14 = (t13 + 8U);
    *((int *)t14) = 1;
    t12 = (7 - 1);
    t63 = (t12 * 1);
    t63 = (t63 + 1);
    t14 = (t13 + 12U);
    *((unsigned int *)t14) = t63;
    goto LAB1;

LAB9:    t10 = (t1 + 17267);
    t0 = xsi_get_transient_memory(7U);
    memcpy(t0, t10, 7U);
    t13 = (t2 + 0U);
    t14 = (t13 + 0U);
    *((int *)t14) = 1;
    t14 = (t13 + 4U);
    *((int *)t14) = 7;
    t14 = (t13 + 8U);
    *((int *)t14) = 1;
    t12 = (7 - 1);
    t63 = (t12 * 1);
    t63 = (t63 + 1);
    t14 = (t13 + 12U);
    *((unsigned int *)t14) = t63;
    goto LAB1;

LAB10:    t10 = (t1 + 17274);
    t0 = xsi_get_transient_memory(7U);
    memcpy(t0, t10, 7U);
    t13 = (t2 + 0U);
    t14 = (t13 + 0U);
    *((int *)t14) = 1;
    t14 = (t13 + 4U);
    *((int *)t14) = 7;
    t14 = (t13 + 8U);
    *((int *)t14) = 1;
    t12 = (7 - 1);
    t63 = (t12 * 1);
    t63 = (t63 + 1);
    t14 = (t13 + 12U);
    *((unsigned int *)t14) = t63;
    goto LAB1;

LAB11:    t10 = (t1 + 17281);
    t0 = xsi_get_transient_memory(7U);
    memcpy(t0, t10, 7U);
    t13 = (t2 + 0U);
    t14 = (t13 + 0U);
    *((int *)t14) = 1;
    t14 = (t13 + 4U);
    *((int *)t14) = 7;
    t14 = (t13 + 8U);
    *((int *)t14) = 1;
    t12 = (7 - 1);
    t63 = (t12 * 1);
    t63 = (t63 + 1);
    t14 = (t13 + 12U);
    *((unsigned int *)t14) = t63;
    goto LAB1;

LAB12:    t10 = (t1 + 17288);
    t0 = xsi_get_transient_memory(7U);
    memcpy(t0, t10, 7U);
    t13 = (t2 + 0U);
    t14 = (t13 + 0U);
    *((int *)t14) = 1;
    t14 = (t13 + 4U);
    *((int *)t14) = 7;
    t14 = (t13 + 8U);
    *((int *)t14) = 1;
    t12 = (7 - 1);
    t63 = (t12 * 1);
    t63 = (t63 + 1);
    t14 = (t13 + 12U);
    *((unsigned int *)t14) = t63;
    goto LAB1;

LAB13:    t10 = (t1 + 17295);
    t0 = xsi_get_transient_memory(7U);
    memcpy(t0, t10, 7U);
    t13 = (t2 + 0U);
    t14 = (t13 + 0U);
    *((int *)t14) = 1;
    t14 = (t13 + 4U);
    *((int *)t14) = 7;
    t14 = (t13 + 8U);
    *((int *)t14) = 1;
    t12 = (7 - 1);
    t63 = (t12 * 1);
    t63 = (t63 + 1);
    t14 = (t13 + 12U);
    *((unsigned int *)t14) = t63;
    goto LAB1;

LAB14:    t10 = (t1 + 17302);
    t0 = xsi_get_transient_memory(7U);
    memcpy(t0, t10, 7U);
    t13 = (t2 + 0U);
    t14 = (t13 + 0U);
    *((int *)t14) = 1;
    t14 = (t13 + 4U);
    *((int *)t14) = 7;
    t14 = (t13 + 8U);
    *((int *)t14) = 1;
    t12 = (7 - 1);
    t63 = (t12 * 1);
    t63 = (t63 + 1);
    t14 = (t13 + 12U);
    *((unsigned int *)t14) = t63;
    goto LAB1;

LAB15:    t10 = (t1 + 17309);
    t0 = xsi_get_transient_memory(7U);
    memcpy(t0, t10, 7U);
    t13 = (t2 + 0U);
    t14 = (t13 + 0U);
    *((int *)t14) = 1;
    t14 = (t13 + 4U);
    *((int *)t14) = 7;
    t14 = (t13 + 8U);
    *((int *)t14) = 1;
    t12 = (7 - 1);
    t63 = (t12 * 1);
    t63 = (t63 + 1);
    t14 = (t13 + 12U);
    *((unsigned int *)t14) = t63;
    goto LAB1;

LAB16:    t10 = (t1 + 17316);
    t0 = xsi_get_transient_memory(7U);
    memcpy(t0, t10, 7U);
    t13 = (t2 + 0U);
    t14 = (t13 + 0U);
    *((int *)t14) = 1;
    t14 = (t13 + 4U);
    *((int *)t14) = 7;
    t14 = (t13 + 8U);
    *((int *)t14) = 1;
    t12 = (7 - 1);
    t63 = (t12 * 1);
    t63 = (t63 + 1);
    t14 = (t13 + 12U);
    *((unsigned int *)t14) = t63;
    goto LAB1;

LAB17:    t10 = (t1 + 17323);
    t0 = xsi_get_transient_memory(7U);
    memcpy(t0, t10, 7U);
    t13 = (t2 + 0U);
    t14 = (t13 + 0U);
    *((int *)t14) = 1;
    t14 = (t13 + 4U);
    *((int *)t14) = 7;
    t14 = (t13 + 8U);
    *((int *)t14) = 1;
    t12 = (7 - 1);
    t63 = (t12 * 1);
    t63 = (t63 + 1);
    t14 = (t13 + 12U);
    *((unsigned int *)t14) = t63;
    goto LAB1;

LAB18:    t10 = (t1 + 17330);
    t0 = xsi_get_transient_memory(7U);
    memcpy(t0, t10, 7U);
    t13 = (t2 + 0U);
    t14 = (t13 + 0U);
    *((int *)t14) = 1;
    t14 = (t13 + 4U);
    *((int *)t14) = 7;
    t14 = (t13 + 8U);
    *((int *)t14) = 1;
    t12 = (7 - 1);
    t63 = (t12 * 1);
    t63 = (t63 + 1);
    t14 = (t13 + 12U);
    *((unsigned int *)t14) = t63;
    goto LAB1;

LAB19:    t10 = (t1 + 17337);
    t0 = xsi_get_transient_memory(7U);
    memcpy(t0, t10, 7U);
    t13 = (t2 + 0U);
    t14 = (t13 + 0U);
    *((int *)t14) = 1;
    t14 = (t13 + 4U);
    *((int *)t14) = 7;
    t14 = (t13 + 8U);
    *((int *)t14) = 1;
    t12 = (7 - 1);
    t63 = (t12 * 1);
    t63 = (t63 + 1);
    t14 = (t13 + 12U);
    *((unsigned int *)t14) = t63;
    goto LAB1;

LAB20:    t10 = (t1 + 17344);
    t0 = xsi_get_transient_memory(7U);
    memcpy(t0, t10, 7U);
    t13 = (t2 + 0U);
    t14 = (t13 + 0U);
    *((int *)t14) = 1;
    t14 = (t13 + 4U);
    *((int *)t14) = 7;
    t14 = (t13 + 8U);
    *((int *)t14) = 1;
    t12 = (7 - 1);
    t63 = (t12 * 1);
    t63 = (t63 + 1);
    t14 = (t13 + 12U);
    *((unsigned int *)t14) = t63;
    goto LAB1;

LAB38:;
LAB39:    goto LAB4;

LAB40:    goto LAB4;

LAB41:    goto LAB4;

LAB42:    goto LAB4;

LAB43:    goto LAB4;

LAB44:    goto LAB4;

LAB45:    goto LAB4;

LAB46:    goto LAB4;

LAB47:    goto LAB4;

LAB48:    goto LAB4;

LAB49:    goto LAB4;

LAB50:    goto LAB4;

LAB51:    goto LAB4;

LAB52:    goto LAB4;

LAB53:    goto LAB4;

LAB54:    goto LAB4;

LAB55:    goto LAB4;

}

static void work_a_1415465652_3212880686_p_0(char *t0)
{
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned char t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    int t19;
    int t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;

LAB0:    xsi_set_current_line(288, ng1);
    t2 = (t0 + 7072U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 10632);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(289, ng1);
    t4 = (t0 + 7272U);
    t8 = *((char **)t4);
    t9 = (0 - 3);
    t10 = (t9 * -1);
    t11 = (1U * t10);
    t12 = (0 + t11);
    t4 = (t8 + t12);
    t13 = *((unsigned char *)t4);
    t14 = (t0 + 10792);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    *((unsigned char *)t18) = t13;
    xsi_driver_first_trans_delta(t14, 2U, 1, 0LL);
    xsi_set_current_line(290, ng1);
    t2 = (t0 + 7272U);
    t4 = *((char **)t2);
    t9 = (1 - 3);
    t10 = (t9 * -1);
    t11 = (1U * t10);
    t12 = (0 + t11);
    t2 = (t4 + t12);
    t1 = *((unsigned char *)t2);
    t5 = (t0 + 10792);
    t8 = (t5 + 56U);
    t14 = *((char **)t8);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    *((unsigned char *)t16) = t1;
    xsi_driver_first_trans_delta(t5, 1U, 1, 0LL);
    xsi_set_current_line(291, ng1);
    t2 = (t0 + 7272U);
    t4 = *((char **)t2);
    t9 = (2 - 3);
    t10 = (t9 * -1);
    t11 = (1U * t10);
    t12 = (0 + t11);
    t2 = (t4 + t12);
    t1 = *((unsigned char *)t2);
    t5 = (t0 + 10792);
    t8 = (t5 + 56U);
    t14 = *((char **)t8);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    *((unsigned char *)t16) = t1;
    xsi_driver_first_trans_delta(t5, 0U, 1, 0LL);
    xsi_set_current_line(292, ng1);
    t2 = (t0 + 7272U);
    t4 = *((char **)t2);
    t9 = (3 - 3);
    t10 = (t9 * -1);
    t11 = (1U * t10);
    t12 = (0 + t11);
    t2 = (t4 + t12);
    t1 = *((unsigned char *)t2);
    t5 = (t0 + 10792);
    t8 = (t5 + 56U);
    t14 = *((char **)t8);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    *((unsigned char *)t16) = t1;
    xsi_driver_first_trans_delta(t5, 3U, 1, 0LL);
    xsi_set_current_line(293, ng1);
    t2 = (t0 + 7272U);
    t4 = *((char **)t2);
    t2 = (t0 + 10856);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t14 = (t8 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t4, 4U);
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(294, ng1);
    t2 = (t0 + 7272U);
    t4 = *((char **)t2);
    t2 = (t0 + 17358);
    t9 = xsi_mem_cmp(t2, t4, 4U);
    if (t9 == 1)
        goto LAB9;

LAB13:    t8 = (t0 + 17362);
    t19 = xsi_mem_cmp(t8, t4, 4U);
    if (t19 == 1)
        goto LAB10;

LAB14:    t15 = (t0 + 17366);
    t20 = xsi_mem_cmp(t15, t4, 4U);
    if (t20 == 1)
        goto LAB11;

LAB15:
LAB12:    xsi_set_current_line(298, ng1);
    t2 = (t0 + 7912U);
    t4 = *((char **)t2);
    t2 = (t0 + 10920);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t14 = (t8 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t4, 8U);
    xsi_driver_first_trans_fast_port(t2);

LAB8:    goto LAB3;

LAB5:    t4 = (t0 + 7112U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB9:    xsi_set_current_line(295, ng1);
    t17 = (t0 + 7432U);
    t18 = *((char **)t17);
    t17 = (t0 + 10920);
    t21 = (t17 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t18, 8U);
    xsi_driver_first_trans_fast_port(t17);
    goto LAB8;

LAB10:    xsi_set_current_line(296, ng1);
    t2 = (t0 + 7592U);
    t4 = *((char **)t2);
    t2 = (t0 + 10920);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t14 = (t8 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t4, 8U);
    xsi_driver_first_trans_fast_port(t2);
    goto LAB8;

LAB11:    xsi_set_current_line(297, ng1);
    t2 = (t0 + 7752U);
    t4 = *((char **)t2);
    t2 = (t0 + 10920);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t14 = (t8 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t4, 8U);
    xsi_driver_first_trans_fast_port(t2);
    goto LAB8;

LAB16:;
}

static void work_a_1415465652_3212880686_p_1(char *t0)
{
    char t9[16];
    char t15[16];
    char t21[16];
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned char t7;
    unsigned char t8;
    char *t10;
    char *t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t16;
    char *t17;
    int t18;
    unsigned int t19;
    char *t20;
    char *t22;
    char *t23;
    unsigned int t24;
    unsigned char t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;

LAB0:    xsi_set_current_line(303, ng1);

LAB3:    t1 = (t0 + 4072U);
    t2 = *((char **)t1);
    t3 = (0 - 0);
    t4 = (t3 * 1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t7);
    t10 = (t0 + 4552U);
    t11 = *((char **)t10);
    t12 = (15 - 15);
    t13 = (t12 * 1U);
    t14 = (0 + t13);
    t10 = (t11 + t14);
    t16 = (t15 + 0U);
    t17 = (t16 + 0U);
    *((int *)t17) = 15;
    t17 = (t16 + 4U);
    *((int *)t17) = 12;
    t17 = (t16 + 8U);
    *((int *)t17) = -1;
    t18 = (12 - 15);
    t19 = (t18 * -1);
    t19 = (t19 + 1);
    t17 = (t16 + 12U);
    *((unsigned int *)t17) = t19;
    t17 = work_a_1415465652_3212880686_sub_481989754_3057020925(t0, t9, t10, t15);
    t22 = ((IEEE_P_2592010699) + 4024);
    t20 = xsi_base_array_concat(t20, t21, t22, (char)99, t8, (char)97, t17, t9, (char)101);
    t23 = (t9 + 12U);
    t19 = *((unsigned int *)t23);
    t19 = (t19 * 1U);
    t24 = (1U + t19);
    t25 = (8U != t24);
    if (t25 == 1)
        goto LAB5;

LAB6:    t26 = (t0 + 10984);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    t29 = (t28 + 56U);
    t30 = *((char **)t29);
    memcpy(t30, t20, 8U);
    xsi_driver_first_trans_fast(t26);

LAB2:    t31 = (t0 + 10648);
    *((int *)t31) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(8U, t24, 0);
    goto LAB6;

}

static void work_a_1415465652_3212880686_p_2(char *t0)
{
    char t9[16];
    char t15[16];
    char t21[16];
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned char t7;
    unsigned char t8;
    char *t10;
    char *t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t16;
    char *t17;
    int t18;
    unsigned int t19;
    char *t20;
    char *t22;
    char *t23;
    unsigned int t24;
    unsigned char t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;

LAB0:    xsi_set_current_line(304, ng1);

LAB3:    t1 = (t0 + 4072U);
    t2 = *((char **)t1);
    t3 = (1 - 0);
    t4 = (t3 * 1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t7);
    t10 = (t0 + 4552U);
    t11 = *((char **)t10);
    t12 = (15 - 11);
    t13 = (t12 * 1U);
    t14 = (0 + t13);
    t10 = (t11 + t14);
    t16 = (t15 + 0U);
    t17 = (t16 + 0U);
    *((int *)t17) = 11;
    t17 = (t16 + 4U);
    *((int *)t17) = 8;
    t17 = (t16 + 8U);
    *((int *)t17) = -1;
    t18 = (8 - 11);
    t19 = (t18 * -1);
    t19 = (t19 + 1);
    t17 = (t16 + 12U);
    *((unsigned int *)t17) = t19;
    t17 = work_a_1415465652_3212880686_sub_481989754_3057020925(t0, t9, t10, t15);
    t22 = ((IEEE_P_2592010699) + 4024);
    t20 = xsi_base_array_concat(t20, t21, t22, (char)99, t8, (char)97, t17, t9, (char)101);
    t23 = (t9 + 12U);
    t19 = *((unsigned int *)t23);
    t19 = (t19 * 1U);
    t24 = (1U + t19);
    t25 = (8U != t24);
    if (t25 == 1)
        goto LAB5;

LAB6:    t26 = (t0 + 11048);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    t29 = (t28 + 56U);
    t30 = *((char **)t29);
    memcpy(t30, t20, 8U);
    xsi_driver_first_trans_fast(t26);

LAB2:    t31 = (t0 + 10664);
    *((int *)t31) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(8U, t24, 0);
    goto LAB6;

}

static void work_a_1415465652_3212880686_p_3(char *t0)
{
    char t9[16];
    char t15[16];
    char t21[16];
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned char t7;
    unsigned char t8;
    char *t10;
    char *t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t16;
    char *t17;
    int t18;
    unsigned int t19;
    char *t20;
    char *t22;
    char *t23;
    unsigned int t24;
    unsigned char t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;

LAB0:    xsi_set_current_line(305, ng1);

LAB3:    t1 = (t0 + 4072U);
    t2 = *((char **)t1);
    t3 = (2 - 0);
    t4 = (t3 * 1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t7);
    t10 = (t0 + 4552U);
    t11 = *((char **)t10);
    t12 = (15 - 7);
    t13 = (t12 * 1U);
    t14 = (0 + t13);
    t10 = (t11 + t14);
    t16 = (t15 + 0U);
    t17 = (t16 + 0U);
    *((int *)t17) = 7;
    t17 = (t16 + 4U);
    *((int *)t17) = 4;
    t17 = (t16 + 8U);
    *((int *)t17) = -1;
    t18 = (4 - 7);
    t19 = (t18 * -1);
    t19 = (t19 + 1);
    t17 = (t16 + 12U);
    *((unsigned int *)t17) = t19;
    t17 = work_a_1415465652_3212880686_sub_481989754_3057020925(t0, t9, t10, t15);
    t22 = ((IEEE_P_2592010699) + 4024);
    t20 = xsi_base_array_concat(t20, t21, t22, (char)99, t8, (char)97, t17, t9, (char)101);
    t23 = (t9 + 12U);
    t19 = *((unsigned int *)t23);
    t19 = (t19 * 1U);
    t24 = (1U + t19);
    t25 = (8U != t24);
    if (t25 == 1)
        goto LAB5;

LAB6:    t26 = (t0 + 11112);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    t29 = (t28 + 56U);
    t30 = *((char **)t29);
    memcpy(t30, t20, 8U);
    xsi_driver_first_trans_fast(t26);

LAB2:    t31 = (t0 + 10680);
    *((int *)t31) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(8U, t24, 0);
    goto LAB6;

}

static void work_a_1415465652_3212880686_p_4(char *t0)
{
    char t9[16];
    char t15[16];
    char t21[16];
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned char t7;
    unsigned char t8;
    char *t10;
    char *t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t16;
    char *t17;
    int t18;
    unsigned int t19;
    char *t20;
    char *t22;
    char *t23;
    unsigned int t24;
    unsigned char t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;

LAB0:    xsi_set_current_line(306, ng1);

LAB3:    t1 = (t0 + 4072U);
    t2 = *((char **)t1);
    t3 = (3 - 0);
    t4 = (t3 * 1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t7);
    t10 = (t0 + 4552U);
    t11 = *((char **)t10);
    t12 = (15 - 3);
    t13 = (t12 * 1U);
    t14 = (0 + t13);
    t10 = (t11 + t14);
    t16 = (t15 + 0U);
    t17 = (t16 + 0U);
    *((int *)t17) = 3;
    t17 = (t16 + 4U);
    *((int *)t17) = 0;
    t17 = (t16 + 8U);
    *((int *)t17) = -1;
    t18 = (0 - 3);
    t19 = (t18 * -1);
    t19 = (t19 + 1);
    t17 = (t16 + 12U);
    *((unsigned int *)t17) = t19;
    t17 = work_a_1415465652_3212880686_sub_481989754_3057020925(t0, t9, t10, t15);
    t22 = ((IEEE_P_2592010699) + 4024);
    t20 = xsi_base_array_concat(t20, t21, t22, (char)99, t8, (char)97, t17, t9, (char)101);
    t23 = (t9 + 12U);
    t19 = *((unsigned int *)t23);
    t19 = (t19 * 1U);
    t24 = (1U + t19);
    t25 = (8U != t24);
    if (t25 == 1)
        goto LAB5;

LAB6:    t26 = (t0 + 11176);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    t29 = (t28 + 56U);
    t30 = *((char **)t29);
    memcpy(t30, t20, 8U);
    xsi_driver_first_trans_fast(t26);

LAB2:    t31 = (t0 + 10696);
    *((int *)t31) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(8U, t24, 0);
    goto LAB6;

}

static void work_a_1415465652_3212880686_p_5(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;

LAB0:    xsi_set_current_line(308, ng1);
    t1 = (t0 + 3432U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB5:    t14 = (t0 + 4232U);
    t15 = *((char **)t14);
    t16 = (15 - 15);
    t17 = (t16 * 1U);
    t18 = (0 + t17);
    t14 = (t15 + t18);
    t19 = (t0 + 11240);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    memcpy(t23, t14, 8U);
    xsi_driver_first_trans_fast_port(t19);

LAB2:    t24 = (t0 + 10712);
    *((int *)t24) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 4232U);
    t5 = *((char **)t1);
    t6 = (15 - 7);
    t7 = (t6 * 1U);
    t8 = (0 + t7);
    t1 = (t5 + t8);
    t9 = (t0 + 11240);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t1, 8U);
    xsi_driver_first_trans_fast_port(t9);
    goto LAB2;

LAB6:    goto LAB2;

}


extern void work_a_1415465652_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1415465652_3212880686_p_0,(void *)work_a_1415465652_3212880686_p_1,(void *)work_a_1415465652_3212880686_p_2,(void *)work_a_1415465652_3212880686_p_3,(void *)work_a_1415465652_3212880686_p_4,(void *)work_a_1415465652_3212880686_p_5};
	static char *se[] = {(void *)work_a_1415465652_3212880686_sub_481989754_3057020925};
	xsi_register_didat("work_a_1415465652_3212880686", "isim/tbCPU_isim_beh.exe.sim/work/a_1415465652_3212880686.didat");
	xsi_register_executes(pe);
	xsi_register_subprogram_executes(se);
}
