-- uart_rx_fsm.vhd: UART controller - finite state machine controlling RX side
-- Author(s): Name Surname (xlogin00)

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;



entity UART_RX_FSM is
    port(
        CLK         : in  std_logic;
        RST         : in  std_logic;
        START_BIT   : in  std_logic;
        CE          : out std_logic;
        RES         : out std_logic;
        CNT7        : in  std_logic;
        RX_END      : in  std_logic;
        RES_BIT_CNT : out std_logic;
        RES_REG     : out std_logic;
        DOUT_VALID  : out std_logic
    );
end entity;



architecture behavioral of UART_RX_FSM is
type t_state is (STAV_1, STAV_2, STAV_3);  -- seznam stavů
begin


end architecture;
