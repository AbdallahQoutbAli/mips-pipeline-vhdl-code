LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
ENTITY dataMemory IS
	PORT (
		address   : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		writeData : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		memRead   : IN STD_LOGIC;
		memWrite  : IN STD_LOGIC;
		clk       : IN STD_LOGIC;
		readData  : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END dataMemory;
ARCHITECTURE Behavioral OF dataMemory IS
TYPE RAM IS ARRAY(0 TO 15) OF std_logic_vector(31 DOWNTO 0);
SIGNAL DM : RAM :=((others=> (others=>'0')));
begin 
DMProcess: process(clk)
begin
if(clk='1') then
if (memWrite='1') then
DM(to_integer(unsigned(address))) <= writeData;
end if;
end if;
end process;
readData <= DM(to_integer(unsigned(address))) when (memRead='1') else x"00000000";
end Behavioral ;