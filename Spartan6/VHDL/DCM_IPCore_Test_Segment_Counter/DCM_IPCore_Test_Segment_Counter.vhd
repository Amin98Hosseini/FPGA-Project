library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DCM_IPCore_Test_Segment_Counter is

    Port ( 
				Clock 					: in  STD_LOGIC;
				Seven_Seg 				: out	unsigned (7 downto 0)
			 );
			  
end DCM_IPCore_Test_Segment_Counter;

architecture Behavioral of DCM_IPCore_Test_Segment_Counter is

	signal	Seven_Segment_Int		:	unsigned	(7 downto 0)	:=	(others=>'0');
	signal	BCD_Int					:	unsigned	(3 downto 0)	:=	(others=>'0');
	signal	One_Sec_Counter		:	unsigned	(25 downto 0)	:=	(others=>'0');
	signal	Clock_120MHz			:	std_logic					:=	'0';

	component DCM_50TO120MHZ
	port
	 (-- Clock in ports
	  CLK_IN1           : in     std_logic;
	  -- Clock out ports
	  CLK_OUT1          : out    std_logic
	 );
	end component;

begin

	DCM_50_120 : DCM_50TO120MHZ
	  port map
		(-- Clock in ports
		 CLK_IN1 => Clock,
		 -- Clock out ports
		 CLK_OUT1 => Clock_120MHz);
	 
	Seven_Seg						<=	Seven_Segment_Int;

	process(Clock_120MHz)
	begin
	
		if rising_edge(Clock_120MHz) then
		
			One_Sec_Counter			<=	One_Sec_Counter + 1;
			
			if (One_Sec_Counter = to_unsigned(50000000,26)) then
			
				BCD_Int						<=	BCD_Int + 1;
				One_Sec_Counter			<=	(others=>'0');
				
			end if;

			case BCD_Int is
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
					BCD_Int				<=	(others=>'0');
					
			end case;
		
		end if;
	
	end process;
	
end Behavioral;

