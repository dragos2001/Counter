----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.12.2021 15:18:47
-- Design Name: 
-- Module Name: aut3b - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;


entity aut3b is
    Port ( d : in STD_LOGIC_VECTOR (2 downto 0);
           clk : in STD_LOGIC;
           r_neg : in STD_LOGIC;
           en : in STD_LOGIC;
           ld_neg : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR (2 downto 0));
end aut3b;

architecture Behavioral of aut3b is

signal qint: std_logic_vector(2 downto 0):="000";

begin
                                                                            
process(r_neg,clk)
begin

if r_neg='0' 
    then qint<="000";
    elsif rising_edge(clk) then
        if ld_neg='1'then
         qint<=d;
         elsif en='1'then
            qint<=qint+1;
         end if;
       end if;
end process;

q <= qint;
end Behavioral;
