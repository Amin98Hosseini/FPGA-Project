library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Flip_Flop_ASynch_Reset is
    Port ( 
				D 			: in  STD_LOGIC;
				Clock		: in  STD_LOGIC;
				Reset		: in  std_logic;
				Set		: in  std_logic;
				Q 			: out std_logic
			);
end Flip_Flop_ASynch_Reset;

architecture Behavioral of Flip_Flop_ASynch_Reset is

begin

	process(Clock,Reset,Set) 
	begin
	
		--	FlipFlop definition with Asynch reset.
		if (Reset = '1') then
			Q		<=		'0';
		elsif (Set = '1') then
			Q		<=		'1';
		elsif rising_edge(Clock) then
			Q		<=		D;
		end if;
		
	end process;

end Behavioral;