library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mux1_pc is 
	port (
		din1,din2: in std_logic_vector(31 downto 0);
		s: in std_logic;
		pc: out std_logic_vector(31 downto 0)
	);
end mux1_pc;

architecture beh of mux1_pc is
	begin
	pc <= din1 when (s='0') else din2;
end beh;

