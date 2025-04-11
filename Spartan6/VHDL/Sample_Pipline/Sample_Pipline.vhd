library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

-- S = A*C1 + B*C2;
entity Sample_PipeLine is

	port (
				A		:	in		signed	(7 downto 0);
				B		:	in		signed	(7 downto 0);
				C1		:	in		signed	(3 downto 0);
				C2		:	in		signed	(3 downto 0);
				S		:	out	signed	(7 downto 0);
				Clock	:	in		std_logic
			);	
				
end Sample_PipeLine;

architecture Behavioral of Sample_PipeLine is

	signal	A_Int			:	signed	(7 downto 0)			:=	(others=>'0');	
	signal	B_Int			:	signed	(7 downto 0)			:=	(others=>'0');	
	signal	C1_Int		:	signed	(3 downto 0)			:=	(others=>'0');
	signal	C2_Int		:	signed	(3 downto 0)			:=	(others=>'0');
	signal	P1_Int		:	signed	(11 downto 0)			:=	(others=>'0');	
	signal	P2_Int		:	signed	(11 downto 0)			:=	(others=>'0');	
	signal	S_Int			:	signed	(11 downto 0)			:=	(others=>'0');	

begin

	-- port maps.
	-- some assignments.
	S							<=		S_Int(11 downto 4);
	
	Process(Clock)
	begin
	
		if rising_edge(Clock) then
		--- Sequential Code
			A_Int				<=		A;
			B_Int				<=		B;
			C1_Int			<=		C1;
			C2_Int			<=		C2;

--			S_Int				<=		A_Int	* C1_Int + B_Int	* C2_Int;
			
			P1_Int			<=		A_Int	* C1_Int;
			P2_Int			<=		B_Int	* C2_Int;
			S_Int				<=		P1_Int + P2_Int;
		
		end if;
	
	end process;

end Behavioral;