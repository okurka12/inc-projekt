-- uart_rx_fsm.vhd: UART controller - finite state machine controlling RX side
-- Author(s): Name Surname (xlogin00)

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;



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



architecture behavioral of UART_RX_FSM is

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
            RST_BIT <= '0'; ------------
            RST_REG <= '0'; ------------
            
            -- kdyz din je 0 resetuj CLK_CNT a prejdi do WAIT_FOR_MID
            if (DIN = '0') then
                RST_CLK_CNT <= '1';
                next_state <= WAIT_FOR_MID;
            else
                DOUT_VLD <= '0';
                next_state <= IDLE;
            end if;

        when WAIT_FOR_MID =>
            if (CLK_CNT = "1000") then
                RST_CLK_CNT <= '1';
                next_state <= DATA;
            else
                RST_CLK_CNT <= '0';
                next_state <= WAIT_FOR_MID;
            end if;

        when DATA =>
            if (CLK_CNT = "1111") then
                REG_ENABLE <= '1';
                INC_BIT <= '1';
            else
                REG_ENABLE <= '0';
                INC_BIT <= '0';
            end if;
            
            if (BIT_CNT = "1000") then
                next_state <= GO_IDLE;
                DOUT_VLD <= '1';
            else
                next_state <= DATA;
            end if;

        when GO_IDLE =>
            DOUT_VLD <= '0';
            RST_REG <= '1';
            RST_BIT <= '1';
            next_state <= IDLE;



        when others =>
            next_state <= IDLE;
        end case;
    end process;

end architecture;
