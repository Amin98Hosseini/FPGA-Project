library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity BCD_to_7_Seg_TB is
end BCD_to_7_Seg_TB;

architecture Behavioral of BCD_to_7_Seg_TB is

    -- Component declaration for the Unit Under Test (UUT)
    component BCD_to_7_Seg
        Port (
            BCD_Digit         : in  unsigned (3 downto 0);
            Seven_Segment_Int : out unsigned (7 downto 0)
        );
    end component;

    -- Input signal
    signal BCD_Digit : unsigned(3 downto 0) := (others => '0');

    -- Output signal
    signal Seven_Segment_Int : unsigned(7 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: BCD_to_7_Seg
        port map (
            BCD_Digit => BCD_Digit,
            Seven_Segment_Int => Seven_Segment_Int
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- Apply all valid BCD inputs (0 to 9)
        for i in 0 to 9 loop
            BCD_Digit <= to_unsigned(i, 4); -- Convert integer to 4-bit unsigned
            wait for 10 ns; -- Wait for 10 ns to observe the output
        end loop;

        -- Apply invalid BCD inputs (10 to 15)
        for i in 10 to 15 loop
            BCD_Digit <= to_unsigned(i, 4); -- Convert integer to 4-bit unsigned
            wait for 10 ns; -- Wait for 10 ns to observe the output
        end loop;

        -- End the simulation
        wait;
    end process;

end Behavioral;