library IEEE; 
use IEEE.STD_LOGIC_1164.all;
entity aludec is
port(
funct: in STD_LOGIC_VECTOR(5 downto 0);
aluop: in STD_LOGIC_VECTOR(3 downto 0);
alucontrol: out STD_LOGIC_VECTOR(5 downto 0)
);
end aludec;
architecture behave of aludec is
begin
process(funct,aluop) 
begin
case aluop is
when "0000" => alucontrol <= "000000";     -- add (for 1w/sw/addi/ lui)
--------------------------------I-TYPE------------------------------
when "1010" => alucontrol <= "000100"; -- AndI
when "0010" => alucontrol <= "000101"; -- ORI
when "0100" => alucontrol <= "000110"; --xorI
when "0011" => alucontrol <= "000010"; -- sltI
when "0101" => alucontrol <= "011100"; -- sltIu
when "0001" => alucontrol <= "011101"; -- beq
when "1001" => alucontrol <= "011110"; -- bne
when "0111" => alucontrol <= "011111"; -- blez
when "1011" => alucontrol <= "100000"; -- bgtz
when "XXXX" => alucontrol <= "XXXXXX"; -- Jump / Jump and link
when "1000" => case funct is      
    ------------------ R-type instructions------------------------
when "100000" => alucontrol <= "000000"; -- add
when "100010" => alucontrol <= "000001"; -- sub
when "101010" => alucontrol <= "000010"; -- slt
when "101011" => alucontrol <= "000011"; -- sltu
when "100100" => alucontrol <= "000100"; -- And
when "100101" => alucontrol <= "000101"; -- OR
when "100110" => alucontrol <= "000110"; --xor
when "100111" => alucontrol <= "000111"; --NOR
when "100001" => alucontrol <= "001000"; -- add unsigned
when "100011" => alucontrol <= "001001"; -- sub unsigned
when "000000" => alucontrol <= "001010"; -- sheft left logical
when "000010" => alucontrol <= "001011"; -- sheft Right logical
when "000011" => alucontrol <= "001100"; -- sheft Right Arithmatic sra
when "000100" => alucontrol <= "001101"; -- sheft left logical variable
when "000110" => alucontrol <= "001110"; -- sheft Right logical variable
when "000111" => alucontrol <= "001111"; -- sheft Right Arithmatic variable
when "001000" => alucontrol <= "XXXXXX"    ; -- Jump Register JR                
when "001001" => alucontrol <= "XXXXXX"    ; -- Jump and link Register JALR 
when "011000" => alucontrol <= "011000"; -- multiply            
when "011001" => alucontrol <= "011001"; -- multiply unsigned
when "011010" => alucontrol <= "011010"; -- divide
when "011011" => alucontrol <= "011011"; -- divide unsigned
when others => Null;
end case ;
when others => Null;
end case;
end process;
end behave;
