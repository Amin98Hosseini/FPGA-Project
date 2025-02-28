library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity BCD_to_7_Seg is
    Port ( 
				BCD_Digit 				: in   unsigned (3 downto 0);
				Seven_Segment_Int 	: out  unsigned (7 downto 0)
			);
					
end BCD_to_7_Seg;

architecture Behavioral of BCD_to_7_Seg is
begin
	--Concurrent
	process(BCD_Digit)
	begin
		--Sequential
		case BCD_Digit is
			
			when "0000" =>
					Seven_Segment_Int	<=	"00111111";
					
			when "0001" =>
					Seven_Segment_Int	<=	"00000110";
					
			when "0010" =>
					Seven_Segment_Int	<=	"01011011";

			when "0011" =>
					Seven_Segment_Int	<=	"01001111";

			when "0100" =>
					Seven_Segment_Int	<=	"01100110";

			when "0101" =>
					Seven_Segment_Int	<=	"01101101";

			when "0110" =>
					Seven_Segment_Int	<=	"01111101";

			when "0111" =>
					Seven_Segment_Int	<=	"00000111";

			when "1000" =>
					Seven_Segment_Int	<=	"01111111";

			when "1001" =>
					Seven_Segment_Int	<=	"01100111";

			when others =>
					Seven_Segment_Int	<=	"00000000";			
		end case;		
	end process;
end Behavioral;