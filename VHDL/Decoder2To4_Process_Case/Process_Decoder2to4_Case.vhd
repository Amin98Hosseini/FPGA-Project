library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity tb_Example_05_Process_Decoder2to4 is
end tb_Example_05_Process_Decoder2to4;

architecture Behavioral of tb_Example_05_Process_Decoder2to4 is

    -- Component declaration for the Unit Under Test (UUT)
    component Example_05_Process_Decoder2to4
        port(
            X  : in  unsigned(1 downto 0);
            Y  : out unsigned(3 downto 0);
            En : in  std_logic
        );
    end component;

    -- Inputs
    signal X  : unsigned(1 downto 0) := (others => '0');
    signal En : std_logic := '0';

    -- Outputs
    signal Y  : unsigned(3 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: Example_05_Process_Decoder2to4
        port map (
            X  => X,
            Y  => Y,
            En => En
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- Test all combinations of X with En = '1'
        En <= '1';
        X <= "00";
        wait for 10 ns;
        assert Y = "0001" report "Error: Y should be 0001 when X=00 and En=1" severity error;

        X <= "01";
        wait for 10 ns;
        assert Y = "0010" report "Error: Y should be 0010 when X=01 and En=1" severity error;

        X <= "10";
        wait for 10 ns;
        assert Y = "0100" report "Error: Y should be 0100 when X=10 and En=1" severity error;

        X <= "11";
        wait for 10 ns;
        assert Y = "1000" report "Error: Y should be 1000 when X=11 and En=1" severity error;

        -- Test all combinations of X with En = '0'
        En <= '0';
        X <= "00";
        wait for 10 ns;
        assert Y = "0000" report "Error: Y should be 0000 when X=00 and En=0" severity error;

        X <= "01";
        wait for 10 ns;
        assert Y = "0000" report "Error: Y should be 0000 when X=01 and En=0" severity error;

        X <= "10";
        wait for 10 ns;
        assert Y = "0000" report "Error: Y should be 0000 when X=10 and En=0" severity error;

        X <= "11";
        wait for 10 ns;
        assert Y = "0000" report "Error: Y should be 0000 when X=11 and En=0" severity error;

        -- End of test
        wait;
    end process;

end Behavioral;