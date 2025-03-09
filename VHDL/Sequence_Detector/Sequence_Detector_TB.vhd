library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Sequence_Detector_TB is
end Sequence_Detector_TB;

architecture Behavioral of Sequence_Detector_TB is

    -- Component Declaration for the Unit Under Test (UUT)
    component Sequence_Detector
        Port (
            Input  : in  std_logic;
            Clock  : in  std_logic;
            Reset  : in  std_logic;
            Alarm  : out std_logic
        );
    end component;

    -- Inputs
    signal Input  : std_logic := '0';
    signal Clock  : std_logic := '0';
    signal Reset  : std_logic := '0';

    -- Outputs
    signal Alarm  : std_logic;

    -- Clock period definition
    constant Clock_period : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: Sequence_Detector
        port map (
            Input  => Input,
            Clock  => Clock,
            Reset  => Reset,
            Alarm  => Alarm
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
        Input <= '0';
        Reset <= '1';
        wait for 20 ns;

        -- Release Reset
        Reset <= '0';
        wait for 20 ns;

        -- Test Case 1: No pattern detected
        Input <= '1';
        wait for 10 ns;
        Input <= '0';
        wait for 10 ns;
        Input <= '0';
        wait for 10 ns;
        Input <= '1';
        wait for 10 ns;
        Input <= '1';
        wait for 10 ns;

        -- Test Case 2: Pattern "10011" detected
        Input <= '1';
        wait for 10 ns;
        Input <= '0';
        wait for 10 ns;
        Input <= '0';
        wait for 10 ns;
        Input <= '1';
        wait for 10 ns;
        Input <= '1';
        wait for 10 ns;

        -- Test Case 3: No pattern detected
        Input <= '0';
        wait for 10 ns;
        Input <= '1';
        wait for 10 ns;
        Input <= '0';
        wait for 10 ns;
        Input <= '1';
        wait for 10 ns;
        Input <= '0';
        wait for 10 ns;

        -- Test Case 4: Pattern "10011" detected again
        Input <= '1';
        wait for 10 ns;
        Input <= '0';
        wait for 10 ns;
        Input <= '0';
        wait for 10 ns;
        Input <= '1';
        wait for 10 ns;
        Input <= '1';
        wait for 10 ns;

        -- End of simulation
        wait;
    end process;

end Behavioral;