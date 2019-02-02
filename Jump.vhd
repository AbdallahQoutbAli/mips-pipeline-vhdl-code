library IEEE;
use IEEE.std_logic_1164.all; 
entity Jump_address  is 
port(
Jump_address_in  : in std_logic_vector (25 downto 0);
Pc_in             : in std_logic_vector (3 downto 0);
Jump_address_out : out std_logic_vector(31 downto 0) 
);
end Jump_address ;
architecture Behavioral of Jump_address is 
begin 
--shiftLeft by 2
	Jump_address_out(27 DOWNTO 2) <=Jump_address_in (25 downto 0);
       Jump_address_out(1) <= '0';
	Jump_address_out(0) <= '0';
       Jump_address_out(28) <= Pc_in (0);
       Jump_address_out(29) <= Pc_in (1);
       Jump_address_out(30) <= Pc_in (2);
	Jump_address_out(31) <= Pc_in (3);

end Behavioral ;

