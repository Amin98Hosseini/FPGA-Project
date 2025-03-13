library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity Adder_Use_IPCore_TB is
end Adder_Use_IPCore_TB;

architecture Behavioral of Adder_Use_IPCore_TB is

    -- Component Declaration for the Unit Under Test (UUT)
    component Adder_Use_IPCore
        port (
            A_Top   : in  signed(15 downto 0);
            B_Top   : in  signed(15 downto 0);
            Sum_Top : out signed(16 downto 0);
            Add_Top : in  std_logic;
            Clock   : in  std_logic
        );
    end component;

    -- Inputs
    signal A_Top   : signed(15 downto 0) := (others => '0');
    signal B_Top   : signed(15 downto 0) := (others => '0');
    signal Add_Top : std_logic := '0';
    signal Clock   : std_logic := '0';

    -- Outputs
    signal Sum_Top : signed(16 downto 0);

    -- Clock period definitions
    constant Clock_period : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: Adder_Use_IPCore port map (
        A_Top   => A_Top,
        B_Top   => B_Top,
        Sum_Top => Sum_Top,
        Add_Top => Add_Top,
        Clock   => Clock
    );

    -- Clock process definitions
    Clock_process : process
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
        A_Top   <= to_signed(100, 16);  -- Example value for A_Top
        B_Top   <= to_signed(200, 16);  -- Example value for B_Top
        Add_Top <= '1';                 -- Enable addition
        wait for Clock_period * 2;

        -- Change inputs
        A_Top   <= to_signed(-50, 16); -- Example value for A_Top
        B_Top   <= to_signed(75, 16);  -- Example value for B_Top
        wait for Clock_period * 2;

        -- Disable addition
        Add_Top <= '0';
        wait for Clock_period * 2;

        -- Re-enable addition with new values
        A_Top   <= to_signed(300, 16);  -- Example value for A_Top
        B_Top   <= to_signed(-150, 16); -- Example value for B_Top
        Add_Top <= '1';
        wait for Clock_period * 2;

        -- End simulation
        wait;
    end process;

end Behavioral;