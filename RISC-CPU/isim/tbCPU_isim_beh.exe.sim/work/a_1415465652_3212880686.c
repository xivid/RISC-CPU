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
    t10 = (t1 + 16559);
    t12 = xsi_mem_cmp(t10, t3, 4U);
    if (t12 == 1)
        goto LAB5;

LAB22:    t13 = (t1 + 16563);
    t15 = xsi_mem_cmp(t13, t3, 4U);
    if (t15 == 1)
        goto LAB6;

LAB23:    t16 = (t1 + 16567);
    t18 = xsi_mem_cmp(t16, t3, 4U);
    if (t18 == 1)
        goto LAB7;

LAB24:    t19 = (t1 + 16571);
    t21 = xsi_mem_cmp(t19, t3, 4U);
    if (t21 == 1)
        goto LAB8;

LAB25:    t22 = (t1 + 16575);
    t24 = xsi_mem_cmp(t22, t3, 4U);
    if (t24 == 1)
        goto LAB9;

LAB26:    t25 = (t1 + 16579);
    t27 = xsi_mem_cmp(t25, t3, 4U);
    if (t27 == 1)
        goto LAB10;

LAB27:    t28 = (t1 + 16583);
    t30 = xsi_mem_cmp(t28, t3, 4U);
    if (t30 == 1)
        goto LAB11;

LAB28:    t31 = (t1 + 16587);
    t33 = xsi_mem_cmp(t31, t3, 4U);
    if (t33 == 1)
        goto LAB12;

LAB29:    t34 = (t1 + 16591);
    t36 = xsi_mem_cmp(t34, t3, 4U);
    if (t36 == 1)
        goto LAB13;

LAB30:    t37 = (t1 + 16595);
    t39 = xsi_mem_cmp(t37, t3, 4U);
    if (t39 == 1)
        goto LAB14;

LAB31:    t40 = (t1 + 16599);
    t42 = xsi_mem_cmp(t40, t3, 4U);
    if (t42 == 1)
        goto LAB15;

LAB32:    t43 = (t1 + 16603);
    t45 = xsi_mem_cmp(t43, t3, 4U);
    if (t45 == 1)
        goto LAB16;

LAB33:    t46 = (t1 + 16607);
    t48 = xsi_mem_cmp(t46, t3, 4U);
    if (t48 == 1)
        goto LAB17;

LAB34:    t49 = (t1 + 16611);
    t51 = xsi_mem_cmp(t49, t3, 4U);
    if (t51 == 1)
        goto LAB18;

LAB35:    t52 = (t1 + 16615);
    t54 = xsi_mem_cmp(t52, t3, 4U);
    if (t54 == 1)
        goto LAB19;

LAB36:    t55 = (t1 + 16619);
    t57 = xsi_mem_cmp(t55, t3, 4U);
    if (t57 == 1)
        goto LAB20;

LAB37:
LAB21:    t10 = (t1 + 16735);
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

LAB5:    t58 = (t1 + 16623);
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

LAB6:    t10 = (t1 + 16630);
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

LAB7:    t10 = (t1 + 16637);
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

LAB8:    t10 = (t1 + 16644);
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

LAB9:    t10 = (t1 + 16651);
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

LAB10:    t10 = (t1 + 16658);
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

LAB11:    t10 = (t1 + 16665);
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

LAB12:    t10 = (t1 + 16672);
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

LAB13:    t10 = (t1 + 16679);
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

LAB14:    t10 = (t1 + 16686);
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

LAB15:    t10 = (t1 + 16693);
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

LAB16:    t10 = (t1 + 16700);
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

LAB17:    t10 = (t1 + 16707);
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

LAB18:    t10 = (t1 + 16714);
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

LAB19:    t10 = (t1 + 16721);
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

LAB20:    t10 = (t1 + 16728);
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

LAB0:    xsi_set_current_line(289, ng1);
    t2 = (t0 + 6912U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 10224);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(290, ng1);
    t4 = (t0 + 7112U);
    t8 = *((char **)t4);
    t9 = (0 - 3);
    t10 = (t9 * -1);
    t11 = (1U * t10);
    t12 = (0 + t11);
    t4 = (t8 + t12);
    t13 = *((unsigned char *)t4);
    t14 = (t0 + 10368);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    *((unsigned char *)t18) = t13;
    xsi_driver_first_trans_delta(t14, 2U, 1, 0LL);
    xsi_set_current_line(291, ng1);
    t2 = (t0 + 7112U);
    t4 = *((char **)t2);
    t9 = (1 - 3);
    t10 = (t9 * -1);
    t11 = (1U * t10);
    t12 = (0 + t11);
    t2 = (t4 + t12);
    t1 = *((unsigned char *)t2);
    t5 = (t0 + 10368);
    t8 = (t5 + 56U);
    t14 = *((char **)t8);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    *((unsigned char *)t16) = t1;
    xsi_driver_first_trans_delta(t5, 1U, 1, 0LL);
    xsi_set_current_line(292, ng1);
    t2 = (t0 + 7112U);
    t4 = *((char **)t2);
    t9 = (2 - 3);
    t10 = (t9 * -1);
    t11 = (1U * t10);
    t12 = (0 + t11);
    t2 = (t4 + t12);
    t1 = *((unsigned char *)t2);
    t5 = (t0 + 10368);
    t8 = (t5 + 56U);
    t14 = *((char **)t8);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    *((unsigned char *)t16) = t1;
    xsi_driver_first_trans_delta(t5, 0U, 1, 0LL);
    xsi_set_current_line(293, ng1);
    t2 = (t0 + 7112U);
    t4 = *((char **)t2);
    t9 = (3 - 3);
    t10 = (t9 * -1);
    t11 = (1U * t10);
    t12 = (0 + t11);
    t2 = (t4 + t12);
    t1 = *((unsigned char *)t2);
    t5 = (t0 + 10368);
    t8 = (t5 + 56U);
    t14 = *((char **)t8);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    *((unsigned char *)t16) = t1;
    xsi_driver_first_trans_delta(t5, 3U, 1, 0LL);
    xsi_set_current_line(294, ng1);
    t2 = (t0 + 7112U);
    t4 = *((char **)t2);
    t2 = (t0 + 10432);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t14 = (t8 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t4, 4U);
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(295, ng1);
    t2 = (t0 + 7112U);
    t4 = *((char **)t2);
    t2 = (t0 + 16742);
    t9 = xsi_mem_cmp(t2, t4, 4U);
    if (t9 == 1)
        goto LAB9;

LAB13:    t8 = (t0 + 16746);
    t19 = xsi_mem_cmp(t8, t4, 4U);
    if (t19 == 1)
        goto LAB10;

LAB14:    t15 = (t0 + 16750);
    t20 = xsi_mem_cmp(t15, t4, 4U);
    if (t20 == 1)
        goto LAB11;

LAB15:
LAB12:    xsi_set_current_line(299, ng1);
    t2 = (t0 + 7752U);
    t4 = *((char **)t2);
    t2 = (t0 + 10496);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t14 = (t8 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t4, 8U);
    xsi_driver_first_trans_fast_port(t2);

LAB8:    goto LAB3;

LAB5:    t4 = (t0 + 6952U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB9:    xsi_set_current_line(296, ng1);
    t17 = (t0 + 7272U);
    t18 = *((char **)t17);
    t17 = (t0 + 10496);
    t21 = (t17 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t18, 8U);
    xsi_driver_first_trans_fast_port(t17);
    goto LAB8;

LAB10:    xsi_set_current_line(297, ng1);
    t2 = (t0 + 7432U);
    t4 = *((char **)t2);
    t2 = (t0 + 10496);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t14 = (t8 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t4, 8U);
    xsi_driver_first_trans_fast_port(t2);
    goto LAB8;

LAB11:    xsi_set_current_line(298, ng1);
    t2 = (t0 + 7592U);
    t4 = *((char **)t2);
    t2 = (t0 + 10496);
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
    char t12[16];
    char t18[16];
    char t24[16];
    char t42[16];
    char t48[16];
    char t54[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned char t10;
    unsigned char t11;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t19;
    char *t20;
    int t21;
    unsigned int t22;
    char *t23;
    char *t25;
    char *t26;
    unsigned int t27;
    unsigned char t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned char t40;
    unsigned char t41;
    char *t43;
    char *t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    char *t49;
    char *t50;
    int t51;
    unsigned int t52;
    char *t53;
    char *t55;
    char *t56;
    unsigned int t57;
    unsigned char t58;
    char *t59;
    char *t60;
    char *t61;
    char *t62;
    char *t63;
    char *t64;

LAB0:    xsi_set_current_line(304, ng1);
    t1 = (t0 + 3432U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB7:    t34 = (t0 + 3912U);
    t35 = *((char **)t34);
    t36 = (0 - 0);
    t37 = (t36 * 1);
    t38 = (1U * t37);
    t39 = (0 + t38);
    t34 = (t35 + t39);
    t40 = *((unsigned char *)t34);
    t41 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t40);
    t43 = (t0 + 4072U);
    t44 = *((char **)t43);
    t45 = (15 - 15);
    t46 = (t45 * 1U);
    t47 = (0 + t46);
    t43 = (t44 + t47);
    t49 = (t48 + 0U);
    t50 = (t49 + 0U);
    *((int *)t50) = 15;
    t50 = (t49 + 4U);
    *((int *)t50) = 12;
    t50 = (t49 + 8U);
    *((int *)t50) = -1;
    t51 = (12 - 15);
    t52 = (t51 * -1);
    t52 = (t52 + 1);
    t50 = (t49 + 12U);
    *((unsigned int *)t50) = t52;
    t50 = work_a_1415465652_3212880686_sub_481989754_3057020925(t0, t42, t43, t48);
    t55 = ((IEEE_P_2592010699) + 4024);
    t53 = xsi_base_array_concat(t53, t54, t55, (char)99, t41, (char)97, t50, t42, (char)101);
    t56 = (t42 + 12U);
    t52 = *((unsigned int *)t56);
    t52 = (t52 * 1U);
    t57 = (1U + t52);
    t58 = (8U != t57);
    if (t58 == 1)
        goto LAB9;

LAB10:    t59 = (t0 + 10560);
    t60 = (t59 + 56U);
    t61 = *((char **)t60);
    t62 = (t61 + 56U);
    t63 = *((char **)t62);
    memcpy(t63, t53, 8U);
    xsi_driver_first_trans_fast(t59);

LAB2:    t64 = (t0 + 10240);
    *((int *)t64) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 3912U);
    t5 = *((char **)t1);
    t6 = (0 - 0);
    t7 = (t6 * 1);
    t8 = (1U * t7);
    t9 = (0 + t8);
    t1 = (t5 + t9);
    t10 = *((unsigned char *)t1);
    t11 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t10);
    t13 = (t0 + 4392U);
    t14 = *((char **)t13);
    t15 = (15 - 15);
    t16 = (t15 * 1U);
    t17 = (0 + t16);
    t13 = (t14 + t17);
    t19 = (t18 + 0U);
    t20 = (t19 + 0U);
    *((int *)t20) = 15;
    t20 = (t19 + 4U);
    *((int *)t20) = 12;
    t20 = (t19 + 8U);
    *((int *)t20) = -1;
    t21 = (12 - 15);
    t22 = (t21 * -1);
    t22 = (t22 + 1);
    t20 = (t19 + 12U);
    *((unsigned int *)t20) = t22;
    t20 = work_a_1415465652_3212880686_sub_481989754_3057020925(t0, t12, t13, t18);
    t25 = ((IEEE_P_2592010699) + 4024);
    t23 = xsi_base_array_concat(t23, t24, t25, (char)99, t11, (char)97, t20, t12, (char)101);
    t26 = (t12 + 12U);
    t22 = *((unsigned int *)t26);
    t22 = (t22 * 1U);
    t27 = (1U + t22);
    t28 = (8U != t27);
    if (t28 == 1)
        goto LAB5;

LAB6:    t29 = (t0 + 10560);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    t32 = (t31 + 56U);
    t33 = *((char **)t32);
    memcpy(t33, t23, 8U);
    xsi_driver_first_trans_fast(t29);
    goto LAB2;

LAB5:    xsi_size_not_matching(8U, t27, 0);
    goto LAB6;

LAB8:    goto LAB2;

LAB9:    xsi_size_not_matching(8U, t57, 0);
    goto LAB10;

}

static void work_a_1415465652_3212880686_p_2(char *t0)
{
    char t12[16];
    char t18[16];
    char t24[16];
    char t42[16];
    char t48[16];
    char t54[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned char t10;
    unsigned char t11;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t19;
    char *t20;
    int t21;
    unsigned int t22;
    char *t23;
    char *t25;
    char *t26;
    unsigned int t27;
    unsigned char t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned char t40;
    unsigned char t41;
    char *t43;
    char *t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    char *t49;
    char *t50;
    int t51;
    unsigned int t52;
    char *t53;
    char *t55;
    char *t56;
    unsigned int t57;
    unsigned char t58;
    char *t59;
    char *t60;
    char *t61;
    char *t62;
    char *t63;
    char *t64;

LAB0:    xsi_set_current_line(305, ng1);
    t1 = (t0 + 3432U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB7:    t34 = (t0 + 3912U);
    t35 = *((char **)t34);
    t36 = (1 - 0);
    t37 = (t36 * 1);
    t38 = (1U * t37);
    t39 = (0 + t38);
    t34 = (t35 + t39);
    t40 = *((unsigned char *)t34);
    t41 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t40);
    t43 = (t0 + 4072U);
    t44 = *((char **)t43);
    t45 = (15 - 11);
    t46 = (t45 * 1U);
    t47 = (0 + t46);
    t43 = (t44 + t47);
    t49 = (t48 + 0U);
    t50 = (t49 + 0U);
    *((int *)t50) = 11;
    t50 = (t49 + 4U);
    *((int *)t50) = 8;
    t50 = (t49 + 8U);
    *((int *)t50) = -1;
    t51 = (8 - 11);
    t52 = (t51 * -1);
    t52 = (t52 + 1);
    t50 = (t49 + 12U);
    *((unsigned int *)t50) = t52;
    t50 = work_a_1415465652_3212880686_sub_481989754_3057020925(t0, t42, t43, t48);
    t55 = ((IEEE_P_2592010699) + 4024);
    t53 = xsi_base_array_concat(t53, t54, t55, (char)99, t41, (char)97, t50, t42, (char)101);
    t56 = (t42 + 12U);
    t52 = *((unsigned int *)t56);
    t52 = (t52 * 1U);
    t57 = (1U + t52);
    t58 = (8U != t57);
    if (t58 == 1)
        goto LAB9;

LAB10:    t59 = (t0 + 10624);
    t60 = (t59 + 56U);
    t61 = *((char **)t60);
    t62 = (t61 + 56U);
    t63 = *((char **)t62);
    memcpy(t63, t53, 8U);
    xsi_driver_first_trans_fast(t59);

LAB2:    t64 = (t0 + 10256);
    *((int *)t64) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 3912U);
    t5 = *((char **)t1);
    t6 = (1 - 0);
    t7 = (t6 * 1);
    t8 = (1U * t7);
    t9 = (0 + t8);
    t1 = (t5 + t9);
    t10 = *((unsigned char *)t1);
    t11 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t10);
    t13 = (t0 + 4392U);
    t14 = *((char **)t13);
    t15 = (15 - 11);
    t16 = (t15 * 1U);
    t17 = (0 + t16);
    t13 = (t14 + t17);
    t19 = (t18 + 0U);
    t20 = (t19 + 0U);
    *((int *)t20) = 11;
    t20 = (t19 + 4U);
    *((int *)t20) = 8;
    t20 = (t19 + 8U);
    *((int *)t20) = -1;
    t21 = (8 - 11);
    t22 = (t21 * -1);
    t22 = (t22 + 1);
    t20 = (t19 + 12U);
    *((unsigned int *)t20) = t22;
    t20 = work_a_1415465652_3212880686_sub_481989754_3057020925(t0, t12, t13, t18);
    t25 = ((IEEE_P_2592010699) + 4024);
    t23 = xsi_base_array_concat(t23, t24, t25, (char)99, t11, (char)97, t20, t12, (char)101);
    t26 = (t12 + 12U);
    t22 = *((unsigned int *)t26);
    t22 = (t22 * 1U);
    t27 = (1U + t22);
    t28 = (8U != t27);
    if (t28 == 1)
        goto LAB5;

LAB6:    t29 = (t0 + 10624);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    t32 = (t31 + 56U);
    t33 = *((char **)t32);
    memcpy(t33, t23, 8U);
    xsi_driver_first_trans_fast(t29);
    goto LAB2;

LAB5:    xsi_size_not_matching(8U, t27, 0);
    goto LAB6;

LAB8:    goto LAB2;

LAB9:    xsi_size_not_matching(8U, t57, 0);
    goto LAB10;

}

static void work_a_1415465652_3212880686_p_3(char *t0)
{
    char t12[16];
    char t18[16];
    char t24[16];
    char t42[16];
    char t48[16];
    char t54[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned char t10;
    unsigned char t11;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t19;
    char *t20;
    int t21;
    unsigned int t22;
    char *t23;
    char *t25;
    char *t26;
    unsigned int t27;
    unsigned char t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned char t40;
    unsigned char t41;
    char *t43;
    char *t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    char *t49;
    char *t50;
    int t51;
    unsigned int t52;
    char *t53;
    char *t55;
    char *t56;
    unsigned int t57;
    unsigned char t58;
    char *t59;
    char *t60;
    char *t61;
    char *t62;
    char *t63;
    char *t64;

LAB0:    xsi_set_current_line(306, ng1);
    t1 = (t0 + 3432U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB7:    t34 = (t0 + 3912U);
    t35 = *((char **)t34);
    t36 = (2 - 0);
    t37 = (t36 * 1);
    t38 = (1U * t37);
    t39 = (0 + t38);
    t34 = (t35 + t39);
    t40 = *((unsigned char *)t34);
    t41 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t40);
    t43 = (t0 + 4072U);
    t44 = *((char **)t43);
    t45 = (15 - 7);
    t46 = (t45 * 1U);
    t47 = (0 + t46);
    t43 = (t44 + t47);
    t49 = (t48 + 0U);
    t50 = (t49 + 0U);
    *((int *)t50) = 7;
    t50 = (t49 + 4U);
    *((int *)t50) = 4;
    t50 = (t49 + 8U);
    *((int *)t50) = -1;
    t51 = (4 - 7);
    t52 = (t51 * -1);
    t52 = (t52 + 1);
    t50 = (t49 + 12U);
    *((unsigned int *)t50) = t52;
    t50 = work_a_1415465652_3212880686_sub_481989754_3057020925(t0, t42, t43, t48);
    t55 = ((IEEE_P_2592010699) + 4024);
    t53 = xsi_base_array_concat(t53, t54, t55, (char)99, t41, (char)97, t50, t42, (char)101);
    t56 = (t42 + 12U);
    t52 = *((unsigned int *)t56);
    t52 = (t52 * 1U);
    t57 = (1U + t52);
    t58 = (8U != t57);
    if (t58 == 1)
        goto LAB9;

LAB10:    t59 = (t0 + 10688);
    t60 = (t59 + 56U);
    t61 = *((char **)t60);
    t62 = (t61 + 56U);
    t63 = *((char **)t62);
    memcpy(t63, t53, 8U);
    xsi_driver_first_trans_fast(t59);

LAB2:    t64 = (t0 + 10272);
    *((int *)t64) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 3912U);
    t5 = *((char **)t1);
    t6 = (2 - 0);
    t7 = (t6 * 1);
    t8 = (1U * t7);
    t9 = (0 + t8);
    t1 = (t5 + t9);
    t10 = *((unsigned char *)t1);
    t11 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t10);
    t13 = (t0 + 4392U);
    t14 = *((char **)t13);
    t15 = (15 - 7);
    t16 = (t15 * 1U);
    t17 = (0 + t16);
    t13 = (t14 + t17);
    t19 = (t18 + 0U);
    t20 = (t19 + 0U);
    *((int *)t20) = 7;
    t20 = (t19 + 4U);
    *((int *)t20) = 4;
    t20 = (t19 + 8U);
    *((int *)t20) = -1;
    t21 = (4 - 7);
    t22 = (t21 * -1);
    t22 = (t22 + 1);
    t20 = (t19 + 12U);
    *((unsigned int *)t20) = t22;
    t20 = work_a_1415465652_3212880686_sub_481989754_3057020925(t0, t12, t13, t18);
    t25 = ((IEEE_P_2592010699) + 4024);
    t23 = xsi_base_array_concat(t23, t24, t25, (char)99, t11, (char)97, t20, t12, (char)101);
    t26 = (t12 + 12U);
    t22 = *((unsigned int *)t26);
    t22 = (t22 * 1U);
    t27 = (1U + t22);
    t28 = (8U != t27);
    if (t28 == 1)
        goto LAB5;

LAB6:    t29 = (t0 + 10688);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    t32 = (t31 + 56U);
    t33 = *((char **)t32);
    memcpy(t33, t23, 8U);
    xsi_driver_first_trans_fast(t29);
    goto LAB2;

LAB5:    xsi_size_not_matching(8U, t27, 0);
    goto LAB6;

LAB8:    goto LAB2;

LAB9:    xsi_size_not_matching(8U, t57, 0);
    goto LAB10;

}

static void work_a_1415465652_3212880686_p_4(char *t0)
{
    char t12[16];
    char t18[16];
    char t24[16];
    char t42[16];
    char t48[16];
    char t54[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned char t10;
    unsigned char t11;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t19;
    char *t20;
    int t21;
    unsigned int t22;
    char *t23;
    char *t25;
    char *t26;
    unsigned int t27;
    unsigned char t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned char t40;
    unsigned char t41;
    char *t43;
    char *t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    char *t49;
    char *t50;
    int t51;
    unsigned int t52;
    char *t53;
    char *t55;
    char *t56;
    unsigned int t57;
    unsigned char t58;
    char *t59;
    char *t60;
    char *t61;
    char *t62;
    char *t63;
    char *t64;

LAB0:    xsi_set_current_line(307, ng1);
    t1 = (t0 + 3432U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB7:    t34 = (t0 + 3912U);
    t35 = *((char **)t34);
    t36 = (3 - 0);
    t37 = (t36 * 1);
    t38 = (1U * t37);
    t39 = (0 + t38);
    t34 = (t35 + t39);
    t40 = *((unsigned char *)t34);
    t41 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t40);
    t43 = (t0 + 4072U);
    t44 = *((char **)t43);
    t45 = (15 - 3);
    t46 = (t45 * 1U);
    t47 = (0 + t46);
    t43 = (t44 + t47);
    t49 = (t48 + 0U);
    t50 = (t49 + 0U);
    *((int *)t50) = 3;
    t50 = (t49 + 4U);
    *((int *)t50) = 0;
    t50 = (t49 + 8U);
    *((int *)t50) = -1;
    t51 = (0 - 3);
    t52 = (t51 * -1);
    t52 = (t52 + 1);
    t50 = (t49 + 12U);
    *((unsigned int *)t50) = t52;
    t50 = work_a_1415465652_3212880686_sub_481989754_3057020925(t0, t42, t43, t48);
    t55 = ((IEEE_P_2592010699) + 4024);
    t53 = xsi_base_array_concat(t53, t54, t55, (char)99, t41, (char)97, t50, t42, (char)101);
    t56 = (t42 + 12U);
    t52 = *((unsigned int *)t56);
    t52 = (t52 * 1U);
    t57 = (1U + t52);
    t58 = (8U != t57);
    if (t58 == 1)
        goto LAB9;

LAB10:    t59 = (t0 + 10752);
    t60 = (t59 + 56U);
    t61 = *((char **)t60);
    t62 = (t61 + 56U);
    t63 = *((char **)t62);
    memcpy(t63, t53, 8U);
    xsi_driver_first_trans_fast(t59);

LAB2:    t64 = (t0 + 10288);
    *((int *)t64) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 3912U);
    t5 = *((char **)t1);
    t6 = (3 - 0);
    t7 = (t6 * 1);
    t8 = (1U * t7);
    t9 = (0 + t8);
    t1 = (t5 + t9);
    t10 = *((unsigned char *)t1);
    t11 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t10);
    t13 = (t0 + 4392U);
    t14 = *((char **)t13);
    t15 = (15 - 3);
    t16 = (t15 * 1U);
    t17 = (0 + t16);
    t13 = (t14 + t17);
    t19 = (t18 + 0U);
    t20 = (t19 + 0U);
    *((int *)t20) = 3;
    t20 = (t19 + 4U);
    *((int *)t20) = 0;
    t20 = (t19 + 8U);
    *((int *)t20) = -1;
    t21 = (0 - 3);
    t22 = (t21 * -1);
    t22 = (t22 + 1);
    t20 = (t19 + 12U);
    *((unsigned int *)t20) = t22;
    t20 = work_a_1415465652_3212880686_sub_481989754_3057020925(t0, t12, t13, t18);
    t25 = ((IEEE_P_2592010699) + 4024);
    t23 = xsi_base_array_concat(t23, t24, t25, (char)99, t11, (char)97, t20, t12, (char)101);
    t26 = (t12 + 12U);
    t22 = *((unsigned int *)t26);
    t22 = (t22 * 1U);
    t27 = (1U + t22);
    t28 = (8U != t27);
    if (t28 == 1)
        goto LAB5;

LAB6:    t29 = (t0 + 10752);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    t32 = (t31 + 56U);
    t33 = *((char **)t32);
    memcpy(t33, t23, 8U);
    xsi_driver_first_trans_fast(t29);
    goto LAB2;

LAB5:    xsi_size_not_matching(8U, t27, 0);
    goto LAB6;

LAB8:    goto LAB2;

LAB9:    xsi_size_not_matching(8U, t57, 0);
    goto LAB10;

}


extern void work_a_1415465652_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1415465652_3212880686_p_0,(void *)work_a_1415465652_3212880686_p_1,(void *)work_a_1415465652_3212880686_p_2,(void *)work_a_1415465652_3212880686_p_3,(void *)work_a_1415465652_3212880686_p_4};
	static char *se[] = {(void *)work_a_1415465652_3212880686_sub_481989754_3057020925};
	xsi_register_didat("work_a_1415465652_3212880686", "isim/tbCPU_isim_beh.exe.sim/work/a_1415465652_3212880686.didat");
	xsi_register_executes(pe);
	xsi_register_subprogram_executes(se);
}
