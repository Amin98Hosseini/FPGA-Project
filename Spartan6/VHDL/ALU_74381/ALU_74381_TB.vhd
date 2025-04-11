library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity ALU_74381_TB is
end ALU_74381_TB;

architecture Behavioral of ALU_74381_TB is
    -- Component declaration for the Unit Under Test (UUT)
    component ALU_74381
        Port (
            A, B    : in  unsigned(3 downto 0);  -- 4-bit inputs
            S       : in  unsigned(2 downto 0);  -- 3-bit select lines
            F       : out unsigned(3 downto 0);  -- 4-bit output
            Cout    : out std_logic              -- Carry out
        );
    end component;

    -- Input signals
    signal A, B : unsigned(3 downto 0) := (others => '0');
    signal S    : unsigned(2 downto 0) := (others => '0');

    -- Output signals
    signal F    : unsigned(3 downto 0);
    signal Cout : std_logic;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: ALU_74381
        port map (
            A => A,
            B => B,
            S => S,
            F => F,
            Cout => Cout
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- Test case 1: Clear operation (S = "000")
        A <= "1010";  -- A = 10
        B <= "0110";  -- B = 6
        S <= "000";   -- Clear
        wait for 10 ns;

        -- Test case 2: B - A operation (S = "001")
        S <= "001";   -- B - A
        wait for 10 ns;

        -- Test case 3: A - B operation (S = "010")
        S <= "010";   -- A - B
        wait for 10 ns;

        -- Test case 4: A + B operation (S = "011")
        S <= "011";   -- A + B
        wait for 10 ns;

        -- Test case 5: A XOR B operation (S = "100")
        S <= "100";   -- A XOR B
        wait for 10 ns;

        -- Test case 6: A OR B operation (S = "101")
        S <= "101";   -- A OR B
        wait for 10 ns;

        -- Test case 7: A AND B operation (S = "110")
        S <= "110";   -- A AND B
        wait for 10 ns;

        -- Test case 8: Preset operation (S = "111")
        S <= "111";   -- Preset
        wait for 10 ns;

        -- Test case 9: Test with different inputs
        A <= "0011";  -- A = 3
        B <= "0101";  -- B = 5
        S <= "011";   -- A + B
        wait for 10 ns;

        -- Test case 10: Test with different inputs
        A <= "1111";  -- A = 15
        B <= "0001";  -- B = 1
        S <= "001";   -- B - A
        wait for 10 ns;

        -- End simulation
        wait;
    end process;
end Behavioral;