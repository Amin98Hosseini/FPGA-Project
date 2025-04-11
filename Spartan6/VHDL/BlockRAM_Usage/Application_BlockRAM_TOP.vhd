library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity Application_BlockRAM_TOP is

	port (
				Data_Out_App	: out	unsigned(9 downto 0);
				Clock				: in	std_logic
		);

end Application_BlockRAM_TOP;

architecture Behavioral of Application_BlockRAM_TOP is

	signal	WE_Int				:	std_logic						:=	'0';
	signal	Write_Address_Int	:	unsigned		(7 downto 0)	:=	(others=>'0');
	signal	Read_Address_Int	:	unsigned		(7 downto 0)	:=	(others=>'0');
	signal	Data_In_Int			:	unsigned		(9 downto 0)	:=	(others=>'0');
	signal	Data_Out_Int		:	unsigned		(9 downto 0)	:=	(others=>'0');
	signal	RAM_Write_Count	:	unsigned		(7 downto 0)	:=	(others=>'0');
	signal	RAM_Read_Count		:	unsigned		(7 downto 0)	:=	to_unsigned(10,8);
	
begin

	Inst_Block_RAM: entity work.Block_RAM 

			generic map
					(
							RAM_Width				=>	10,
							RAM_AddWidth			=>	8
					)
	
			PORT MAP( 
							Clock 					=> 	Clock,
							WE 						=> 	WE_Int,
							Write_Address 			=> 	Write_Address_Int,
							Read_Address 			=> 	Read_Address_Int,
							Data_In 					=> 	Data_In_Int,
							Data_Out 				=> 	Data_Out_Int
						);

	Data_Out_App						<=		Data_Out_Int;
	
	process(Clock)
	begin
	
		if rising_edge(Clock) then
		
			RAM_Write_Count			<=	RAM_Write_Count + 1;
			Write_Address_Int			<=	RAM_Write_Count;
			Data_In_Int					<=	resize(RAM_Write_Count,10);
			WE_Int						<=	'1';
			
			RAM_Read_Count				<=	RAM_Read_Count + 1;
			Read_Address_Int			<=	RAM_Read_Count;
			
		end if;
	
	end process;

end Behavioral;
