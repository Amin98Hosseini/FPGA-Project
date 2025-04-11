library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity Shift_Register is

	port 
		(
			Input					:	in		std_logic;
			Clock					:	in		std_logic;
			Parallel_Input		:	in		unsigned	(7 downto 0);
			Load					:	in		std_logic;
			Reset					:	in		std_logic;
			Output				:	out	unsigned	(7 downto 0)
		);
end Shift_Register;

architecture Behavioral of Shift_Register is
	
	signal	Shift_Content	:	unsigned	(7 downto 0)		:=	(others=>'0');

begin

	Output		<=		Shift_Content;
	
	process(Clock)
	begin
	
		if rising_edge(Clock) then
		
			Shift_Content(7)		<=		input;
			Shift_Content(0)		<=		Shift_Content(1);
			Shift_Content(1)		<=		Shift_Content(2);
			Shift_Content(2)		<=		Shift_Content(3);
			Shift_Content(3)		<=		Shift_Content(4);
			Shift_Content(4)		<=		Shift_Content(5);
			Shift_Content(5)		<=		Shift_Content(6);
			Shift_Content(6)		<=		Shift_Content(7);
		
			if (Load = '1') then
				Shift_Content		<=		Parallel_Input;
			end if;
			
			if (Reset = '1') then
				Shift_Content		<=		(others=>'0');
			end if;
		
		end if;
	
	end process;

end Behavioral;