library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX4To1_Process is
    Port ( 
				w0 : in  STD_LOGIC;
				w1 : in  STD_LOGIC;
				w2 : in  STD_LOGIC;
				w3 : in  STD_LOGIC;
				s : in  STD_LOGIC_VECTOR (1 downto 0);
				f : out  STD_LOGIC
				);
end MUX4To1_Process;

architecture Behavioral of MUX4To1_Process is

begin

	--Concurrent
	process(w0,w1,w2,w3,s)
		begin
			--Seqential
			if (s = "00") then
				f <= w0;
			elsif (s = "01") then
				f <= w1;
			elsif (s = "10") then
				f <= w2;
			else 
				f <= w3;
			end if;
	
	end process;

end Behavioral;

