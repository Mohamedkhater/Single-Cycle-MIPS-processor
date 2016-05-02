----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:43:37 05/03/2016 
-- Design Name: 
-- Module Name:    jump_shift - Behavioral 
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

entity jump_shift is
    Port ( A : in  STD_LOGIC_VECTOR (25 downto 0);
           Y : out  STD_LOGIC_VECTOR (27 downto 0));
end jump_shift;

architecture Behavioral of jump_shift is

begin

	Y <= A & "00";

end Behavioral;

