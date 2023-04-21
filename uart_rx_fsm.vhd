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
type t_state is (STAV_1, STAV_2, STAV_3);  -- seznam stavů
begin


end architecture;
