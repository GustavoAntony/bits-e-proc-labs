-- File: toplevel.vhd
-- Generated by MyHDL 0.11
-- Date: Mon Jul 18 20:54:12 2022


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.textio.all;

use work.pck_myhdl_011.all;

entity toplevel is
    port (
        LEDR: out unsigned(9 downto 0);
        SW: in unsigned(9 downto 0);
        KEY: in unsigned(3 downto 0);
        HEX0: in unsigned(6 downto 0);
        HEX1: in unsigned(6 downto 0);
        HEX2: in unsigned(6 downto 0);
        HEX3: in unsigned(6 downto 0);
        HEX4: in unsigned(6 downto 0);
        HEX5: in unsigned(6 downto 0);
        CLOCK_50: in std_logic;
        RESET_N: in std_logic
    );
end entity toplevel;


architecture MyHDL of toplevel is



signal blinkLed0_cnt: unsigned(31 downto 0);
signal blinkLed0_l: std_logic;
signal blinkLed1_cnt: unsigned(31 downto 0);
signal blinkLed1_l: std_logic;
signal blinkLed2_cnt: unsigned(31 downto 0);
signal blinkLed2_l: std_logic;
type t_array_ledr_s is array(0 to 10-1) of std_logic;
signal ledr_s: t_array_ledr_s;

begin




TOPLEVEL_BLINKLED0_SEQ: process (CLOCK_50, RESET_N) is
begin
    if (RESET_N = '0') then
        blinkLed0_cnt <= to_unsigned(0, 32);
        blinkLed0_l <= '0';
    elsif rising_edge(CLOCK_50) then
        if (signed(resize(blinkLed0_cnt, 33)) < (50000 * 100)) then
            blinkLed0_cnt <= (blinkLed0_cnt + 1);
        else
            blinkLed0_cnt <= to_unsigned(0, 32);
            blinkLed0_l <= stdl((not bool(blinkLed0_l)));
        end if;
    end if;
end process TOPLEVEL_BLINKLED0_SEQ;


ledr_s(0) <= blinkLed0_l;

TOPLEVEL_BLINKLED1_SEQ: process (CLOCK_50, RESET_N) is
begin
    if (RESET_N = '0') then
        blinkLed1_cnt <= to_unsigned(0, 32);
        blinkLed1_l <= '0';
    elsif rising_edge(CLOCK_50) then
        if (signed(resize(blinkLed1_cnt, 33)) < (50000 * 50)) then
            blinkLed1_cnt <= (blinkLed1_cnt + 1);
        else
            blinkLed1_cnt <= to_unsigned(0, 32);
            blinkLed1_l <= stdl((not bool(blinkLed1_l)));
        end if;
    end if;
end process TOPLEVEL_BLINKLED1_SEQ;


ledr_s(1) <= blinkLed1_l;

TOPLEVEL_BLINKLED2_SEQ: process (CLOCK_50, RESET_N) is
begin
    if (RESET_N = '0') then
        blinkLed2_cnt <= to_unsigned(0, 32);
        blinkLed2_l <= '0';
    elsif rising_edge(CLOCK_50) then
        if (signed(resize(blinkLed2_cnt, 33)) < (50000 * 1000)) then
            blinkLed2_cnt <= (blinkLed2_cnt + 1);
        else
            blinkLed2_cnt <= to_unsigned(0, 32);
            blinkLed2_l <= stdl((not bool(blinkLed2_l)));
        end if;
    end if;
end process TOPLEVEL_BLINKLED2_SEQ;


ledr_s(2) <= blinkLed2_l;

TOPLEVEL_COMB: process (ledr_s) is
begin
    for i in 0 to 10-1 loop
        LEDR(i) <= ledr_s(i);
    end loop;
end process TOPLEVEL_COMB;

end architecture MyHDL;
