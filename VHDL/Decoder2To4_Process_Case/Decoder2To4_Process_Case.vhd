library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity Example_05_Process_Decoder2to4 is
	port(
			X		:	in		unsigned	(1 downto 0);
			Y		:	out	unsigned	(3 downto 0);
			En		:	in		std_logic
			);		
end Example_05_Process_Decoder2to4;

architecture Behavioral of Example_05_Process_Decoder2to4 is

begin
	--Concurrent
	process(X,En)
		begin
			--Sequential
			case X is
				when "00"	=>	Y	<=	"0001";
				when "01"	=>	Y	<=	"0010";
				when "10"	=>	Y	<=	"0100";
				when others	=>	Y	<=	"1000";
			end case;	
		if En = '0' then
			Y		<= "0000";
		end if;
	end process;
	
end Behavioral;