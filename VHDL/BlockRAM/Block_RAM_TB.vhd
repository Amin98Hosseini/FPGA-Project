library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_Block_RAM is
end TB_Block_RAM;

architecture Behavioral of TB_Block_RAM is

    -- Constants matching the Block_RAM generic values
    constant RAM_Width    : integer := 15;
    constant RAM_AddWidth: integer := 6;

    -- Signals to connect to the Unit Under Test (UUT)
    signal Clock         : std_logic := '0';
    signal WE            : std_logic := '0';
    signal Write_Address : unsigned(RAM_AddWidth-1 downto 0) := (others => '0');
    signal Read_Address  : unsigned(RAM_AddWidth-1 downto 0) := (others => '0');
    signal Data_In       : unsigned(RAM_Width-1 downto 0) := (others => '0');
    signal Data_Out      : unsigned(RAM_Width-1 downto 0);

    -- Clock period
    constant clk_period : time := 10 ns;

begin

    -- Instantiate the Block_RAM
    uut: entity work.Block_RAM
        generic map (
            RAM_Width     => RAM_Width,
            RAM_AddWidth  => RAM_AddWidth
        )
        port map (
            Clock         => Clock,
            WE            => WE,
            Write_Address => Write_Address,
            Read_Address  => Read_Address,
            Data_In       => Data_In,
            Data_Out      => Data_Out
        );

    -- Clock process
    clk_process: process
    begin
        while now < 500 ns loop
            Clock <= '0';
            wait for clk_period / 2;
            Clock <= '1';
            wait for clk_period / 2;
        end loop;
        wait;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        wait for 20 ns;
        
        -- Write data to address 5
        WE <= '1';
        Write_Address <= to_unsigned(5, RAM_AddWidth);
        Data_In <= to_unsigned(12345, RAM_Width);
        wait for clk_period;

        -- Write data to address 10
        Write_Address <= to_unsigned(10, RAM_AddWidth);
        Data_In <= to_unsigned(23456, RAM_Width);
        wait for clk_period;

        -- Disable write
        WE <= '0';
        
        -- Read from address 5
        Read_Address <= to_unsigned(5, RAM_AddWidth);
        wait for clk_period;

        -- Read from address 10
        Read_Address <= to_unsigned(10, RAM_AddWidth);
        wait for clk_period;

        -- Read from address 0 (should be 0)
        Read_Address <= to_unsigned(0, RAM_AddWidth);
        wait for clk_period;

        wait;
    end process;

end Behavioral;
