library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity mux2_pc is 
	port (
		din1,din2: in std_logic_vector(31 downto 0);
		s1: in std_logic;
		s2: in std_logic;
		pc: out std_logic_vector(31 downto 0)
	);
end mux2_pc;

architecture beh of mux2_pc is
	begin
	pc <= din2 when (s1='1' or s2='1') else din1;
end beh;

