library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity Comparator_4Bit is
    Port ( 
				a 			: in  	unsigned (3 downto 0);
				b 			: in  	unsigned (3 downto 0);
				a_eq_b 	: out  	STD_LOGIC;
				a_gt_b 	: out  	STD_LOGIC;
				a_lt_b 	: out  	STD_LOGIC
				);
end Comparator_4Bit;

architecture Behavioral of Comparator_4Bit is

begin

	a_eq_b <= '1' when a=b else '0';
	a_gt_b <= '1' when a>b else '0';
	a_lt_b <= '1' when a<b else '0';


end Behavioral;

