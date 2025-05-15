library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity SRAM_Interface_Module is
    Port ( 
				Clock				: in 			STD_LOGIC;
				Rst				: in     	STD_LOGIC;
				Data_DIR			: in			STD_LOGIC;
				Address 			: OUT  		STD_LOGIC_VECTOR (18 downto 0);
				Data				: inout  	STD_LOGIC_VECTOR (7 downto 0);
				WE 				: OUT  		STD_LOGIC;
				OE 				: OUT  		STD_LOGIC;
				CE 				: OUT  		STD_LOGIC;
				LED				: OUT 		STD_LOGIC_VECTOR (3 downto 0)
			);
end SRAM_Interface_Module;

architecture Behavioral of SRAM_Interface_Module is

	signal Address_Int 		: STD_LOGIC_VECTOR (18 downto 0) := (others => '0');
	--signal Data_Int 		: STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
	signal Data_Out			: STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
	signal Data_In				: STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
	signal Data_Direction	: STD_LOGIC := '0' ;
	signal WE_Int				: STD_LOGIC := '1' ;
	signal OE_Int				: STD_LOGIC := '1' ;
	signal CE_Int				: STD_LOGIC := '1' ;
	signal Rst_Int				: STD_LOGIC := '0' ;
	signal Led_Int				: STD_LOGIC_VECTOR (3 downto 0);
	
	
begin

	Data <= Data_Out when Data_Direction = '1' else (others => 'Z');
	
	Address 			<= Address_Int;
	WE					<= WE_Int;
	OE					<= OE_Int;
	CE					<= CE_Int;
	Rst_Int			<= Rst;
	Data_Direction <= Data_DIR;
	Led				<= Led_Int;
	
	 
	 -- Example control logic (for write)
    process(Clock)
    begin
        if rising_edge(Clock) then
				-- Reset SRAM
				if Rst_Int ='1' then
					WE_Int <= '1';
					OE_Int <= '1';
					CE_Int <= '1';
					Address_Int <= "0000000000000000000";
				-- Read and Write 
				elsif Rst_Int = '0' then
					-- Write
					if Data_Direction ='1' then
						Address_Int <= "0000000000000000001";
						WE_Int <= '0';
						OE_Int <= '1';
						CE_Int <= '0';
						Data_Out <= "00001110";
					--Read
					elsif Data_Direction = '0' then
						Address_Int <= "0000000000000000001";
						WE_Int <= '1';
						OE_Int <= '0';
						CE_Int <= '0';
						Data_In <= Data;
						Led_Int	<= Data_In(3 downto 0);
					end if;
				end if;
		  end if;	  
    end process;
	

end Behavioral;

