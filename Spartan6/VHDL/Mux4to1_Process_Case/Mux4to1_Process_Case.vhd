library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity Mux4to1_Process_Case is
    Port ( 
				w0 : in  STD_LOGIC;
				w1 : in  STD_LOGIC;
				w2 : in  STD_LOGIC;
				w3 : in  STD_LOGIC;
				s : in  unsigned (1 downto 0);
				f : out  STD_LOGIC
				);
end Mux4to1_Process_Case;

architecture Behavioral of Mux4to1_Process_Case is

begin
	--Concurrent
	process(w0,w1,w2,w3,s)
		begin
			--Sequential
			case s is
				when "00" =>
						f	<=	w0;
				when "01" =>
						f	<=	w1;
				when "10" =>
						f	<=	w2;
				when others =>
						f	<=	w3;
			end case;
	end process;
end Behavioral;

