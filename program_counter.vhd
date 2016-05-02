----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:27:18 04/29/2016 
-- Design Name: 
-- Module Name:    program_counter - Behavioral 
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

entity program_counter is
    Port ( in_address : in  STD_LOGIC_VECTOR (31 downto 0);
           out_address : out  STD_LOGIC_VECTOR (31 downto 0);
			  clk : in STD_LOGIC);
end program_counter;

architecture Behavioral of program_counter is

begin

	--process(clk)
	--begin
	
		--if (clk = "1") and (clk'event) then
			out_address <= in_address;
		--end if;
	
	--end process;

end Behavioral;

