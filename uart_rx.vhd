-- uart_rx.vhd: UART controller - receiving (RX) side
-- Author(s): Name Surname (xlogin00)

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;



-- Entity declaration (DO NOT ALTER THIS PART!)
entity UART_RX is
    port(
        CLK      : in std_logic;
        RST      : in std_logic;
        DIN      : in std_logic;
        DOUT     : out std_logic_vector(7 downto 0);
        DOUT_VLD : out std_logic
    );
end entity;


-- entita demultiplexor
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity DEMUX_4_8 is 
    port (
        DM_IN  : in std_logic;
        ADDR   : in std_logic_vector(3 downto 0);
        DM_OUT : out std_logic_vector(7 downto 0)
    );
end entity;


-- entita 4bit citac
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity COUNTER_4 is
    port(
        CNT_IN  : in std_logic;
        CNT_CE  : in std_logic;
        CNT_RES : in std_logic;
        CNT_OUT : out std_logic_vector(3 downto 0)
    );
end entity;


-- entita OR (8bit/8bit)
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity OR_8 is 
    port (
        OR_8_IN_1 : in std_logic_vector(7 downto 0);
        OR_8_IN_2 : in std_logic_vector(7 downto 0);
        OR_8_OUT : out std_logic_vector(7 downto 0)
    );
end entity;


-- entita registru
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity REG is
    port(
        REG_IN : in std_logic_vector(7 downto 0);
        REG_ENABLE : in std_logic;
        REG_VAL : out std_logic_vector(7 downto 0)
    );
end entity;


-- architektura registru
architecture behavioral of REG is

    -- signal ktery bude drzet hodnotu registru
    signal REG_VAL_SIG : std_logic_vector(7 downto 0);

begin

    -- proces na zmenu hodnoty registru
    process (REG_IN, REG_ENABLE)
    begin
        if (REG_ENABLE = '1') then
            REG_VAL_SIG <= REG_IN;
        end if;
    end process;

    -- prirazeni vystupu registru jeho hodnote (signal)
    REG_VAL <= REG_VAL_SIG;

end architecture;


-- architektura OR (8bit/8bit)
architecture behavioral of OR_8 is
begin
    
    OR_8_OUT(0) <= '1' when OR_8_IN_1(0) = '1' or OR_8_IN_2(0) = '1' else '0';
    OR_8_OUT(1) <= '1' when OR_8_IN_1(1) = '1' or OR_8_IN_2(1) = '1' else '0';
    OR_8_OUT(2) <= '1' when OR_8_IN_1(2) = '1' or OR_8_IN_2(2) = '1' else '0';
    OR_8_OUT(3) <= '1' when OR_8_IN_1(3) = '1' or OR_8_IN_2(3) = '1' else '0';
    OR_8_OUT(4) <= '1' when OR_8_IN_1(4) = '1' or OR_8_IN_2(4) = '1' else '0';
    OR_8_OUT(5) <= '1' when OR_8_IN_1(5) = '1' or OR_8_IN_2(5) = '1' else '0';
    OR_8_OUT(6) <= '1' when OR_8_IN_1(6) = '1' or OR_8_IN_2(6) = '1' else '0';
    OR_8_OUT(7) <= '1' when OR_8_IN_1(7) = '1' or OR_8_IN_2(7) = '1' else '0';

end architecture;


-- architektura 4bit citace
architecture behavioral of COUNTER_4 is 

-- tady je signal aby se z toho dalo i cist
signal CNT_SIG : std_logic_vector(3 downto 0) := "0000";

begin  -- architecture

    process(CNT_RES, CNT_IN, CNT_CE)
    begin  -- process

        -- reset counteru
        -- if (CNT_RES = '1') then 
        if (rising_edge(CNT_RES)) then 
            CNT_SIG <= "0000";
        end if;

        -- inkrement counteru
        if (rising_edge(CNT_IN) and CNT_CE = '1') then
            if (CNT_SIG = "1111") then
                CNT_SIG <= "0000";
            else
                CNT_SIG <= CNT_SIG + 1;
            end if;
        else
            CNT_SIG <= CNT_SIG;  -- toto tady musi byt
        end if;

    end process;

    CNT_OUT <= CNT_SIG;

end architecture;


-- architektura demultiplexoru
architecture behavioral of DEMUX_4_8 is 
begin
    -- tady to nevim jestli nejde nejak efektivneji
    DM_OUT(0) <= DM_IN when ADDR = "0000" else '0';
    DM_OUT(1) <= DM_IN when ADDR = "0001" else '0';
    DM_OUT(2) <= DM_IN when ADDR = "0010" else '0';
    DM_OUT(3) <= DM_IN when ADDR = "0011" else '0';
    DM_OUT(4) <= DM_IN when ADDR = "0100" else '0';
    DM_OUT(5) <= DM_IN when ADDR = "0101" else '0';
    DM_OUT(6) <= DM_IN when ADDR = "0110" else '0';
    DM_OUT(7) <= DM_IN when ADDR = "0111" else '0';
end architecture;







-- mam tady:
-- demultiplexor 1-8
-- 4bit citac
-- or 8/8
-- registr

-- Architecture implementation (INSERT YOUR IMPLEMENTATION HERE)
architecture behavioral of UART_RX is

    -- propojeni DMX a OR_8
    signal DMX_OUT : std_logic_vector(7 downto 0);

    -- propojeni FSM s prvky v obvode
    signal RST_CLK_CNT : std_logic;
    signal CLK_CNT     : std_logic_vector(3 downto 0);
    signal INC_BIT     : std_logic;
    signal RST_BIT     : std_logic;
    signal BIT_CNT     : std_logic_vector(3 downto 0);
    signal REG_ENABLE  : std_logic;
    signal RST_REG     : std_logic;


begin

    -- Instance of RX FSM
    fsm: entity work.UART_RX_FSM
    port map (
        CLK => CLK,
        RST => RST,
        DIN => DIN,
        RST_CLK_CNT => RST_CLK_CNT,
        CLK_CNT => CLK_CNT,
        INC_BIT => INC_BIT,
        RST_BIT => RST_BIT,
        BIT_CNT => BIT_CNT,
        REG_ENABLE => REG_ENABLE,
        RST_REG => RST_REG,
        DOUT_VLD => DOUT_VLD
    );

    -- instance: citac hodinoveho signalu
    cnt_clk: entity work.COUNTER_4
    port map (
        CNT_IN => CLK,
        CNT_CE => '1',
        CNT_RES => RST_CLK_CNT,
        CNT_OUT => CLK_CNT
    );

    DOUT <= (others => '0');

end architecture;
