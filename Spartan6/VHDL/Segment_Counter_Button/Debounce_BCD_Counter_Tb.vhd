library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Debounce_Counter_TB is
end Debounce_Counter_TB;

architecture Behavioral of Debounce_Counter_TB is
    -- Constants
    constant CLK_PERIOD : time := 10 ns; -- 100 MHz clock

    -- Signals
    signal clk       : STD_LOGIC := '0';
    signal rst       : STD_LOGIC := '0';
    signal btn       : STD_LOGIC := '1'; -- Button is active low
    signal seven_seg : STD_LOGIC_VECTOR (7 downto 0);

    -- Instantiate the Unit Under Test (UUT)
    component Debounce_Counter is
        Port (
            clk       : in  STD_LOGIC;
            rst      : in  STD_LOGIC;
            btn      : in  STD_LOGIC;
            seven_seg: out STD_LOGIC_VECTOR (7 downto 0)
        );
    end component;

begin
    -- Instantiate the UUT
    uut: Debounce_Counter
        port map (
            clk       => clk,
            rst       => rst,
            btn       => btn,
            seven_seg => seven_seg
        );

    -- Clock generation process
    clk_process: process
    begin
        clk <= '0';
        wait for CLK_PERIOD / 2;
        clk <= '1';
        wait for CLK_PERIOD / 2;
    end process;

    -- Stimulus process
    stimulus_process: process
    begin
        -- Initial reset
        rst <= '1';
        wait for CLK_PERIOD * 2;
        rst <= '0';
        wait for CLK_PERIOD;

        -- Simulate button press and release
        btn <= '0'; -- Press button
        wait for CLK_PERIOD * 500000; -- Wait for debounce time
        btn <= '1'; -- Release button
        wait for CLK_PERIOD * 100;

        -- Simulate multiple button presses
        for i in 1 to 5 loop
            btn <= '0'; -- Press button
            wait for CLK_PERIOD * 500000; -- Wait for debounce time
            btn <= '1'; -- Release button
            wait for CLK_PERIOD * 100;
        end loop;

        -- Reset the counter
        rst <= '1';
        wait for CLK_PERIOD * 2;
        rst <= '0';
        wait for CLK_PERIOD;

        -- Simulate button press to verify reset
        btn <= '0'; -- Press button
        wait for CLK_PERIOD * 500000; -- Wait for debounce time
        btn <= '1'; -- Release button
        wait for CLK_PERIOD * 100;

        -- End simulation
        wait;
    end process;

end Behavioral;