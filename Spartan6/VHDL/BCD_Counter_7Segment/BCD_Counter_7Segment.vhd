library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity BCD_Counter_7Segment is

		port (
					Clock						:	in		std_logic;
					Reset						:	in		std_logic;
					Up_Down					:	in		std_logic;
					Counter_Out				:	out	unsigned (3 downto 0);
					Seven_Segment_Int 	: 	out  unsigned (7 downto 0)
				);

end BCD_Counter_7Segment;

architecture Behavioral of BCD_Counter_7Segment is

	signal	Counter_Out_Int		:	unsigned	(31 downto 0)		:=	(others=>'0');
	signal	Counter_BCD_Int		:	unsigned	(3 downto 0)		:=	(others=>'0');

begin

	Counter_Out						<=		Counter_BCD_Int;

	process(Clock)
	begin
	
		if rising_edge(Clock) then
			-- Up_Down = 0 => Up counter, Up_Down = 1 => Down counter.
			Counter_Out_Int			<=		Counter_Out_Int + 1;
			if(Counter_Out_Int = "00000000000000001111111111111111" ) then
				Counter_BCD_Int		<=		Counter_BCD_Int + 1;
				if (Up_Down = '0') then
					Counter_BCD_Int		<=		Counter_BCD_Int - 1;
				end if;
					Counter_Out_Int <= "00000000000000000000000000000000";
				end if;	
			if (Reset = '1') then
				Counter_Out_Int		<=		(others=>'0');
				Counter_BCD_Int		<=		(others=>'0');
			end if;
			case Counter_BCD_Int is
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
		end if;
	
	end process;

end Behavioral;