LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE IEEE.NUMERIC_STD.ALL ;

ENTITY InstructionMemory IS
	PORT (
		clk : IN STD_LOGIC ;								
		address : IN STD_LOGIC_VECTOR(31 DOWNTO 0) ;					
		dout : Out STD_LOGIC_VECTOR (31 DOWNTO 0)	
	) ;
END InstructionMemory ;
	
ARCHITECTURE Behaviour OF InstructionMemory IS
TYPE RAM IS ARRAY (0 to 8) OF STD_LOGIC_VECTOR(31 DOWNTO 0) ;
SIGNAL instr_mem : RAM ;
BEGIN
--data_mem
instr_mem(0)  <= x"00000000"; 
instr_mem(1)  <= x"ae110000" ; --  sw   $s1, 	0($s0) 
instr_mem(2)  <= x"01285020" ; --  add 	$t2, 	$t1, 	$t0
instr_mem(3)  <= x"01285022" ; --  sub 	$t5, 	$t1, 	$t0
instr_mem(4)  <= x"0149402a" ; --  slt 	$t0, 	$t2, 	$t1
instr_mem(5)  <= x"1211fffb" ; --  branchequal 	$s0, 	$s1, 	$L1	
instr_mem(6)  <= x"8e110000" ; --  lw   $s1, 	0($s0)
instr_mem(7)  <= x"018b6825" ; --  or 	$t5, 	$t4, 	$t3
InstrProcess : PROCESS(clk, address) IS
BEGIN
IF clk = '1'THEN
dout <= instr_mem(TO_INTEGER(UNSIGNED(address(15 downto 0))/4)) ;					
END IF ;
END PROCESS ;				
END Behaviour ;

