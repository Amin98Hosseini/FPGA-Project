library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity MUX4_1_TB is
end MUX4_1_TB;

architecture Behavioral of MUX4_1_TB is

    -- Component declaration for the Unit Under Test (UUT)
    component MUX4_1
        Port (
            w0 : in  STD_LOGIC;
            w1 : in  STD_LOGIC;
            w2 : in  STD_LOGIC;
            w3 : in  STD_LOGIC;
            En : in  STD_LOGIC;
            s  : in  unsigned (1 downto 0);
            f  : out STD_LOGIC
        );
    end component;

    -- Inputs
    signal w0 : STD_LOGIC := '0';
    signal w1 : STD_LOGIC := '0';
    signal w2 : STD_LOGIC := '0';
    signal w3 : STD_LOGIC := '0';
    signal En : STD_LOGIC := '0';
    signal s  : unsigned (1 downto 0) := (others => '0');

    -- Outputs
    signal f : STD_LOGIC;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: MUX4_1
        Port Map (
            w0 => w0,
            w1 => w1,
            w2 => w2,
            w3 => w3,
            En => En,
            s  => s,
            f  => f
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- Test case 1: Enable = 0, all inputs should be ignored
        En <= '0';
        w0 <= '1'; w1 <= '0'; w2 <= '1'; w3 <= '0';
        s <= "00"; wait for 10 ns;
        s <= "01"; wait for 10 ns;
        s <= "10"; wait for 10 ns;
        s <= "11"; wait for 10 ns;

        -- Test case 2: Enable = 1, select each input
        En <= '1';
        w0 <= '1'; w1 <= '0'; w2 <= '1'; w3 <= '0';
        s <= "00"; wait for 10 ns;  -- f should be w0 = '1'
        s <= "01"; wait for 10 ns;  -- f should be w1 = '0'
        s <= "10"; wait for 10 ns;  -- f should be w2 = '1'
        s <= "11"; wait for 10 ns;  -- f should be w3 = '0'

        -- Test case 3: Enable = 1, change inputs and select again
        En <= '1';
        w0 <= '0'; w1 <= '1'; w2 <= '0'; w3 <= '1';
        s <= "00"; wait for 10 ns;  -- f should be w0 = '0'
        s <= "01"; wait for 10 ns;  -- f should be w1 = '1'
        s <= "10"; wait for 10 ns;  -- f should be w2 = '0'
        s <= "11"; wait for 10 ns;  -- f should be w3 = '1'

        -- Test case 4: Enable = 1, all inputs are '1'
        En <= '1';
        w0 <= '1'; w1 <= '1'; w2 <= '1'; w3 <= '1';
        s <= "00"; wait for 10 ns;  -- f should be w0 = '1'
        s <= "01"; wait for 10 ns;  -- f should be w1 = '1'
        s <= "10"; wait for 10 ns;  -- f should be w2 = '1'
        s <= "11"; wait for 10 ns;  -- f should be w3 = '1'

        -- Test case 5: Enable = 1, all inputs are '0'
        En <= '1';
        w0 <= '0'; w1 <= '0'; w2 <= '0'; w3 <= '0';
        s <= "00"; wait for 10 ns;  -- f should be w0 = '0'
        s <= "01"; wait for 10 ns;  -- f should be w1 = '0'
        s <= "10"; wait for 10 ns;  -- f should be w2 = '0'
        s <= "11"; wait for 10 ns;  -- f should be w3 = '0'

        -- End of simulation
        wait;
    end process;

end Behavioral;