----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:45:53 04/29/2016 
-- Design Name: 
-- Module Name:    register_file - Behavioral 
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

entity register_file is
    Port ( CLK : in  STD_LOGIC;
           A1 : in  STD_LOGIC_VECTOR (4 downto 0);
           A2 : in  STD_LOGIC_VECTOR (4 downto 0);
           A3 : in  STD_LOGIC_VECTOR (4 downto 0);
           WE3 : in  STD_LOGIC;
           WD3 : in  STD_LOGIC_VECTOR (31 downto 0);
           RD1 : out  STD_LOGIC_VECTOR (31 downto 0);
           RD2 : out  STD_LOGIC_VECTOR (31 downto 0));
end register_file;

architecture Behavioral of register_file is

	type memory is array(0 to 31) of STD_LOGIC_VECTOR(31 downto 0);
	signal registers : memory;

begin
	process(CLK)
	begin
		if ((CLK'event) and (CLK = '1')) then
			if (WE3 = '1') then
				registers(CONV_INTEGER(A3)) <= WD3;
			end if;
		end if;
	end process;
	
	process(A1, A2)
	begin
		if (CONV_INTEGER(A1) = 0) then -- $0
			RD1 <= x"0000";
		else
			RD1 <= registers(CONV_INTEGER(A1));
		end if;
			
		if (CONV_INTEGER(A2) = 0) then
			RD2 <= x"0000";
		else
			RD2 <= registers(CONV_INTEGER(A2));
		end if;
	end process;

end Behavioral;

