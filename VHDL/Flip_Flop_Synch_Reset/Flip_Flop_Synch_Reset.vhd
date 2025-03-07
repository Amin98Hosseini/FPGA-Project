library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Flip_Flop_Synch_Reset is
    Port ( 
				D 			: in  STD_LOGIC;
				Clock		: in  STD_LOGIC;
				Reset		: in  std_logic;
				Q 			: out std_logic
			);
end Flip_Flop_Synch_Reset;

architecture Behavioral of Flip_Flop_Synch_Reset is

begin

	process(Clock) 
	begin
	
		--	FlipFlop definition with Synch reset.
	
		if rising_edge(Clock) then
		
			Q			<=		D;
			if (Reset = '1') then
				Q		<=		'0';
			end if;
			
		end if;
		
	end process;

end Behavioral;