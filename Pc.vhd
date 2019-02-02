library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pc is
	port(
		clk             : in std_logic; 
		din   		: in std_logic_vector(31 downto 0);
		dout		: out std_logic_vector(31 downto 0)

	);
end pc;
architecture beh of pc is

begin
process(clk)
begin
if (din = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" )then
 dout<= "00000000000000000000000000000000" ;
else 
IF (clk = '1'  )then
 dout <= din;
end if;
end if;
end process;
	
	

end beh;




