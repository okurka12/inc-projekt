-- uart_rx.vhd: UART controller - receiving (RX) side
-- Author(s): Vit Pavlik (xpavli0a)

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

-- entita EQ (vizte navrh)
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity EQ_4 is 
    port(
        EQ_IN_1 : in std_logic_vector(3 downto 0);
        EQ_IN_2 : in std_logic_vector(3 downto 0);
        EQ_OUT : out std_logic 
    );
end entity;


-- entita AND (2 vstupy)
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity AND_2 is 
    port(
        AND_IN_1 : in std_logic;
        AND_IN_2 : in std_logic;
        AND_OUT : out std_logic
    );
end entity;


-- entita SUB_4 (4bit)
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity SUB_4 is
    port(
        SUB_4_MIN : in std_logic_vector(3 downto 0);  -- minuend
        SUB_4_SUB : in std_logic_vector(3 downto 0);  -- subtrahend
        SUB_4_OUT : out std_logic_vector(3 downto 0)
    );
end entity;


-- architektura SUB (4bit)
architecture behavioral of SUB_4 is
begin
    process(SUB_4_MIN, SUB_4_SUB)
    begin
        SUB_4_OUT <= SUB_4_MIN - SUB_4_SUB;
    end process;
end architecture;


-- architektura AND (2 vstupy)
architecture behavioral of AND_2 is
begin
    process (AND_IN_1, AND_IN_2)
    begin
        AND_OUT <= '0';
        if (AND_IN_1 = '1' and AND_IN_2 = '1') then
            AND_OUT <= '1';
        end if;
    end process;
end architecture;


-- architektura EQ
architecture behavioral of EQ_4 is 
begin
    process (EQ_IN_1, EQ_IN_2)
    begin
        if (EQ_IN_1 = EQ_IN_2) then
            EQ_OUT <= '1';
        else
            EQ_OUT <= '0';
        end if;
    end process;
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


-- Architecture implementation (INSERT YOUR IMPLEMENTATION HERE)
architecture behavioral of UART_RX is

    -- konstantni signal pro inverzi DIN
    signal DIN_NOT : std_logic := not '0';

    -- signal pro adresu DMX (bude o 1 vetsi nez adresa vizte navrh)
    signal DMX_ADDRESS : std_logic_vector(3 downto 0) := "0000";

    -- signal pro adresu DMX (bude o 1 vetsi nez adresa vizte navrh)
    signal DMX_ADDRESS_SUB : std_logic_vector(3 downto 0) := "0000";

    -- vystup citace hodinoveho cyklu
    signal CLK_CNT : std_logic_vector(3 downto 0) := "0000";

    -- vystup EQ (clk == 15)
    signal CNT_CLK_EQ_15 : std_logic;

    -- propojeni FSM a cnt_clk
    signal CNT_CLK_RES : std_logic;
    signal CNT_CLK_CE : std_logic;

    -- propojeni FSM a EQ (clk == 7)
    signal CNT_CLK_EQ_7 : std_logic;

    -- propojeni FSM a CNT (bits)
    signal RES_BIT_CNT : std_logic;

    -- propojeni FSM a EQ (bits == 8)
    signal BITS_EQ_8 : std_logic;

begin

    -- Instance of RX FSM
    fsm: entity work.UART_RX_FSM
    port map (
        CLK => CLK,
        RST => RST,
        START_BIT => DIN_NOT,
        CE => CNT_CLK_CE,
        RES => CNT_CLK_RES,
        CNT7 => CNT_CLK_EQ_7,
        RX_END => BITS_EQ_8,
        RES_BIT_CNT => RES_BIT_CNT,
        DOUT_VALID => DOUT_VLD
    );

    -- instance EQ pro CLK == 15
    clk_eq_15: entity work.EQ_4
    port map (
        EQ_IN_1 => CLK_CNT,
        EQ_IN_2 => "1111",
        EQ_OUT => CNT_CLK_EQ_15
    );

    -- instance EQ pro CLK == 7
    clk_eq_7: entity work.EQ_4
    port map (
        EQ_IN_1 => CLK_CNT,
        EQ_IN_2 => "0111",
        EQ_OUT => CNT_CLK_EQ_7
    );

    -- instance demultiplexoru podle navrhu
    dmx: entity work.DEMUX_4_8
    port map(
        DM_IN => DIN,
        ADDR => DMX_ADDRESS_SUB,
        DM_OUT => DOUT
    );

    -- instance: citac hodinoveho signalu
    cnt_clk: entity work.COUNTER_4
    port map (
        CNT_IN => CLK,
        CNT_CE => CNT_CLK_CE,
        CNT_RES => CNT_CLK_RES,
        CNT_OUT => CLK_CNT
    );

    -- instance: citac bitu (bits)
    cnt_bits: entity work.COUNTER_4
    port map (
        CNT_IN => CNT_CLK_EQ_15,
        CNT_CE => '1',
        CNT_RES => RES_BIT_CNT,
        CNT_OUT => DMX_ADDRESS
    );

    -- instance SUB
    sub: entity work.SUB_4
    port map (
        SUB_4_MIN => DMX_ADDRESS,
        SUB_4_SUB => "0001",
        SUB_4_OUT => DMX_ADDRESS_SUB
    );

    -- instance EQ (bits == 8)
    bits_eq: entity work.EQ_4
    port map (
        EQ_IN_1 => DMX_ADDRESS,
        EQ_IN_2 => "1000",
        EQ_OUT => BITS_EQ_8
    );

    -- process co pri zmene DIN zmeni signal DIN_NOT
    process (DIN)
    begin
        DIN_NOT <= not DIN;
    end process;

    -- toto tu bylo puvodne
    -- DOUT <= (others => '0');
    -- DOUT_VLD <= '0';

    -- takze kamaradickove vezte ze uz mam pocit ze vim co delam takze 
    -- pecicka akorat s tim bude jeste dost prace ale jsem podle me 
    -- mega dobrej ze jsem na to prisel sam takze vis co
    -- uz akorat postupovat podle navrhu no je fakt ze ten kdybych neudelal
    -- tak jsem ted ztracen ale nastesti ho mam i kdyz za 0 bodu!!!!!!!!
    -- proste postup je takovy, ze deklaruji entitu, definuju jeji chovani
    -- (architecture behavioral) a pak v te hlavni architekture vsechno
    -- pospojuji tim ze tam ty ruzne entity dam jakozto instance 
    -- a vsechno to pospojuji. kdyz je potreba udelat propojeni mezi instancemi
    -- tak je na to potreba signal coz je takova ficurka tohoto
    -- hardware popisujiciho jazyka no nic po 4 hodinach koncim praci tady na 
    -- tomto skvelem projektu a jdu se ucit isu peace out

end architecture;
