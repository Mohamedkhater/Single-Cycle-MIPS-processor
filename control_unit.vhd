----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:42:16 04/29/2016 
-- Design Name: 
-- Module Name:    control_unit - Behavioral 
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

entity control_unit is
    Port ( OpCode : in  STD_LOGIC_VECTOR (5 downto 0);
           MemtoReg : out  STD_LOGIC;
           MemWrite : out  STD_LOGIC;
           Branch : out  STD_LOGIC;
           ALUSrc : out  STD_LOGIC;
           RegDst : out  STD_LOGIC;
           RegWrite : out  STD_LOGIC;
			  Jump: out STD_LOGIC;
			  ALUOp: out STD_LOGIC_VECTOR(2 downto 0));
end control_unit;

architecture Behavioral of control_unit is

begin
	process(OpCode) is
	begin
	
		case OpCode is
			when "000000" => -- R type
				MemtoReg <= "0";
				MemWrite <= "0";
				Branch <= "0";
				ALUSrc <= "0";
				RegDst <= "1";
				RegWrite <= "1";
				Jump <= "0";
				ALUOp(1 downto 0) <= "10";
				
			when "100011" => -- lw
				MemtoReg <= "1";
				MemWrite <= "0";
				Branch <= "0";
				ALUSrc <= "1";
				RegDst <= "0";
				RegWrite <= "1";
				Jump <= "0";
				ALUOp(1 downto 0) <= "00";
				
			when "101011" => -- sw
				MemtoReg <= "U";
				MemWrite <= "1";
				Branch <= "0";
				ALUSrc <= "1";
				RegDst <= "U";
				RegWrite <= "0";
				Jump <= "0";
				ALUOp(1 downto 0) <= "00";
				
			when "000100" => -- beq
				MemtoReg <= "U";
				MemWrite <= "0";
				Branch <= "1";
				ALUSrc <= "0";
				RegDst <= "U";
				RegWrite <= "0";
				Jump <= "0";
				ALUOp(1 downto 0) <= "01";
				
			when "001000" => -- addi
				MemtoReg <= "0";
				MemWrite <= "0";
				Branch <= "0";
				ALUSrc <= "1";
				RegDst <= "0";
				RegWrite <= "1";
				Jump <= "0";
				ALUOp(1 downto 0) <= "00";
				
			when "000010" => -- j
				MemtoReg <= "U";
				MemWrite <= "0";
				Branch <= "U";
				ALUSrc <= "U";
				RegDst <= "U";
				RegWrite <= "0";
				Jump <= "1";
				ALUOp(1 downto 0) <= "UU";
		end case;
		
	end process;

end Behavioral;

