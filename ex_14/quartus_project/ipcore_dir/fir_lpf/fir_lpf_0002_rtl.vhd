----------------------------------------------------------------------------- 
-- Altera DSP Builder Advanced Flow Tools Release Version 12.0
-- Quartus II development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2012 Altera Corporation.  All rights reserved.    
-- Your use of  Altera  Corporation's design tools,  logic functions and other 
-- software and tools,  and its AMPP  partner logic functions, and  any output 
-- files  any of the  foregoing  device programming or simulation files),  and 
-- any associated  documentation or information are expressly subject  to  the 
-- terms and conditions  of the Altera Program License Subscription Agreement, 
-- Altera  MegaCore  Function  License  Agreement, or other applicable license 
-- agreement,  including,  without limitation,  that your use  is for the sole 
-- purpose of  programming  logic  devices  manufactured by Altera and sold by 
-- Altera or its authorized  distributors.  Please  refer  to  the  applicable 
-- agreement for further details.
----------------------------------------------------------------------------- 

-- VHDL created from fir_lpf_0002_rtl
-- VHDL created on Fri Oct 05 22:40:15 2018


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

-- Text written from d:/SJ/nightly/12.0/178/w32/p4/ip/aion/src/mip_common/hw_model.cpp:1206
entity fir_lpf_0002_rtl is
    port (
        xIn_v : in std_logic_vector(0 downto 0);
        xIn_c : in std_logic_vector(7 downto 0);
        xIn_0 : in std_logic_vector(7 downto 0);
        xOut_v : out std_logic_vector(0 downto 0);
        xOut_c : out std_logic_vector(7 downto 0);
        xOut_0 : out std_logic_vector(20 downto 0);
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        h_areset : in std_logic
        );
end;

architecture normal of fir_lpf_0002_rtl is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo0_memread_q_14_q : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo0_memread_q_14_v_0 : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo0_memread_q_14_v_1 : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo0_memread_q_14_v_2 : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_11_q : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_wi0_delayr1_q : std_logic_vector (7 downto 0);
    signal d_u0_m0_wo0_wi0_delayr1_q_11_q : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_wi0_delayr2_q : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_wi0_delayr3_q : std_logic_vector (7 downto 0);
    signal d_u0_m0_wo0_wi0_delayr3_q_11_q : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_wi0_delayr4_q : std_logic_vector (7 downto 0);
    signal d_u0_m0_wo0_wi0_delayr4_q_11_q : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_wi0_delayr5_q : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_wi0_delayr6_q : std_logic_vector (7 downto 0);
    signal d_u0_m0_wo0_wi0_delayr6_q_11_q : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_wi0_delayr7_q : std_logic_vector (7 downto 0);
    signal d_u0_m0_wo0_wi0_delayr7_q_11_q : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_cm2_q : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_a : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_b : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_s1 : std_logic_vector (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_5_q : std_logic_vector (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_a : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_b : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_s1 : std_logic_vector (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_2_q : std_logic_vector (17 downto 0);
    signal u0_m0_wo0_mtree_add0_0_a : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_mtree_add0_0_b : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_mtree_add0_0_o : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_add0_0_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_add0_1_a : std_logic_vector(18 downto 0);
    signal u0_m0_wo0_mtree_add0_1_b : std_logic_vector(18 downto 0);
    signal u0_m0_wo0_mtree_add0_1_o : std_logic_vector (18 downto 0);
    signal u0_m0_wo0_mtree_add0_1_q : std_logic_vector (18 downto 0);
    signal u0_m0_wo0_mtree_add0_2_a : std_logic_vector(18 downto 0);
    signal u0_m0_wo0_mtree_add0_2_b : std_logic_vector(18 downto 0);
    signal u0_m0_wo0_mtree_add0_2_o : std_logic_vector (18 downto 0);
    signal u0_m0_wo0_mtree_add0_2_q : std_logic_vector (18 downto 0);
    signal u0_m0_wo0_mtree_add0_3_a : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_mtree_add0_3_b : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_mtree_add0_3_o : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_add0_3_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_add1_0_a : std_logic_vector(19 downto 0);
    signal u0_m0_wo0_mtree_add1_0_b : std_logic_vector(19 downto 0);
    signal u0_m0_wo0_mtree_add1_0_o : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_add1_0_q : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_add1_1_a : std_logic_vector(19 downto 0);
    signal u0_m0_wo0_mtree_add1_1_b : std_logic_vector(19 downto 0);
    signal u0_m0_wo0_mtree_add1_1_o : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_add1_1_q : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_add2_0_a : std_logic_vector(20 downto 0);
    signal u0_m0_wo0_mtree_add2_0_b : std_logic_vector(20 downto 0);
    signal u0_m0_wo0_mtree_add2_0_o : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_add2_0_q : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_oseq_gated_reg_q : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_add_1_a : std_logic_vector(11 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_add_1_b : std_logic_vector(11 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_add_1_o : std_logic_vector (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_add_1_q : std_logic_vector (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_add_3_a : std_logic_vector(13 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_add_3_b : std_logic_vector(13 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_add_3_o : std_logic_vector (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_add_3_q : std_logic_vector (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_add_1_a : std_logic_vector(10 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_add_1_b : std_logic_vector(10 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_add_1_o : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_add_1_q : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_add_3_a : std_logic_vector(15 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_add_3_b : std_logic_vector(15 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_add_3_o : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_add_3_q : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_sub_1_a : std_logic_vector(17 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_sub_1_b : std_logic_vector(17 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_sub_1_o : std_logic_vector (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_sub_1_q : std_logic_vector (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_sub_1_a : std_logic_vector(17 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_sub_1_b : std_logic_vector(17 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_sub_1_o : std_logic_vector (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_sub_1_q : std_logic_vector (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_add_1_a : std_logic_vector(10 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_add_1_b : std_logic_vector(10 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_add_1_o : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_add_1_q : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_add_3_a : std_logic_vector(15 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_add_3_b : std_logic_vector(15 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_add_3_o : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_add_3_q : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_add_1_a : std_logic_vector(11 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_add_1_b : std_logic_vector(11 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_add_1_o : std_logic_vector (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_add_1_q : std_logic_vector (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_add_3_a : std_logic_vector(13 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_add_3_b : std_logic_vector(13 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_add_3_o : std_logic_vector (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_add_3_q : std_logic_vector (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_shift0_q_int : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_shift0_q : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_shift2_q_int : std_logic_vector (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_shift2_q : std_logic_vector (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_shift0_q_int : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_shift0_q : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_shift2_q_int : std_logic_vector (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_shift2_q : std_logic_vector (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_shift0_q_int : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_shift0_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_shift0_q_int : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_shift0_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_shift0_q_int : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_shift0_q : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_shift2_q_int : std_logic_vector (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_shift2_q : std_logic_vector (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_shift0_q_int : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_shift0_q : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_shift2_q_int : std_logic_vector (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_shift2_q : std_logic_vector (12 downto 0);
begin


	--VCC(CONSTANT,1)@0
    VCC_q <= "1";

	--xIn(PORTIN,2)@10

	--d_u0_m0_wo0_wi0_phasedelay0_q_11(DELAY,117)@10
    d_u0_m0_wo0_wi0_phasedelay0_q_11: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_m0_wo0_wi0_phasedelay0_q_11_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_u0_m0_wo0_wi0_phasedelay0_q_11_q <= xIn_0;
        END IF;
    END PROCESS;


	--u0_m0_wo0_mtree_mult1_7_shift2(BITSHIFT,44)@11
    u0_m0_wo0_mtree_mult1_7_shift2_q_int <= d_u0_m0_wo0_wi0_phasedelay0_q_11_q & "00000";
    u0_m0_wo0_mtree_mult1_7_shift2_q <= u0_m0_wo0_mtree_mult1_7_shift2_q_int(12 downto 0);

	--u0_m0_wo0_mtree_mult1_7_shift0(BITSHIFT,42)@10
    u0_m0_wo0_mtree_mult1_7_shift0_q_int <= xIn_0 & "000";
    u0_m0_wo0_mtree_mult1_7_shift0_q <= u0_m0_wo0_mtree_mult1_7_shift0_q_int(10 downto 0);

	--u0_m0_wo0_mtree_mult1_7_add_1(ADD,43)@10
    u0_m0_wo0_mtree_mult1_7_add_1_a <= STD_LOGIC_VECTOR(RESIZE(SIGNED(xIn_0(7 downto 0)), 12));
    u0_m0_wo0_mtree_mult1_7_add_1_b <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_7_shift0_q(10 downto 0)), 12));
    u0_m0_wo0_mtree_mult1_7_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_7_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_7_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_7_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_7_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_7_add_1_q <= u0_m0_wo0_mtree_mult1_7_add_1_o(11 downto 0);


	--u0_m0_wo0_mtree_mult1_7_add_3(ADD,45)@11
    u0_m0_wo0_mtree_mult1_7_add_3_a <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_7_add_1_q(11 downto 0)), 14));
    u0_m0_wo0_mtree_mult1_7_add_3_b <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_7_shift2_q(12 downto 0)), 14));
    u0_m0_wo0_mtree_mult1_7_add_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_7_add_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_7_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_7_add_3_a) + SIGNED(u0_m0_wo0_mtree_mult1_7_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_7_add_3_q <= u0_m0_wo0_mtree_mult1_7_add_3_o(13 downto 0);


	--u0_m0_wo0_wi0_delayr1(DELAY,8)@10
    u0_m0_wo0_wi0_delayr1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_delayr1_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u0_m0_wo0_wi0_delayr1_q <= xIn_0;
            END IF;
        END IF;
    END PROCESS;


	--d_u0_m0_wo0_wi0_delayr1_q_11(DELAY,118)@10
    d_u0_m0_wo0_wi0_delayr1_q_11: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_m0_wo0_wi0_delayr1_q_11_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_u0_m0_wo0_wi0_delayr1_q_11_q <= u0_m0_wo0_wi0_delayr1_q;
        END IF;
    END PROCESS;


	--u0_m0_wo0_mtree_mult1_6_shift2(BITSHIFT,48)@11
    u0_m0_wo0_mtree_mult1_6_shift2_q_int <= d_u0_m0_wo0_wi0_delayr1_q_11_q & "0000000";
    u0_m0_wo0_mtree_mult1_6_shift2_q <= u0_m0_wo0_mtree_mult1_6_shift2_q_int(14 downto 0);

	--u0_m0_wo0_mtree_mult1_6_shift0(BITSHIFT,46)@10
    u0_m0_wo0_mtree_mult1_6_shift0_q_int <= u0_m0_wo0_wi0_delayr1_q & "00";
    u0_m0_wo0_mtree_mult1_6_shift0_q <= u0_m0_wo0_mtree_mult1_6_shift0_q_int(9 downto 0);

	--u0_m0_wo0_mtree_mult1_6_add_1(ADD,47)@10
    u0_m0_wo0_mtree_mult1_6_add_1_a <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_wi0_delayr1_q(7 downto 0)), 11));
    u0_m0_wo0_mtree_mult1_6_add_1_b <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_6_shift0_q(9 downto 0)), 11));
    u0_m0_wo0_mtree_mult1_6_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_6_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_6_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_6_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_6_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_6_add_1_q <= u0_m0_wo0_mtree_mult1_6_add_1_o(10 downto 0);


	--u0_m0_wo0_mtree_mult1_6_add_3(ADD,49)@11
    u0_m0_wo0_mtree_mult1_6_add_3_a <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_6_add_1_q(10 downto 0)), 16));
    u0_m0_wo0_mtree_mult1_6_add_3_b <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_6_shift2_q(14 downto 0)), 16));
    u0_m0_wo0_mtree_mult1_6_add_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_6_add_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_6_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_6_add_3_a) + SIGNED(u0_m0_wo0_mtree_mult1_6_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_6_add_3_q <= u0_m0_wo0_mtree_mult1_6_add_3_o(15 downto 0);


	--u0_m0_wo0_mtree_add0_3(ADD,34)@12
    u0_m0_wo0_mtree_add0_3_a <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_6_add_3_q(15 downto 0)), 17));
    u0_m0_wo0_mtree_add0_3_b <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_7_add_3_q(13 downto 0)), 17));
    u0_m0_wo0_mtree_add0_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_3_a) + SIGNED(u0_m0_wo0_mtree_add0_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_3_q <= u0_m0_wo0_mtree_add0_3_o(16 downto 0);


	--u0_m0_wo0_wi0_delayr2(DELAY,9)@10
    u0_m0_wo0_wi0_delayr2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_delayr2_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u0_m0_wo0_wi0_delayr2_q <= u0_m0_wo0_wi0_delayr1_q;
            END IF;
        END IF;
    END PROCESS;


	--u0_m0_wo0_cm2(CONSTANT,17)@10
    u0_m0_wo0_cm2_q <= "0101010110";

	--u0_m0_wo0_mtree_mult1_5(MULT,25)@10
    u0_m0_wo0_mtree_mult1_5_a <= u0_m0_wo0_cm2_q;
    u0_m0_wo0_mtree_mult1_5_b <= u0_m0_wo0_wi0_delayr2_q;
    u0_m0_wo0_mtree_mult1_5_reset <= areset;

    u0_m0_wo0_mtree_mult1_5_component : lpm_mult
    GENERIC MAP (
    lpm_widtha => 10,
    lpm_widthb => 8,
    lpm_widthp => 18,
    lpm_widths => 1,
    lpm_type => "LPM_MULT",
    lpm_representation => "SIGNED",
    lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES,MAXIMIZE_SPEED=5",
    lpm_pipeline => 2
    )
    PORT MAP (
    dataa => u0_m0_wo0_mtree_mult1_5_a,
    datab => u0_m0_wo0_mtree_mult1_5_b,
    clken => VCC_q(0),
    aclr => u0_m0_wo0_mtree_mult1_5_reset,
    clock => clk,
    result => u0_m0_wo0_mtree_mult1_5_s1
    );
    u0_m0_wo0_mtree_mult1_5_q <= u0_m0_wo0_mtree_mult1_5_s1;

	--u0_m0_wo0_wi0_delayr3(DELAY,10)@10
    u0_m0_wo0_wi0_delayr3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_delayr3_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u0_m0_wo0_wi0_delayr3_q <= u0_m0_wo0_wi0_delayr2_q;
            END IF;
        END IF;
    END PROCESS;


	--d_u0_m0_wo0_wi0_delayr3_q_11(DELAY,119)@10
    d_u0_m0_wo0_wi0_delayr3_q_11: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_m0_wo0_wi0_delayr3_q_11_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_u0_m0_wo0_wi0_delayr3_q_11_q <= u0_m0_wo0_wi0_delayr3_q;
        END IF;
    END PROCESS;


	--u0_m0_wo0_mtree_mult1_4_shift0(BITSHIFT,59)@11
    u0_m0_wo0_mtree_mult1_4_shift0_q_int <= d_u0_m0_wo0_wi0_delayr3_q_11_q & "000000000";
    u0_m0_wo0_mtree_mult1_4_shift0_q <= u0_m0_wo0_mtree_mult1_4_shift0_q_int(16 downto 0);

	--u0_m0_wo0_mtree_mult1_4_sub_1(SUB,60)@11
    u0_m0_wo0_mtree_mult1_4_sub_1_a <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_4_shift0_q(16 downto 0)), 18));
    u0_m0_wo0_mtree_mult1_4_sub_1_b <= STD_LOGIC_VECTOR(RESIZE(SIGNED(d_u0_m0_wo0_wi0_delayr3_q_11_q(7 downto 0)), 18));
    u0_m0_wo0_mtree_mult1_4_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_4_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_4_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_4_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_4_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_4_sub_1_q <= u0_m0_wo0_mtree_mult1_4_sub_1_o(17 downto 0);


	--u0_m0_wo0_mtree_add0_2(ADD,33)@12
    u0_m0_wo0_mtree_add0_2_a <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_4_sub_1_q(17 downto 0)), 19));
    u0_m0_wo0_mtree_add0_2_b <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_5_q(17 downto 0)), 19));
    u0_m0_wo0_mtree_add0_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_2_a) + SIGNED(u0_m0_wo0_mtree_add0_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_2_q <= u0_m0_wo0_mtree_add0_2_o(18 downto 0);


	--u0_m0_wo0_mtree_add1_1(ADD,36)@13
    u0_m0_wo0_mtree_add1_1_a <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_add0_2_q(18 downto 0)), 20));
    u0_m0_wo0_mtree_add1_1_b <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_add0_3_q(16 downto 0)), 20));
    u0_m0_wo0_mtree_add1_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_1_a) + SIGNED(u0_m0_wo0_mtree_add1_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_1_q <= u0_m0_wo0_mtree_add1_1_o(19 downto 0);


	--u0_m0_wo0_wi0_delayr4(DELAY,11)@10
    u0_m0_wo0_wi0_delayr4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_delayr4_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u0_m0_wo0_wi0_delayr4_q <= u0_m0_wo0_wi0_delayr3_q;
            END IF;
        END IF;
    END PROCESS;


	--d_u0_m0_wo0_wi0_delayr4_q_11(DELAY,120)@10
    d_u0_m0_wo0_wi0_delayr4_q_11: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_m0_wo0_wi0_delayr4_q_11_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_u0_m0_wo0_wi0_delayr4_q_11_q <= u0_m0_wo0_wi0_delayr4_q;
        END IF;
    END PROCESS;


	--u0_m0_wo0_mtree_mult1_3_shift0(BITSHIFT,61)@11
    u0_m0_wo0_mtree_mult1_3_shift0_q_int <= d_u0_m0_wo0_wi0_delayr4_q_11_q & "000000000";
    u0_m0_wo0_mtree_mult1_3_shift0_q <= u0_m0_wo0_mtree_mult1_3_shift0_q_int(16 downto 0);

	--u0_m0_wo0_mtree_mult1_3_sub_1(SUB,62)@11
    u0_m0_wo0_mtree_mult1_3_sub_1_a <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_3_shift0_q(16 downto 0)), 18));
    u0_m0_wo0_mtree_mult1_3_sub_1_b <= STD_LOGIC_VECTOR(RESIZE(SIGNED(d_u0_m0_wo0_wi0_delayr4_q_11_q(7 downto 0)), 18));
    u0_m0_wo0_mtree_mult1_3_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_3_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_3_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_3_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_3_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_3_sub_1_q <= u0_m0_wo0_mtree_mult1_3_sub_1_o(17 downto 0);


	--u0_m0_wo0_wi0_delayr5(DELAY,12)@10
    u0_m0_wo0_wi0_delayr5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_delayr5_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u0_m0_wo0_wi0_delayr5_q <= u0_m0_wo0_wi0_delayr4_q;
            END IF;
        END IF;
    END PROCESS;


	--u0_m0_wo0_mtree_mult1_2(MULT,28)@10
    u0_m0_wo0_mtree_mult1_2_a <= u0_m0_wo0_cm2_q;
    u0_m0_wo0_mtree_mult1_2_b <= u0_m0_wo0_wi0_delayr5_q;
    u0_m0_wo0_mtree_mult1_2_reset <= areset;

    u0_m0_wo0_mtree_mult1_2_component : lpm_mult
    GENERIC MAP (
    lpm_widtha => 10,
    lpm_widthb => 8,
    lpm_widthp => 18,
    lpm_widths => 1,
    lpm_type => "LPM_MULT",
    lpm_representation => "SIGNED",
    lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES,MAXIMIZE_SPEED=5",
    lpm_pipeline => 2
    )
    PORT MAP (
    dataa => u0_m0_wo0_mtree_mult1_2_a,
    datab => u0_m0_wo0_mtree_mult1_2_b,
    clken => VCC_q(0),
    aclr => u0_m0_wo0_mtree_mult1_2_reset,
    clock => clk,
    result => u0_m0_wo0_mtree_mult1_2_s1
    );
    u0_m0_wo0_mtree_mult1_2_q <= u0_m0_wo0_mtree_mult1_2_s1;

	--u0_m0_wo0_mtree_add0_1(ADD,32)@12
    u0_m0_wo0_mtree_add0_1_a <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_2_q(17 downto 0)), 19));
    u0_m0_wo0_mtree_add0_1_b <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_3_sub_1_q(17 downto 0)), 19));
    u0_m0_wo0_mtree_add0_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_1_a) + SIGNED(u0_m0_wo0_mtree_add0_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_1_q <= u0_m0_wo0_mtree_add0_1_o(18 downto 0);


	--u0_m0_wo0_wi0_delayr6(DELAY,13)@10
    u0_m0_wo0_wi0_delayr6: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_delayr6_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u0_m0_wo0_wi0_delayr6_q <= u0_m0_wo0_wi0_delayr5_q;
            END IF;
        END IF;
    END PROCESS;


	--d_u0_m0_wo0_wi0_delayr6_q_11(DELAY,121)@10
    d_u0_m0_wo0_wi0_delayr6_q_11: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_m0_wo0_wi0_delayr6_q_11_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_u0_m0_wo0_wi0_delayr6_q_11_q <= u0_m0_wo0_wi0_delayr6_q;
        END IF;
    END PROCESS;


	--u0_m0_wo0_mtree_mult1_1_shift2(BITSHIFT,74)@11
    u0_m0_wo0_mtree_mult1_1_shift2_q_int <= d_u0_m0_wo0_wi0_delayr6_q_11_q & "0000000";
    u0_m0_wo0_mtree_mult1_1_shift2_q <= u0_m0_wo0_mtree_mult1_1_shift2_q_int(14 downto 0);

	--u0_m0_wo0_mtree_mult1_1_shift0(BITSHIFT,72)@10
    u0_m0_wo0_mtree_mult1_1_shift0_q_int <= u0_m0_wo0_wi0_delayr6_q & "00";
    u0_m0_wo0_mtree_mult1_1_shift0_q <= u0_m0_wo0_mtree_mult1_1_shift0_q_int(9 downto 0);

	--u0_m0_wo0_mtree_mult1_1_add_1(ADD,73)@10
    u0_m0_wo0_mtree_mult1_1_add_1_a <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_wi0_delayr6_q(7 downto 0)), 11));
    u0_m0_wo0_mtree_mult1_1_add_1_b <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_1_shift0_q(9 downto 0)), 11));
    u0_m0_wo0_mtree_mult1_1_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_1_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_1_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_1_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_1_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_1_add_1_q <= u0_m0_wo0_mtree_mult1_1_add_1_o(10 downto 0);


	--u0_m0_wo0_mtree_mult1_1_add_3(ADD,75)@11
    u0_m0_wo0_mtree_mult1_1_add_3_a <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_1_add_1_q(10 downto 0)), 16));
    u0_m0_wo0_mtree_mult1_1_add_3_b <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_1_shift2_q(14 downto 0)), 16));
    u0_m0_wo0_mtree_mult1_1_add_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_1_add_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_1_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_1_add_3_a) + SIGNED(u0_m0_wo0_mtree_mult1_1_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_1_add_3_q <= u0_m0_wo0_mtree_mult1_1_add_3_o(15 downto 0);


	--u0_m0_wo0_wi0_delayr7(DELAY,14)@10
    u0_m0_wo0_wi0_delayr7: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_delayr7_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u0_m0_wo0_wi0_delayr7_q <= u0_m0_wo0_wi0_delayr6_q;
            END IF;
        END IF;
    END PROCESS;


	--d_u0_m0_wo0_wi0_delayr7_q_11(DELAY,122)@10
    d_u0_m0_wo0_wi0_delayr7_q_11: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_m0_wo0_wi0_delayr7_q_11_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_u0_m0_wo0_wi0_delayr7_q_11_q <= u0_m0_wo0_wi0_delayr7_q;
        END IF;
    END PROCESS;


	--u0_m0_wo0_mtree_mult1_0_shift2(BITSHIFT,78)@11
    u0_m0_wo0_mtree_mult1_0_shift2_q_int <= d_u0_m0_wo0_wi0_delayr7_q_11_q & "00000";
    u0_m0_wo0_mtree_mult1_0_shift2_q <= u0_m0_wo0_mtree_mult1_0_shift2_q_int(12 downto 0);

	--u0_m0_wo0_mtree_mult1_0_shift0(BITSHIFT,76)@10
    u0_m0_wo0_mtree_mult1_0_shift0_q_int <= u0_m0_wo0_wi0_delayr7_q & "000";
    u0_m0_wo0_mtree_mult1_0_shift0_q <= u0_m0_wo0_mtree_mult1_0_shift0_q_int(10 downto 0);

	--u0_m0_wo0_mtree_mult1_0_add_1(ADD,77)@10
    u0_m0_wo0_mtree_mult1_0_add_1_a <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_wi0_delayr7_q(7 downto 0)), 12));
    u0_m0_wo0_mtree_mult1_0_add_1_b <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_0_shift0_q(10 downto 0)), 12));
    u0_m0_wo0_mtree_mult1_0_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_0_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_0_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_0_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_0_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_0_add_1_q <= u0_m0_wo0_mtree_mult1_0_add_1_o(11 downto 0);


	--u0_m0_wo0_mtree_mult1_0_add_3(ADD,79)@11
    u0_m0_wo0_mtree_mult1_0_add_3_a <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_0_add_1_q(11 downto 0)), 14));
    u0_m0_wo0_mtree_mult1_0_add_3_b <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_0_shift2_q(12 downto 0)), 14));
    u0_m0_wo0_mtree_mult1_0_add_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_0_add_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_0_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_0_add_3_a) + SIGNED(u0_m0_wo0_mtree_mult1_0_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_0_add_3_q <= u0_m0_wo0_mtree_mult1_0_add_3_o(13 downto 0);


	--u0_m0_wo0_mtree_add0_0(ADD,31)@12
    u0_m0_wo0_mtree_add0_0_a <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_0_add_3_q(13 downto 0)), 17));
    u0_m0_wo0_mtree_add0_0_b <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_mult1_1_add_3_q(15 downto 0)), 17));
    u0_m0_wo0_mtree_add0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_0_a) + SIGNED(u0_m0_wo0_mtree_add0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_0_q <= u0_m0_wo0_mtree_add0_0_o(16 downto 0);


	--u0_m0_wo0_mtree_add1_0(ADD,35)@13
    u0_m0_wo0_mtree_add1_0_a <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_add0_0_q(16 downto 0)), 20));
    u0_m0_wo0_mtree_add1_0_b <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_add0_1_q(18 downto 0)), 20));
    u0_m0_wo0_mtree_add1_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_0_a) + SIGNED(u0_m0_wo0_mtree_add1_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_0_q <= u0_m0_wo0_mtree_add1_0_o(19 downto 0);


	--u0_m0_wo0_mtree_add2_0(ADD,37)@14
    u0_m0_wo0_mtree_add2_0_a <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_add1_0_q(19 downto 0)), 21));
    u0_m0_wo0_mtree_add2_0_b <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_m0_wo0_mtree_add1_1_q(19 downto 0)), 21));
    u0_m0_wo0_mtree_add2_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add2_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add2_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add2_0_a) + SIGNED(u0_m0_wo0_mtree_add2_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add2_0_q <= u0_m0_wo0_mtree_add2_0_o(20 downto 0);


	--GND(CONSTANT,0)@15
    GND_q <= "0";

	--d_u0_m0_wo0_memread_q_14(DELAY,116)@10
    d_u0_m0_wo0_memread_q_14: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_m0_wo0_memread_q_14_v_0 <= (others => '0');
            d_u0_m0_wo0_memread_q_14_v_1 <= (others => '0');
            d_u0_m0_wo0_memread_q_14_v_2 <= (others => '0');
            d_u0_m0_wo0_memread_q_14_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_u0_m0_wo0_memread_q_14_v_0 <= xIn_v;
            d_u0_m0_wo0_memread_q_14_v_1 <= d_u0_m0_wo0_memread_q_14_v_0;
            d_u0_m0_wo0_memread_q_14_v_2 <= d_u0_m0_wo0_memread_q_14_v_1;
            d_u0_m0_wo0_memread_q_14_q <= d_u0_m0_wo0_memread_q_14_v_2;
        END IF;
    END PROCESS;


	--u0_m0_wo0_oseq_gated_reg(REG,38)@14
    u0_m0_wo0_oseq_gated_reg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= d_u0_m0_wo0_memread_q_14_q;
        END IF;
    END PROCESS;


	--xOut(PORTOUT,41)@15
    xOut_v <= u0_m0_wo0_oseq_gated_reg_q;
    xOut_c <= "0000000" & GND_q;
    xOut_0 <= u0_m0_wo0_mtree_add2_0_q;


end normal;
