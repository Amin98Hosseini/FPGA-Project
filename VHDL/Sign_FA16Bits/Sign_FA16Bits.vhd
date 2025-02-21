library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity Example_01_FA_16bit_Signed is
    Port ( 
	 			A 		: in  signed (15 downto 0);
				B 		: in  signed (15 downto 0);
				Cin	: in	signed (0 downto 0);
				Cout	: out	std_logic;
				Sum 	: out signed (15 downto 0)
			);
			
end Example_01_FA_16bit_Signed;

architecture Behavioral of Example_01_FA_16bit_Signed is

	signal	Sum_Int	:	signed	(16 downto 0)	:=	(others=>'0');

begin

	Sum_Int		<=		resize(A,17) + B + signed('0'&Cin);
	Cout			<=		Sum_Int(16) xor A(15) xor B(15);
	Sum			<=		Sum_Int(15 downto 0);

end Behavioral;