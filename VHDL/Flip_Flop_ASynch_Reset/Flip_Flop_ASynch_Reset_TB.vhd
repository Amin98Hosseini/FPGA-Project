library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Flip_Flop_ASynch_Reset_TB is
end Flip_Flop_ASynch_Reset_TB;

architecture Behavioral of Flip_Flop_ASynch_Reset_TB is

    -- Component Declaration for the Unit Under Test (UUT)
    component Flip_Flop_ASynch_Reset
        Port ( 
            D       : in  STD_LOGIC;
            Clock   : in  STD_LOGIC;
            Reset   : in  STD_LOGIC;
            Set     : in  STD_LOGIC;
            Q       : out STD_LOGIC
        );
    end component;

    -- Inputs
    signal D     : STD_LOGIC := '0';
    signal Clock : STD_LOGIC := '0';
    signal Reset : STD_LOGIC := '0';
    signal Set   : STD_LOGIC := '0';

    -- Outputs
    signal Q     : STD_LOGIC;

    -- Clock period definition
    constant Clock_period : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: Flip_Flop_ASynch_Reset 
        port map (
            D     => D,
            Clock => Clock,
            Reset => Reset,
            Set   => Set,
            Q     => Q
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
        D     <= '0';
        Reset <= '0';
        Set   <= '0';
        wait for 20 ns;

        -- Test Case 1: Normal Operation (D = '1')
        D <= '1';
        wait for 20 ns;

        -- Test Case 2: Normal Operation (D = '0')
        D <= '0';
        wait for 20 ns;

        -- Test Case 3: Asynchronous Reset
        Reset <= '1';
        wait for 10 ns;
        Reset <= '0';
        wait for 20 ns;

        -- Test Case 4: Asynchronous Set
        Set <= '1';
        wait for 10 ns;
        Set <= '0';
        wait for 20 ns;

        -- Test Case 5: Reset and Set simultaneously (Reset should have priority)
        Reset <= '1';
        Set   <= '1';
        wait for 10 ns;
        Reset <= '0';
        Set   <= '0';
        wait for 20 ns;

        -- Test Case 6: Change D while Reset is active
        Reset <= '1';
        D     <= '1';
        wait for 10 ns;
        Reset <= '0';
        wait for 20 ns;

        -- Test Case 7: Change D while Set is active
        Set <= '1';
        D   <= '0';
        wait for 10 ns;
        Set <= '0';
        wait for 20 ns;

        -- End of simulation
        wait;
    end process;

end Behavioral;