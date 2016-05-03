----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:20:28 04/29/2016 
-- Design Name: 
-- Module Name:    data_memory - Behavioral 
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

entity data_memory is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           WD : in  STD_LOGIC_VECTOR (31 downto 0);
           WE : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           RD : out  STD_LOGIC_VECTOR (31 downto 0));
end data_memory;

architecture Behavioral of data_memory is

	type memory is array(0 to 63) of STD_LOGIC_VECTOR(31 downto 0);
	signal myMemory: memory := (
		 X"00000005", -- initialize data memory
		 X"00000000", -- mem 1
		 X"00000000",
		 X"00000000",
		 X"00000004",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000", 
		 X"00000000", -- mem 10 
		 X"00000000", 
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",  
		 X"00000000", -- mem 20
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000", 
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000", 
		 X"00000000", -- mem 30
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000",
		 X"00000000"		 
	);

begin
	process(CLK)
	begin
		
		if (clk'event) and (clk = '1') then
			if (WE = '1') then
				myMemory(CONV_INTEGER(UNSIGNED(A))) <= WD;
			end if;
		end if;
		
		RD <= myMemory(CONV_INTEGER(UNSIGNED(A)));
		
	end process;

end Behavioral;

