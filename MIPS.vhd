----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:26:16 05/01/2016 
-- Design Name: 
-- Module Name:    MIPS - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MIPS is
	Port( CLK: in STD_LOGIC);
end MIPS;

architecture Behavioral of MIPS is

	component control_unit is
   Port ( OpCode : in  STD_LOGIC_VECTOR (5 downto 0);
          MemtoReg : out  STD_LOGIC;
          MemWrite : out  STD_LOGIC;
          Branch : out  STD_LOGIC;
          ALUSrc : out  STD_LOGIC;
          RegDst : out  STD_LOGIC;
          RegWrite : out  STD_LOGIC;
	      Jump: out STD_LOGIC;
		  ALUOp: out STD_LOGIC_VECTOR(2 downto 0));
	end component;
	
	component ALU is
	Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           S : in  STD_LOGIC_VECTOR (3 downto 0);
           --Y : out  STD_LOGIC_VECTOR (31 downto 0);
		   Y : buffer  STD_LOGIC_VECTOR (31 downto 0);
           Z : out  STD_LOGIC);
	end component;
	
	component ALU_control is
	Port ( Funct : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUOp : in  STD_LOGIC_VECTOR (1 downto 0);
           OutOp : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;
	
	component adder is
	Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Y : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	
	component data_memory is
	Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           WD : in  STD_LOGIC_VECTOR (31 downto 0);
           WE : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           RD : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	
	component instruction_memory is
	Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           RD : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	
	component mux_2_to_1 is
	Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           S : in  STD_LOGIC;
           Y : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	
	component register_file is
	Port ( CLK : in  STD_LOGIC;
           A1 : in  STD_LOGIC_VECTOR (4 downto 0);
           A2 : in  STD_LOGIC_VECTOR (4 downto 0);
           A3 : in  STD_LOGIC_VECTOR (4 downto 0);
           WE3 : in  STD_LOGIC;
           WD3 : in  STD_LOGIC_VECTOR (31 downto 0);
           RD1 : out  STD_LOGIC_VECTOR (31 downto 0);
           RD2 : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	
	component shift_left_by_2 is
	generic(size: integer := 32);
	Port ( A : in  STD_LOGIC_VECTOR (size - 1 downto 0);
           Y : out  STD_LOGIC_VECTOR (size - 1 downto 0));
	end component;
	
	component sign_extension is
	Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           Y : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	
	component jump_shift is
	Port( A : in STD_LOGIC_VECTOR(25 downto 0);
		  Y : out STD_LOGIC_VECTOR(27 downto 0));
	end component;
	
	component program_counter is
	Port ( in_address : in  STD_LOGIC_VECTOR (31 downto 0);
		   out_address : out  STD_LOGIC_VECTOR (31 downto 0);
		   clk : in STD_LOGIC);
	end component;
	
	component and_gate is
	Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Y : out  STD_LOGIC);
	end component;
	
	signal MemtoReg,
           MemWrite,
           Branch,
           ALUSrc,
           RegDst,
           RegWrite,
	       Jump,
		   zeroFlag,
		   branchAndGate
		   : STD_LOGIC := "0";
	
	signal instruction,
			instructionAddress,
			nextInstructionAddress,
			nextAddress,
			ALUresult,
			RD1,
			RD2,
			WD,
			immSignExtended,
			shiftSignExtended,
			ALUinput2,
			ReadData,
			shiftJumpAddress,
			PCandBranchMUX,
			PCandJumpMUX,
			concatJumpAddress,
			branchAddress,
			BranchOrPC
			: STD_LOGIC_VECTOR(31 downto 0);
			 
	signal RS,
			RT,
			RD,
			SHAMT,
			WriteReg
			: STD_LOGIC_VECTOR(4 downto 0);
			 
	signal OpCode,
			Funct
			: STD_LOGIC_VECTOR(5 downto 0);
			 
	signal ALUOp
			: STD_LOGIC_VECTOR(1 downto 0);
	
	signal ALUoutOp
			: STD_LOGIC_VECTOR(3 downto 0);
			 
	signal immediate
			: STD_LOGIC_VECTOR(15 downto 0);
	
	signal jumpAddress
			: STD_LOGIC_VECTOR(25 downto 0);
			

begin

	process(CLK)
	begin
	
		if (CLK = "1") and (CLK'event) then
			
		end if;
	
	end process;

	OpCode <= instruction(31 downto 26);
	RS <= instruction(25 downto 21);
	RT <= instruction(20 downto 16);
	RD <= instruction(15 downto 11);
	SHAMT <= instruction(10 downto 6);
	Funct <= instruction(5 downto 0);
	immediate <= instruction(15 downto 0);
	jumpAddress <= instruction(25 downto 0);
	concatJumpAddress <= nextInstructionAddress(31 downto 28) & shiftJumpAddress(27 downto 0);
	
	
	-- components - signals mapping
	Control_unit: control_unit
		port map(
			MemtoReg => MemtoReg,
			MemWrite => MemWrite,
			Branch => Branch,
			ALUSrc => ALUSrc,
			RegDst => RegDst,
			RegWrite => RegWrite,
			Jump => Jump
		);
		
	Sign_extension: sign_extension
		port map(
			A => immediate,
			Y => immSignExtended
		);
	
	Register_file: register_file
		port map(
			CLK => CLK,
			A1 => RS,
			A2 => RT,
			A3 => WriteReg,
			WE3 => RegWrite,
			WD3 => result,
			RD1 => RD1,
			RD2 => RD2
		);
	
	ALU_Control: ALU_control
		port map(
			Funct => Funct,
			ALUOp => ALUOp,
			OutOp => ALUoutOp
		);
		
	ALU: ALU
		port map(
			A => RD1,
			B => ALUinput2,
			S => ALUoutOp,
			Y => ALUresult,
			Z => zeroFlag
		);
		
	Data_memory: data_memory
		port map(
			A => instructionAddress,
			WD => WriteData,
			WE => MemWrite,
			CLK => CLK,
			RD => ReadData
		);
		
	-- ALU Src B MUX	
	MUX1: mux_2_to_1
		port map(
			A => RD2,
			B => immSignExtended,
			S => ALUSrc,
			Y => ALUinput2
		);
		
	-- ALU result or ReadData MUX
	MUX2: mux_2_to_1
		port map(
			A => ALUresult,
			B => ReadData,
			S => MemtoReg,
			Y => result
		);
		
	-- RT or RD MUX
	MUX3: mux_2_to_1
		port map(
			A => RT,
			B => RD,
			S => RegDst,
			Y => WriteReg
		);
		
	-- Jump or PC
	MUX4: mux_2_to_1
		port map(
			A => BranchOrPC,
			B => concatJumpAddress,
			S => Jump,
			Y => nextAddress
		);
		
	-- Branch or PC
	MUX5: mux_2_to_1
		port map(
			A => nextInstructionAddress,
			B => branchAddress,
			S => branchAndGate,
			Y => BranchOrPC
		);
		
	Shifter1: shift_left_by_2
		port map(
			A => immSignExtended,
			Y => shiftSignExtended
		);
		
	Shifter2: jump_shift
		port map(
			A => jumpAddress,
			Y => shiftJumpAddress
		);
		
	Adder1: adder
		port map(
			A => shiftSignExtended,
			B => nextInstructionAddress,
			Y => branchAddress
		);
		
	Adder2: adder
		port map(
			A => instructionAddress,
			B => "00000000000000000000000000000100",
			Y => nextInstructionAddress
		);
		
	PC: program_counter
		port map(
			in_address => nextAddress,
			out_address => instructionAddress,
			clk => CLK
		);
	
	ANDgate: and_gate
		port map(
			A => Branch,
			B => zeroFlag,
			Y => branchAndGate
		);
		
	instructionMemory: instruction_memory
		port map(
			A => instructionAddress,
			RD => instruction
		);
		
end Behavioral;

