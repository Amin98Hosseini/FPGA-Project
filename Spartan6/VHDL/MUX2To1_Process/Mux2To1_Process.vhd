library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux2To1_Process is
    Port ( 
				w0 : in  STD_LOGIC;
				w1 : in  STD_LOGIC;
				s : in  STD_LOGIC;
				f : out  STD_LOGIC
				);
end Mux2To1_Process;

architecture Behavioral of Mux2To1_Process is

begin

	--Concurrent 
	process(w0,w1,s)
		begin
			--Seqential
			if (s='0') then
				f <= w1;

			else 
				f <= w0;
				
			end if;
	end process;


end Behavioral;

