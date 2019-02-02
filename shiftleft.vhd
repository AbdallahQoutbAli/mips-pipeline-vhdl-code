LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY shiftLeft IS
	PORT (
		input  : IN STD_LOGIC_VECTOR(31  DOWNTO 0);
		output : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END shiftLeft;
ARCHITECTURE Behavioral OF shiftLeft IS
BEGIN 
--shiftLeft by 2
	output(31)          <= input(31);
	output(30 DOWNTO 2) <= input(28 DOWNTO 0);
        output(1) <= '0';
	output(0) <= '0';
END Behavioral;
