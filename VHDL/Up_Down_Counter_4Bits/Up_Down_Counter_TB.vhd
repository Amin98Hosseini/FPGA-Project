library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity Up_Down_Counter_TB is
end Up_Down_Counter_TB;

architecture Behavioral of Up_Down_Counter_TB is

    -- Component Declaration for the Unit Under Test (UUT)
    component Up_Down_Counter
        port (
            Clock        : in  std_logic;
            Reset        : in  std_logic;
            Up_Down      : in  std_logic;
            Counter_Out  : out unsigned(3 downto 0)
        );
    end component;

    -- Inputs
    signal Clock       : std_logic := '0';
    signal Reset       : std_logic := '0';
    signal Up_Down     : std_logic := '0';

    -- Outputs
    signal Counter_Out : unsigned(3 downto 0);

    -- Clock period definition
    constant Clock_period : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: Up_Down_Counter
        port map (
            Clock       => Clock,
            Reset       => Reset,
            Up_Down     => Up_Down,
            Counter_Out => Counter_Out
        );

    -- Clock process definitions
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
        Reset   <= '0';
        Up_Down <= '0'; -- Start in Up Counter mode
        wait for 20 ns;

        -- Test Case 1: Up Counter Mode
        Up_Down <= '0'; -- Up Counter
        wait for 100 ns; -- Let the counter count up for 10 clock cycles

        -- Test Case 2: Down Counter Mode
        Up_Down <= '1'; -- Down Counter
        wait for 100 ns; -- Let the counter count down for 10 clock cycles

        -- Test Case 3: Reset the Counter
        Reset <= '1';
        wait for 10 ns; -- Reset the counter
        Reset <= '0';
        wait for 20 ns;

        -- Test Case 4: Switch to Up Counter Mode Again
        Up_Down <= '0'; -- Up Counter
        wait for 50 ns; -- Let the counter count up for 5 clock cycles

        -- Test Case 5: Switch to Down Counter Mode Again
        Up_Down <= '1'; -- Down Counter
        wait for 50 ns; -- Let the counter count down for 5 clock cycles

        -- Test Case 6: Reset the Counter Again
        Reset <= '1';
        wait for 10 ns; -- Reset the counter
        Reset <= '0';
        wait for 20 ns;

        -- End of simulation
        wait;
    end process;

end Behavioral;