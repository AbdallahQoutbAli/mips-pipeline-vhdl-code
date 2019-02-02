library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity Muxwrite_2 is 
	port (
		din1,din2: in std_logic_vector(31 downto 0);
		s1: in std_logic;
		s2: in std_logic;
		writeback: out std_logic_vector(31 downto 0)
	);
end Muxwrite_2;

architecture beh of Muxwrite_2 is
	begin
	writeback <= din1 when (s1='1' or s2='1' ) else din2;
end beh;

