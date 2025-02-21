library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FA_4bits is
    Port ( 
				A 		: in  	STD_LOGIC_VECTOR (3 downto 0);
				B 		: in  	STD_LOGIC_VECTOR (3 downto 0);
				Cin 	: in  	STD_LOGIC;
				Cout 	: out  	STD_LOGIC;
				Sum 	: out  	STD_LOGIC_VECTOR (3 downto 0));
end FA_4bits;

architecture Behavioral of FA_4bits is

	COMPONENT fulladder
	PORT(
			A 		: IN std_logic;
			B 		: IN std_logic;
			Cin 	: IN std_logic;          
			Sum 	: OUT std_logic;
			Cout 	: OUT std_logic
			);
	END COMPONENT;

	signal SCin : STD_LOGIC_VECTOR (2 downto 0) := "000";


begin

	FA0: fulladder PORT MAP(
		A 		=> A(0) ,
		B 		=> B(0),
		Cin 	=> Cin,
		Sum 	=> Sum(0),
		Cout 	=> SCin(0)
	);
	
	FA1: fulladder PORT MAP(
		A 		=> A(1) ,
		B 		=> B(1),
		Cin 	=> SCin(0),
		Sum 	=> Sum(1),
		Cout 	=> SCin(1)
	);
	
	FA2: fulladder PORT MAP(
		A 		=> A(2) ,
		B 		=> B(2),
		Cin 	=> SCin(1),
		Sum 	=> Sum(2),
		Cout 	=> SCin(2)
	);
	
	FA3: fulladder PORT MAP(
		A 		=> A(3) ,
		B 		=> B(3),
		Cin 	=> SCin(2),
		Sum 	=> Sum(3),
		Cout 	=> Cout
	);


end Behavioral;

