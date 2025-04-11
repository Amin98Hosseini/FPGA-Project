library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity Register_Generic_TB is
end Register_Generic_TB;

architecture Behavioral of Register_Generic_TB is

    -- Constants
    constant Reg_Width : integer := 8; -- Set the register width
    constant Clock_Period : time := 10 ns; -- Define clock period

    -- Signals
    signal D : unsigned(Reg_Width-1 downto 0) := (others => '0');
    signal Clock : std_logic := '0';
    signal Reset : std_logic := '0';
    signal Q : unsigned(Reg_Width-1 downto 0);

begin

    -- Instantiate the Register_Generic entity
    UUT: entity work.Register_Generic
        generic map (
            Reg_Width => Reg_Width
        )
        port map (
            D => D,
            Clock => Clock,
            Reset => Reset,
            Q => Q
        );

    -- Clock generation process
    Clock_Process: process
    begin
        Clock <= '0';
        wait for Clock_Period / 2;
        Clock <= '1';
        wait for Clock_Period / 2;
    end process;

    -- Stimulus process
    Stimulus_Process: process
    begin
        -- Initialize signals
        Reset <= '0';
        D <= (others => '0');
        wait for Clock_Period;

        -- Test case 1: Load data into the register
        D <= to_unsigned(170, Reg_Width); -- Load 170 (10101010 in binary)
        wait for Clock_Period;
        assert Q = to_unsigned(170, Reg_Width)
            report "Test case 1 failed: Q should be 170"
            severity error;

        -- Test case 2: Load new data into the register
        D <= to_unsigned(85, Reg_Width); -- Load 85 (01010101 in binary)
        wait for Clock_Period;
        assert Q = to_unsigned(85, Reg_Width)
            report "Test case 2 failed: Q should be 85"
            severity error;

        -- Test case 3: Apply reset
        Reset <= '1';
        wait for Clock_Period;
        assert Q = to_unsigned(0, Reg_Width)
            report "Test case 3 failed: Q should be 0 after reset"
            severity error;

        -- Test case 4: Disable reset and load new data
        Reset <= '0';
        D <= to_unsigned(255, Reg_Width); -- Load 255 (11111111 in binary)
        wait for Clock_Period;
        assert Q = to_unsigned(255, Reg_Width)
            report "Test case 4 failed: Q should be 255"
            severity error;

        -- Test case 5: Apply reset again
        Reset <= '1';
        wait for Clock_Period;
        assert Q = to_unsigned(0, Reg_Width)
            report "Test case 5 failed: Q should be 0 after reset"
            severity error;

        -- End of simulation
        report "All test cases passed!" severity note;
        wait;
    end process;

end Behavioral;