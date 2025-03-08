library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity Shift_Register_For_Loop is
	
	generic	(
					Reg_Width	: integer	:=	16
				);

	port 
		(
			Input					:	in		std_logic;
			Clock					:	in		std_logic;
			Parallel_Input		:	in		unsigned	(Reg_Width-1 downto 0);
			Load					:	in		std_logic;
			Reset					:	in 	std_logic;
			Output				:	out	unsigned	(Reg_Width-1 downto 0)
		);
end Shift_Register_For_Loop;

architecture Behavioral of Shift_Register_For_Loop is
	
	signal	Shift_Content	:	unsigned	(Reg_Width-1 downto 0)		:=	(others=>'0');

begin

	Output		<=		Shift_Content;
	
	process(Clock)
	begin
	
		if rising_edge(Clock) then
		
			Shift_Content(Reg_Width-1)		<=		input;
			
			for i in 0 to Reg_Width-2 loop
				Shift_Content(i)		<=		Shift_Content(i+1);
			end loop;
			
			if (Load = '1') then
				Shift_Content		<=		Parallel_Input;
			end if;

			if (Reset = '1') then
				Shift_Content		<=		(others=>'0');
			end if;
		
		end if;
	
	end process;

end Behavioral;