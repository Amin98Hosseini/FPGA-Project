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
static const char *ng0 = "C:/Users/Amin/Documents/FPGA_Project/Sign_FA16Bits/Sign_FA16Bits.vhd";
extern char *IEEE_P_1242562249;
extern char *IEEE_P_2592010699;

char *ieee_p_1242562249_sub_3273497107_1035706684(char *, char *, char *, char *, char *, char *);
char *ieee_p_1242562249_sub_3410769178_1035706684(char *, char *, char *, char *, int );
unsigned char ieee_p_2592010699_sub_2507238156_503743352(char *, unsigned char , unsigned char );


static void work_a_4229554062_3212880686_p_0(char *t0)
{
    char t1[16];
    char t2[16];
    char t3[16];
    char t12[16];
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    unsigned char t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;

LAB0:    xsi_set_current_line(22, ng0);

LAB3:    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t4 = (t0 + 6140U);
    t6 = ieee_p_1242562249_sub_3410769178_1035706684(IEEE_P_1242562249, t3, t5, t4, 17);
    t7 = (t0 + 1192U);
    t8 = *((char **)t7);
    t7 = (t0 + 6156U);
    t9 = ieee_p_1242562249_sub_3273497107_1035706684(IEEE_P_1242562249, t2, t6, t3, t8, t7);
    t10 = (t0 + 1352U);
    t11 = *((char **)t10);
    t13 = ((IEEE_P_1242562249) + 3112);
    t14 = (t0 + 6172U);
    t10 = xsi_base_array_concat(t10, t12, t13, (char)99, (unsigned char)2, (char)97, t11, t14, (char)101);
    t15 = ieee_p_1242562249_sub_3273497107_1035706684(IEEE_P_1242562249, t1, t9, t2, t10, t12);
    t16 = (t1 + 12U);
    t17 = *((unsigned int *)t16);
    t18 = (1U * t17);
    t19 = (17U != t18);
    if (t19 == 1)
        goto LAB5;

LAB6:    t20 = (t0 + 3920);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t15, 17U);
    xsi_driver_first_trans_fast(t20);

LAB2:    t25 = (t0 + 3808);
    *((int *)t25) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(17U, t18, 0);
    goto LAB6;

}

static void work_a_4229554062_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned char t7;
    char *t8;
    char *t9;
    int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned char t14;
    unsigned char t15;
    char *t16;
    char *t17;
    int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned char t22;
    unsigned char t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;

LAB0:    xsi_set_current_line(23, ng0);

LAB3:    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t3 = (16 - 16);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = (t0 + 1032U);
    t9 = *((char **)t8);
    t10 = (15 - 15);
    t11 = (t10 * -1);
    t12 = (1U * t11);
    t13 = (0 + t12);
    t8 = (t9 + t13);
    t14 = *((unsigned char *)t8);
    t15 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t7, t14);
    t16 = (t0 + 1192U);
    t17 = *((char **)t16);
    t18 = (15 - 15);
    t19 = (t18 * -1);
    t20 = (1U * t19);
    t21 = (0 + t20);
    t16 = (t17 + t21);
    t22 = *((unsigned char *)t16);
    t23 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t15, t22);
    t24 = (t0 + 3984);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    *((unsigned char *)t28) = t23;
    xsi_driver_first_trans_fast_port(t24);

LAB2:    t29 = (t0 + 3824);
    *((int *)t29) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_4229554062_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    unsigned int t3;
    unsigned int t4;
    unsigned int t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(24, ng0);

LAB3:    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t3 = (16 - 15);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t6 = (t0 + 4048);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 16U);
    xsi_driver_first_trans_fast_port(t6);

LAB2:    t11 = (t0 + 3840);
    *((int *)t11) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_4229554062_3212880686_init()
{
	static char *pe[] = {(void *)work_a_4229554062_3212880686_p_0,(void *)work_a_4229554062_3212880686_p_1,(void *)work_a_4229554062_3212880686_p_2};
	xsi_register_didat("work_a_4229554062_3212880686", "isim/FA16Bits_Sign_Tb_isim_beh.exe.sim/work/a_4229554062_3212880686.didat");
	xsi_register_executes(pe);
}
