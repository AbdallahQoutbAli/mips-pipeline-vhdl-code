library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
ENTITY ALU IS
PORT (
src1           : IN STD_LOGIC_VECTOR (31 DOWNTO 0);   -- src1
src2           : IN STD_LOGIC_VECTOR (31 DOWNTO 0);   --src2
shamt          : IN STD_LOGIC_VECTOR (4 DOWNTO 0) ;    --instruction (6 : 10) '
alucontrol     : IN STD_LOGIC_VECTOR ( 5 DOWNTO 0);   -- function select
alu_result     : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);  -- ALU Output Result
zero           : OUT STD_LOGIC                        -- Zero Flag
);
END ALU;
ARCHITECTURE Behavioral OF ALU IS
SIGNAL src1_unsigned: unsigned(31 downto 0);  	---unsigned for unsigned instructions
SIGNAL src2_unsigned: unsigned(31 downto 0);  	---unsigned for unsigned instructions
SIGNAL out_sra    : signed(31 downto 0);  	---output for sra instructions
BEGIN 
src1_unsigned <= unsigned(src1)   ;
src2_unsigned <= unsigned(src2)   ;  



PROCESS (src1, src2, src1_unsigned , src2_unsigned, alucontrol,out_sra)
BEGIN
CASE alucontrol IS    
-----------------R_TYPE------------------
WHEN "000000"  =>   alu_result <= src1 + src2; --add
WHEN "001000"  =>   alu_result <= STD_LOGIC_VECTOR( src1_unsigned + src2_unsigned);  --addu
WHEN "000001"  =>   alu_result <= src1 - src2;--  sub 
WHEN "001001"  =>   alu_result <= STD_LOGIC_VECTOR(src1_unsigned - src2_unsigned);--  subu 
WHEN "000100"  =>   alu_result <= src1 and src2;-- And / Andi 
WHEN "000101"  =>   alu_result <= src1 or src2;--or  / ori 
WHEN "000010"  =>    if (src1<src2)then  -- slt /slt immediate
alu_result<=x"00000001";   
else
alu_result<=x"00000000";  
end if ;
WHEN "000011" =>    if (src1_unsigned < src2_unsigned) then -- sltu /sltu immediate
 alu_result <=x"00000001" ;
else 
 alu_result <=x"00000000" ;
end if ;
when "000110" =>    alu_result <= src1 xor src2 ;  --XOR / XORi  
when "000111" =>    alu_result <= src1 nor src2 ;  --NOR 
when "001010" =>    alu_result <= STD_LOGIC_VECTOR(signed(src2) sll TO_INTEGER(SIGNED(shamt))) ; --shift left logical  
when "001011" =>    alu_result <= STD_LOGIC_VECTOR(signed(src2) srl TO_INTEGER(SIGNED(shamt))) ; --shift Right logical  
when "001100" =>    alu_result <= STD_LOGIC_VECTOR(signed (to_stdlogicvector(to_bitvector(std_logic_vector(src2)) sra to_integer(SIGNED (shamt)))) ); --shift Right Arithmatic 
when "001101" =>    alu_result <= STD_LOGIC_VECTOR(signed(src2) sll TO_INTEGER(SIGNED(src1)))  ;--shift left logical variable  SLLV  
when "001110" =>    alu_result <= STD_LOGIC_VECTOR(signed(src2) srl TO_INTEGER(SIGNED(src1))) ; -- shift Right logical variabl SRLV  
when "001111" =>    alu_result <= STD_LOGIC_VECTOR(signed (to_stdlogicvector(to_bitvector(std_logic_vector(src2)) sra to_integer(SIGNED(src1)))) ); -- shift Right Arithmatic variable SRAV		
when "011000" =>    alu_result <= src1 (15 downto 0) * src2 (15 downto 0)    ;  -- multiply 
when "011001" =>    alu_result <= STD_LOGIC_VECTOR(   src1_unsigned(15 downto 0) * src2_unsigned (15 downto 0))  ;  -- multiply unsigned
when "011010" =>    alu_result <= STD_LOGIC_VECTOR(signed(src1) / TO_INTEGER(SIGNED(src2))) ;	 --divide
when "011011" =>    alu_result <= STD_LOGIC_VECTOR( (unsigned(src1) / (UNSIGNED(src2))) );	 -- divide unsigned
when "011101" =>   if (src1 = src2 ) then  -- beq 
 zero <= '1' ;
else   
zero <= '0';
end if ;
when "011110" =>  if (src1 /= src2 ) then  -- bne
zero <= '1' ;
else 
zero <= '0' ;
end if ;
when "011111" =>  if ((src1 < 0) or  (src1 = 0)) then   -- blez 
 zero <= '1' ;
else
zero <= '0' ;
end if ; 
when "100000" => if (src1 > 0 ) then   -- bgtz 
zero <= '1' ;
else
zero <= '0' ;
 end if ; 
when others => zero<='-' ;	 	
END CASE;
END PROCESS;
END Behavioral;