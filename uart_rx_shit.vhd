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


-- entita AND (8+1bit/8bit)
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity AND_8_1 is 
    port (
        AND_8_IN_1 : in std_logic_vector(7 downto 0);
        AND_8_IN_2 : in std_logic;
        AND_8_OUT : out std_logic_vector(7 downto 0)
    );
end entity;


-- entita OR (2 vstupy)
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity OR_2 is 
    port(
        OR_IN_1 : in std_logic;
        OR_IN_2 : in std_logic;
        OR_OUT : out std_logic
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



-- architektura OR (2 vstupy)
architecture behavioral of OR_2 is
begin
    OR_OUT <= '1' when OR_IN_1 = '1' or OR_IN_2 = '1' else '0';
end architecture;



-- architektura AND (8+1bit/8bit)
-- veme kazdy bit z prvniho vstupu (vektoru) a udela and s druhym vstupem
-- timto udela jakysi 'enable'. cely vektor bude bud puvodni nebo bude 0
architecture behavioral of AND_8_1 is
begin
    AND_8_OUT(0) <= '1' when AND_8_IN_1(0) = '1' and AND_8_IN_2 = '1'
    else '0';
    AND_8_OUT(1) <= '1' when AND_8_IN_1(1) = '1' and AND_8_IN_2 = '1'
    else '0';
    AND_8_OUT(2) <= '1' when AND_8_IN_1(2) = '1' and AND_8_IN_2 = '1'
    else '0';
    AND_8_OUT(3) <= '1' when AND_8_IN_1(3) = '1' and AND_8_IN_2 = '1'
    else '0';
    AND_8_OUT(4) <= '1' when AND_8_IN_1(4) = '1' and AND_8_IN_2 = '1'
    else '0';
    AND_8_OUT(5) <= '1' when AND_8_IN_1(5) = '1' and AND_8_IN_2 = '1'
    else '0';
    AND_8_OUT(6) <= '1' when AND_8_IN_1(6) = '1' and AND_8_IN_2 = '1'
    else '0';
    AND_8_OUT(7) <= '1' when AND_8_IN_1(7) = '1' and AND_8_IN_2 = '1'
    else '0';

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
    AND_OUT <= '1' when AND_IN_1 = '1' and AND_IN_2 = '1' else '0';
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

    -- propojeni DMX a OR8
    signal DMX_OUT : std_logic_vector(7 downto 0);

    -- propojeni nove hodnoty registru s tim divnym andem
    signal NEW_REG_VAL_1 : std_logic_vector(7 downto 0);

    -- nova hodnota registru po tom divnem andu
    signal NEW_REG_VAL_2 : std_logic_vector(7 downto 0);

    -- hodnota registru
    signal CURR_REG_VAL : std_logic_vector(7 downto 0);

    -- vystup toho oru na REG_ENABLE
    signal REG_ENABLE : std_logic;

    -- vystup FSM RES_REG
    signal RES_REG : std_logic;

    -- negace vystupu FSM RES_REG
    signal NOT_RES_REG : std_logic;

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
        DOUT_VALID => DOUT_VLD,
        RES_REG => RES_REG
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
        DM_OUT => DMX_OUT
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


    -- instance OR_8
    or8: entity work.OR_8
    port map (
        OR_8_IN_1 => DMX_OUT,
        OR_8_IN_2 => CURR_REG_VAL,
        OR_8_OUT => NEW_REG_VAL_1
    );

    -- instance AND_8_1
    and81: entity work.AND_8_1
    port map (
        AND_8_IN_1 => NEW_REG_VAL_1,
        AND_8_IN_2 => NOT_RES_REG,
        AND_8_OUT => NEW_REG_VAL_2
    );

    -- instance registru
    registr: entity work.REG
    port map (
        REG_IN => NEW_REG_VAL_2,
        REG_ENABLE => REG_ENABLE,
        REG_VAL => CURR_REG_VAL
    );

    -- process co pri zmene DIN zmeni signal DIN_NOT
    process (DIN)
    begin
        DIN_NOT <= not DIN;
    end process;

    -- proces co updatuje signal NOT_RES_REG kdyz se zmeni RES_REG
    process (RES_REG)
    begin
        NOT_RES_REG <= not RES_REG;
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


    -- tady ten komentar smazat protoze je tam to s tou natkou tak
    -- to nemuzu commitnout (also otherwise je to trapny) protoze co 
    -- kdybych to chtel nekdy publishnout na githubu
    --
    --- tak jo takze vezte ze se z toho stala ultimatni sracka vsechno jde 
    --- podle planu darilo se mi psat to co jsem mel na mysli a potlacit
    --- vsechny compiler errory ale to co ukazuje gtkwave je ALARMUJICI 
    --- protoze kdyz obcas neco pripojim treba na dout tak dout je 
    --- proste rovna cara v nule a to i kdyz tam proste pripojim neco 
    --- co fungovalo takze je to v pici protoze ja jsem tady sice 8 hodin 
    --- pracuju na necem ale ono to nefunguje takze if thats the case 
    --- tak se jdu asi legit zabit protoze vole to sem mohl delat tisic 
    --- lepsich veci no ale tak to dodelam a uvidime co pak no jako nevim 
    --- jak to ASI budu debugovat kdyz uz mam ted vole 450 radku jakoze 
    --- to ty pico ti jebe na kebulu ne co mam delat s tim dopice a tedka 
    --- pojedu do brna uz zacne skola a ja na to mam nulovou casovou rezervu 
    --- proste vsechno je v pici legit prisaham jo a taky jsem si u tohodle
    --- vzpomnel na natalii perkovou perkovou jako co by se asi stalo 
    --- kdybych odevzdal projekt kterej nefunguje ona taky odevzdala 
    --- projekt do izp kterej vyhodil minimalne 5 erroru takze nesel 
    --- prelozit no tak co kdybych ja proste odevzdal tady tohle ono 
    --- to sice vubec nefungovalo ale ja bych rekl noo haa ale divejte 
    --- ja jsem si s tim dal praci ma to 500 radku divejte akorat 
    --- v izp bylo potreba na zapocet 1/14 bodu no tady u toho je 
    --- potreba 5/20 well FUCK

end architecture;
