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
static const char *ng0 = "C:/Users/Administrator/CPU/RISC-CPU/RISC-CPU/INTctrl.vhd";
extern char *IEEE_P_3620187407;
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1605435078_503743352(char *, unsigned char , unsigned char );
unsigned char ieee_p_2592010699_sub_1690584930_503743352(char *, unsigned char );
int ieee_p_3620187407_sub_514432868_3965413181(char *, char *, char *);


static void work_a_4129807357_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(57, ng0);

LAB3:    t1 = (t0 + 3592U);
    t2 = *((char **)t1);
    t3 = *((int *)t2);
    t1 = (t0 + 5944);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((int *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 5816);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_4129807357_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(58, ng0);

LAB3:    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    t1 = (t0 + 6008);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 8U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 5832);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_4129807357_3212880686_p_2(char *t0)
{
    unsigned char t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    int t9;
    int t10;
    char *t11;
    char *t12;
    int t13;
    int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    unsigned char t19;
    unsigned char t20;
    char *t21;
    int t22;
    int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    int t32;
    int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    char *t37;

LAB0:    xsi_set_current_line(61, ng0);
    t2 = (t0 + 1352U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = (t4 == (unsigned char)3);
    if (t5 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    xsi_set_current_line(70, ng0);
    t2 = (t0 + 2472U);
    t3 = *((char **)t2);
    t2 = (t0 + 9620U);
    t9 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t3, t2);
    t1 = (t9 != 0);
    if (t1 != 0)
        goto LAB16;

LAB18:
LAB17:    xsi_set_current_line(84, ng0);
    t2 = (t0 + 1672U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = (t4 == (unsigned char)3);
    if (t5 == 1)
        goto LAB31;

LAB32:    t1 = (unsigned char)0;

LAB33:    if (t1 != 0)
        goto LAB28;

LAB30:
LAB29:    xsi_set_current_line(89, ng0);
    t2 = (t0 + 1832U);
    t3 = *((char **)t2);
    t1 = *((unsigned char *)t3);
    t4 = (t1 == (unsigned char)3);
    if (t4 != 0)
        goto LAB34;

LAB36:
LAB35:    t2 = (t0 + 5848);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(62, ng0);
    t7 = (t0 + 9784);
    *((int *)t7) = 0;
    t8 = (t0 + 9788);
    *((int *)t8) = 7;
    t9 = 0;
    t10 = 7;

LAB8:    if (t9 <= t10)
        goto LAB9;

LAB11:    goto LAB3;

LAB5:    t2 = (t0 + 1312U);
    t6 = xsi_signal_has_event(t2);
    t1 = t6;
    goto LAB7;

LAB9:    xsi_set_current_line(63, ng0);
    t11 = (t0 + 2792U);
    t12 = *((char **)t11);
    t11 = (t0 + 9784);
    t13 = *((int *)t11);
    t14 = (t13 - 7);
    t15 = (t14 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, *((int *)t11));
    t16 = (1U * t15);
    t17 = (0 + t16);
    t18 = (t12 + t17);
    t19 = *((unsigned char *)t18);
    t20 = (t19 == (unsigned char)3);
    if (t20 != 0)
        goto LAB12;

LAB14:    xsi_set_current_line(66, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 9784);
    t13 = *((int *)t2);
    t14 = (t13 - 7);
    t15 = (t14 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, *((int *)t2));
    t16 = (1U * t15);
    t17 = (0 + t16);
    t7 = (t3 + t17);
    t1 = *((unsigned char *)t7);
    t8 = (t0 + 9784);
    t22 = *((int *)t8);
    t23 = (t22 - 7);
    t24 = (t23 * -1);
    t25 = (1 * t24);
    t26 = (0U + t25);
    t11 = (t0 + 6072);
    t12 = (t11 + 56U);
    t18 = *((char **)t12);
    t21 = (t18 + 56U);
    t27 = *((char **)t21);
    *((unsigned char *)t27) = t1;
    xsi_driver_first_trans_delta(t11, t26, 1, 0LL);

LAB13:
LAB10:    t2 = (t0 + 9784);
    t9 = *((int *)t2);
    t3 = (t0 + 9788);
    t10 = *((int *)t3);
    if (t9 == t10)
        goto LAB11;

LAB15:    t13 = (t9 + 1);
    t9 = t13;
    t7 = (t0 + 9784);
    *((int *)t7) = t9;
    goto LAB8;

LAB12:    xsi_set_current_line(64, ng0);
    t21 = (t0 + 9784);
    t22 = *((int *)t21);
    t23 = (t22 - 7);
    t24 = (t23 * -1);
    t25 = (1 * t24);
    t26 = (0U + t25);
    t27 = (t0 + 6072);
    t28 = (t27 + 56U);
    t29 = *((char **)t28);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    *((unsigned char *)t31) = (unsigned char)2;
    xsi_driver_first_trans_delta(t27, t26, 1, 0LL);
    goto LAB13;

LAB16:    xsi_set_current_line(71, ng0);
    t7 = (t0 + 6136);
    t8 = (t7 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t18 = *((char **)t12);
    *((unsigned char *)t18) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t7);
    xsi_set_current_line(72, ng0);
    t2 = (t0 + 9792);
    *((int *)t2) = 0;
    t3 = (t0 + 9796);
    *((int *)t3) = 7;
    t9 = 0;
    t10 = 7;

LAB19:    if (t9 <= t10)
        goto LAB20;

LAB22:    goto LAB17;

LAB20:    xsi_set_current_line(73, ng0);
    t7 = (t0 + 2472U);
    t8 = *((char **)t7);
    t7 = (t0 + 9792);
    t13 = *((int *)t7);
    t14 = (t13 - 7);
    t15 = (t14 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, *((int *)t7));
    t16 = (1U * t15);
    t17 = (0 + t16);
    t11 = (t8 + t17);
    t1 = *((unsigned char *)t11);
    t12 = (t0 + 2632U);
    t18 = *((char **)t12);
    t12 = (t0 + 9792);
    t22 = *((int *)t12);
    t23 = (t22 - 7);
    t24 = (t23 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, *((int *)t12));
    t25 = (1U * t24);
    t26 = (0 + t25);
    t21 = (t18 + t26);
    t4 = *((unsigned char *)t21);
    t5 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t4);
    t6 = ieee_p_2592010699_sub_1605435078_503743352(IEEE_P_2592010699, t1, t5);
    t19 = (t6 == (unsigned char)3);
    if (t19 != 0)
        goto LAB23;

LAB25:
LAB24:
LAB21:    t2 = (t0 + 9792);
    t9 = *((int *)t2);
    t3 = (t0 + 9796);
    t10 = *((int *)t3);
    if (t9 == t10)
        goto LAB22;

LAB27:    t13 = (t9 + 1);
    t9 = t13;
    t7 = (t0 + 9792);
    *((int *)t7) = t9;
    goto LAB19;

LAB23:    xsi_set_current_line(74, ng0);
    t27 = (t0 + 9792);
    t32 = *((int *)t27);
    t33 = (t32 - 7);
    t34 = (t33 * -1);
    t35 = (1 * t34);
    t36 = (0U + t35);
    t28 = (t0 + 6200);
    t29 = (t28 + 56U);
    t30 = *((char **)t29);
    t31 = (t30 + 56U);
    t37 = *((char **)t31);
    *((unsigned char *)t37) = (unsigned char)3;
    xsi_driver_first_trans_delta(t28, t36, 1, 0LL);
    xsi_set_current_line(75, ng0);
    t2 = (t0 + 9792);
    t13 = *((int *)t2);
    t14 = (t13 - 7);
    t15 = (t14 * -1);
    t16 = (1 * t15);
    t17 = (0U + t16);
    t3 = (t0 + 6072);
    t7 = (t3 + 56U);
    t8 = *((char **)t7);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_delta(t3, t17, 1, 0LL);
    xsi_set_current_line(76, ng0);
    t2 = (t0 + 9792);
    t3 = (t0 + 6264);
    t7 = (t3 + 56U);
    t8 = *((char **)t7);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    *((int *)t12) = *((int *)t2);
    xsi_driver_first_trans_fast(t3);
    xsi_set_current_line(77, ng0);
    t2 = (t0 + 9792);
    t3 = (t0 + 3112U);
    t7 = *((char **)t3);
    t13 = *((int *)t7);
    t14 = (t13 + 1);
    t22 = (t14 - 0);
    t15 = (t22 * 1);
    t16 = (1 * t15);
    t17 = (0U + t16);
    t3 = (t0 + 6328);
    t8 = (t3 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t18 = *((char **)t12);
    *((int *)t18) = *((int *)t2);
    xsi_driver_first_trans_delta(t3, t17, 1, 0LL);
    xsi_set_current_line(78, ng0);
    t2 = (t0 + 3112U);
    t3 = *((char **)t2);
    t13 = *((int *)t3);
    t14 = (t13 + 1);
    t2 = (t0 + 6392);
    t7 = (t2 + 56U);
    t8 = *((char **)t7);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    *((int *)t12) = t14;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(79, ng0);
    t2 = (t0 + 6136);
    t3 = (t2 + 56U);
    t7 = *((char **)t3);
    t8 = (t7 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(80, ng0);
    goto LAB22;

LAB26:    goto LAB24;

LAB28:    xsi_set_current_line(85, ng0);
    t7 = (t0 + 3592U);
    t8 = *((char **)t7);
    t9 = *((int *)t8);
    t10 = (t9 - 7);
    t15 = (t10 * -1);
    t16 = (1 * t15);
    t17 = (0U + t16);
    t7 = (t0 + 6200);
    t11 = (t7 + 56U);
    t12 = *((char **)t11);
    t18 = (t12 + 56U);
    t21 = *((char **)t18);
    *((unsigned char *)t21) = (unsigned char)2;
    xsi_driver_first_trans_delta(t7, t17, 1, 0LL);
    xsi_set_current_line(86, ng0);
    t2 = (t0 + 2952U);
    t3 = *((char **)t2);
    t2 = (t0 + 3112U);
    t7 = *((char **)t2);
    t9 = *((int *)t7);
    t10 = (t9 - 1);
    t13 = (t10 - 0);
    t15 = (t13 * 1);
    xsi_vhdl_check_range_of_index(0, 8, 1, t10);
    t16 = (4U * t15);
    t17 = (0 + t16);
    t2 = (t3 + t17);
    t14 = *((int *)t2);
    t8 = (t0 + 6264);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    t18 = (t12 + 56U);
    t21 = *((char **)t18);
    *((int *)t21) = t14;
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(87, ng0);
    t2 = (t0 + 3112U);
    t3 = *((char **)t2);
    t9 = *((int *)t3);
    t10 = (t9 - 1);
    t2 = (t0 + 6392);
    t7 = (t2 + 56U);
    t8 = *((char **)t7);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    *((int *)t12) = t10;
    xsi_driver_first_trans_fast(t2);
    goto LAB29;

LAB31:    t2 = (t0 + 1632U);
    t6 = xsi_signal_has_event(t2);
    t1 = t6;
    goto LAB33;

LAB34:    xsi_set_current_line(90, ng0);
    t2 = (t0 + 6136);
    t7 = (t2 + 56U);
    t8 = *((char **)t7);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t2);
    goto LAB35;

}

static void work_a_4129807357_3212880686_p_3(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    xsi_set_current_line(94, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB5:    t10 = (t0 + 2792U);
    t11 = *((char **)t10);
    t10 = (t0 + 6456);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t11, 8U);
    xsi_driver_first_trans_fast(t10);

LAB2:    t16 = (t0 + 5864);
    *((int *)t16) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 1192U);
    t5 = *((char **)t1);
    t1 = (t0 + 6456);
    t6 = (t1 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t5, 8U);
    xsi_driver_first_trans_fast(t1);
    goto LAB2;

LAB6:    goto LAB2;

}


extern void work_a_4129807357_3212880686_init()
{
	static char *pe[] = {(void *)work_a_4129807357_3212880686_p_0,(void *)work_a_4129807357_3212880686_p_1,(void *)work_a_4129807357_3212880686_p_2,(void *)work_a_4129807357_3212880686_p_3};
	xsi_register_didat("work_a_4129807357_3212880686", "isim/tbINTctrl_isim_beh.exe.sim/work/a_4129807357_3212880686.didat");
	xsi_register_executes(pe);
}
