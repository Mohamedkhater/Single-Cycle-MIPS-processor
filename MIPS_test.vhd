-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  --USE ieee.numeric_std.ALL;
  USE ieee.std_logic_arith.ALL;

  ENTITY testbench IS
  END testbench;

  ARCHITECTURE behavior OF testbench IS 

  -- Component Declaration
  COMPONENT MIPS
  PORT(
		CLK : IN std_logic;
      RESET : IN std_logic;       
      RESULT : INOUT std_logic_vector(31 downto 0);
		ALUresult: buffer STD_LOGIC_VECTOR(31 downto 0);
		RD2: inout STD_LOGIC_VECTOR(31 downto 0);
		MemWrite: inout STD_LOGIC
  );
  END COMPONENT;
  
  -- Inputs
  SIGNAL CLK :  std_logic := '0';
  SIGNAL RESET :  std_logic := '0';
  
  -- Outputs
  SIGNAL RESULT : std_logic_vector(31 downto 0);
  SIGNAL ALUresult : std_logic_vector(31 downto 0);
  SIGNAL RD2 : std_logic_vector(31 downto 0);
  SIGNAL MemWrite : std_logic := '0';


  BEGIN

	  -- Component Instantiation
	  uut: MIPS PORT MAP(
			CLK => CLK,
			RESET => RESET,
			RESULT => RESULT,
			ALUresult => ALUresult,
			RD2 => RD2,
			MemWrite => MemWrite
	  );

	  PROCESS
	  BEGIN
			clk <= '1';
			wait for 5 ns;
			clk <= '0';
			wait for 5 ns;   
	  END PROCESS;
	  
	  PROCESS
	  BEGIN
			reset <= '1';
			wait for 20 ns;
			reset <= '0';
			wait;
	  END PROCESS;
	  
	  PROCESS(CLK)
	  BEGIN
		  if (clk'event) and (clk = '0') and (memwrite = '1') then
				if (CONV_INTEGER(UNSIGNED(ALUresult)) = 84 and CONV_INTEGER(UNSIGNED(RD2)) = 7) then
					report "Simulation succeeded";	
				end if;
			end if;
		END PROCESS;
		
  END;
