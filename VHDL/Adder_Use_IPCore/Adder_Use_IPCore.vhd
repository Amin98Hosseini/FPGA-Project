library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity Adder_Use_IPCore is
		port
		(
			A_Top		:	in		signed(15 downto 0);
			B_Top		:	in		signed(15 downto 0);
			Sum_Top	:	out	signed(16 downto 0);
			Add_Top	:	in		std_logic;
			Clock		:	in		std_logic
		);
end Adder_Use_IPCore;

architecture Behavioral of Adder_Use_IPCore is
	--Concurrent
	signal	Sum_Int	:	std_logic_vector(16 downto 0)		:=	(others=>'0');
	
	COMPONENT Adder_IPCore
	  PORT (
		 a : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 b : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 clk : IN STD_LOGIC;
		 add : IN STD_LOGIC;
		 s : OUT STD_LOGIC_VECTOR(16 DOWNTO 0)
	  );
	END COMPONENT;

begin
	
	Sum_Top	<=		signed(Sum_Int);
	
	add_ip_core0 : Adder_IPCore
	  PORT MAP (
					 a 		=> 	std_logic_vector(A_Top),
					 b 		=> 	std_logic_vector(B_Top),
					 clk 		=> 	Clock,
					 add 		=> 	Add_Top,
					 s 		=> 	Sum_Int
					);

end Behavioral;

