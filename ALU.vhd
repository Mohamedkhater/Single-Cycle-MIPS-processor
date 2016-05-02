----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:35:10 04/29/2016 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           S : in  STD_LOGIC_VECTOR (3 downto 0);
           --Y : out  STD_LOGIC_VECTOR (31 downto 0);
			  Y : buffer  STD_LOGIC_VECTOR (31 downto 0);
           Z : out  STD_LOGIC);
end ALU;

architecture Behavioral of ALU is

begin
	process(A, B, S)
	begin
	
	case S is
		when "0000" =>
			y <= a and b;
		when "0001" =>
			y <= a or b;
		when "0010" =>
			y <= not a;
		when "0011" =>
			y <= not b;
		when "0100" =>
			y <= a nand b;
		when "0101" =>
			y <= a nor b;
		when "0110" =>
			y <= a xor b;
		when "0111" =>
			y <= not(a xor b);
		when "1000" =>
			y <= a + b;
		when "1001" =>
			y <= a + 1;
		when "1010" =>
			y <= a - 1;
		when "1011" => --slt
			if a < b then
				y <= x"000" & "0001";
			else
				y <= x"0000";
			end if;
		when "1100" =>
			y <= a - b;
		when others =>
			y <= "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU";
		end case;
				
	end process;
	
	z <= "1" when ((y = STD_LOGIC_VECTOR(x"000" & "0001")) and (not(s = STD_LOGIC_VECTOR("1010")))) else
		  "0";

end Behavioral;