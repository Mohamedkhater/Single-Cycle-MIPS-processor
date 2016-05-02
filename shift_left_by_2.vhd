----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:35:58 04/29/2016 
-- Design Name: 
-- Module Name:    shift_left_by_2 - Behavioral 
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

entity shift_left_by_2 is
	 generic(size: integer := 32);
    Port ( A : in  STD_LOGIC_VECTOR (size - 1 downto 0);
           Y : out  STD_LOGIC_VECTOR (size - 1 downto 0));
end shift_left_by_2;

architecture Behavioral of shift_left_by_2 is

begin
	process(A)
	begin
		
		y <= a(size - 3 downto 0) & "00";
		
	end process;

end Behavioral;

