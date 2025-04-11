library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity MUX4To1_When is
    Port ( 
				w0 : in  STD_LOGIC;
				w1 : in  STD_LOGIC;
				w2 : in  STD_LOGIC;
				w3 : in  STD_LOGIC;
				En : in STD_LOGIC;
				s 	: in  unsigned (1 downto 0) ;
				f 	: out  STD_LOGIC
			  );
end MUX4To1_When;

architecture Behavioral of MUX4To1_When is

begin

	f <= 	w0 when s="00" and En='1' else
			w1 when s="01" and En='1' else
			w2 when s="10" and En='1' else
			w3 when s="10" and En='1' else
			'0';


end Behavioral;

