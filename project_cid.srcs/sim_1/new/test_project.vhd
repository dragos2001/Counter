
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test_project is
--  Port ( );
end test_project;

architecture Behavioral of test_project is

component proiect2FII is
    Port ( clk : in STD_LOGIC;
           r_neg : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR (2 downto 0));
end component proiect2FII;

signal clk, r_neg : std_logic;
signal q : std_logic_vector (2 downto 0);

begin
uut : proiect2FII port map (clk => clk,
                    r_neg => r_neg,
                    q => q);
                    
r_neg <='1';
 
process 

begin
  clk <= '0';
  wait for 5 ns;
  clk <= '1';
  wait for 5 ns;
end process;
                     
end Behavioral;

