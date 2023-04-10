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

entity sub_4 is
  port (
    sub_4_min : in std_logic_vector (3 downto 0);
    sub_4_sub : in std_logic_vector (3 downto 0);
    sub_4_out : out std_logic_vector (3 downto 0));
end entity sub_4;

architecture rtl of sub_4 is
  signal n100_o : std_logic_vector (3 downto 0);
begin
  sub_4_out <= n100_o;
  -- uart_rx.vhd:92:32
  n100_o <= std_logic_vector (unsigned (sub_4_min) - unsigned (sub_4_sub));
end rtl;

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
  signal n85_o : std_logic;
  signal n88_o : std_logic;
  signal n90_o : std_logic_vector (3 downto 0);
  signal n92_o : std_logic_vector (3 downto 0);
  signal n95_o : std_logic_vector (3 downto 0);
  signal n96_q : std_logic_vector (3 downto 0) := "0000";
begin
  cnt_out <= cnt_sig;
  -- uart_rx.vhd:128:8
  cnt_sig <= n96_q; -- (isignal)
  -- uart_rx.vhd:142:13
  n85_o <= '1' when rising_edge (cnt_in) else '0';
  -- uart_rx.vhd:143:25
  n88_o <= '1' when cnt_sig = "1111" else '0';
  -- uart_rx.vhd:146:36
  n90_o <= std_logic_vector (unsigned (cnt_sig) + unsigned'("0001"));
  -- uart_rx.vhd:143:13
  n92_o <= n90_o when n88_o = '0' else "0000";
  -- uart_rx.vhd:39:8
  n95_o <= cnt_sig when cnt_ce = '0' else n92_o;
  -- uart_rx.vhd:142:9
  process (cnt_in)
  begin
    if rising_edge (cnt_in) then
      n96_q <= n95_o;
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
  signal n46_o : std_logic;
  signal n47_o : std_logic;
  signal n50_o : std_logic;
  signal n51_o : std_logic;
  signal n54_o : std_logic;
  signal n55_o : std_logic;
  signal n58_o : std_logic;
  signal n59_o : std_logic;
  signal n62_o : std_logic;
  signal n63_o : std_logic;
  signal n66_o : std_logic;
  signal n67_o : std_logic;
  signal n70_o : std_logic;
  signal n71_o : std_logic;
  signal n74_o : std_logic;
  signal n75_o : std_logic;
  signal n77_o : std_logic_vector (7 downto 0);
begin
  dm_out <= n77_o;
  -- uart_rx.vhd:163:34
  n46_o <= '1' when addr = "0000" else '0';
  -- uart_rx.vhd:163:24
  n47_o <= '0' when n46_o = '0' else dm_in;
  -- uart_rx.vhd:164:34
  n50_o <= '1' when addr = "0001" else '0';
  -- uart_rx.vhd:164:24
  n51_o <= '0' when n50_o = '0' else dm_in;
  -- uart_rx.vhd:165:34
  n54_o <= '1' when addr = "0010" else '0';
  -- uart_rx.vhd:165:24
  n55_o <= '0' when n54_o = '0' else dm_in;
  -- uart_rx.vhd:166:34
  n58_o <= '1' when addr = "0011" else '0';
  -- uart_rx.vhd:166:24
  n59_o <= '0' when n58_o = '0' else dm_in;
  -- uart_rx.vhd:167:34
  n62_o <= '1' when addr = "0100" else '0';
  -- uart_rx.vhd:167:24
  n63_o <= '0' when n62_o = '0' else dm_in;
  -- uart_rx.vhd:168:34
  n66_o <= '1' when addr = "0101" else '0';
  -- uart_rx.vhd:168:24
  n67_o <= '0' when n66_o = '0' else dm_in;
  -- uart_rx.vhd:169:34
  n70_o <= '1' when addr = "0110" else '0';
  -- uart_rx.vhd:169:24
  n71_o <= '0' when n70_o = '0' else dm_in;
  -- uart_rx.vhd:170:34
  n74_o <= '1' when addr = "0111" else '0';
  -- uart_rx.vhd:170:24
  n75_o <= '0' when n74_o = '0' else dm_in;
  n77_o <= n75_o & n71_o & n67_o & n63_o & n59_o & n55_o & n51_o & n47_o;
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
  signal n39_o : std_logic;
  signal n42_o : std_logic;
begin
  eq_out <= n42_o;
  -- uart_rx.vhd:115:21
  n39_o <= '1' when eq_in_1 = eq_in_2 else '0';
  -- uart_rx.vhd:115:9
  n42_o <= '0' when n39_o = '0' else '1';
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uart_rx_fsm is
  port (
    clk : in std_logic;
    rst : in std_logic;
    start_bit : in std_logic;
    cnt7 : in std_logic;
    rx_end : in std_logic;
    ce : out std_logic;
    res : out std_logic;
    res_bit_cnt : out std_logic;
    res_reg : out std_logic;
    dout_valid : out std_logic);
end entity uart_rx_fsm;

architecture rtl of uart_rx_fsm is
  constant n31_o : std_logic := 'Z';
  constant n32_o : std_logic := 'Z';
  constant n33_o : std_logic := 'Z';
  constant n34_o : std_logic := 'Z';
  constant n35_o : std_logic := 'Z';
begin
  ce <= n31_o;
  res <= n32_o;
  res_bit_cnt <= n33_o;
  res_reg <= n34_o;
  dout_valid <= n35_o;
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
  signal dmx_address_sub : std_logic_vector (3 downto 0);
  signal clk_cnt : std_logic_vector (3 downto 0);
  signal cnt_clk_eq_15 : std_logic;
  signal cnt_clk_res : std_logic;
  signal cnt_clk_ce : std_logic;
  signal cnt_clk_eq_7 : std_logic;
  signal res_bit_cnt : std_logic;
  signal bits_eq_8 : std_logic;
  signal fsm_ce : std_logic;
  signal fsm_res : std_logic;
  signal fsm_res_bit_cnt : std_logic;
  signal fsm_res_reg : std_logic;
  signal fsm_dout_valid : std_logic;
  signal clk_eq_15_eq_out : std_logic;
  constant n10_o : std_logic_vector (3 downto 0) := "1111";
  signal clk_eq_7_eq_out : std_logic;
  constant n12_o : std_logic_vector (3 downto 0) := "0111";
  signal dmx_dm_out : std_logic_vector (7 downto 0);
  signal cnt_clk_cnt_out : std_logic_vector (3 downto 0);
  signal cnt_bits_cnt_out : std_logic_vector (3 downto 0);
  constant n16_o : std_logic := '1';
  signal sub_sub_4_out : std_logic_vector (3 downto 0);
  constant n18_o : std_logic_vector (3 downto 0) := "0001";
  signal bits_eq_eq_out : std_logic;
  constant n20_o : std_logic_vector (3 downto 0) := "1000";
  signal n24_o : std_logic;
begin
  wrap_clk <= clk;
  wrap_rst <= rst;
  wrap_din <= din;
  dout <= wrap_dout;
  dout_vld <= wrap_dout_vld;
  wrap_DOUT <= dmx_dm_out;
  wrap_DOUT_VLD <= fsm_dout_valid;
  -- uart_rx.vhd:178:12
  din_not <= n24_o; -- (isignal)
  -- uart_rx.vhd:181:12
  dmx_address <= cnt_bits_cnt_out; -- (isignal)
  -- uart_rx.vhd:184:12
  dmx_address_sub <= sub_sub_4_out; -- (isignal)
  -- uart_rx.vhd:187:12
  clk_cnt <= cnt_clk_cnt_out; -- (isignal)
  -- uart_rx.vhd:190:12
  cnt_clk_eq_15 <= clk_eq_15_eq_out; -- (signal)
  -- uart_rx.vhd:193:12
  cnt_clk_res <= fsm_res; -- (signal)
  -- uart_rx.vhd:194:12
  cnt_clk_ce <= fsm_ce; -- (signal)
  -- uart_rx.vhd:197:12
  cnt_clk_eq_7 <= clk_eq_7_eq_out; -- (signal)
  -- uart_rx.vhd:200:12
  res_bit_cnt <= fsm_res_bit_cnt; -- (signal)
  -- uart_rx.vhd:203:12
  bits_eq_8 <= bits_eq_eq_out; -- (signal)
  -- uart_rx.vhd:208:5
  fsm : entity work.uart_rx_fsm port map (
    clk => wrap_CLK,
    rst => wrap_RST,
    start_bit => din_not,
    cnt7 => cnt_clk_eq_7,
    rx_end => bits_eq_8,
    ce => fsm_ce,
    res => fsm_res,
    res_bit_cnt => fsm_res_bit_cnt,
    res_reg => open,
    dout_valid => fsm_dout_valid);
  -- uart_rx.vhd:222:5
  clk_eq_15 : entity work.eq_4 port map (
    eq_in_1 => clk_cnt,
    eq_in_2 => n10_o,
    eq_out => clk_eq_15_eq_out);
  -- uart_rx.vhd:230:5
  clk_eq_7 : entity work.eq_4 port map (
    eq_in_1 => clk_cnt,
    eq_in_2 => n12_o,
    eq_out => clk_eq_7_eq_out);
  -- uart_rx.vhd:238:5
  dmx : entity work.demux_4_8 port map (
    dm_in => wrap_DIN,
    addr => dmx_address_sub,
    dm_out => dmx_dm_out);
  -- uart_rx.vhd:246:5
  cnt_clk : entity work.counter_4 port map (
    cnt_in => wrap_CLK,
    cnt_ce => cnt_clk_ce,
    cnt_res => cnt_clk_res,
    cnt_out => cnt_clk_cnt_out);
  -- uart_rx.vhd:255:5
  cnt_bits : entity work.counter_4 port map (
    cnt_in => cnt_clk_eq_15,
    cnt_ce => n16_o,
    cnt_res => res_bit_cnt,
    cnt_out => cnt_bits_cnt_out);
  -- uart_rx.vhd:264:5
  sub : entity work.sub_4 port map (
    sub_4_min => dmx_address,
    sub_4_sub => n18_o,
    sub_4_out => sub_sub_4_out);
  -- uart_rx.vhd:272:5
  bits_eq : entity work.eq_4 port map (
    eq_in_1 => dmx_address,
    eq_in_2 => n20_o,
    eq_out => bits_eq_eq_out);
  -- uart_rx.vhd:282:20
  n24_o <= not wrap_DIN;
end rtl;
