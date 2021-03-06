----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:15:03 04/29/2016 
-- Design Name: 
-- Module Name:    mux_2_to_1 - Behavioral 
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

entity mux_2_to_1 is
	 generic(size: integer := 32);
    Port ( A : in  STD_LOGIC_VECTOR (size - 1 downto 0);
           B : in  STD_LOGIC_VECTOR (size - 1 downto 0);
           S : in  STD_LOGIC;
           Y : out  STD_LOGIC_VECTOR (size - 1 downto 0));
end mux_2_to_1;

architecture Behavioral of mux_2_to_1 is

begin

	y <= a when(s = '0') else
		  b;

end Behavioral;

