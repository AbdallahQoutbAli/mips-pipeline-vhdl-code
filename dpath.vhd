library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
ENTITY dpath IS
	PORT (
		clk        : IN STD_LOGIC;
		reset      : IN STD_LOGIC 
                
	);
END dpath;
ARCHITECTURE test OF dpath IS

	--/************IF stage signals  *************/--
   	-- PC signals
       SIGNAL  PC_new,PC_new_1,PC_new_2: std_logic_vector(31 DOWNTO 0);
        SIGNAL  PC_IF   	   : std_logic_vector(31 DOWNTO 0);
    
         SIGNAL 	 Pc_add_4      :std_logic_vector(31 DOWNTO 0); 
	--/***********ID stage signals  *************/--
       --instructionMemory signals
        SIGNAL 	 instr_id          :std_logic_vector(31 DOWNTO 0);
        SIGNAL 	 Pc_add_4_id       :std_logic_vector(31 DOWNTO 0); 
        SIGNAL   Jump_address      :std_logic_vector(31 downto 0);
	--Control Unit signals        
	SIGNAL  regDst_id         :  std_logic_vector(1 DOWNTO 0);
	SIGNAL	branch_id    	  :  std_logic;
	SIGNAL	memRead_id        :  std_logic;
	SIGNAL	memToReg_id 	  :  std_logic;
	SIGNAL	aluOp_id          :  std_logic_vector(3 DOWNTO 0);
	SIGNAL	memWrite_id   	  :  std_logic;
	SIGNAL	aluSrc_id         :  std_logic_vector(2 DOWNTO 0);
	SIGNAL	regWrite_id       :  std_logic; 
        SIGNAL  id_ex_enable      :std_logic;
        SIGNAL  jump_id           :  std_logic;
        SIGNAL  jump_link_id      :  std_logic;
        SIGNAL  jump_reg_id         	  :  std_logic;
        SIGNAL  jump_and_link_reg_id :  std_logic;
        SIGNAL  branch_not_equal_id   :  std_logic     ; 
        SIGNAL  branch_less_than_or_equal_id   :  std_logic     ;  		
	SIGNAL  branch_greater_than_id  :  std_logic     ;  
        SIGNAL sign_id         :  std_logic   ;
        SIGNAL un_signed_id     :  std_logic ;
 	--Register File  signals 
        SIGNAL rs_id,rt_id,rd_id,shamt_id      :std_logic_vector(4 DOWNTO 0); 
        SIGNAL rt_or_rd_wb                     :std_logic_vector(4 DOWNTO 0);  --register write index (from WB stage) 
        SIGNAL reg_wr_wb,reg_wr_wb_1           :std_logic_vector(31 DOWNTO 0);               
	SIGNAL reg_rd1_ex,reg_rd2_ex           :std_logic_vector(31 DOWNTO 0);
        SIGNAL regWrite_wb                     :std_logic;
		--SignExtend
        SIGNAL   sign_extended_id              :std_logic_vector(31 DOWNTO 0);
 	 --unSignExtend
        SIGNAL   zero_extended_id 		:std_logic_vector(31 downto 0);
--/************EX stage signals *************/--
        --Control Unit signals 
        SIGNAL  regDst_ex         :  std_logic_vector(1 DOWNTO 0);
	SIGNAL	branch_ex    	  :  std_logic;
	SIGNAL	memRead_ex        :  std_logic;
	SIGNAL	memToReg_ex 	  :  std_logic;
       	SIGNAL	aluOp_ex          :  std_logic_vector( 3 DOWNTO 0);
	SIGNAL	memWrite_ex  	  :  std_logic;
	SIGNAL	aluSrc_ex         :  std_logic_vector(2 DOWNTO 0);
	SIGNAL	regWrite_ex       :  std_logic; 
        SIGNAL  instr_ex          :std_logic_vector(31 DOWNTO 0);
        SIGNAL  jump_ex          :std_logic;
        SIGNAL  jump_link_ex      :  std_logic;
        SIGNAL  jump_reg_ex          :  std_logic;
        SIGNAL  jump_and_link_reg_ex  :  std_logic;
        SIGNAL  branch_not_equal_ex   :  std_logic     ; 
        SIGNAL  branch_less_than_or_equal_ex  :  std_logic     ;  		
	SIGNAL  branch_greater_than_ex  :  std_logic     ;  
        SIGNAL sign_ex         :  std_logic   ;
        SIGNAL un_signed_ex     :  std_logic ;
 	--ExtendSign and unsign
        SIGNAL   sign_extended_ex             :std_logic_vector(31 DOWNTO 0);
        SIGNAL   zero_extended_ex 		:std_logic_vector(31 downto 0);
        --instruction components
        SIGNAL  rs_ex,rt_ex,rd_ex,shamt_ex    :std_logic_vector(4 DOWNTO 0); 
        SIGNAL  pc_add_4_ex             :std_logic_vector(31 DOWNTO 0);
        --ALu components
        SIGNAL  rt_or_rd_ex    :std_logic_vector(4 DOWNTO 0); --To choose (20 to 16 ) or (15 to 11)
        SIGNAL aluOp1,aluOp2,aluResult_ex    :std_logic_vector(31 DOWNTO 0);
	SIGNAL aluZero_ex                    :std_logic; 
        SIGNAL aluOperation_ex               :std_logic_vector(5 DOWNTO 0); 
        SIGNAL pc_branch_ex 		     :std_logic_vector(31 DOWNTO 0);
	SIGNAL Shift_out 		     :std_logic_vector(31 DOWNTO 0);
--/************ MEM stage signals  *************/--
	--instruction components
	SIGNAL rs_mem,rt_mem 		      :std_logic_vector(4 DOWNTO 0);
	SIGNAL rt_or_rd_mem 	              :std_logic_vector(4 DOWNTO 0);
	SIGNAL reg_rd2_mem   		      :std_logic_vector(31 DOWNTO 0);
        SIGNAL reg_rd1_mem   		      :std_logic_vector(31 DOWNTO 0);

	SIGNAL aluResult_mem  		      :std_logic_vector(31 DOWNTO 0);
	SIGNAL aluZero_mem                    :std_logic; 
	SIGNAL regWrite_mem 		      :std_logic; 
	SIGNAL branch_mem                     :std_logic; 
	SIGNAL memWrite_mem                   :std_logic; 
	SIGNAL memRead_mem                    :std_logic; 
	SIGNAL memToReg_mem                   :std_logic; 
        SIGNAL mem_read_data_mem              :std_logic_vector(31 DOWNTO 0);
	SIGNAL  instr_mem                     :std_logic_vector(31 DOWNTO 0);
        SIGNAL  regDst_mem                   :  std_logic_vector(1 DOWNTO 0);
        SIGNAL 	 Pc_add_4_mem                :std_logic_vector(31 DOWNTO 0); 
        SIGNAL  jump_mem                      :  std_logic; 
        SIGNAL  jump_link_mem                 :  std_logic;
        SIGNAL  jump_reg_mem                  :  std_logic;
        SIGNAL  jump_and_link_reg_mem         :  std_logic;
        SIGNAL  branch_not_equal_mem   :  std_logic     ; 
        SIGNAL  branch_less_than_or_equal_mem  :  std_logic     ;  		
	SIGNAL  branch_greater_than_mem  :  std_logic     ;  
        SIGNAL sign_mem        :  std_logic   ;
        SIGNAL un_signed_mem     :  std_logic ;
    	--PC select multiplexer
	SIGNAL  pc_branch_mem 		: std_logic_vector(31 DOWNTO 0); 
	SIGNAL  pcSrc_mem                  : std_logic;
	--/************ WB stage signals  *************/- 
	 --instruction components
	SIGNAL rs_wb,rt_wb                    :std_logic_vector(4 DOWNTO 0);	
	SIGNAL mem_read_data_wb	              :std_logic_vector(31 DOWNTO 0);
	SIGNAL aluResult_wb                   :std_logic_vector(31 DOWNTO 0);
	SIGNAL  memToReg_wb                    :std_logic; 
        SIGNAL  jump_link_wb	                 :  std_logic;
        SIGNAL  jump_reg_wb	                 :  std_logic;
        SIGNAL  jump_and_link_reg_wb	         :  std_logic;
        SIGNAL 	 Pc_add_4_wb                 :std_logic_vector(31 DOWNTO 0); 
--/************ data_hazard  signals  *************/- 
        SIGNAL data_hazard		      :std_logic; 
	SIGNAL control_hazard                 :std_logic;  
begin
 --================================= IF =Instruction Fetch stage =============================================

-------Mux_PC
--process (jump_reg_mem,jump_and_link_reg_mem,PC_new,reg_rd1_mem ,PC_new_2,clk,reset)
--begin
--if((jump_reg_mem='1' or jump_and_link_reg_mem='1') and clk='1'  and reset= '0' )then
--PC_new<=reg_rd1_mem;
--else 
--PC_new<=PC_new_2;
--end if;
--end process;

 pc: ENTITY work.pc 
        port map
        (
                clk              =>clk,
		din 		 =>PC_new, 
		dout		 =>PC_IF
  );
-- instruction memory of the MIPS 
Instruction_Memory: ENTITY work.InstructionMemory 
        port map
        (
	clk     =>clk,
        address=> PC_IF,
        dout   => instr_id
         );

Pc_add_4<=PC_IF + x"00000004" ;

---  Jump_address
Jump:entity work.Jump_address 
port map (
Jump_address_in  => instr_id(25 downto 0 ),
Pc_in             => Pc_add_4 (31 downto 28),
Jump_address_out => Jump_address
);

-------Mux_PC_1
 Mux1_pc: ENTITY work.mux1_pc 
port map
(
din1=>Pc_add_4,
din2=>pc_branch_mem,
s=>pcSrc_mem,
pc=>PC_new_1
  );
-------Mux_PC_2
 Mux2_pc: ENTITY work.mux2_pc
port map
(
din1=>PC_new_1,
din2=>Jump_address,
s1=>jump_mem,
s2=>jump_link_mem,
pc=>PC_new_2
  );
-------Mux_PC_3
 Mux3_pc: ENTITY work.mux3_pc
port map
(
din1=>PC_new_2,
din2=>reg_rd1_mem,
s1=>jump_reg_mem,
s2=>jump_and_link_reg_mem,
pc=>PC_new
);
---=============ID Decode & Register Read stage========================
--needed 
--control signals
--pc_en_id
--pcSrc_mem
--pc_branch_mem
-- control unit of the MIPS
control: ENTITY work.Controller
   port map
(
                opcode   =>  instr_id (31 downto 26), 
                fun=> instr_id (5 downto 0),
		regDst   =>   regDst_id  ,
		branch   =>   branch_id,
		memRead=>    memRead_id,
		memToRegister => memToReg_id,
		ALUop  =>    aluOp_id, 
		memWrite =>   memWrite_id,
		ALUsrc  =>   aluSrc_id,  
		regWrite  =>    regWrite_id , 
		 regRead=>id_ex_enable,
                 jump      => jump_id,
                jump_link     => jump_link_id,
                jump_reg       =>       jump_reg_id,
                jump_and_link_reg  => jump_and_link_reg_id,  
                branch_not_equal => branch_not_equal_id, 
                branch_less_than_or_equal=>branch_less_than_or_equal_id,  		
		branch_greater_than=>branch_greater_than_id,
        	 sign =>sign_id,
        	 un_signed=>un_signed_id
	);

process (clk,id_ex_enable,Pc_add_4)
 begin
if( clk ='1' and id_ex_enable='1') then
pc_add_4_id <= Pc_add_4;
else
pc_add_4_id <= "--------------------------------" ;
end if;
end process;
--Block Register file
rs_id     <= instr_id (25 downto 21); --register1
rt_id     <= instr_id (20 downto 16); --register2
rd_id     <= instr_id (15 downto 11);
shamt_id  <= instr_id (10 downto 6); --shamt 

register_file : entity work.register_file

port map 
(
register1 	 => rs_id,
register2  	=> rt_id, 
register3 	=> rt_or_rd_wb,
writeData      => reg_wr_wb,
clk            => clk ,
regWrite       => regWrite_wb ,
regRead        => id_ex_enable ,
ReadData1      => reg_rd1_ex,      
ReadData2      => reg_rd2_ex 
);
 -- sign extend
Extend_sign : entity work.SignExtend 
port map (
signExIn  => instr_id (15 downto 0),
signEXOut => sign_extended_id 
);
 -- unsign extend
Extend_unsign : entity work.unSignExtend 
port map (
unsignExIn  => instr_id (15 downto 0),
unsignEXOut => zero_extended_id 
);
--============ EX stage ============================

process 
(clk,reset,id_ex_enable,rd_id,rt_id,
rs_id,sign_extended_ex,sign_extended_id,zero_extended_ex,
zero_extended_id,regDst_ex,regDst_id,aluSrc_ex,aluSrc_id,
branch_ex,branch_id,memWrite_ex,memWrite_id,memRead_ex,
memRead_id,memToReg_ex,memToReg_id,pc_add_4_ex,
pc_add_4_id,aluOp_ex,aluOp_id,
instr_ex,instr_id,jump_ex,jump_id,jump_link_ex ,jump_link_id,jump_reg_ex,
jump_reg_id,jump_and_link_reg_ex,jump_and_link_reg_id,branch_not_equal_ex,
 branch_not_equal_id,branch_less_than_or_equal_ex , 
branch_less_than_or_equal_id,branch_greater_than_ex ,
 branch_greater_than_id ,sign_ex , sign_id,un_signed_ex , 
un_signed_id)
--process (id_ex_reset,reset,id_ex_enable)
begin
if(reset='1')then
regWrite_ex  <= '0';
memWrite_ex  <= '0';
memRead_ex   <= '0';
branch_ex    <= '0';
elsif( id_ex_enable='1' and clk='1')then
rs_ex <=rs_id;
rt_ex <=rt_id;
rd_ex <=rd_id;
shamt_ex<=shamt_id;
sign_extended_ex<=sign_extended_id;
zero_extended_ex<=zero_extended_id;
regDst_ex<=regDst_id;
aluSrc_ex<=aluSrc_id;
branch_ex<=branch_id;
memWrite_ex<=memWrite_id;
memRead_ex<=memRead_id;
memToReg_ex<=memToReg_id;
pc_add_4_ex<=pc_add_4_id;
aluOp_ex<=aluOp_id;
instr_ex<=instr_id;
jump_ex<=jump_id;
jump_link_ex <=jump_link_id;
jump_reg_ex<=  jump_reg_id;
jump_and_link_reg_ex<=jump_and_link_reg_id;
branch_not_equal_ex <= branch_not_equal_id; 
branch_less_than_or_equal_ex <= branch_less_than_or_equal_id; 		
branch_greater_than_ex <= branch_greater_than_id; 
sign_ex <= sign_id ;
un_signed_ex <= un_signed_id;
end if;
end process;
----Mux RegDst
--clk'event and clk='1' and
process (regDst_ex,jump_link_ex,rt_ex,rt_or_rd_ex ,clk)
begin 
if ( regDst_ex="00"   and clk='1') then
rt_or_rd_ex <=rt_ex;  ---choose 20 to 16
elsif(  regDst_ex="01" and clk='1' ) then
rt_or_rd_ex <=rd_ex; ---choose 15 to 16 
elsif(jump_link_ex='0' and regDst_ex="10" and clk='1' )then
rt_or_rd_ex <="11111";--31 
end if ;
end process;


-- ALU control unit of the MIPS
ALU_Conutrol  : entity work.aludec
 port map
  (
   aluop      => aluOp_ex,
   funct      =>instr_ex(5 downto 0),
   alucontrol => aluOperation_ex 
   );
-- ALU unit of the MIPS 
aluOp1<=reg_rd1_ex;

--choose sign extended OR Register2
process (aluSrc_ex,aluOp2,reg_rd2_ex,zero_extended_ex,sign_extended_ex)
begin 
if (aluSrc_ex="000") then
aluOp2 <=reg_rd2_ex;   ---choose 20 to 16
elsif(aluSrc_ex="010") then 
aluOp2 <=sign_extended_ex; --- sign_extended_ex
elsif (aluSrc_ex="001") then
aluOp2 <=zero_extended_ex; -- Zero _extended_ex
end if ;
end process; 

Alu :  entity work.ALU 
port map   (
		src1          =>aluOp1,        
		src2          =>aluOp2,   
                 shamt=>shamt_ex,       
		 alucontrol  =>aluOperation_ex,
		alu_result  =>aluResult_ex,
		zero        =>aluZero_ex        

	
);
--shiftLeft by 2
 shiftLeft:entity work.shiftLeft
port map 
(
input  =>sign_extended_ex,
output =>Shift_out 	
);
pc_branch_ex <= Shift_out + pc_add_4_ex;
--========================================= MEM=Memory Access stage ================================================

process 
(clk,reset,rt_or_rd_mem,rt_mem,
rs_mem,sign_extended_ex,zero_extended_ex
,regDst_ex,regDst_mem,aluResult_ex,aluResult_mem,
branch_ex,branch_mem,memWrite_ex,memWrite_mem,memRead_ex,
memRead_mem,memToReg_ex,memToReg_mem,pc_add_4_ex,
pc_add_4_mem,aluZero_ex,aluZero_mem,
instr_ex,instr_mem,jump_ex,jump_mem,jump_link_ex ,jump_link_mem,jump_reg_ex,
jump_reg_mem,jump_and_link_reg_ex,jump_and_link_reg_mem,branch_not_equal_ex,
 branch_not_equal_mem,branch_less_than_or_equal_ex , 
branch_less_than_or_equal_mem,branch_greater_than_ex ,
 branch_greater_than_mem ,sign_ex , sign_mem,un_signed_ex , 
un_signed_mem,pc_branch_mem,pc_branch_ex	)
begin
if(  reset='1')then
regWrite_mem<='0';
branch_mem<='0';
memWrite_mem<='0';
memRead_mem<='0';
elsif( clk='1')then
rs_mem<=rs_ex;
rt_mem<=rt_ex;
rt_or_rd_mem<=rt_or_rd_ex;
reg_rd1_mem<=reg_rd1_ex;
reg_rd2_mem<=reg_rd2_ex;
aluResult_mem<=aluResult_ex;
aluZero_mem<=aluZero_ex;
pc_branch_mem<=pc_branch_ex;			
regWrite_mem<=regWrite_ex;				
branch_mem<=branch_ex;
memWrite_mem<=memWrite_ex;
memRead_mem<=memRead_ex;
memToReg_mem<=memToReg_ex;
instr_mem<=instr_ex;
jump_mem<=jump_ex;
jump_link_mem <=jump_link_ex;
jump_reg_mem<=  jump_reg_ex;
jump_and_link_reg_mem<=jump_and_link_reg_ex;
pc_add_4_mem<=pc_add_4_ex;
regDst_mem<=regDst_ex;
branch_not_equal_mem <= branch_not_equal_ex; 
branch_less_than_or_equal_mem<= branch_less_than_or_equal_ex; 		
branch_greater_than_mem <= branch_greater_than_ex; 
sign_mem <= sign_ex;
un_signed_mem <= un_signed_ex;
end if;
end process ;
pcSrc_mem <=(branch_mem or  branch_greater_than_mem or branch_less_than_or_equal_mem or branch_not_equal_mem )  and (aluZero_mem);
--============================================== WB stage =================================================
--dataMemory
dataMemory: entity work.dataMemory(Behavioral)
port map
  (
  clk=>clk,
  address   => aluResult_mem,
  writeData => reg_rd2_mem,
  memRead  => memRead_mem,
  memWrite => memWrite_mem,
  readData => mem_read_data_mem
  );

process
(clk,aluResult_wb,aluResult_mem,rs_wb,rs_mem,
rt_wb,rt_mem,
rt_or_rd_wb,rt_or_rd_mem,
mem_read_data_wb,mem_read_data_mem,
regWrite_wb,regWrite_mem,
memToReg_wb,memToReg_mem,
jump_link_wb ,jump_link_mem,
jump_reg_wb,  jump_reg_mem,
jump_and_link_reg_wb,jump_and_link_reg_mem,
pc_add_4_wb , pc_add_4_mem)
begin
if( reset='1')then
regWrite_wb<='0';
elsif( clk='1'   )then
aluResult_wb<=aluResult_mem;
rs_wb<=rs_mem;
rt_wb<=rt_mem;
rt_or_rd_wb<=rt_or_rd_mem;
mem_read_data_wb<=mem_read_data_mem;
regWrite_wb<=regWrite_mem;
memToReg_wb<=memToReg_mem;
jump_link_wb <=jump_link_mem;
jump_reg_wb<=  jump_reg_mem;
jump_and_link_reg_wb<=jump_and_link_reg_mem;
pc_add_4_wb <= pc_add_4_mem;
end if ;
end process ;
-------Muxwriteback_1
 Muxwrite: ENTITY work.Muxwrite
port map
(
din1=>aluResult_wb,
din2=>mem_read_data_wb,
s1=>memToReg_wb,
writeback=>reg_wr_wb_1
  );
-------Muxwriteback_2
 Muxwrite_2: ENTITY work.Muxwrite_2
port map
(
din1=>pc_add_4_wb,
din2=>reg_wr_wb_1,
s1=>jump_link_wb,
s2=>jump_and_link_reg_wb,
writeback=>reg_wr_wb
  );
--=========================================  data_hazard ================================================
--check for Data Hazard 
process (rs_id,rt_id,rt_or_rd_ex,rt_or_rd_mem,regWrite_ex,regWrite_mem,data_hazard )
begin
if ((rs_id=rt_or_rd_ex)   and regWrite_ex='1')then
data_hazard <='1'; 
elsif (rt_id=rt_or_rd_ex   and regWrite_ex='1')then
data_hazard <='1'; 
elsif( rs_id=rt_or_rd_mem and regWrite_mem='1')then
data_hazard <='1'; 
elsif(rt_id=rt_or_rd_mem  and regWrite_mem='1')then
data_hazard <='1';
else 
data_hazard <='0'; 
end if ;
end process;

--check for Control Hazard 
process (branch_mem,aluZero_mem,control_hazard)
begin 
if(branch_mem= '1' and  aluZero_mem='1')then
control_hazard <='1' ;
else 
control_hazard <='0'; 
end if ;
end process;







end test;