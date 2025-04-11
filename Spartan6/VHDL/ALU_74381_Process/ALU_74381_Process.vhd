library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity ALU_74381_Process is
    Port (
				A, B    : in  unsigned(3 downto 0);  -- 4-bit inputs
				S       : in  unsigned(2 downto 0);  -- 3-bit select lines
				F       : out unsigned(3 downto 0);  -- 4-bit output
				Cout    : out std_logic              -- Carry out
    );
end ALU_74381_Process;

architecture Behavioral of ALU_74381_Process is
    signal A_int, B_int : unsigned(4 downto 0); -- 5-bit internal signals for carry handling
    signal F_int        : unsigned(4 downto 0); -- 5-bit internal output
begin
    -- Extend inputs to 5 bits for carry handling
    A_int <= '0' & A;
    B_int <= '0' & B;

    -- Process for ALU logic
    process(A , A_int , B , B_int , S)  -- Include all signals used in the process
    begin
        case S is
            when "000" =>  -- Clear
                F_int <= "00000";
            when "001" =>  -- B - A
                F_int <= B_int - A_int;
            when "010" =>  -- A - B
                F_int <= A_int - B_int;
            when "011" =>  -- A + B
                F_int <= A_int + B_int;
            when "100" =>  -- A XOR B
                F_int <= '0' & (A XOR B);
            when "101" =>  -- A OR B
                F_int <= '0' & (A OR B);
            when "110" =>  -- A AND B
                F_int <= '0' & (A AND B);
            when others => -- Preset
                F_int <= "11111";
        end case;
    end process;

    -- Output the result and carry
    F    <= F_int(3 downto 0);  -- 4-bit result
    Cout <= F_int(4);           -- Carry out
end Behavioral;