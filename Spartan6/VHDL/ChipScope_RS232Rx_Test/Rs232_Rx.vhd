library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity RS232_Rx is
    Port ( 
				Clock 	: in  	STD_LOGIC;
				Data 		: out  	unsigned 	(7 downto 0);
				Valid		: out  	STD_LOGIC;
				Serial 	: in  	STD_LOGIC);
end RS232_Rx;

architecture Behavioral of RS232_Rx is

	signal	Data_Int					:	unsigned	(15 downto 0)				:=	(others=>'0');
	signal	Valid_Int				:	std_logic								:=	'0';
	signal	Serial_Int				:	std_logic								:=	'0';
	signal	Serial_Prev				:	std_logic								:=	'0';
	
	signal	Data_Bit_Count			:	unsigned	(3 downto 0)				:=	(others=>'0');
	signal	Parity_Bit				:	std_logic								:=	'0';
	signal	Packet_Detection		:	std_logic								:=	'0';
	signal	Find_Bit_Center_State:	std_logic								:=	'0';
	
	-----		Baud rate = 9600 => bit width = 1/9600 = 104.16 us.
	-----		Clock Freq. = 50 MHz => Clock Period = 20 ns.
	-----		Bit sample = 104.16 us / 20 ns = 5208.
	constant	Baud_Rate_9600			:	unsigned	(12 downto 0)				:=	to_unsigned(5207,13);--5207
	constant	Half_Baud_Rate_9600	:	unsigned	(12 downto 0)				:=	to_unsigned(2603,13);--2603
	signal	Bit_Width_Count		:	unsigned	(12 downto 0)				:=	(others=>'0');
	
begin

	Data									<=		Data_Int(7 downto 0);
	Valid									<=		Valid_Int;

	process(Clock)
	begin
	
		if rising_edge(Clock) then
		
			Serial_Int					<=		Serial;
			Serial_Prev					<=		Serial_Int;
			Valid_Int					<=		'0';
				
			Bit_Width_Count			<=		Bit_Width_Count + 1;
			if (Bit_Width_Count = Baud_Rate_9600) then
			
				Bit_Width_Count		<=		(others=>'0');
				Data_Bit_Count			<=		Data_Bit_Count + 1;
				Data_Int(to_integer(Data_Bit_Count))<=	Serial_Int;
				Parity_Bit				<=		Parity_Bit xor Serial_Int;
			
			end if;
			
			if (Data_Bit_Count = to_unsigned(10,4) and Packet_Detection = '1') then
				
				Valid_Int				<=		Parity_Bit;
				Packet_Detection		<=		'0';
				
			end if;
						
			if (Serial_Int = '0' and Serial_Prev = '1' and Packet_Detection = '0') then
				
				Packet_Detection		<=		'1';
				Find_Bit_Center_State<=		'1';
				Parity_Bit				<=		'0';				
				Data_Bit_Count			<=		(others=>'0');						
				Bit_Width_Count		<=		(others=>'0');
				
			end if;
			
			if (Bit_Width_Count = Half_Baud_Rate_9600 and Find_Bit_Center_State = '1') then
			
				Find_Bit_Center_State<=		'0';			
				Bit_Width_Count		<=		(others=>'0');						
				
			end if;
			
		end if;
	
	end process;

end Behavioral;

