library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Preiority_Encoder4Bits_Process is
    Port ( 
				w : in  STD_LOGIC_VECTOR (3 downto 0);
				y : out  STD_LOGIC_VECTOR (1 downto 0);
				z : out  STD_LOGIC
				);
				
end Preiority_Encoder4Bits_Process;

architecture Behavioral of Preiority_Encoder4Bits_Process is

begin
	
	--Concurrent
	process(w)
		begin
			--sequential
			z <= '0';
			if (w(3) = '1') then 
				y <= "11";
			elsif (w(2) = '1' ) then 
				y <= "10";
			elsif (w(1) = '1' ) then 
				y <= "01";
			elsif (w(0) = '1' ) then
				y <= "00";
			else
				z <= '1';
				
			end if;
	end process;
		


end Behavioral;

