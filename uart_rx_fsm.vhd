-- uart_rx_fsm.vhd: UART controller - finite state machine controlling RX side
-- Author(s): Name Surname (xlogin00)


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;



entity UART_RX_FSM is
    port(
        CLK         : in  std_logic;
        RST         : in  std_logic;
        DIN         : in  std_logic;
        CLK_CNT     : in  std_logic_vector(3 downto 0);
        BIT_CNT     : in  std_logic_vector(3 downto 0);
        REG_ENABLE  : out std_logic;
        RST_REG     : out std_logic;
        DOUT_VLD    : out std_logic;
        RST_BIT     : out std_logic;
        INC_BIT     : out std_logic;
        RST_CLK_CNT : out std_logic
    );
end entity;


-- -- -- -- -- toto aby se daly reportovat vektory
-- library ieee;
-- use ieee.std_logic_1164.all;
-- use ieee.numeric_std.all;
-- library std;
-- use std.textio.all;

-- toto potrebuje ta funkce dole


architecture behavioral of UART_RX_FSM is

-- -- -- -- funkce na reportovani vektoru
--------------------------------------------------------------------------------
function to_string(vec: std_logic_vector) return string is
  variable result: string(vec'left + 1 downto 1);
begin
  for i in vec'reverse_range loop
    if (vec(i) = '1') then
      result(i + 1) := '1';
    elsif (vec(i) = '0') then
      result(i + 1) := '0';
    else
      result(i + 1) := 'X';
    end if;
  end loop;
  return result;
end function;
--------------------------------------------------------------------------------

type t_state is (IDLE, WAIT_FOR_MID, DATA, GO_IDLE);  -- seznam stavu
signal current_state : t_state;
signal next_state    : t_state;

begin

    process (CLK, RST)
    begin
        if (RST = '1') then
            current_state <= IDLE;
        elsif (rising_edge(CLK)) then
            current_state <= next_state;
        end if;
    end process;

    process (current_state, DIN, CLK_CNT, BIT_CNT)
    begin
        case current_state is

        -- stav IDLE
        when IDLE =>
            REG_ENABLE <= '0';
            RST_BIT <= '0';
            RST_REG <= '0';

            -- kdyz din je 0 resetuj CLK_CNT a prejdi do WAIT_FOR_MID
            if (DIN = '0') then
                RST_CLK_CNT <= '1';
                next_state <= WAIT_FOR_MID;
                -- report "IDLE: DIN je 0, resetuju CLK_CNT a prechazim do WAIT_FOR_MID"; 
            else
                DOUT_VLD <= '0';
                next_state <= IDLE;
                -- report "IDLE: DIN neni 0, CLK_CNT=" & to_string(CLK_CNT);
            end if;

        -- stav WAIF_ROR_MID
        when WAIT_FOR_MID =>
            REG_ENABLE <= '0';

            -- kdyz CLK_CNT je 6, resetuj ho a prejdi do DATA
            -- (automatu trva 3 takty nez nastavi REG_ENABLE na 1)
            -- datova cesta az k registru je ciste kombinacni takze tam toto
            -- neni potreba resit
            if (CLK_CNT = "0110") then
                RST_CLK_CNT <= '1';
                RST_REG <= '1';
                next_state <= DATA;
                -- report "WAIT_FOR_MID: CLK_CNT=1000 resetuju CLK_CNT a prechazim do DATA";
            else
                RST_CLK_CNT <= '0';
                next_state <= WAIT_FOR_MID;
                -- report "WAIT_FOR_MID: clk_cnt=" & to_string(CLK_CNT);
            end if;

        -- stav DATA
        when DATA =>
            RST_REG <= '0';
            RST_CLK_CNT <= '0';
            if (CLK_CNT = "1111") then
            -- report "DATA: CLK_CNT=1111 inkrementuji BIT_CNT";
                REG_ENABLE <= '1';
                INC_BIT <= '1';
            else
                REG_ENABLE <= '0';
                INC_BIT <= '0';
            end if;

            if (BIT_CNT = "1000") then
                -- report "DATA: CLK_CNT = " & to_string(CLK_CNT) & " BIT_CNT = " & to_string(BIT_CNT) & " prechazim do GO_IDLE";
                next_state <= GO_IDLE;
                DOUT_VLD <= '1';
            else
                -- report "DATA: CLK_CNT = " & to_string(CLK_CNT) & " BIT_CNT = " & to_string(BIT_CNT) & " pokracuju DATA";
                next_state <= DATA;
            end if;

        -- stav GO_IDLE
        when GO_IDLE =>
            -- report "GO_IDLE:";
            DOUT_VLD <= '0';
            RST_BIT <= '1';
            REG_ENABLE <= '0';
            if (DIN = '0') then
                -- report "GO_IDLE: cekam nez se linka nastavi na idle jednicku";
                next_state <= GO_IDLE;
            else
                -- report "GO_IDLE: din je 1 takze jdu do IDLE";
                next_state <= IDLE;
            end if;



        when others =>  -- nikdy nenastane (i hope)
            next_state <= IDLE;
        end case;
    end process;

end architecture;