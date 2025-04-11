library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity Up_Down_Counter is

		port (
					Clock			:	in		std_logic;
					Reset			:	in		std_logic;
					Up_Down		:	in		std_logic;
					Counter_Out	:	out	unsigned (3 downto 0)
				);

end Up_Down_Counter;

architecture Behavioral of Up_Down_Counter is

	signal	Counter_Out_Int		:	unsigned	(3 downto 0)		:=	(others=>'0');

begin

	Counter_Out						<=		Counter_Out_Int;

	process(Clock)
	begin
	
		if rising_edge(Clock) then
			
			-- Up_Down = 0 => Up counter, Up_Down = 1 => Down counter.
			Counter_Out_Int			<=		Counter_Out_Int - 1;
			if (Up_Down = '0') then
				Counter_Out_Int		<=		Counter_Out_Int + 1;
			end if;
						
			if (Reset = '1') then
				Counter_Out_Int		<=		(others=>'0');
			end if;
			
		end if;
	
	end process;

end Behavioral;