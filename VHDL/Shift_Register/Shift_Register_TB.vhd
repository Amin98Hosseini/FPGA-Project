library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity Shift_Register_TB is
end Shift_Register_TB;

architecture Behavioral of Shift_Register_TB is

    -- Component Declaration for the Unit Under Test (UUT)
    component Shift_Register
        port (
            Input           : in  std_logic;
            Clock           : in  std_logic;
            Parallel_Input  : in  unsigned(7 downto 0);
            Load            : in  std_logic;
            Reset           : in  std_logic;
            Output          : out unsigned(7 downto 0)
        );
    end component;

    -- Inputs
    signal Input          : std_logic := '0';
    signal Clock          : std_logic := '0';
    signal Parallel_Input : unsigned(7 downto 0) := (others => '0');
    signal Load           : std_logic := '0';
    signal Reset          : std_logic := '0';

    -- Outputs
    signal Output         : unsigned(7 downto 0);

    -- Clock period definition
    constant Clock_period : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: Shift_Register
        port map (
            Input           => Input,
            Clock           => Clock,
            Parallel_Input  => Parallel_Input,
            Load            => Load,
            Reset           => Reset,
            Output          => Output
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
        Input          <= '0';
        Parallel_Input <= (others => '0');
        Load           <= '0';
        Reset          <= '0';
        wait for 20 ns;

        -- Test Case 1: Reset the shift register
        Reset <= '1';
        wait for 10 ns; -- Wait for the next clock edge
        Reset <= '0';
        wait for 20 ns;

        -- Test Case 2: Load a parallel input
        Parallel_Input <= "10101010";
        Load <= '1';
        wait for 10 ns; -- Wait for the next clock edge
        Load <= '0';
        wait for 20 ns;

        -- Test Case 3: Shift in serial data
        Input <= '1';
        wait for 10 ns; -- Shift in '1'
        Input <= '0';
        wait for 10 ns; -- Shift in '0'
        Input <= '1';
        wait for 10 ns; -- Shift in '1'
        Input <= '0';
        wait for 10 ns; -- Shift in '0'
        Input <= '1';
        wait for 10 ns; -- Shift in '1'
        Input <= '0';
        wait for 10 ns; -- Shift in '0'
        Input <= '1';
        wait for 10 ns; -- Shift in '1'
        Input <= '0';
        wait for 10 ns; -- Shift in '0'
        wait for 20 ns;

        -- Test Case 4: Reset the shift register again
        Reset <= '1';
        wait for 10 ns; -- Wait for the next clock edge
        Reset <= '0';
        wait for 20 ns;

        -- Test Case 5: Load a different parallel input
        Parallel_Input <= "11110000";
        Load <= '1';
        wait for 10 ns; -- Wait for the next clock edge
        Load <= '0';
        wait for 20 ns;

        -- Test Case 6: Shift in more serial data
        Input <= '1';
        wait for 10 ns; -- Shift in '1'
        Input <= '1';
        wait for 10 ns; -- Shift in '1'
        Input <= '0';
        wait for 10 ns; -- Shift in '0'
        Input <= '0';
        wait for 10 ns; -- Shift in '0'
        Input <= '1';
        wait for 10 ns; -- Shift in '1'
        Input <= '1';
        wait for 10 ns; -- Shift in '1'
        Input <= '0';
        wait for 10 ns; -- Shift in '0'
        Input <= '0';
        wait for 10 ns; -- Shift in '0'
        wait for 20 ns;

        -- End of simulation
        wait;
    end process;

end Behavioral;