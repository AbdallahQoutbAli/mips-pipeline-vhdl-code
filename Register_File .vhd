library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity register_file  is
port
(
register1      : in  std_logic_vector(4 downto 0); 
register2      : in  std_logic_vector(4 downto 0); 
register3      : in  std_logic_vector(4 downto 0); 
writeData      : in  std_logic_vector(31 downto 0);
clk            : in std_logic;
regWrite       : in  std_logic ;
regRead        :in  std_logic  ;
ReadData1      : out  std_logic_vector(31 downto 0); 
ReadData2      : out  std_logic_vector(31 downto 0) 

);
end register_file ;
architecture Behavioral of register_file is 

type    registers is array (0 to 31) of std_logic_vector(31 downto 0);

signal  reg_array  : registers :=(

                x"00000000", --$zero
		x"00000001", --$at
		x"00000002", --$v0
		x"00000003", --$v1
		x"00000004", --$a0
		x"00000005", --$a1
		x"00000006", --$a2
		x"00000007", --$a3
		"00000000000000000000000000001000", --$t0
		"00000000000000000000000000001001", --$t1
		x"0000000A", --$t2
		x"0000000B", --$t3
		x"0000000C", --$t4
		x"0000000D", --$t5
		x"0000000E", --$t6
		x"0000000F", --$t7
		x"00000010", --$s0
		x"00000011", --$s1
		x"00000012", --$s2
		x"00000013", --$s3
		x"00000014", --$s4
		x"00000015", --$s5
		x"00000016", --$s6
		x"00000017", --$s7
		x"00000018", --$t8
		x"00000019", --$t9
		x"0000001A", --$k0
		x"0000001B", --$k1
		x"0000001C", --$global pointer
		x"0000001D", --$stack pointer
		x"0000001E", --$frame pointer
                x"0000001F" --$return address
);

begin 
process(clk,regRead,regWrite,register1,register2,reg_array) 
begin 
 
if(clk='1'and regRead='1' ) then     --Read out
 ReadData1<=STD_LOGIC_VECTOR( reg_array(to_integer(unsigned(register1)))) ;
  ReadData2<=STD_LOGIC_VECTOR( reg_array(to_integer(unsigned(register2)))) ;

end if ; 
if (clk='1'   and regWrite='1' ) Then  -- pluse on write
 reg_array(to_integer(unsigned(register3)))<= writeData ;
end if;
end process;
end Behavioral; 