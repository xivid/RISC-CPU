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
static const char *ng0 = "C:/Users/Administrator/CPU/RISC-CPU/RISC-CPU/EXctrl.vhd";
extern char *IEEE_P_3620187407;
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1258338084_503743352(char *, char *, unsigned int , unsigned int );
unsigned char ieee_p_2592010699_sub_2507238156_503743352(char *, unsigned char , unsigned char );
int ieee_p_3620187407_sub_514432868_3965413181(char *, char *, char *);
char *ieee_p_3620187407_sub_674691591_3965413181(char *, char *, char *, char *, unsigned char );
char *ieee_p_3620187407_sub_674763465_3965413181(char *, char *, char *, char *, unsigned char );
char *ieee_p_3620187407_sub_767668596_3965413181(char *, char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_767740470_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_2298125690_3212880686_p_0(char *t0)
{
    char t13[16];
    char t27[16];
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t14;
    char *t15;
    int t16;
    unsigned int t17;
    int t18;
    int t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t28;
    char *t29;
    char *t30;

LAB0:    xsi_set_current_line(55, ng0);
    t2 = (t0 + 1152U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 4888);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(56, ng0);
    t4 = (t0 + 2312U);
    t8 = *((char **)t4);
    t4 = (t0 + 1832U);
    t9 = *((char **)t4);
    t10 = (15 - 10);
    t11 = (t10 * 1U);
    t12 = (0 + t11);
    t4 = (t9 + t12);
    t14 = (t13 + 0U);
    t15 = (t14 + 0U);
    *((int *)t15) = 10;
    t15 = (t14 + 4U);
    *((int *)t15) = 8;
    t15 = (t14 + 8U);
    *((int *)t15) = -1;
    t16 = (8 - 10);
    t17 = (t16 * -1);
    t17 = (t17 + 1);
    t15 = (t14 + 12U);
    *((unsigned int *)t15) = t17;
    t18 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t4, t13);
    t19 = (t18 - 7);
    t17 = (t19 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, t18);
    t20 = (8U * t17);
    t21 = (0 + t20);
    t15 = (t8 + t21);
    t22 = (t0 + 5000);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t15, 8U);
    xsi_driver_first_trans_fast(t22);
    xsi_set_current_line(57, ng0);
    t2 = (t0 + 2312U);
    t4 = *((char **)t2);
    t2 = (t0 + 1832U);
    t5 = *((char **)t2);
    t10 = (15 - 2);
    t11 = (t10 * 1U);
    t12 = (0 + t11);
    t2 = (t5 + t12);
    t8 = (t13 + 0U);
    t9 = (t8 + 0U);
    *((int *)t9) = 2;
    t9 = (t8 + 4U);
    *((int *)t9) = 0;
    t9 = (t8 + 8U);
    *((int *)t9) = -1;
    t16 = (0 - 2);
    t17 = (t16 * -1);
    t17 = (t17 + 1);
    t9 = (t8 + 12U);
    *((unsigned int *)t9) = t17;
    t18 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t2, t13);
    t19 = (t18 - 7);
    t17 = (t19 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, t18);
    t20 = (8U * t17);
    t21 = (0 + t20);
    t9 = (t4 + t21);
    t14 = (t0 + 5064);
    t15 = (t14 + 56U);
    t22 = *((char **)t15);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t9, 8U);
    xsi_driver_first_trans_fast(t14);
    xsi_set_current_line(58, ng0);
    t2 = (t0 + 1832U);
    t4 = *((char **)t2);
    t10 = (15 - 7);
    t11 = (t10 * 1U);
    t12 = (0 + t11);
    t2 = (t4 + t12);
    t5 = (t0 + 5128);
    t8 = (t5 + 56U);
    t9 = *((char **)t8);
    t14 = (t9 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t2, 8U);
    xsi_driver_first_trans_delta(t5, 8U, 8U, 0LL);
    xsi_set_current_line(59, ng0);
    t2 = (t0 + 1832U);
    t4 = *((char **)t2);
    t10 = (15 - 15);
    t11 = (t10 * 1U);
    t12 = (0 + t11);
    t2 = (t4 + t12);
    t5 = (t13 + 0U);
    t8 = (t5 + 0U);
    *((int *)t8) = 15;
    t8 = (t5 + 4U);
    *((int *)t8) = 13;
    t8 = (t5 + 8U);
    *((int *)t8) = -1;
    t16 = (13 - 15);
    t17 = (t16 * -1);
    t17 = (t17 + 1);
    t8 = (t5 + 12U);
    *((unsigned int *)t8) = t17;
    t8 = (t0 + 8444);
    t14 = (t27 + 0U);
    t15 = (t14 + 0U);
    *((int *)t15) = 0;
    t15 = (t14 + 4U);
    *((int *)t15) = 2;
    t15 = (t14 + 8U);
    *((int *)t15) = 1;
    t18 = (2 - 0);
    t17 = (t18 * 1);
    t17 = (t17 + 1);
    t15 = (t14 + 12U);
    *((unsigned int *)t15) = t17;
    t1 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t13, t8, t27);
    if (t1 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(62, ng0);
    t2 = (t0 + 2312U);
    t4 = *((char **)t2);
    t16 = (7 - 7);
    t10 = (t16 * -1);
    t11 = (8U * t10);
    t12 = (0 + t11);
    t2 = (t4 + t12);
    t5 = (t0 + 5128);
    t8 = (t5 + 56U);
    t9 = *((char **)t8);
    t14 = (t9 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t2, 8U);
    xsi_driver_first_trans_delta(t5, 0U, 8U, 0LL);

LAB9:    goto LAB3;

LAB5:    t4 = (t0 + 1192U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_set_current_line(60, ng0);
    t15 = xsi_get_transient_memory(8U);
    memset(t15, 0, 8U);
    t22 = t15;
    t23 = (t0 + 1832U);
    t24 = *((char **)t23);
    t19 = (7 - 15);
    t17 = (t19 * -1);
    t20 = (1U * t17);
    t21 = (0 + t20);
    t23 = (t24 + t21);
    t3 = *((unsigned char *)t23);
    memset(t22, t3, 8U);
    t25 = (t0 + 5128);
    t26 = (t25 + 56U);
    t28 = *((char **)t26);
    t29 = (t28 + 56U);
    t30 = *((char **)t29);
    memcpy(t30, t15, 8U);
    xsi_driver_first_trans_delta(t25, 0U, 8U, 0LL);
    goto LAB9;

}

static void work_a_2298125690_3212880686_p_1(char *t0)
{
    char t44[16];
    char t45[16];
    char t46[16];
    char t50[16];
    unsigned char t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    int t14;
    char *t15;
    char *t16;
    int t17;
    char *t18;
    char *t19;
    int t20;
    char *t21;
    char *t22;
    int t23;
    char *t24;
    char *t25;
    int t26;
    char *t27;
    char *t28;
    int t29;
    char *t30;
    char *t31;
    int t32;
    char *t33;
    int t35;
    char *t36;
    int t38;
    char *t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t51;
    unsigned int t52;

LAB0:    xsi_set_current_line(107, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = (t4 == (unsigned char)3);
    if (t5 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 4904);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(109, ng0);
    t7 = (t0 + 1832U);
    t8 = *((char **)t7);
    t9 = (15 - 15);
    t10 = (t9 * 1U);
    t11 = (0 + t10);
    t7 = (t8 + t11);
    t12 = (t0 + 8447);
    t14 = xsi_mem_cmp(t12, t7, 5U);
    if (t14 == 1)
        goto LAB9;

LAB19:    t15 = (t0 + 8452);
    t17 = xsi_mem_cmp(t15, t7, 5U);
    if (t17 == 1)
        goto LAB10;

LAB20:    t18 = (t0 + 8457);
    t20 = xsi_mem_cmp(t18, t7, 5U);
    if (t20 == 1)
        goto LAB11;

LAB21:    t21 = (t0 + 8462);
    t23 = xsi_mem_cmp(t21, t7, 5U);
    if (t23 == 1)
        goto LAB12;

LAB22:    t24 = (t0 + 8467);
    t26 = xsi_mem_cmp(t24, t7, 5U);
    if (t26 == 1)
        goto LAB13;

LAB23:    t27 = (t0 + 8472);
    t29 = xsi_mem_cmp(t27, t7, 5U);
    if (t29 == 1)
        goto LAB14;

LAB24:    t30 = (t0 + 8477);
    t32 = xsi_mem_cmp(t30, t7, 5U);
    if (t32 == 1)
        goto LAB15;

LAB25:    t33 = (t0 + 8482);
    t35 = xsi_mem_cmp(t33, t7, 5U);
    if (t35 == 1)
        goto LAB16;

LAB26:    t36 = (t0 + 8487);
    t38 = xsi_mem_cmp(t36, t7, 5U);
    if (t38 == 1)
        goto LAB17;

LAB27:
LAB18:    xsi_set_current_line(123, ng0);

LAB8:    goto LAB3;

LAB5:    t2 = (t0 + 992U);
    t6 = ieee_p_2592010699_sub_1258338084_503743352(IEEE_P_2592010699, t2, 0U, 0U);
    t1 = t6;
    goto LAB7;

LAB9:    xsi_set_current_line(110, ng0);
    t39 = (t0 + 5192);
    t40 = (t39 + 56U);
    t41 = *((char **)t40);
    t42 = (t41 + 56U);
    t43 = *((char **)t42);
    *((unsigned char *)t43) = (unsigned char)2;
    xsi_driver_first_trans_fast(t39);
    goto LAB8;

LAB10:    xsi_set_current_line(111, ng0);
    t2 = (t0 + 5192);
    t3 = (t2 + 56U);
    t7 = *((char **)t3);
    t8 = (t7 + 56U);
    t12 = *((char **)t8);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    goto LAB8;

LAB11:    xsi_set_current_line(112, ng0);
    t2 = (t0 + 2472U);
    t3 = *((char **)t2);
    t14 = (7 - 7);
    t9 = (t14 * -1);
    t10 = (1U * t9);
    t11 = (0 + t10);
    t2 = (t3 + t11);
    t1 = *((unsigned char *)t2);
    t7 = (t0 + 2472U);
    t8 = *((char **)t7);
    t12 = ((IEEE_P_2592010699) + 4024);
    t13 = (t0 + 8260U);
    t7 = xsi_base_array_concat(t7, t46, t12, (char)99, t1, (char)97, t8, t13, (char)101);
    t15 = (t0 + 2632U);
    t16 = *((char **)t15);
    t17 = (7 - 7);
    t47 = (t17 * -1);
    t48 = (1U * t47);
    t49 = (0 + t48);
    t15 = (t16 + t49);
    t4 = *((unsigned char *)t15);
    t18 = (t0 + 2632U);
    t19 = *((char **)t18);
    t21 = ((IEEE_P_2592010699) + 4024);
    t22 = (t0 + 8260U);
    t18 = xsi_base_array_concat(t18, t50, t21, (char)99, t4, (char)97, t19, t22, (char)101);
    t24 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t45, t7, t46, t18, t50);
    t25 = (t0 + 2792U);
    t27 = *((char **)t25);
    t5 = *((unsigned char *)t27);
    t25 = ieee_p_3620187407_sub_674691591_3965413181(IEEE_P_3620187407, t44, t24, t45, t5);
    t28 = (t0 + 3088U);
    t30 = *((char **)t28);
    t28 = (t30 + 0);
    t31 = (t44 + 12U);
    t51 = *((unsigned int *)t31);
    t52 = (1U * t51);
    memcpy(t28, t25, t52);
    xsi_set_current_line(113, ng0);
    t2 = (t0 + 3088U);
    t3 = *((char **)t2);
    t9 = (8 - 7);
    t10 = (t9 * 1U);
    t11 = (0 + t10);
    t2 = (t3 + t11);
    t7 = (t0 + 5256);
    t8 = (t7 + 56U);
    t12 = *((char **)t8);
    t13 = (t12 + 56U);
    t15 = *((char **)t13);
    memcpy(t15, t2, 8U);
    xsi_driver_first_trans_fast_port(t7);
    xsi_set_current_line(114, ng0);
    t2 = (t0 + 3088U);
    t3 = *((char **)t2);
    t14 = (8 - 8);
    t9 = (t14 * -1);
    t10 = (1U * t9);
    t11 = (0 + t10);
    t2 = (t3 + t11);
    t1 = *((unsigned char *)t2);
    t7 = (t0 + 3088U);
    t8 = *((char **)t7);
    t17 = (7 - 8);
    t47 = (t17 * -1);
    t48 = (1U * t47);
    t49 = (0 + t48);
    t7 = (t8 + t49);
    t4 = *((unsigned char *)t7);
    t5 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t1, t4);
    t12 = (t0 + 5192);
    t13 = (t12 + 56U);
    t15 = *((char **)t13);
    t16 = (t15 + 56U);
    t18 = *((char **)t16);
    *((unsigned char *)t18) = t5;
    xsi_driver_first_trans_fast(t12);
    goto LAB8;

LAB12:    xsi_set_current_line(115, ng0);
    t2 = (t0 + 2472U);
    t3 = *((char **)t2);
    t14 = (7 - 7);
    t9 = (t14 * -1);
    t10 = (1U * t9);
    t11 = (0 + t10);
    t2 = (t3 + t11);
    t1 = *((unsigned char *)t2);
    t7 = (t0 + 2472U);
    t8 = *((char **)t7);
    t12 = ((IEEE_P_2592010699) + 4024);
    t13 = (t0 + 8260U);
    t7 = xsi_base_array_concat(t7, t46, t12, (char)99, t1, (char)97, t8, t13, (char)101);
    t15 = (t0 + 2632U);
    t16 = *((char **)t15);
    t17 = (7 - 7);
    t47 = (t17 * -1);
    t48 = (1U * t47);
    t49 = (0 + t48);
    t15 = (t16 + t49);
    t4 = *((unsigned char *)t15);
    t18 = (t0 + 2632U);
    t19 = *((char **)t18);
    t21 = ((IEEE_P_2592010699) + 4024);
    t22 = (t0 + 8260U);
    t18 = xsi_base_array_concat(t18, t50, t21, (char)99, t4, (char)97, t19, t22, (char)101);
    t24 = ieee_p_3620187407_sub_767740470_3965413181(IEEE_P_3620187407, t45, t7, t46, t18, t50);
    t25 = (t0 + 2792U);
    t27 = *((char **)t25);
    t5 = *((unsigned char *)t27);
    t25 = ieee_p_3620187407_sub_674763465_3965413181(IEEE_P_3620187407, t44, t24, t45, t5);
    t28 = (t0 + 3088U);
    t30 = *((char **)t28);
    t28 = (t30 + 0);
    t31 = (t44 + 12U);
    t51 = *((unsigned int *)t31);
    t52 = (1U * t51);
    memcpy(t28, t25, t52);
    xsi_set_current_line(116, ng0);
    t2 = (t0 + 3088U);
    t3 = *((char **)t2);
    t9 = (8 - 7);
    t10 = (t9 * 1U);
    t11 = (0 + t10);
    t2 = (t3 + t11);
    t7 = (t0 + 5256);
    t8 = (t7 + 56U);
    t12 = *((char **)t8);
    t13 = (t12 + 56U);
    t15 = *((char **)t13);
    memcpy(t15, t2, 8U);
    xsi_driver_first_trans_fast_port(t7);
    xsi_set_current_line(117, ng0);
    t2 = (t0 + 3088U);
    t3 = *((char **)t2);
    t14 = (8 - 8);
    t9 = (t14 * -1);
    t10 = (1U * t9);
    t11 = (0 + t10);
    t2 = (t3 + t11);
    t1 = *((unsigned char *)t2);
    t7 = (t0 + 3088U);
    t8 = *((char **)t7);
    t17 = (7 - 8);
    t47 = (t17 * -1);
    t48 = (1U * t47);
    t49 = (0 + t48);
    t7 = (t8 + t49);
    t4 = *((unsigned char *)t7);
    t5 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t1, t4);
    t12 = (t0 + 5192);
    t13 = (t12 + 56U);
    t15 = *((char **)t13);
    t16 = (t15 + 56U);
    t18 = *((char **)t16);
    *((unsigned char *)t18) = t5;
    xsi_driver_first_trans_fast(t12);
    goto LAB8;

LAB13:    xsi_set_current_line(118, ng0);
    t2 = (t0 + 1832U);
    t3 = *((char **)t2);
    t9 = (15 - 7);
    t10 = (t9 * 1U);
    t11 = (0 + t10);
    t2 = (t3 + t11);
    t7 = (t0 + 5256);
    t8 = (t7 + 56U);
    t12 = *((char **)t8);
    t13 = (t12 + 56U);
    t15 = *((char **)t13);
    memcpy(t15, t2, 8U);
    xsi_driver_first_trans_fast_port(t7);
    goto LAB8;

LAB14:    xsi_set_current_line(119, ng0);
    t2 = (t0 + 2632U);
    t3 = *((char **)t2);
    t2 = (t0 + 5256);
    t7 = (t2 + 56U);
    t8 = *((char **)t7);
    t12 = (t8 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t3, 8U);
    xsi_driver_first_trans_fast_port(t2);
    goto LAB8;

LAB15:    xsi_set_current_line(120, ng0);
    t2 = (t0 + 2472U);
    t3 = *((char **)t2);
    t2 = (t0 + 5256);
    t7 = (t2 + 56U);
    t8 = *((char **)t7);
    t12 = (t8 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t3, 8U);
    xsi_driver_first_trans_fast_port(t2);
    goto LAB8;

LAB16:    xsi_set_current_line(121, ng0);
    t2 = (t0 + 2472U);
    t3 = *((char **)t2);
    t2 = (t0 + 5256);
    t7 = (t2 + 56U);
    t8 = *((char **)t7);
    t12 = (t8 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t3, 8U);
    xsi_driver_first_trans_fast_port(t2);
    goto LAB8;

LAB17:    xsi_set_current_line(122, ng0);
    t2 = (t0 + 2472U);
    t3 = *((char **)t2);
    t2 = (t0 + 5256);
    t7 = (t2 + 56U);
    t8 = *((char **)t7);
    t12 = (t8 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t3, 8U);
    xsi_driver_first_trans_fast_port(t2);
    goto LAB8;

LAB28:;
}

static void work_a_2298125690_3212880686_p_2(char *t0)
{
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    char *t9;
    int t10;
    int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;

LAB0:    xsi_set_current_line(132, ng0);
    t2 = (t0 + 1312U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 4920);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(133, ng0);
    t4 = (t0 + 1672U);
    t8 = *((char **)t4);
    t4 = (t0 + 1512U);
    t9 = *((char **)t4);
    t4 = (t0 + 8148U);
    t10 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t9, t4);
    t11 = (t10 - 7);
    t12 = (t11 * -1);
    t13 = (8U * t12);
    t14 = (0U + t13);
    t15 = (t0 + 5320);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    memcpy(t19, t8, 8U);
    xsi_driver_first_trans_delta(t15, t14, 8U, 0LL);
    goto LAB3;

LAB5:    t4 = (t0 + 1352U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

}


extern void work_a_2298125690_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2298125690_3212880686_p_0,(void *)work_a_2298125690_3212880686_p_1,(void *)work_a_2298125690_3212880686_p_2};
	xsi_register_didat("work_a_2298125690_3212880686", "isim/tbEXctrl_isim_beh.exe.sim/work/a_2298125690_3212880686.didat");
	xsi_register_executes(pe);
}
