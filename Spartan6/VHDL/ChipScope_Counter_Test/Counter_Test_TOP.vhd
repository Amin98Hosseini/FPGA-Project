library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Counter_Test_TOP is
    Port ( 
				Clock 				: 	in		std_logic;
				Counter_Out 		: 	out 	unsigned (7 downto 0)				
			);
end Counter_Test_TOP;

architecture Behavioral of Counter_Test_TOP is

	signal	Count_Direction		:	std_logic								:=	'0';
	signal	Counter_Out_Int		:	unsigned	(7 downto 0)				:=	(others=>'0');
	signal	CONTROL0 				: 	STD_LOGIC_VECTOR(35 DOWNTO 0)		:=	(others=>'0');


	component icon_inst
	  PORT (
		 CONTROL0 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0));

	end component;

	component ila_inst
	  PORT (
		 CONTROL : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
		 CLK : IN STD_LOGIC;
		 DATA : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 TRIG0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0));

	end component;
		
begin

	icon_instt : icon_inst
	  port map (
		 CONTROL0 	=> CONTROL0);

	ila_instt : ila_inst
	  port map (
		 CONTROL 	=> CONTROL0,
		 CLK 			=> Clock,
		 DATA 		=> std_logic_vector(Counter_Out_Int),
		 TRIG0 		=> std_logic_vector(Counter_Out_Int));

	Counter_Out						<=	Counter_Out_Int;

	Inst_UpDown_Counter: entity work.UpDown_Counter 
		PORT MAP (
		
						Clock 		=> Clock,
						Up_Down 		=> Count_Direction,
						Output 		=> Counter_Out_Int
					);

end Behavioral;

