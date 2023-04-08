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

entity counter_4 is
  port (
    cnt_in : in std_logic;
    cnt_ce : in std_logic;
    cnt_res : in std_logic;
    cnt_out : out std_logic_vector (3 downto 0));
end entity counter_4;

architecture rtl of counter_4 is
  signal cnt_sig : std_logic_vector (3 downto 0);
  signal n57_o : std_logic;
  signal n60_o : std_logic;
  signal n62_o : std_logic_vector (3 downto 0);
  signal n64_o : std_logic_vector (3 downto 0);
  signal n67_o : std_logic_vector (3 downto 0);
  signal n68_q : std_logic_vector (3 downto 0) := "0000";
begin
  cnt_out <= cnt_sig;
  -- uart_rx.vhd:50:8
  cnt_sig <= n68_q; -- (isignal)
  -- uart_rx.vhd:64:13
  n57_o <= '1' when rising_edge (cnt_in) else '0';
  -- uart_rx.vhd:65:25
  n60_o <= '1' when cnt_sig = "1111" else '0';
  -- uart_rx.vhd:68:36
  n62_o <= std_logic_vector (unsigned (cnt_sig) + unsigned'("0001"));
  -- uart_rx.vhd:65:13
  n64_o <= n62_o when n60_o = '0' else "0000";
  -- uart_rx.vhd:38:8
  n67_o <= cnt_sig when cnt_ce = '0' else n64_o;
  -- uart_rx.vhd:64:9
  process (cnt_in)
  begin
    if rising_edge (cnt_in) then
      n68_q <= n67_o;
    end if;
  end process;
end rtl;

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
  signal n18_o : std_logic;
  signal n19_o : std_logic;
  signal n22_o : std_logic;
  signal n23_o : std_logic;
  signal n26_o : std_logic;
  signal n27_o : std_logic;
  signal n30_o : std_logic;
  signal n31_o : std_logic;
  signal n34_o : std_logic;
  signal n35_o : std_logic;
  signal n38_o : std_logic;
  signal n39_o : std_logic;
  signal n42_o : std_logic;
  signal n43_o : std_logic;
  signal n46_o : std_logic;
  signal n47_o : std_logic;
  signal n49_o : std_logic_vector (7 downto 0);
begin
  dm_out <= n49_o;
  -- uart_rx.vhd:84:34
  n18_o <= '1' when addr = "0000" else '0';
  -- uart_rx.vhd:84:24
  n19_o <= '0' when n18_o = '0' else dm_in;
  -- uart_rx.vhd:85:34
  n22_o <= '1' when addr = "0001" else '0';
  -- uart_rx.vhd:85:24
  n23_o <= '0' when n22_o = '0' else dm_in;
  -- uart_rx.vhd:86:34
  n26_o <= '1' when addr = "0010" else '0';
  -- uart_rx.vhd:86:24
  n27_o <= '0' when n26_o = '0' else dm_in;
  -- uart_rx.vhd:87:34
  n30_o <= '1' when addr = "0011" else '0';
  -- uart_rx.vhd:87:24
  n31_o <= '0' when n30_o = '0' else dm_in;
  -- uart_rx.vhd:88:34
  n34_o <= '1' when addr = "0100" else '0';
  -- uart_rx.vhd:88:24
  n35_o <= '0' when n34_o = '0' else dm_in;
  -- uart_rx.vhd:89:34
  n38_o <= '1' when addr = "0101" else '0';
  -- uart_rx.vhd:89:24
  n39_o <= '0' when n38_o = '0' else dm_in;
  -- uart_rx.vhd:90:34
  n42_o <= '1' when addr = "0110" else '0';
  -- uart_rx.vhd:90:24
  n43_o <= '0' when n42_o = '0' else dm_in;
  -- uart_rx.vhd:91:34
  n46_o <= '1' when addr = "0111" else '0';
  -- uart_rx.vhd:91:24
  n47_o <= '0' when n46_o = '0' else dm_in;
  n49_o <= n47_o & n43_o & n39_o & n35_o & n31_o & n27_o & n23_o & n19_o;
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
  signal dmx_address : std_logic_vector (3 downto 0);
  signal fsm_test_out : std_logic;
  signal dmx_dm_out : std_logic_vector (7 downto 0);
  signal cnt_cnt_out : std_logic_vector (3 downto 0);
  constant n6_o : std_logic := '1';
  signal n10_o : std_logic;
begin
  wrap_clk <= clk;
  wrap_rst <= rst;
  wrap_din <= din;
  dout <= wrap_dout;
  dout_vld <= wrap_dout_vld;
  wrap_DOUT <= dmx_dm_out;
  wrap_DOUT_VLD <= fsm_test_out;
  -- uart_rx.vhd:103:12
  din_not <= n10_o; -- (isignal)
  -- uart_rx.vhd:106:12
  dmx_address <= cnt_cnt_out; -- (isignal)
  -- uart_rx.vhd:111:5
  fsm : entity work.uart_rx_fsm port map (
    clk => wrap_CLK,
    rst => wrap_RST,
    start_bit => din_not,
    test_out => fsm_test_out);
  -- uart_rx.vhd:120:5
  dmx : entity work.demux_4_8 port map (
    dm_in => wrap_DIN,
    addr => dmx_address,
    dm_out => dmx_dm_out);
  -- uart_rx.vhd:128:5
  cnt : entity work.counter_4 port map (
    cnt_in => wrap_CLK,
    cnt_ce => n6_o,
    cnt_res => wrap_CLK,
    cnt_out => cnt_cnt_out);
  -- uart_rx.vhd:139:20
  n10_o <= not wrap_DIN;
end rtl;
