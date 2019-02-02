library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use IEEE.STD_LOGIC_UNSIGNED.all;
entity tb_Datapath is
end tb_Datapath;

architecture Tb  of tb_Datapath is
--Inputs
signal  tb_clk : STD_LOGIC ;
signal tb_reset: STD_LOGIC ;

BEGIN
--Instantiate the Unit Under Test (U1_Test)

uuu:ENTITY work.dpath(test)
PORT MAP (
		clk=>tb_clk,
		reset=>tb_reset
);

clk_process :process
begin
tb_clk <= '0';
wait for 100 ns;
tb_clk <= '1';
wait for 100 ns;
end process;

-- Generate reset for first two clock cycles
process_reset : process begin
tb_reset <= '1';
wait for 100 ns;
tb_reset <= '0';
wait for 100 ns;
end process;
end;
