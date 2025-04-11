library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity BCD_Counter_7Segment_TB is
end BCD_Counter_7Segment_TB;

architecture Behavioral of BCD_Counter_7Segment_TB is

    -- Component Declaration for the Unit Under Test (UUT)
    component BCD_Counter_7Segment
        port (
            Clock      : in  std_logic;  -- Clock signal
            Reset      : in  std_logic;  -- Reset signal
            Up_Down    : in  std_logic;  -- Up/Down control: '0' for up, '1' for down
            Counter_Out: out unsigned(3 downto 0)  -- 4-bit BCD counter output
        );
    end component;

    -- Inputs
    signal Clock      : std_logic := '0';
    signal Reset      : std_logic := '0';
    signal Up_Down    : std_logic := '0';

    -- Outputs
    signal Counter_Out: unsigned(3 downto 0);

    -- Clock period definition
    constant Clock_period : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: BCD_Counter_7Segment
        port map (
            Clock      => Clock,
            Reset      => Reset,
            Up_Down    => Up_Down,
            Counter_Out=> Counter_Out
        );

    -- Clock process
    Clock_process: process
    begin
        Clock <= '0';
        wait for Clock_period/2;
        Clock <= '1';
        wait for Clock_period/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Initialize Inputs
        Reset <= '1';  -- Apply reset
        wait for 20 ns;
        Reset <= '0';  -- Release reset
        wait for 20 ns;

        -- Test Case 1: Up Counting (Up_Down = '0')
        --Up_Down <= '0';  -- Set to up-counting mode
        wait for 500 ns;  -- Let the counter run for a while

        -- Test Case 2: Down Counting (Up_Down = '1')
        --Up_Down <= '1';  -- Set to down-counting mode
        --wait for 500 ns;  -- Let the counter run for a while

        -- Test Case 3: Reset the Counter
        Reset <= '1';  -- Apply reset
        wait for 20 ns;
        Reset <= '0';  -- Release reset
        wait for 20 ns;

        -- Test Case 4: Up Counting Again (Up_Down = '0')
        --Up_Down <= '0';  -- Set to up-counting mode
        --wait for 500 ns;  -- Let the counter run for a while

        -- End of simulation
        wait;
    end process;

end Behavioral;