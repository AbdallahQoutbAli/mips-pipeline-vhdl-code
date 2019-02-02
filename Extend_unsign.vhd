library IEEE;
use IEEE.std_logic_1164.all; 

entity unSignExtend  is 
port(
unsignExIn  : in std_logic_vector (15 downto 0);
unsignEXOut : out std_logic_vector(31 downto 0) 
);
end unSignExtend ;
architecture Behavioral of unSignExtend is 
begin 
unsignEXOut (15 downto 0) <= unsignExIn ( 15 downto 0) ;
unsignEXOut (31 downto 16) <= x"0000" ;

end Behavioral ;

