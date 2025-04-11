library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Sequence_Detector is
    Port (
        Input  : in  std_logic;  -- Serial input bit
        Clock  : in  std_logic;  -- Clock signal
        Reset  : in  std_logic;  -- Reset signal
        Alarm  : out std_logic   -- Output alarm signal
    );
end Sequence_Detector;

architecture Behavioral of Sequence_Detector is

    -- Shift register to store the last 5 bits
    signal Shift_Reg : std_logic_vector(4 downto 0) := (others => '0');

begin

    process(Clock, Reset)
    begin
        if Reset = '1' then
            -- Reset the shift register and alarm
            Shift_Reg <= (others => '0');
            Alarm <= '0';
        elsif rising_edge(Clock) then
            -- Shift the input bit into the shift register
            Shift_Reg <= Shift_Reg(3 downto 0) & Input;

            -- Check if the pattern "10011" is detected
            if Shift_Reg = "10011" then
                Alarm <= '1';  -- Set alarm high for one clock cycle
            else
                Alarm <= '0';  -- Keep alarm low
            end if;
        end if;
    end process;

end Behavioral;