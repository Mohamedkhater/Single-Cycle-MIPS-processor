----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:39:50 04/29/2016 
-- Design Name: 
-- Module Name:    instruction_memory - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity instruction_memory is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           RD : out  STD_LOGIC_VECTOR (31 downto 0));
end instruction_memory;

architecture Behavioral of instruction_memory is

	type memory is array(0 to 255) of STD_LOGIC_VECTOR(31 downto 0);
	signal myMemory : memory;

begin
	process(A)
	begin
		-- instructions shall be hardcoded here
		
		-- lw $s0, 0($t0)
		-- Given that there's an offset of 40 on $t0
		myMemory(0) <= x"8D100000"; --"10001101000100000000000000000000"
		-- lw $s1, 4($t0)
		myMemory(1) <= x"8D110004"; --"10001101000100010000000000000100"
		-- beq $s0, $s1, LABEL
		myMemory(2) <= x"12110002"; --"00010010000100010000000000000010"
		-- add $s3, $s4, $s5
		myMemory(3) <= x"02959820"; --"00000010100101011001100000100000"
		-- j EXIT
		myMemory(4) <= x"08000006"; --"00001000000000000000000000000110"
		-- LABEL: sub $s3, $s4, $s5
		myMemory(5) <= x"02959822"; --"00000010100101011001100000100010"
		-- EXIT: sw $s3, 8($t0)
		myMemory(6) <= x"AD130008"; --"10101101000100110000000000001000"
		
		RD <= myMemory(CONV_INTEGER(UNSIGNED(A)));
	end process;

end Behavioral;

