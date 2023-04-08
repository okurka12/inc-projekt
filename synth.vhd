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
  signal n67_o : std_logic;
  signal n70_o : std_logic;
  signal n72_o : std_logic_vector (3 downto 0);
  signal n74_o : std_logic_vector (3 downto 0);
  signal n77_o : std_logic_vector (3 downto 0);
  signal n78_q : std_logic_vector (3 downto 0) := "0000";
begin
  cnt_out <= cnt_sig;
  -- uart_rx.vhd:79:8
  cnt_sig <= n78_q; -- (isignal)
  -- uart_rx.vhd:93:13
  n67_o <= '1' when rising_edge (cnt_in) else '0';
  -- uart_rx.vhd:94:25
  n70_o <= '1' when cnt_sig = "1111" else '0';
  -- uart_rx.vhd:97:36
  n72_o <= std_logic_vector (unsigned (cnt_sig) + unsigned'("0001"));
  -- uart_rx.vhd:94:13
  n74_o <= n72_o when n70_o = '0' else "0000";
  -- uart_rx.vhd:39:8
  n77_o <= cnt_sig when cnt_ce = '0' else n74_o;
  -- uart_rx.vhd:93:9
  process (cnt_in)
  begin
    if rising_edge (cnt_in) then
      n78_q <= n77_o;
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
  signal n48_o : std_logic;
  signal n49_o : std_logic;
  signal n52_o : std_logic;
  signal n53_o : std_logic;
  signal n56_o : std_logic;
  signal n57_o : std_logic;
  signal n59_o : std_logic_vector (7 downto 0);
begin
  dm_out <= n59_o;
  -- uart_rx.vhd:114:34
  n28_o <= '1' when addr = "0000" else '0';
  -- uart_rx.vhd:114:24
  n29_o <= '0' when n28_o = '0' else dm_in;
  -- uart_rx.vhd:115:34
  n32_o <= '1' when addr = "0001" else '0';
  -- uart_rx.vhd:115:24
  n33_o <= '0' when n32_o = '0' else dm_in;
  -- uart_rx.vhd:116:34
  n36_o <= '1' when addr = "0010" else '0';
  -- uart_rx.vhd:116:24
  n37_o <= '0' when n36_o = '0' else dm_in;
  -- uart_rx.vhd:117:34
  n40_o <= '1' when addr = "0011" else '0';
  -- uart_rx.vhd:117:24
  n41_o <= '0' when n40_o = '0' else dm_in;
  -- uart_rx.vhd:118:34
  n44_o <= '1' when addr = "0100" else '0';
  -- uart_rx.vhd:118:24
  n45_o <= '0' when n44_o = '0' else dm_in;
  -- uart_rx.vhd:119:34
  n48_o <= '1' when addr = "0101" else '0';
  -- uart_rx.vhd:119:24
  n49_o <= '0' when n48_o = '0' else dm_in;
  -- uart_rx.vhd:120:34
  n52_o <= '1' when addr = "0110" else '0';
  -- uart_rx.vhd:120:24
  n53_o <= '0' when n52_o = '0' else dm_in;
  -- uart_rx.vhd:121:34
  n56_o <= '1' when addr = "0111" else '0';
  -- uart_rx.vhd:121:24
  n57_o <= '0' when n56_o = '0' else dm_in;
  n59_o <= n57_o & n53_o & n49_o & n45_o & n41_o & n37_o & n33_o & n29_o;
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity eq_4 is
  port (
    eq_in_1 : in std_logic_vector (3 downto 0);
    eq_in_2 : in std_logic_vector (3 downto 0);
    eq_out : out std_logic);
end entity eq_4;

architecture rtl of eq_4 is
  signal n21_o : std_logic;
  signal n24_o : std_logic;
begin
  eq_out <= n24_o;
  -- uart_rx.vhd:66:21
  n21_o <= '1' when eq_in_1 = eq_in_2 else '0';
  -- uart_rx.vhd:66:9
  n24_o <= '0' when n21_o = '0' else '1';
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
  signal clk_cnt : std_logic_vector (3 downto 0);
  signal fsm_test_out : std_logic;
  signal clk_eq_15_eq_out : std_logic;
  constant n5_o : std_logic_vector (3 downto 0) := "1111";
  signal dmx_dm_out : std_logic_vector (7 downto 0);
  signal cnt_clk_cnt_out : std_logic_vector (3 downto 0);
  constant n8_o : std_logic := '1';
  signal n12_o : std_logic;
begin
  wrap_clk <= clk;
  wrap_rst <= rst;
  wrap_din <= din;
  dout <= wrap_dout;
  dout_vld <= wrap_dout_vld;
  wrap_DOUT <= dmx_dm_out;
  wrap_DOUT_VLD <= clk_eq_15_eq_out;
  -- uart_rx.vhd:129:12
  din_not <= n12_o; -- (isignal)
  -- uart_rx.vhd:132:12
  dmx_address <= "0000"; -- (isignal)
  -- uart_rx.vhd:135:12
  clk_cnt <= cnt_clk_cnt_out; -- (isignal)
  -- uart_rx.vhd:140:5
  fsm : entity work.uart_rx_fsm port map (
    clk => wrap_CLK,
    rst => wrap_RST,
    start_bit => din_not,
    test_out => open);
  -- uart_rx.vhd:149:5
  clk_eq_15 : entity work.eq_4 port map (
    eq_in_1 => clk_cnt,
    eq_in_2 => n5_o,
    eq_out => clk_eq_15_eq_out);
  -- uart_rx.vhd:157:5
  dmx : entity work.demux_4_8 port map (
    dm_in => wrap_DIN,
    addr => dmx_address,
    dm_out => dmx_dm_out);
  -- uart_rx.vhd:165:5
  cnt_clk : entity work.counter_4 port map (
    cnt_in => wrap_CLK,
    cnt_ce => n8_o,
    cnt_res => wrap_CLK,
    cnt_out => cnt_clk_cnt_out);
  -- uart_rx.vhd:176:20
  n12_o <= not wrap_DIN;
end rtl;
