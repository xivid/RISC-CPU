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
static const char *ng0 = "C:/Users/Administrator/CPU/RISC-CPU/RISC-CPU/WBctrl.vhd";
extern char *IEEE_P_3620187407;
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1605435078_503743352(char *, unsigned char , unsigned char );
char *ieee_p_3620187407_sub_767668596_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_2172560711_3212880686_p_0(char *t0)
{
    char t6[16];
    char t15[16];
    unsigned char t1;
    char *t2;
    char *t3;
    char *t4;
    char *t7;
    char *t8;
    int t9;
    unsigned int t10;
    unsigned char t11;
    char *t12;
    char *t13;
    char *t16;
    char *t17;
    int t18;
    unsigned char t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;

LAB0:    xsi_set_current_line(55, ng0);
    t2 = (t0 + 1992U);
    t3 = *((char **)t2);
    t2 = (t0 + 8400U);
    t4 = (t0 + 8546);
    t7 = (t6 + 0U);
    t8 = (t7 + 0U);
    *((int *)t8) = 0;
    t8 = (t7 + 4U);
    *((int *)t8) = 4;
    t8 = (t7 + 8U);
    *((int *)t8) = 1;
    t9 = (4 - 0);
    t10 = (t9 * 1);
    t10 = (t10 + 1);
    t8 = (t7 + 12U);
    *((unsigned int *)t8) = t10;
    t11 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t3, t2, t4, t6);
    if (t11 == 1)
        goto LAB5;

LAB6:    t8 = (t0 + 1992U);
    t12 = *((char **)t8);
    t8 = (t0 + 8400U);
    t13 = (t0 + 8551);
    t16 = (t15 + 0U);
    t17 = (t16 + 0U);
    *((int *)t17) = 0;
    t17 = (t16 + 4U);
    *((int *)t17) = 4;
    t17 = (t16 + 8U);
    *((int *)t17) = 1;
    t18 = (4 - 0);
    t10 = (t18 * 1);
    t10 = (t10 + 1);
    t17 = (t16 + 12U);
    *((unsigned int *)t17) = t10;
    t19 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t12, t8, t13, t15);
    t1 = t19;

LAB7:    if (t1 != 0)
        goto LAB3;

LAB4:
LAB8:    t25 = (t0 + 1672U);
    t26 = *((char **)t25);
    t25 = (t0 + 5568);
    t27 = (t25 + 56U);
    t28 = *((char **)t27);
    t29 = (t28 + 56U);
    t30 = *((char **)t29);
    memcpy(t30, t26, 8U);
    xsi_driver_first_trans_fast_port(t25);

LAB2:    t31 = (t0 + 5424);
    *((int *)t31) = 1;

LAB1:    return;
LAB3:    t17 = (t0 + 1192U);
    t20 = *((char **)t17);
    t17 = (t0 + 5568);
    t21 = (t17 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t20, 8U);
    xsi_driver_first_trans_fast_port(t17);
    goto LAB2;

LAB5:    t1 = (unsigned char)1;
    goto LAB7;

LAB9:    goto LAB2;

}

static void work_a_2172560711_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(57, ng0);

LAB3:    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t1 = (t0 + 5632);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 3U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 5440);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_2172560711_3212880686_p_2(char *t0)
{
    char t1[16];
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    xsi_set_current_line(58, ng0);

LAB3:    t2 = (t0 + 1352U);
    t3 = *((char **)t2);
    t2 = (t0 + 8352U);
    t4 = (t0 + 1512U);
    t5 = *((char **)t4);
    t4 = (t0 + 8368U);
    t6 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t1, t3, t2, t5, t4);
    t7 = (t1 + 12U);
    t8 = *((unsigned int *)t7);
    t9 = (1U * t8);
    t10 = (16U != t9);
    if (t10 == 1)
        goto LAB5;

LAB6:    t11 = (t0 + 5696);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t6, 16U);
    xsi_driver_first_trans_fast_port(t11);

LAB2:    t16 = (t0 + 5456);
    *((int *)t16) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(16U, t9, 0);
    goto LAB6;

}

static void work_a_2172560711_3212880686_p_3(char *t0)
{
    char t6[16];
    char t16[16];
    char t24[16];
    unsigned char t1;
    char *t2;
    char *t3;
    char *t4;
    char *t7;
    char *t8;
    int t9;
    unsigned int t10;
    unsigned char t11;
    unsigned char t12;
    char *t13;
    char *t14;
    char *t17;
    char *t18;
    int t19;
    unsigned char t20;
    char *t21;
    char *t22;
    char *t25;
    char *t26;
    int t27;
    unsigned char t28;
    char *t29;
    unsigned char t30;
    char *t31;
    unsigned char t32;
    unsigned char t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;

LAB0:    xsi_set_current_line(63, ng0);
    t2 = (t0 + 1992U);
    t3 = *((char **)t2);
    t2 = (t0 + 8400U);
    t4 = (t0 + 8556);
    t7 = (t6 + 0U);
    t8 = (t7 + 0U);
    *((int *)t8) = 0;
    t8 = (t7 + 4U);
    *((int *)t8) = 4;
    t8 = (t7 + 8U);
    *((int *)t8) = 1;
    t9 = (4 - 0);
    t10 = (t9 * 1);
    t10 = (t10 + 1);
    t8 = (t7 + 12U);
    *((unsigned int *)t8) = t10;
    t11 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t3, t2, t4, t6);
    if (t11 == 1)
        goto LAB5;

LAB6:    t8 = (t0 + 1992U);
    t13 = *((char **)t8);
    t8 = (t0 + 8400U);
    t14 = (t0 + 8561);
    t17 = (t16 + 0U);
    t18 = (t17 + 0U);
    *((int *)t18) = 0;
    t18 = (t17 + 4U);
    *((int *)t18) = 4;
    t18 = (t17 + 8U);
    *((int *)t18) = 1;
    t19 = (4 - 0);
    t10 = (t19 * 1);
    t10 = (t10 + 1);
    t18 = (t17 + 12U);
    *((unsigned int *)t18) = t10;
    t20 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t13, t8, t14, t16);
    if (t20 == 1)
        goto LAB8;

LAB9:    t12 = (unsigned char)0;

LAB10:    t1 = t12;

LAB7:    if (t1 != 0)
        goto LAB3;

LAB4:
LAB11:    t38 = (t0 + 5760);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    t41 = (t40 + 56U);
    t42 = *((char **)t41);
    *((unsigned char *)t42) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t38);

LAB2:    t43 = (t0 + 5472);
    *((int *)t43) = 1;

LAB1:    return;
LAB3:    t26 = (t0 + 1832U);
    t29 = *((char **)t26);
    t30 = *((unsigned char *)t29);
    t26 = (t0 + 1032U);
    t31 = *((char **)t26);
    t32 = *((unsigned char *)t31);
    t33 = ieee_p_2592010699_sub_1605435078_503743352(IEEE_P_2592010699, t30, t32);
    t26 = (t0 + 5760);
    t34 = (t26 + 56U);
    t35 = *((char **)t34);
    t36 = (t35 + 56U);
    t37 = *((char **)t36);
    *((unsigned char *)t37) = t33;
    xsi_driver_first_trans_fast_port(t26);
    goto LAB2;

LAB5:    t1 = (unsigned char)1;
    goto LAB7;

LAB8:    t18 = (t0 + 1672U);
    t21 = *((char **)t18);
    t18 = (t0 + 8384U);
    t22 = (t0 + 8566);
    t25 = (t24 + 0U);
    t26 = (t25 + 0U);
    *((int *)t26) = 0;
    t26 = (t25 + 4U);
    *((int *)t26) = 7;
    t26 = (t25 + 8U);
    *((int *)t26) = 1;
    t27 = (7 - 0);
    t10 = (t27 * 1);
    t10 = (t10 + 1);
    t26 = (t25 + 12U);
    *((unsigned int *)t26) = t10;
    t28 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t21, t18, t22, t24);
    t12 = t28;
    goto LAB10;

LAB12:    goto LAB2;

}

static void work_a_2172560711_3212880686_p_4(char *t0)
{
    char t10[16];
    char t19[16];
    char t27[16];
    char t35[16];
    char t43[16];
    char t51[16];
    unsigned char t1;
    unsigned char t2;
    unsigned char t3;
    unsigned char t4;
    unsigned char t5;
    char *t6;
    char *t7;
    char *t8;
    char *t11;
    char *t12;
    int t13;
    unsigned int t14;
    unsigned char t15;
    char *t16;
    char *t17;
    char *t20;
    char *t21;
    int t22;
    unsigned char t23;
    char *t24;
    char *t25;
    char *t28;
    char *t29;
    int t30;
    unsigned char t31;
    char *t32;
    char *t33;
    char *t36;
    char *t37;
    int t38;
    unsigned char t39;
    char *t40;
    char *t41;
    char *t44;
    char *t45;
    int t46;
    unsigned char t47;
    char *t48;
    char *t49;
    char *t52;
    char *t53;
    int t54;
    unsigned char t55;
    char *t56;
    unsigned char t57;
    char *t58;
    unsigned char t59;
    unsigned char t60;
    char *t61;
    char *t62;
    char *t63;
    char *t64;
    char *t65;
    char *t66;
    char *t67;
    char *t68;
    char *t69;
    char *t70;

LAB0:    xsi_set_current_line(64, ng0);
    t6 = (t0 + 1992U);
    t7 = *((char **)t6);
    t6 = (t0 + 8400U);
    t8 = (t0 + 8574);
    t11 = (t10 + 0U);
    t12 = (t11 + 0U);
    *((int *)t12) = 0;
    t12 = (t11 + 4U);
    *((int *)t12) = 4;
    t12 = (t11 + 8U);
    *((int *)t12) = 1;
    t13 = (4 - 0);
    t14 = (t13 * 1);
    t14 = (t14 + 1);
    t12 = (t11 + 12U);
    *((unsigned int *)t12) = t14;
    t15 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t7, t6, t8, t10);
    if (t15 == 1)
        goto LAB17;

LAB18:    t12 = (t0 + 1992U);
    t16 = *((char **)t12);
    t12 = (t0 + 8400U);
    t17 = (t0 + 8579);
    t20 = (t19 + 0U);
    t21 = (t20 + 0U);
    *((int *)t21) = 0;
    t21 = (t20 + 4U);
    *((int *)t21) = 4;
    t21 = (t20 + 8U);
    *((int *)t21) = 1;
    t22 = (4 - 0);
    t14 = (t22 * 1);
    t14 = (t14 + 1);
    t21 = (t20 + 12U);
    *((unsigned int *)t21) = t14;
    t23 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t16, t12, t17, t19);
    t5 = t23;

LAB19:    if (t5 == 1)
        goto LAB14;

LAB15:    t21 = (t0 + 1992U);
    t24 = *((char **)t21);
    t21 = (t0 + 8400U);
    t25 = (t0 + 8584);
    t28 = (t27 + 0U);
    t29 = (t28 + 0U);
    *((int *)t29) = 0;
    t29 = (t28 + 4U);
    *((int *)t29) = 4;
    t29 = (t28 + 8U);
    *((int *)t29) = 1;
    t30 = (4 - 0);
    t14 = (t30 * 1);
    t14 = (t14 + 1);
    t29 = (t28 + 12U);
    *((unsigned int *)t29) = t14;
    t31 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t24, t21, t25, t27);
    t4 = t31;

LAB16:    if (t4 == 1)
        goto LAB11;

LAB12:    t29 = (t0 + 1992U);
    t32 = *((char **)t29);
    t29 = (t0 + 8400U);
    t33 = (t0 + 8589);
    t36 = (t35 + 0U);
    t37 = (t36 + 0U);
    *((int *)t37) = 0;
    t37 = (t36 + 4U);
    *((int *)t37) = 4;
    t37 = (t36 + 8U);
    *((int *)t37) = 1;
    t38 = (4 - 0);
    t14 = (t38 * 1);
    t14 = (t14 + 1);
    t37 = (t36 + 12U);
    *((unsigned int *)t37) = t14;
    t39 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t32, t29, t33, t35);
    t3 = t39;

LAB13:    if (t3 == 1)
        goto LAB8;

LAB9:    t37 = (t0 + 1992U);
    t40 = *((char **)t37);
    t37 = (t0 + 8400U);
    t41 = (t0 + 8594);
    t44 = (t43 + 0U);
    t45 = (t44 + 0U);
    *((int *)t45) = 0;
    t45 = (t44 + 4U);
    *((int *)t45) = 4;
    t45 = (t44 + 8U);
    *((int *)t45) = 1;
    t46 = (4 - 0);
    t14 = (t46 * 1);
    t14 = (t14 + 1);
    t45 = (t44 + 12U);
    *((unsigned int *)t45) = t14;
    t47 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t40, t37, t41, t43);
    t2 = t47;

LAB10:    if (t2 == 1)
        goto LAB5;

LAB6:    t45 = (t0 + 1992U);
    t48 = *((char **)t45);
    t45 = (t0 + 8400U);
    t49 = (t0 + 8599);
    t52 = (t51 + 0U);
    t53 = (t52 + 0U);
    *((int *)t53) = 0;
    t53 = (t52 + 4U);
    *((int *)t53) = 4;
    t53 = (t52 + 8U);
    *((int *)t53) = 1;
    t54 = (4 - 0);
    t14 = (t54 * 1);
    t14 = (t14 + 1);
    t53 = (t52 + 12U);
    *((unsigned int *)t53) = t14;
    t55 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t48, t45, t49, t51);
    t1 = t55;

LAB7:    if (t1 != 0)
        goto LAB3;

LAB4:
LAB20:    t65 = (t0 + 5824);
    t66 = (t65 + 56U);
    t67 = *((char **)t66);
    t68 = (t67 + 56U);
    t69 = *((char **)t68);
    *((unsigned char *)t69) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t65);

LAB2:    t70 = (t0 + 5488);
    *((int *)t70) = 1;

LAB1:    return;
LAB3:    t53 = (t0 + 1832U);
    t56 = *((char **)t53);
    t57 = *((unsigned char *)t56);
    t53 = (t0 + 1032U);
    t58 = *((char **)t53);
    t59 = *((unsigned char *)t58);
    t60 = ieee_p_2592010699_sub_1605435078_503743352(IEEE_P_2592010699, t57, t59);
    t53 = (t0 + 5824);
    t61 = (t53 + 56U);
    t62 = *((char **)t61);
    t63 = (t62 + 56U);
    t64 = *((char **)t63);
    *((unsigned char *)t64) = t60;
    xsi_driver_first_trans_fast_port(t53);
    goto LAB2;

LAB5:    t1 = (unsigned char)1;
    goto LAB7;

LAB8:    t2 = (unsigned char)1;
    goto LAB10;

LAB11:    t3 = (unsigned char)1;
    goto LAB13;

LAB14:    t4 = (unsigned char)1;
    goto LAB16;

LAB17:    t5 = (unsigned char)1;
    goto LAB19;

LAB21:    goto LAB2;

}


extern void work_a_2172560711_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2172560711_3212880686_p_0,(void *)work_a_2172560711_3212880686_p_1,(void *)work_a_2172560711_3212880686_p_2,(void *)work_a_2172560711_3212880686_p_3,(void *)work_a_2172560711_3212880686_p_4};
	xsi_register_didat("work_a_2172560711_3212880686", "isim/tbCPU_isim_beh.exe.sim/work/a_2172560711_3212880686.didat");
	xsi_register_executes(pe);
}
