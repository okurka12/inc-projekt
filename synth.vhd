library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity UART_RX is
  port (
    CLK: in std_logic;
    RST: in std_logic;
    DIN: in std_logic;
    DOUT: out std_logic_vector (7 downto 0);
    DOUT_VLD: out std_logic
  );
end entity;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uart_rx_fsm is
  port (
    clk : in std_logic;
    rst : in std_logic;
    start_bit : in std_logic;
    test_out : out std_logic);
end entity uart_rx_fsm;

architecture rtl of uart_rx_fsm is
begin
  test_out <= start_bit;
end rtl;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture rtl of uart_rx is
  signal wrap_CLK: std_logic;
  signal wrap_RST: std_logic;
  signal wrap_DIN: std_logic;
  subtype typwrap_DOUT is std_logic_vector (7 downto 0);
  signal wrap_DOUT: typwrap_DOUT;
  signal wrap_DOUT_VLD: std_logic;
  signal din_not : std_logic;
  signal fsm_test_out : std_logic;
  signal n6_o : std_logic;
  constant n8_o : std_logic_vector (7 downto 0) := "00000000";
begin
  wrap_clk <= clk;
  wrap_rst <= rst;
  wrap_din <= din;
  dout <= wrap_dout;
  dout_vld <= wrap_dout_vld;
  wrap_DOUT <= n8_o;
  wrap_DOUT_VLD <= fsm_test_out;
  -- uart_rx.vhd:30:12
  din_not <= n6_o; -- (isignal)
  -- uart_rx.vhd:35:5
  fsm : entity work.uart_rx_fsm port map (
    clk => wrap_CLK,
    rst => wrap_RST,
    start_bit => din_not,
    test_out => fsm_test_out);
  -- uart_rx.vhd:46:20
  n6_o <= not wrap_DIN;
end rtl;
