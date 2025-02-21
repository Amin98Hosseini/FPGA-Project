LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
 
ENTITY FA16Bits_Sign_Tb IS
END FA16Bits_Sign_Tb;
 
ARCHITECTURE behavior OF FA16Bits_Sign_Tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Example_01_FA_16bit_Signed
    PORT(
         A : IN  signed(15 downto 0);
         B : IN  signed(15 downto 0);
         Cin : IN  signed(0 downto 0);
         Cout : OUT  std_logic;
         Sum : OUT  signed(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : signed(15 downto 0) := (others => '0');
   signal B : signed(15 downto 0) := (others => '0');
   signal Cin : signed(0 downto 0) := (others => '0');

 	--Outputs
   signal Cout : std_logic;
   signal Sum : signed(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Example_01_FA_16bit_Signed PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          Cout => Cout,
          Sum => Sum
        );

   -- Clock process definitions
   
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.

      -- insert stimulus here 
		
			A <= "0000111101011100";
			B <= "0000000001000000";
			Cin <= "0" ;
			
			--A <= "0000000000000000";
			--B <= "1111100000000000";
			--Cin <= "0" ;
			
			
      wait;
   end process;

END;
