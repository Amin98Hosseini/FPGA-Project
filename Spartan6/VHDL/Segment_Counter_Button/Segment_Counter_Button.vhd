library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Debounce_Counter is
    Port ( clk          : in  STD_LOGIC;
           btn          : in  STD_LOGIC;
           seven_seg    : out STD_LOGIC_VECTOR (7 downto 0));
end Debounce_Counter;

architecture Behavioral of Debounce_Counter is
    signal count       : UNSIGNED (3 downto 0) := "0000";
    signal btn_state  : STD_LOGIC := '1';
    signal debounce_cnt : UNSIGNED (19 downto 0) := (others => '0');
begin

    process(clk)
    begin
        if rising_edge(clk) then
                -- Debounce logic
                if btn = '0' and btn_state = '1' then
                    debounce_cnt <= debounce_cnt + 1;
                    if debounce_cnt >= to_unsigned(500000, debounce_cnt'length) then  -- Adjust for ~10ms debounce time
                        btn_state <= '0';
                        if count = "1001" then
                            count <= "0000"; -- Reset after 9
                        else
                            count <= count + 1;
                        end if;
                        debounce_cnt <= (others => '0');
                    end if;
                elsif btn = '1' then
                    btn_state <= '1';
                    debounce_cnt <= (others => '0');
                end if;
        end if;
    end process;
    
    -- Instantiate 7-segment display decoder
    process(clk)
    begin
        if rising_edge(clk) then
            case count is
                when "0000" => seven_seg <= "00111111";
                when "0001" => seven_seg <= "00000110";
                when "0010" => seven_seg <= "01011011";
                when "0011" => seven_seg <= "01001111";
                when "0100" => seven_seg <= "01100110";
                when "0101" => seven_seg <= "01101101";
                when "0110" => seven_seg <= "01111101";
                when "0111" => seven_seg <= "00000111";
                when "1000" => seven_seg <= "01111111";
                when "1001" => seven_seg <= "01100111";
                when others => seven_seg <= "00000000";
            end case;
        end if;
    end process;

end Behavioral;
