library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity Encoder is
    Port ( 
				w : in  unsigned (3 downto 0);
				y : out  unsigned (1 downto 0)
			  );
end Encoder;

architecture Behavioral of Encoder is

begin

	y <=  "11" when w(3)='1' else
			"10" when w(2)='1' else
			"01" when w(1)='1' else
			"00";


end Behavioral;

