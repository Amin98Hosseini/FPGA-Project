library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FFT_4POINT is
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
end FFT_4POINT;

architecture BEHAVIORAL of FFT_4POINT is
    signal STAGE1_0_REAL  : SIGNED(15 downto 0);
    signal STAGE1_0_IMAG  : SIGNED(15 downto 0);
    signal STAGE1_1_REAL  : SIGNED(15 downto 0);
    signal STAGE1_1_IMAG  : SIGNED(15 downto 0);
    signal STAGE1_2_REAL  : SIGNED(15 downto 0);
    signal STAGE1_2_IMAG  : SIGNED(15 downto 0);
    signal STAGE1_3_REAL  : SIGNED(15 downto 0);
    signal STAGE1_3_IMAG  : SIGNED(15 downto 0);

    signal STAGE2_0_REAL  : SIGNED(15 downto 0);
    signal STAGE2_0_IMAG  : SIGNED(15 downto 0);
    signal STAGE2_1_REAL  : SIGNED(15 downto 0);
    signal STAGE2_1_IMAG  : SIGNED(15 downto 0);
    signal STAGE2_2_REAL  : SIGNED(15 downto 0);
    signal STAGE2_2_IMAG  : SIGNED(15 downto 0);
    signal STAGE2_3_REAL  : SIGNED(15 downto 0);
    signal STAGE2_3_IMAG  : SIGNED(15 downto 0);

begin
    process(CLK, RESET)
    begin
        if RESET = '1' then
            -- Initialize all signals to zero
            STAGE1_0_REAL  <= (others => '0');
            STAGE1_0_IMAG  <= (others => '0');
            STAGE1_1_REAL  <= (others => '0');
            STAGE1_1_IMAG  <= (others => '0');
            STAGE1_2_REAL  <= (others => '0');
            STAGE1_2_IMAG  <= (others => '0');
            STAGE1_3_REAL  <= (others => '0');
            STAGE1_3_IMAG  <= (others => '0');

            STAGE2_0_REAL  <= (others => '0');
            STAGE2_0_IMAG  <= (others => '0');
            STAGE2_1_REAL  <= (others => '0');
            STAGE2_1_IMAG  <= (others => '0');
            STAGE2_2_REAL  <= (others => '0');
            STAGE2_2_IMAG  <= (others => '0');
            STAGE2_3_REAL  <= (others => '0');
            STAGE2_3_IMAG  <= (others => '0');

            Y0_REAL  <= (others => '0');
            Y0_IMAG  <= (others => '0');
            Y1_REAL  <= (others => '0');
            Y1_IMAG  <= (others => '0');
            Y2_REAL  <= (others => '0');
            Y2_IMAG  <= (others => '0');
            Y3_REAL  <= (others => '0');
            Y3_IMAG  <= (others => '0');

        elsif rising_edge(CLK) then
            -- Stage 1: Butterfly operations
            STAGE1_0_REAL  <= X0_REAL + X2_REAL;
            STAGE1_0_IMAG  <= X0_IMAG + X2_IMAG;
            STAGE1_1_REAL  <= X0_REAL - X2_REAL;
            STAGE1_1_IMAG  <= X0_IMAG - X2_IMAG;
            STAGE1_2_REAL  <= X1_REAL + X3_REAL;
            STAGE1_2_IMAG  <= X1_IMAG + X3_IMAG;
            STAGE1_3_REAL  <= X1_REAL - X3_REAL;
            STAGE1_3_IMAG  <= X1_IMAG - X3_IMAG;

            -- Stage 2: Butterfly operations
            STAGE2_0_REAL  <= STAGE1_0_REAL + STAGE1_2_REAL;
            STAGE2_0_IMAG  <= STAGE1_0_IMAG + STAGE1_2_IMAG;
            STAGE2_1_REAL  <= STAGE1_1_REAL + STAGE1_3_IMAG;
            STAGE2_1_IMAG  <= STAGE1_1_IMAG - STAGE1_3_REAL;
            STAGE2_2_REAL  <= STAGE1_0_REAL - STAGE1_2_REAL;
            STAGE2_2_IMAG  <= STAGE1_0_IMAG - STAGE1_2_IMAG;
            STAGE2_3_REAL  <= STAGE1_1_REAL - STAGE1_3_IMAG;
            STAGE2_3_IMAG  <= STAGE1_1_IMAG + STAGE1_3_REAL;

            -- Output the results
            Y0_REAL  <= STAGE2_0_REAL;
            Y0_IMAG  <= STAGE2_0_IMAG;
            Y1_REAL  <= STAGE2_1_REAL;
            Y1_IMAG  <= STAGE2_1_IMAG;
            Y2_REAL  <= STAGE2_2_REAL;
            Y2_IMAG  <= STAGE2_2_IMAG;
            Y3_REAL  <= STAGE2_3_REAL;
            Y3_IMAG  <= STAGE2_3_IMAG;
        end if;
    end process;
end BEHAVIORAL;