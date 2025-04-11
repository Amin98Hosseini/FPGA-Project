library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DCM_IPCore_Test_Segment_Counter_TB is
end DCM_IPCore_Test_Segment_Counter_TB;

architecture testbench of DCM_IPCore_Test_Segment_Counter_TB is

    signal Clock          : std_logic := '0';
    signal Seven_Seg      : unsigned(7 downto 0);
    constant Clock_Period : time := 10 ns; -- 100 MHz clock for simulation

    -- Instantiate the Unit Under Test (UUT)
    component DCM_IPCore_Test_Segment_Counter
        Port (
            Clock      : in  std_logic;
            Seven_Seg  : out unsigned (7 downto 0)
        );
    end component;

begin
    -- Instantiate the DUT
    UUT: DCM_IPCore_Test_Segment_Counter
        port map (
            Clock     => Clock,
            Seven_Seg => Seven_Seg
        );

    -- Clock process
    process
    begin
        while now < 10000 ms loop -- Run simulation for 1 second
            Clock <= '0';
            wait for Clock_Period / 2;
            Clock <= '1';
            wait for Clock_Period / 2;
        end loop;
        wait;
    end process;

end testbench;
