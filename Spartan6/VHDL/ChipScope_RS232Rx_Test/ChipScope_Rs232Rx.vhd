library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ChipScope_Rs232Rx is

    Port ( 
				Clock 				: 	in		std_logic;
				Serial_Rx			:	in		std_logic
				
			);
			
end ChipScope_Rs232Rx;

architecture Behavioral of ChipScope_Rs232Rx is
	
	signal	Rx_Data					:	unsigned	(7 downto 0)			:=	(others=>'0');
	signal	Rx_Valid					:	std_logic							:=	'0';
	signal	CONTROL0 				: 	STD_LOGIC_VECTOR(35 DOWNTO 0)	:=	(others=>'0');
	signal	TRIG0 					: 	STD_LOGIC_VECTOR(0 TO 0)		:=	"0";

	component icon_t
	  PORT (
		 CONTROL0 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0));

	end component;

	component ila_t
	  PORT (
		 CONTROL : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
		 CLK : IN STD_LOGIC;
		 DATA : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 TRIG0 : IN STD_LOGIC_VECTOR(0 TO 0));

	end component;
		
begin

	icon_inst : icon_t
	  port map (
		 CONTROL0 	=> CONTROL0);

	ila_inst : ila_t
	  port map (
		 CONTROL 	=> CONTROL0,
		 CLK 			=> Clock,
		 DATA 		=> std_logic_vector(Rx_Data),
		 TRIG0 		=> TRIG0);
		 
		 TRIG0(0)	<=	Rx_Valid;
		 
	Inst_RS232_Rx: entity work.RS232_Rx 
	
		PORT MAP(
						Clock 		=> 	Clock,
						Data 			=> 	Rx_Data,
						Valid 		=> 	Rx_Valid,
						Serial 		=> 	Serial_Rx
					);
	
end Behavioral;