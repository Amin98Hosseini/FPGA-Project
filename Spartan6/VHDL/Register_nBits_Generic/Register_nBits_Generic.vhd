library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity Register_Generic is

	 Generic
				(
					Reg_Width:	integer	:= 8
				);
				
    Port 
				( 
					D 			: in  unsigned(Reg_Width-1 downto 0);
					Clock		: in  STD_LOGIC;
					Reset		: in  std_logic;
					Q 			: out unsigned(Reg_Width-1 downto 0)
				);


end Register_Generic;

architecture Behavioral of Register_Generic is

begin

	process(Clock) 
	begin
	
		--	FlipFlop definition with Synch reset.
	
		if rising_edge(Clock) then
		
			Q			<=		D;
			if (Reset = '1') then
				Q		<=		(others=>'0');
			end if;
		end if;
		
	end process;

end Behavioral;