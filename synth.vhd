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

entity demux_4_8 is
  port (
    dm_in : in std_logic;
    addr : in std_logic_vector (3 downto 0);
    dm_out : out std_logic_vector (7 downto 0));
end entity demux_4_8;

architecture rtl of demux_4_8 is
  signal n16_o : std_logic;
  signal n17_o : std_logic;
  signal n20_o : std_logic;
  signal n21_o : std_logic;
  signal n24_o : std_logic;
  signal n25_o : std_logic;
  signal n28_o : std_logic;
  signal n29_o : std_logic;
  signal n32_o : std_logic;
  signal n33_o : std_logic;
  signal n36_o : std_logic;
  signal n37_o : std_logic;
  signal n40_o : std_logic;
  signal n41_o : std_logic;
  signal n44_o : std_logic;
  signal n45_o : std_logic;
  signal n47_o : std_logic_vector (7 downto 0);
begin
  dm_out <= n47_o;
  -- uart_rx.vhd:38:34
  n16_o <= '1' when addr = "0000" else '0';
  -- uart_rx.vhd:38:24
  n17_o <= '0' when n16_o = '0' else dm_in;
  -- uart_rx.vhd:39:34
  n20_o <= '1' when addr = "0001" else '0';
  -- uart_rx.vhd:39:24
  n21_o <= '0' when n20_o = '0' else dm_in;
  -- uart_rx.vhd:40:34
  n24_o <= '1' when addr = "0010" else '0';
  -- uart_rx.vhd:40:24
  n25_o <= '0' when n24_o = '0' else dm_in;
  -- uart_rx.vhd:41:34
  n28_o <= '1' when addr = "0011" else '0';
  -- uart_rx.vhd:41:24
  n29_o <= '0' when n28_o = '0' else dm_in;
  -- uart_rx.vhd:42:34
  n32_o <= '1' when addr = "0100" else '0';
  -- uart_rx.vhd:42:24
  n33_o <= '0' when n32_o = '0' else dm_in;
  -- uart_rx.vhd:43:34
  n36_o <= '1' when addr = "0101" else '0';
  -- uart_rx.vhd:43:24
  n37_o <= '0' when n36_o = '0' else dm_in;
  -- uart_rx.vhd:44:34
  n40_o <= '1' when addr = "0110" else '0';
  -- uart_rx.vhd:44:24
  n41_o <= '0' when n40_o = '0' else dm_in;
  -- uart_rx.vhd:45:34
  n44_o <= '1' when addr = "0111" else '0';
  -- uart_rx.vhd:45:24
  n45_o <= '0' when n44_o = '0' else dm_in;
  n47_o <= n45_o & n41_o & n37_o & n33_o & n29_o & n25_o & n21_o & n17_o;
end rtl;

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
  signal dmx_dm_out : std_logic_vector (7 downto 0);
  constant n4_o : std_logic_vector (3 downto 0) := "0010";
  signal n8_o : std_logic;
begin
  wrap_clk <= clk;
  wrap_rst <= rst;
  wrap_din <= din;
  dout <= wrap_dout;
  dout_vld <= wrap_dout_vld;
  wrap_DOUT <= dmx_dm_out;
  wrap_DOUT_VLD <= fsm_test_out;
  -- uart_rx.vhd:57:12
  din_not <= n8_o; -- (isignal)
  -- uart_rx.vhd:62:5
  fsm : entity work.uart_rx_fsm port map (
    clk => wrap_CLK,
    rst => wrap_RST,
    start_bit => din_not,
    test_out => fsm_test_out);
  -- uart_rx.vhd:71:5
  dmx : entity work.demux_4_8 port map (
    dm_in => wrap_DIN,
    addr => n4_o,
    dm_out => dmx_dm_out);
  -- uart_rx.vhd:81:20
  n8_o <= not wrap_DIN;
end rtl;
