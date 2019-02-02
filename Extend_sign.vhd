library IEEE;
use IEEE.std_logic_1164.all; 

entity SignExtend  is 
port(
signExIn  : in std_logic_vector (15 downto 0);
signEXOut : out std_logic_vector(31 downto 0) 
);
end SignExtend ;
architecture Behavioral of SignExtend is 
begin 
process (signExIn)
begin 
signEXOut (15 downto 0) <= signExIn  (15 downto 0) ;
if (signExIn(15)='0') then 
signEXOut (31 downto 16) <=x"0000" ;
elsif (signExIn(15)='1') then 
signEXOut (31 downto 16) <=x"FFFF" ;
End if ;
end process ;
end Behavioral ;

