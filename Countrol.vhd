LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY Controller IS
	PORT (
		opcode        : IN std_logic_vector(5 DOWNTO 0); -- instruction 31-26
		fun           : in STD_LOGIC_VECTOR(5 downto 0); -- instruction 5-0
		regDst        : OUT STD_LOGIC_VECTOR (1 DOWNTO 0); 
		jump          : OUT std_logic;
		branch        : OUT std_logic;
		memRead       : OUT std_logic;
		memToRegister : OUT std_logic;
		ALUop         : OUT std_logic_vector( 3 DOWNTO 0);                                            
		memWrite      : OUT std_logic;                                                             
		ALUsrc        : OUT std_logic_vector(2 DOWNTO 0);                                          
		regWrite      : OUT std_logic ;
        	jump_and_link_reg      : OUT std_logic      ;
       		jump_reg           : OUT std_logic     ;  
        	jump_link          : OUT std_logic     ; 
       		branch_not_equal   : OUT std_logic     ; 
       		branch_less_than_or_equal   : OUT std_logic     ;  		
		branch_greater_than   : OUT std_logic     ;  
		sign            : OUT std_logic  ;
      		un_signed       : OUT std_logic ; 
       		 regRead     : OUT std_logic 

                                                                                   		
	);
END Controller;
ARCHITECTURE Behavioral OF Controller IS
BEGIN                                                                                             
	PROCESS (opcode , fun)                                                                        
	BEGIN
	                                                                                        
		CASE opcode IS     
		------------------- R_TYPE INSTRUCTIONS------------------------                       
			WHEN "000000" => case fun is
			
         		when "100000" =>    -- add                                                                            
				regDst        <= "01";                                                         
				jump          <= '0';
				branch        <= '0';
				memRead       <= '0';
				memToRegister <= '0';
				ALUop         <= "1000";
				memWrite      <= '0';
				ALUsrc        <= "000";
				regWrite      <= '1';
				jump_and_link_reg    <= '0' ;
				jump_reg     <= '0';
				jump_link    <= '0';
				branch_not_equal  <= '0'   ; 
                branch_less_than_or_equal  <= '0'   ;  		
		        branch_greater_than   <= '0'   ; 
              	sign <= '1'  ;
                un_signed <= '0'  ;	
				regRead<= '1' ;
				 
             WHEN "100010" => --  sub 
				regDst        <= "01";  
				jump          <= '0';
				branch        <= '0';
				memRead       <= '0';
				memToRegister <= '0';
				ALUop         <= "1000";
				memWrite      <= '0';
				ALUsrc        <= "000";
				regWrite      <= '1';
				jump_and_link_reg       <= '0' ;
				jump_reg     <= '0';
				jump_link    <= '0';
				branch_not_equal  <= '0'   ; 
                branch_less_than_or_equal  <= '0'   ;  		
		        branch_greater_than   <= '0'   ;  
				sign <= '1'  ;
                un_signed <= '0'  ;
				regRead<= '1' ;
				
             WHEN  "101010" => --  slt 
				regDst        <= "01";  
				jump          <= '0';
				branch        <= '0';
				memRead       <= '0';
				memToRegister <= '0';
				ALUop         <= "1000";
				memWrite      <= '0';
				ALUsrc        <= "000";
				regWrite      <= '1';
				jump_and_link_reg       <= '0' ;
				jump_reg     <= '0';
				jump_link    <= '0';
				branch_not_equal  <= '0'   ; 
                branch_less_than_or_equal  <= '0'   ;  		
		        branch_greater_than   <= '0'   ; 
           		sign <= '1'  ;
                un_signed <= '0'  ;
				regRead<= '1' ;
				
				  WHEN "101011" => --  sltu 
				regDst        <= "01";  
				jump          <= '0';
				branch        <= '0';
				memRead       <= '0';
				memToRegister <= '0';
				ALUop         <= "1000";
				memWrite      <= '0';
				ALUsrc        <= "000";
				regWrite      <= '1';
				jump_and_link_reg       <= '0' ;
				jump_reg     <= '0';
				jump_link    <= '0';
				branch_not_equal  <= '0'   ; 
                branch_less_than_or_equal  <= '0'   ;  		
		        branch_greater_than   <= '0'   ; 
                sign <= '0'  ;
                un_signed <= '1'  ;	
                regRead<= '1' ;				
				
				  WHEN "100100" => --  And 
				regDst        <= "01";  
				jump          <= '0';
				branch        <= '0';
				memRead       <= '0';
				memToRegister <= '0';
				ALUop         <= "1000";
				memWrite      <= '0';
				ALUsrc        <= "000";
				regWrite      <= '1';
				jump_and_link_reg       <= '0' ;
				jump_reg     <= '0';
				jump_link    <= '0';
				branch_not_equal  <= '0'   ; 
                branch_less_than_or_equal  <= '0'   ;  		
		        branch_greater_than   <= '0'   ;  
				sign <= '1'  ;
                un_signed <= '0'  ;		
				regRead<= '1' ;
			
				  WHEN "100101" => --  OR
				regDst        <= "01";  
				jump          <= '0';
				branch        <= '0';
				memRead       <= '0';
				memToRegister <= '0';
				ALUop         <= "1000";
				memWrite      <= '0';
				ALUsrc        <= "000";
				regWrite      <= '1';
				jump_and_link_reg       <= '0' ;
				jump_reg     <= '0';
				jump_link    <= '0';
				branch_not_equal  <= '0'   ; 
                branch_less_than_or_equal  <= '0'   ;  		
		        branch_greater_than   <= '0'   ;  
				 sign <= '1'   ;
                un_signed <= '0'	;
				regRead<= '1' ;
				
				  WHEN "100110" => --  -OR

				regDst        <= "01";  
				jump          <= '0';
				branch        <= '0';
				memRead       <= '0';
				memToRegister <= '0';
				ALUop         <= "1000";
				memWrite      <= '0';
				ALUsrc        <= "000";
				regWrite      <= '1';
				jump_and_link_reg       <= '0' ;
				jump_reg     <= '0';
				jump_link    <= '0';
				branch_not_equal  <= '0'   ; 
                branch_less_than_or_equal  <= '0'   ;  		
		        branch_greater_than   <= '0'   ;
                sign <= '1' ;
                un_signed <= '0'	;		
                regRead<= '1' ;				
				
				  WHEN "100111" => --  NoR

				regDst        <= "01";  
				jump          <= '0';
				branch        <= '0';
				memRead       <= '0';
				memToRegister <= '0';
				ALUop         <= "1000";
				memWrite      <= '0';
				ALUsrc        <= "000";
				regWrite      <= '1';
				jump_and_link_reg       <= '0' ;
				jump_reg     <= '0';
				jump_link    <= '0';
				branch_not_equal  <= '0'   ; 
                branch_less_than_or_equal  <= '0'   ;  		
		        branch_greater_than   <= '0'   ;
                 sign <= '1'   ;
                un_signed <= '0'  ;		
                regRead<= '1' ;				
				
				when "100001" =>  -- add unsigned
				
				regDst        <= "01";  
				jump          <= '0';
				branch        <= '0';
				memRead       <= '0';
				memToRegister <= '0';
				ALUop         <= "1000";
				memWrite      <= '0';
				ALUsrc        <= "000";
				regWrite      <= '1';
				jump_and_link_reg       <= '0' ;
				jump_reg     <= '0';
				jump_link    <= '0';
				branch_not_equal  <= '0'   ; 
                branch_less_than_or_equal  <= '0'   ;  		
		        branch_greater_than   <= '0'   ; 
                 sign <= '0'  ;
                un_signed <= '1'  ;		
                regRead<= '1' ;				
				
				
				when "100011" =>  -- sub unsigned
				
				regDst        <= "01";  
				jump          <= '0';
				branch        <= '0';
				memRead       <= '0';
				memToRegister <= '0';
				ALUop         <= "1000";
				memWrite      <= '0';
				ALUsrc        <= "000";
				regWrite      <= '1';
				jump_and_link_reg       <= '0' ;
				jump_reg     <= '0';
				jump_link    <= '0';
				branch_not_equal  <= '0'   ; 
                branch_less_than_or_equal  <= '0'   ;  		
		        branch_greater_than   <= '0'   ; 
                sign <= '0'  ;
                un_signed <= '1'	;	
                regRead<= '1' ;				
				
				when "000000" =>  -- shift left logical
				regDst        <= "01";  
				jump          <= '0';
				branch        <= '0';
				memRead       <= '0';
				memToRegister <= '0';
				ALUop         <= "1000";
				memWrite      <= '0';
				ALUsrc        <= "000";
				regWrite      <= '1';
				jump_and_link_reg       <= '0' ;
				jump_reg     <= '0';
				jump_link    <= '0';
				branch_not_equal  <= '0'   ; 
                		branch_less_than_or_equal  <= '0'   ;  		
		    		 branch_greater_than   <= '0'   ;  
				sign <= '-' ;
                		un_signed <= '-' ;
				regRead<= '1' ;
				
				when "000010" =>  -- shift Right logical
				regDst        <= "01";  
				jump          <= '0';
				branch        <= '0';
				memRead       <= '0';
				memToRegister <= '0';
				ALUop         <= "1000";
				memWrite      <= '0';
				ALUsrc        <= "000";
				regWrite      <= '1';
				jump_and_link_reg       <= '0' ;
				jump_reg     <= '0';
				jump_link    <= '0';
				branch_not_equal  <= '0'   ; 
                branch_less_than_or_equal  <= '0'   ;  		
		        branch_greater_than   <= '0'   ;  
				sign <= '-' ;
                un_signed <= '-';
				regRead<= '1' ;
				
				when "000011" =>  -- shift Right Arithmatic sra
				regDst        <= "01";  
				jump          <= '0';
				branch        <= '0';
				memRead       <= '0';
				memToRegister <= '0';
				ALUop         <= "1000";
				memWrite      <= '0';
				ALUsrc        <= "000";
				regWrite      <= '1';
				jump_and_link_reg       <= '0' ;
				jump_reg     <= '0';
				jump_link    <= '0';
				branch_not_equal  <= '0'   ; 
                branch_less_than_or_equal  <= '0'   ;  		
		        branch_greater_than   <= '0'   ;  
				sign <= '-' ;
                un_signed <= '-';
				regRead<= '1' ; 
				
				when "000100" =>  -- shift left logical variable
				regDst        <= "01";  
				jump          <= '0';
				branch        <= '0';
				memRead       <= '0';
				memToRegister <= '0';
				ALUop         <= "1000";
				memWrite      <= '0';
				ALUsrc        <= "000";
				regWrite      <= '1';
				jump_and_link_reg       <= '0' ;
				jump_reg     <= '0';
				jump_link    <= '0';
				branch_not_equal  <= '0'   ; 
                branch_less_than_or_equal  <= '0'   ;  		
		        branch_greater_than   <= '0'   ;  
				sign <= '-' ;
                un_signed <= '-';
				regRead<= '1' ; 
				
					when "000110" =>  -- shift Right logical variable
				regDst        <= "01";  
				jump          <= '0';
				branch        <= '0';
				memRead       <= '0';
				memToRegister <= '0';
				ALUop         <= "1000";
				memWrite      <= '0';
				ALUsrc        <= "000";
				regWrite      <= '1';
				jump_and_link_reg       <= '0' ;
				jump_reg     <= '0';
				branch_not_equal  <= '0'   ; 
                branch_less_than_or_equal  <= '0'   ;  		
		        branch_greater_than   <= '0'   ;  
				sign <= '-' ;
                un_signed <= '-';
				regRead<= '1' ;
				
					when "000111" =>  -- shift Right Arithmatic variable
				regDst        <= "01";  
				jump          <= '0';
				branch        <= '0';
				memRead       <= '0';
				memToRegister <= '0';
				ALUop         <= "1000";
				memWrite      <= '0';
				ALUsrc        <= "000";
				regWrite      <= '1';
				jump_and_link_reg       <= '0' ;
				jump_reg     <= '0';
				jump_link    <= '0';
				branch_not_equal  <= '0'   ; 
                branch_less_than_or_equal  <= '0'   ;  		
		        branch_greater_than   <= '0'   ;  
				sign <= '-' ;
                un_signed <= '-';
				regRead<= '1' ;
				
					when "001000" =>  -- jump Register JR 
				regDst        <= "--";
				jump          <= '0';
				branch        <= '0';
				memRead       <= '0';
				memToRegister <= '-';
				ALUop         <= "1000";
				memWrite      <= '0';
				ALUsrc        <= "---";
				regWrite      <= '0';
				jump_and_link_reg       <= '0' ;
				jump_reg     <= '1';
				jump_link    <= '0';
				branch_not_equal  <= '0'   ; 
                branch_less_than_or_equal  <= '0'   ;  		
		        branch_greater_than   <= '0'   ; 
                sign <= '-' ;
                un_signed <= '-';	
                regRead<= '1' ;				

				
                WHEN "001001" => --  JALR      
				regDst        <= "10";
				jump          <= '1';
				branch        <= '0';
				memRead       <= '0';
				memToRegister <= '-';
				ALUop         <= "1000";
				memWrite      <= '0';
				ALUsrc        <= "---";
				regWrite      <= '1';
				jump_and_link_reg       <= '1' ;
				jump_reg     <= '0';
				jump_link    <= '0';
				branch_not_equal  <= '0'   ; 
                branch_less_than_or_equal  <= '0'   ;  		
		        branch_greater_than   <= '0'   ;  
				sign <= '-' ;
                un_signed <= '-';
				regRead<= '1' ;
			
				
					when "011000" =>  -- multiply
				regDst        <= "01";  
				jump          <= '0';
				branch        <= '0';
				memRead       <= '0';
				memToRegister <= '0';
				ALUop         <= "1000";
				memWrite      <= '0';
				ALUsrc        <= "000";
				regWrite      <= '1';
				jump_and_link_reg       <= '0' ;
				jump_reg     <= '0';
				jump_link    <= '0';
				branch_not_equal  <= '0'   ; 
                branch_less_than_or_equal  <= '0'   ;  		
		        branch_greater_than   <= '0'   ;  
				sign <= '-' ;
                un_signed <= '-';
				regRead<= '1' ;
				
					when"011001" =>  -- multiply unsigned
				regDst        <= "01";  
				jump          <= '0';
				branch        <= '0';
				memRead       <= '0';
				memToRegister <= '0';
				ALUop         <= "1000";
				memWrite      <= '0';
				ALUsrc        <= "000";
				regWrite      <= '1';
				jump_and_link_reg       <= '0' ;
				jump_reg     <= '0';
				jump_link    <= '0';
				branch_not_equal  <= '0'   ; 
                branch_less_than_or_equal  <= '0'   ;  		
		        branch_greater_than   <= '0'   ;  
				sign <= '-' ;
                un_signed <= '-';
				regRead<= '1' ;
				
					when "011010" =>  -- divide
				regDst        <= "01";  
				jump          <= '0';
				branch        <= '0';
				memRead       <= '0';
				memToRegister <= '0';
				ALUop         <= "1000";
				memWrite      <= '0';
				ALUsrc        <= "000";
				regWrite      <= '1';
				jump_and_link_reg       <= '0' ;
				jump_reg     <= '0';
				jump_link    <= '0';
				branch_not_equal  <= '0'   ; 
                branch_less_than_or_equal  <= '0'   ;  		
		        branch_greater_than   <= '0'   ; 
                sign <= '-' ;
                un_signed <= '-';				
				regRead<= '1' ; 
				
					when "011011" =>  -- divide unsigned
				regDst        <= "01";  
				jump          <= '0';
				branch        <= '0';
				memRead       <= '0';
				memToRegister <= '0';
				ALUop         <= "1000";
				memWrite      <= '0';
				ALUsrc        <= "000";
				regWrite      <= '1';
				jump_and_link_reg       <= '0' ;
				jump_reg     <= '0';
				jump_link    <= '0';
				branch_not_equal  <= '0'   ; 
                branch_less_than_or_equal  <= '0'   ;  		
		        branch_greater_than   <= '0'   ;
                sign <= '-' ;
                un_signed <= '-';	
                regRead<= '1' ;				
		when others => Null ;
	        end case ; 
				 ---------------- I-TYPE INSTRUCTIONS -------------
        
                WHEN "001000" => --  ADDI 
				regDst        <= "00";
				jump          <= '0';
				branch        <= '0';
				memRead       <= '0';
				memToRegister <= '0';
				ALUop         <= "0000";
				memWrite      <= '0';
				ALUsrc        <= "010";
				regWrite      <= '1';
				jump_and_link_reg       <= '0' ;
				jump_reg     <= '0';
				jump_link    <= '0';
				branch_not_equal  <= '0'   ; 
                branch_less_than_or_equal  <= '0'   ;  		
		        branch_greater_than   <= '0'   ;  
                sign <= '-' ;
                un_signed <= '-';
				regRead<= '1' ;
				
                WHEN "001010" => --  SLTI 
				regDst        <= "00";
				jump          <= '0';
				branch        <= '0';
				memRead       <= '0';
				memToRegister <= '0';
				ALUop         <= "0011";  
				memWrite      <= '0';
				ALUsrc        <= "010" ;
				regWrite      <= '1';
				jump_and_link_reg       <= '0' ;
				jump_reg     <= '0';
				jump_link    <= '0';
				branch_not_equal  <= '0'   ; 
                branch_less_than_or_equal  <= '0'   ;  		
		        branch_greater_than   <= '0'   ;  
                sign <= '-' ;
                un_signed <= '-';
				regRead<= '1' ;
				
                WHEN "001011" => --  SLTIU 
				regDst        <= "00";
				jump          <= '0';
				branch        <= '0';
				memRead       <= '0';
				memToRegister <= '0';
				ALUop         <= "0101";
				memWrite      <= '0';
				ALUsrc        <= "010";
				regWrite      <= '1';
				jump_and_link_reg       <= '0' ;
				jump_reg     <= '0';
				jump_link    <= '0';
				branch_not_equal  <= '0'   ; 
                branch_less_than_or_equal  <= '0'   ;  		
		        branch_greater_than   <= '0'   ;  
                sign <= '-' ;
                un_signed <= '-';
				regRead<= '1' ;
				
                WHEN "001100" => --  ANDI 
				regDst        <= "00";
				jump          <= '0';
				branch        <= '0';
				memRead       <= '0';
				memToRegister <= '0';
				ALUop         <= "1010";
				memWrite      <= '0';
				ALUsrc        <= "010";
				regWrite      <= '1';
				jump_and_link_reg       <= '0' ;
				jump_reg     <= '0';
				jump_link    <= '0';
				branch_not_equal  <= '0'   ; 
                branch_less_than_or_equal  <= '0'   ;  		
		        branch_greater_than   <= '0'   ;  
                sign <= '-' ;
                un_signed <= '-';
				regRead<= '1' ;
				
                WHEN "001101" => --  ORI 
				regDst        <= "00";
				jump          <= '0';
				branch        <= '0';
				memRead       <= '0';
				memToRegister <= '0';
				ALUop         <= "0010";
				memWrite      <= '0';
				ALUsrc        <= "010";
				regWrite      <= '1';
				jump_and_link_reg       <= '0' ;
				jump_reg     <= '0';
				jump_link    <= '0';
				branch_not_equal  <= '0'   ; 
                branch_less_than_or_equal  <= '0'   ;  		
		        branch_greater_than   <= '0'   ;  
                sign <= '-' ;
                un_signed <= '-';
				regRead<= '1' ;
				
                WHEN "001110" => --  -ORI 
				regDst        <= "00";
				jump          <= '0';
				branch        <= '0';
				memRead       <= '0';
				memToRegister <= '0';
				ALUop         <= "0100";
				memWrite      <= '0';
				ALUsrc        <= "010";
				regWrite      <= '1';
				jump_and_link_reg       <= '0' ;
				jump_reg     <= '0';
				jump_link    <= '0';
				branch_not_equal  <= '0'   ; 
                branch_less_than_or_equal  <= '0'   ;  		
		        branch_greater_than   <= '0'   ;  
                sign <= '-' ;
                un_signed <= '-';
				regRead<= '1' ;
                
                WHEN "001111" => --  LUI 
				regDst        <= "10";
				jump          <= '0';
				branch        <= '0';
				memRead       <= '1';
				memToRegister <= '1';
				ALUop         <= "0000";
				memWrite      <= '0';
				ALUsrc        <= "010";
				regWrite      <= '1';
				jump_and_link_reg       <= '0' ;
				jump_reg     <= '0';
				jump_link    <= '0';
				branch_not_equal  <= '0'   ; 
                branch_less_than_or_equal  <= '0'   ;  		
		        branch_greater_than   <= '0'   ;  
                sign <= '-' ;
                un_signed <= '-';
				regRead<= '1' ;
				
                WHEN "100011" => --  LW 
				regDst        <= "00";
				jump          <= '0';
				branch        <= '0';
				memRead       <= '1';
				memToRegister <= '1';
				ALUop         <= "0000";
				memWrite      <= '0';
				ALUsrc        <= "010";
				regWrite      <= '1';
				jump_and_link_reg       <= '0' ;
				jump_reg     <= '0';
				jump_link    <= '0';
                branch_not_equal  <= '0'   ; 
                branch_less_than_or_equal  <= '0'   ;  		
		        branch_greater_than   <= '0'   ;  
				sign <= '-' ;
                un_signed <= '-';
				regRead<= '1' ;
				
                WHEN "101011" => --  SW 
				regDst        <= "--";
				jump          <= '0';
				branch        <= '0';
				memRead       <= '0';
				memToRegister <= '-';
				ALUop         <= "0000";
				memWrite      <= '1';
				ALUsrc        <= "010";
				regWrite      <= '0';
				jump_and_link_reg       <= '0' ;
				jump_reg     <= '0';
				jump_link    <= '0';
				branch_not_equal  <= '0'   ; 
                branch_less_than_or_equal  <= '0'   ;  		
		        branch_greater_than   <= '0'   ;  
				sign <= '-' ;
                un_signed <= '-';
				regRead<= '1' ;
            -----------------------------------------------------------------------------------------
            
         ------------  BRANCHES INSTRUCTIONS ---------------
            
           
                WHEN "000100" => --  BEQ  
				regDst        <= "--";
				jump          <= '0';
				branch        <= '1';
				memRead       <= '0';
				memToRegister <= '-';
				ALUop         <= "0001";
				memWrite      <= '0';
				ALUsrc        <= "000";
				regWrite      <= '0';
				jump_and_link_reg       <= '0' ;
				jump_reg     <= '0';
				jump_link    <= '0';
				branch_not_equal  <= '0'   ; 
                branch_less_than_or_equal  <= '0'   ;  		
		        branch_greater_than   <= '0'   ; 
                sign <= '-' ;
                un_signed <= '-';	
                regRead<= '1' ;				
				
                
                WHEN "000101" => --  BNE  
				regDst        <= "--";
				jump          <= '0';
				branch        <= '0';
				memRead       <= '0';
				memToRegister <= '-';
				ALUop         <= "1001";
				memWrite      <= '0';
				ALUsrc        <= "000";
				regWrite      <= '0';
				jump_and_link_reg       <= '0' ;
				jump_reg     <= '0';
				jump_link    <= '0';
				branch_not_equal  <= '1'   ; 
                branch_less_than_or_equal  <= '0'   ;  		
		        branch_greater_than   <= '0'   ; 
				sign <= '-' ;
                un_signed <= '-';
				regRead<= '1' ;	
                
                WHEN "000110" => --  BLEZ  
				regDst        <= "--";
				jump          <= '0';
				branch        <= '0';
				memRead       <= '0';
				memToRegister <= '-';
				ALUop         <="0111";
				memWrite      <= '0';
				ALUsrc        <= "000";
				regWrite      <= '0';
				jump_and_link_reg       <= '0' ;
				jump_reg     <= '0';
				jump_link    <= '0';
				branch_not_equal  <= '0'   ; 
                branch_less_than_or_equal  <= '1'   ;  		
		        branch_greater_than   <= '0'   ; 
                sign <= '-' ;
                un_signed <= '-';
				regRead<= '1' ;	
  
                
                WHEN "000111" => -- BGTZ  
				regDst        <= "--";
				jump          <= '0';
				branch        <= '0';
				memRead       <= '0';
				memToRegister <= '-';
				ALUop         <= "1011";
				memWrite      <= '0';
				ALUsrc        <= "000";
				regWrite      <= '0';
                jump_and_link_reg       <= '0' ;
				jump_reg     <= '0';
				jump_link    <= '0';
				branch_not_equal  <= '0'   ; 
                branch_less_than_or_equal  <= '0'   ;  		
		        branch_greater_than   <= '1'   ; 
				sign <= '-' ;
                un_signed <= '-';
				regRead<= '1' ;	
           --------------------------------------------------------------------------------------
           
       ------------  JUMP INSTRUCTIONS ---------------
                     
                WHEN "000010" => --  J 
				regDst        <= "--";
				jump          <= '1';
				branch        <= '0';
				memRead       <= '0';
				memToRegister <= '-';
				ALUop         <= "----";
				memWrite      <= '0';
				ALUsrc        <= "---";
				regWrite      <= '0';
				jump_and_link_reg       <= '0' ;
				jump_reg     <= '0';
				jump_link    <= '0';
				branch_not_equal  <= '0'   ; 
                branch_less_than_or_equal  <= '0'   ;  		
		        branch_greater_than   <= '0'   ; 
				sign <= '-' ;
                un_signed <= '-';
				regRead<= '0' ;	
             
                WHEN "000011" => --  JAL 
				regDst        <= "10";
				jump          <= '1';
				branch        <= '0';
				memRead       <= '0';
				memToRegister <= '-';
				ALUop         <= "----";
				memWrite      <= '0';
				ALUsrc        <= "---";
				regWrite      <= '1';
				jump_and_link_reg       <= '0' ;
				jump_reg     <= '0';
				jump_link    <= '1';
				branch_not_equal  <= '0'   ; 
                branch_less_than_or_equal  <= '0'   ;  		
		        branch_greater_than   <= '0'   ; 
                sign <= '-' ;
                un_signed <= '-';
				regRead<= '0' ;	

		when others => Null ;
	        end case ; 
	END PROCESS;
END Behavioral;