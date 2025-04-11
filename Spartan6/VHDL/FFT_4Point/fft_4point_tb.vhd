library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_FFT_4POINT is
end TB_FFT_4POINT;

architecture BEHAVIORAL of TB_FFT_4POINT is
    -- Component declaration for the FFT_4POINT module
    component FFT_4POINT
        Port (
            CLK      : in  STD_LOGIC;
            RESET    : in  STD_LOGIC;
            X0_REAL  : in  SIGNED(15 downto 0);
            X0_IMAG  : in  SIGNED(15 downto 0);
            X1_REAL  : in  SIGNED(15 downto 0);
            X1_IMAG  : in  SIGNED(15 downto 0);
            X2_REAL  : in  SIGNED(15 downto 0);
            X2_IMAG  : in  SIGNED(15 downto 0);
            X3_REAL  : in  SIGNED(15 downto 0);
            X3_IMAG  : in  SIGNED(15 downto 0);
            Y0_REAL  : out SIGNED(15 downto 0);
            Y0_IMAG  : out SIGNED(15 downto 0);
            Y1_REAL  : out SIGNED(15 downto 0);
            Y1_IMAG  : out SIGNED(15 downto 0);
            Y2_REAL  : out SIGNED(15 downto 0);
            Y2_IMAG  : out SIGNED(15 downto 0);
            Y3_REAL  : out SIGNED(15 downto 0);
            Y3_IMAG  : out SIGNED(15 downto 0)
        );
    end component;

    -- Testbench signals
    signal CLK      : STD_LOGIC := '0';
    signal RESET    : STD_LOGIC := '1';
    signal X0_REAL  : SIGNED(15 downto 0) := (others => '0');
    signal X0_IMAG  : SIGNED(15 downto 0) := (others => '0');
    signal X1_REAL  : SIGNED(15 downto 0) := (others => '0');
    signal X1_IMAG  : SIGNED(15 downto 0) := (others => '0');
    signal X2_REAL  : SIGNED(15 downto 0) := (others => '0');
    signal X2_IMAG  : SIGNED(15 downto 0) := (others => '0');
    signal X3_REAL  : SIGNED(15 downto 0) := (others => '0');
    signal X3_IMAG  : SIGNED(15 downto 0) := (others => '0');
    signal Y0_REAL  : SIGNED(15 downto 0);
    signal Y0_IMAG  : SIGNED(15 downto 0);
    signal Y1_REAL  : SIGNED(15 downto 0);
    signal Y1_IMAG  : SIGNED(15 downto 0);
    signal Y2_REAL  : SIGNED(15 downto 0);
    signal Y2_IMAG  : SIGNED(15 downto 0);
    signal Y3_REAL  : SIGNED(15 downto 0);
    signal Y3_IMAG  : SIGNED(15 downto 0);

    -- Clock period definition
    constant CLK_PERIOD : time := 10 ns;

begin
    -- Instantiate the FFT_4POINT module
    UUT: FFT_4POINT
        port map (
            CLK      => CLK,
            RESET    => RESET,
            X0_REAL  => X0_REAL,
            X0_IMAG  => X0_IMAG,
            X1_REAL  => X1_REAL,
            X1_IMAG  => X1_IMAG,
            X2_REAL  => X2_REAL,
            X2_IMAG  => X2_IMAG,
            X3_REAL  => X3_REAL,
            X3_IMAG  => X3_IMAG,
            Y0_REAL  => Y0_REAL,
            Y0_IMAG  => Y0_IMAG,
            Y1_REAL  => Y1_REAL,
            Y1_IMAG  => Y1_IMAG,
            Y2_REAL  => Y2_REAL,
            Y2_IMAG  => Y2_IMAG,
            Y3_REAL  => Y3_REAL,
            Y3_IMAG  => Y3_IMAG
        );

    -- Clock generation process
    CLK_PROCESS: process
    begin
        CLK <= '0';
        wait for CLK_PERIOD / 2;
        CLK <= '1';
        wait for CLK_PERIOD / 2;
    end process;

    -- Stimulus process
    STIM_PROCESS: process
    begin
        -- Hold reset for a few clock cycles
        RESET <= '1';
        wait for 3 * CLK_PERIOD;
        RESET <= '0';

        -- Define input signals (example values)
        X0_REAL <= to_signed(1000, 16);  -- Real part of X0
        X0_IMAG <= to_signed(0, 16);     -- Imaginary part of X0
        X1_REAL <= to_signed(-500, 16);  -- Real part of X1
        X1_IMAG <= to_signed(500, 16);   -- Imaginary part of X1
        X2_REAL <= to_signed(0, 16);     -- Real part of X2
        X2_IMAG <= to_signed(1000, 16);  -- Imaginary part of X2
        X3_REAL <= to_signed(500, 16);   -- Real part of X3
        X3_IMAG <= to_signed(-500, 16);  -- Imaginary part of X3

        -- Wait for the FFT computation to complete
        wait for 10 * CLK_PERIOD;

        -- Stop simulation
        wait;
    end process;
end BEHAVIORAL;