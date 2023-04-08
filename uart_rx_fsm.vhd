-- uart_rx_fsm.vhd: UART controller - finite state machine controlling RX side
-- Author(s): Name Surname (xlogin00)

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;



entity UART_RX_FSM is
    port(
       CLK : in std_logic;
       RST : in std_logic;
       START_BIT : in std_logic;
       TEST_OUT : out std_logic
    );
end entity;



architecture behavioral of UART_RX_FSM is
type t_state is (STAV_1, STAV_2, STAV_3);  -- seznam stavů
begin

    -- tento process pri zmene vstupu START_BIT zmeni taky TEST_OUT
    process (START_BIT)
    begin
        TEST_OUT <= START_BIT;
    end process;

end architecture;
