library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity MUX4_1 is
    Port (
				w0 : in  STD_LOGIC;
				w1 : in  STD_LOGIC;
				w2 : in  STD_LOGIC;
				w3 : in  STD_LOGIC;
				En : in STD_LOGIC;
				s 	: in  unsigned (1 downto 0);
				f 	: out  STD_LOGIC);
end MUX4_1;

architecture Behavioral of MUX4_1 is

	signal SEn : unsigned (2 downto 0) := (others => '0');
	

begin

	SEn <= s&En;

	with SEn select
		f <= 	w0 when "001",
				w1 when "011",
				w2 when "101",
				w3 when "111",
				'0' when others;


end Behavioral;

