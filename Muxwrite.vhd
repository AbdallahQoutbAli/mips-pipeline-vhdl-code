library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity Muxwrite is 
	port (
		din1,din2: in std_logic_vector(31 downto 0);
		s1: in std_logic;
		writeback: out std_logic_vector(31 downto 0)
	);
end Muxwrite;

architecture beh of Muxwrite is
	begin
	writeback <= din1 when (s1='0' ) else din2;
end beh;

