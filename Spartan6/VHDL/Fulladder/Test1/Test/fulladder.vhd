library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fulladder is
    Port ( 
				A 		: 	in  STD_LOGIC;
				B 		: 	in  STD_LOGIC;
				Cin 	: 	in  STD_LOGIC;
				Sum 	: 	out  STD_LOGIC;
				Cout 	: 	out  STD_LOGIC);
end fulladder;

architecture Behavioral of fulladder is

begin
	Sum <= A xor B xor Cin;
	Cout <= (A and B) or (A and Cin) or (B and Cin);
	


end Behavioral;

