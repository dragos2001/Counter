----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.12.2021 17:44:40
-- Design Name: 
-- Module Name: proiect2FII - Behavioral
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



entity proiect2FII is
    Port ( clk : in STD_LOGIC;
           r_neg : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR (2 downto 0));
end proiect2FII;

architecture Behavioral of proiect2FII is

component aut3b is
    Port ( d : in STD_LOGIC_VECTOR (2 downto 0);
           clk : in STD_LOGIC;
           r_neg : in STD_LOGIC;
           en : in STD_LOGIC;
           ld_neg : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR (2 downto 0));
end component aut3b;


component or2 is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           f : out STD_LOGIC);
end component or2;

component mux2_1 is
    Port ( i0 : in STD_LOGIC;
           i1 : in STD_LOGIC;
           a : in STD_LOGIC;
           y : out STD_LOGIC);
end component mux2_1;

signal d, qint : std_logic_vector (2 downto 0);
signal en, ld_neg,f3, f2, f1 , b1, c1, a1 , qa ,qb ,qc, nqa ,nqb  : std_logic;

begin
q<=qint;  

 nqb<=not qint(1);
 nqa<= not qint(0);
-- C PORT             
 U1:or2 port map(a=>nqa,
                  b=>qint(1),
                  f=>f1);

U2:mux2_1 port map(i0=>'1',
                    i1=>f1,
                    a=>qint(2),
                    y=>c1);
                    
  -- B PORT      
U3:mux2_1 port map(i0=>'0',
                   i1=>nqa,
                   a=>qint(2),
                   y=>b1);
                   
   -- A PORT      
 U9:or2 port map(a=>qint(0),
                     b=>qint(1),
                     f=>f3);
 U4:mux2_1 port map(i0=>'0',
                     i1=>f3,
                     a=>qint(2),
                     y=>a1);
  
  
   -- LDn PORT      
  U5:or2 port map(a=>nqb,
                  b=>qint(0),
                  f=>f2);                   
                     
                     
 U6:mux2_1 port map(i0=>'1',
                     i1=>f2,
                     a=>qint(2),
                     y=>ld_neg);
  
                    
  
    
 
   
   
 
    U0:aut3b port map(  d(0)=>a1,
                        d(1)=>b1, 
                        d(2)=>c1,       
                        clk=>clk,
                        r_neg=>r_neg,
                        en=>'1',
                        ld_neg=>ld_neg,
                        q=>qint);
    
                  q<=qint;     
    
   
               
end Behavioral;
