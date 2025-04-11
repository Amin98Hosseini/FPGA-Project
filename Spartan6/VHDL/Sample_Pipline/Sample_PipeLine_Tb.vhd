library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Sample_PipeLine_TB is
end Sample_PipeLine_TB;

architecture Behavioral of Sample_PipeLine_TB is

    -- Component declaration for the Unit Under Test (UUT)
    component Sample_PipeLine
        port (
            A       : in  signed(7 downto 0);
            B       : in  signed(7 downto 0);
            C1      : in  signed(3 downto 0);
            C2      : in  signed(3 downto 0);
            S       : out signed(7 downto 0);
            Clock   : in  std_logic
        );
    end component;

    -- Inputs
    signal A_tb      : signed(7 downto 0) := (others => '0');
    signal B_tb      : signed(7 downto 0) := (others => '0');
    signal C1_tb     : signed(3 downto 0) := (others => '0');
    signal C2_tb     : signed(3 downto 0) := (others => '0');
    signal Clock_tb  : std_logic := '0';

    -- Outputs
    signal S_tb      : signed(7 downto 0);

    -- Clock period definition
    constant Clock_period : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: Sample_PipeLine
        port map (
            A       => A_tb,
            B       => B_tb,
            C1      => C1_tb,
            C2      => C2_tb,
            S       => S_tb,
            Clock   => Clock_tb
        );

    -- Clock process definitions
    Clock_process: process
    begin
        Clock_tb <= '0';
        wait for Clock_period / 2;
        Clock_tb <= '1';
        wait for Clock_period / 2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Initialize inputs
        A_tb <= to_signed(10, 8);  -- Example value for A
        B_tb <= to_signed(20, 8);  -- Example value for B
        C1_tb <= to_signed(3, 4);  -- Example value for C1
        C2_tb <= to_signed(4, 4);  -- Example value for C2

        wait for Clock_period;

        -- Update inputs
        A_tb <= to_signed(-5, 8);  -- Negative value for A
        B_tb <= to_signed(15, 8);  -- Positive value for B
        C1_tb <= to_signed(-2, 4); -- Negative value for C1
        C2_tb <= to_signed(3, 4);  -- Positive value for C2

        wait for Clock_period;

        -- Another set of inputs
        A_tb <= to_signed(127, 8); -- Maximum positive value for A
        B_tb <= to_signed(-128, 8);-- Minimum negative value for B
        C1_tb <= to_signed(1, 4);  -- Simple multiplier for C1
        C2_tb <= to_signed(-1, 4); -- Simple multiplier for C2

        wait for Clock_period;

        -- Final set of inputs
        A_tb <= to_signed(0, 8);   -- Zero value for A
        B_tb <= to_signed(0, 8);   -- Zero value for B
        C1_tb <= to_signed(0, 4);  -- Zero value for C1
        C2_tb <= to_signed(0, 4);  -- Zero value for C2

        wait for Clock_period;

        -- End simulation
        wait;
    end process;

end Behavioral;