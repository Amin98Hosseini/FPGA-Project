library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity UpDown_Counter is

    Port ( 
				Clock 	: in  STD_LOGIC;
				Up_Down 	: in  STD_LOGIC;
				Output 	: out	unsigned (7 downto 0)
			);
			
end UpDown_Counter;

architecture Behavioral of UpDown_Counter is

	signal	Up_Down_Int				:	std_logic								:=	'0';
	signal	Output_Int				:	unsigned	(7 downto 0)				:=	(others=>'0');
		
begin

	Output							<=	Output_Int;

	process(Clock)
	begin
	
		if rising_edge(Clock) then
			
			Up_Down_Int				<=	Up_Down;	
			Output_Int				<=	Output_Int - 1;

			if (Up_Down_Int = '0') then
				
				Output_Int			<=	Output_Int + 1;
				
			end if;
					
		end if;
	
	end process;

end Behavioral;