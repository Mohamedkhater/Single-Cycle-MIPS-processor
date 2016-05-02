----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:05:19 04/30/2016 
-- Design Name: 
-- Module Name:    ALU_control - Behavioral 
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

entity ALU_control is
    Port ( Funct : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUOp : in  STD_LOGIC_VECTOR (1 downto 0);
           OutOp : out  STD_LOGIC_VECTOR (3 downto 0));
end ALU_control;

architecture Behavioral of ALU_control is

begin
	process(ALUOp) is
	begin
		
		case ALUOp is
			when "00" => -- add
				OutOp <= "1000";
			when "01" => -- subtract
				OutOp <= "1100";
			when "10" => -- funct
				case Funct is
					when "100000" => -- add
						OutOp <= "1000";
					when "100010" => -- subtract
						OutOp <= "1100";
					when "100100" => -- and
						OutOp <= "0000";
					when "100101" => -- or
						OutOp <= "0001";
					when "101010" => -- slt
						OutOp <= "1011";
					when others =>
						OutOp <= "UUUU";
				end case;
			when others =>
				OutOp <= "UUUU";
			
		end case;
	end process;

end Behavioral;

