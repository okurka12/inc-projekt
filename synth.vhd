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

entity reg is
  port (
    reg_in : in std_logic_vector (7 downto 0);
    reg_enable : in std_logic;
    reg_res : in std_logic;
    reg_val : out std_logic_vector (7 downto 0));
end entity reg;

architecture rtl of reg is
  signal reg_val_sig : std_logic_vector (7 downto 0);
begin
  reg_val <= reg_val_sig;
  -- uart_rx.vhd:80:12
  reg_val_sig <= "XXXXXXXX"; -- (signal)
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity or_8 is
  port (
    or_8_in_1 : in std_logic_vector (7 downto 0);
    or_8_in_2 : in std_logic_vector (7 downto 0);
    or_8_out : out std_logic_vector (7 downto 0));
end entity or_8;

architecture rtl of or_8 is
  signal n84_o : std_logic;
  signal n85_o : std_logic;
  signal n86_o : std_logic;
  signal n87_o : std_logic;
  signal n90_o : std_logic;
  signal n91_o : std_logic;
  signal n92_o : std_logic;
  signal n93_o : std_logic;
  signal n96_o : std_logic;
  signal n97_o : std_logic;
  signal n98_o : std_logic;
  signal n99_o : std_logic;
  signal n102_o : std_logic;
  signal n103_o : std_logic;
  signal n104_o : std_logic;
  signal n105_o : std_logic;
  signal n108_o : std_logic;
  signal n109_o : std_logic;
  signal n110_o : std_logic;
  signal n111_o : std_logic;
  signal n114_o : std_logic;
  signal n115_o : std_logic;
  signal n116_o : std_logic;
  signal n117_o : std_logic;
  signal n120_o : std_logic;
  signal n121_o : std_logic;
  signal n122_o : std_logic;
  signal n123_o : std_logic;
  signal n126_o : std_logic;
  signal n127_o : std_logic;
  signal n128_o : std_logic;
  signal n129_o : std_logic;
  signal n131_o : std_logic_vector (7 downto 0);
begin
  or_8_out <= n131_o;
  -- uart_rx.vhd:106:38
  n84_o <= or_8_in_1 (0);
  -- uart_rx.vhd:106:60
  n85_o <= or_8_in_2 (0);
  -- uart_rx.vhd:106:48
  n86_o <= n84_o or n85_o;
  -- uart_rx.vhd:106:24
  n87_o <= '0' when n86_o = '0' else '1';
  -- uart_rx.vhd:107:38
  n90_o <= or_8_in_1 (1);
  -- uart_rx.vhd:107:60
  n91_o <= or_8_in_2 (1);
  -- uart_rx.vhd:107:48
  n92_o <= n90_o or n91_o;
  -- uart_rx.vhd:107:24
  n93_o <= '0' when n92_o = '0' else '1';
  -- uart_rx.vhd:108:38
  n96_o <= or_8_in_1 (2);
  -- uart_rx.vhd:108:60
  n97_o <= or_8_in_2 (2);
  -- uart_rx.vhd:108:48
  n98_o <= n96_o or n97_o;
  -- uart_rx.vhd:108:24
  n99_o <= '0' when n98_o = '0' else '1';
  -- uart_rx.vhd:109:38
  n102_o <= or_8_in_1 (3);
  -- uart_rx.vhd:109:60
  n103_o <= or_8_in_2 (3);
  -- uart_rx.vhd:109:48
  n104_o <= n102_o or n103_o;
  -- uart_rx.vhd:109:24
  n105_o <= '0' when n104_o = '0' else '1';
  -- uart_rx.vhd:110:38
  n108_o <= or_8_in_1 (4);
  -- uart_rx.vhd:110:60
  n109_o <= or_8_in_2 (4);
  -- uart_rx.vhd:110:48
  n110_o <= n108_o or n109_o;
  -- uart_rx.vhd:110:24
  n111_o <= '0' when n110_o = '0' else '1';
  -- uart_rx.vhd:111:38
  n114_o <= or_8_in_1 (5);
  -- uart_rx.vhd:111:60
  n115_o <= or_8_in_2 (5);
  -- uart_rx.vhd:111:48
  n116_o <= n114_o or n115_o;
  -- uart_rx.vhd:111:24
  n117_o <= '0' when n116_o = '0' else '1';
  -- uart_rx.vhd:112:38
  n120_o <= or_8_in_1 (6);
  -- uart_rx.vhd:112:60
  n121_o <= or_8_in_2 (6);
  -- uart_rx.vhd:112:48
  n122_o <= n120_o or n121_o;
  -- uart_rx.vhd:112:24
  n123_o <= '0' when n122_o = '0' else '1';
  -- uart_rx.vhd:113:38
  n126_o <= or_8_in_1 (7);
  -- uart_rx.vhd:113:60
  n127_o <= or_8_in_2 (7);
  -- uart_rx.vhd:113:48
  n128_o <= n126_o or n127_o;
  -- uart_rx.vhd:113:24
  n129_o <= '0' when n128_o = '0' else '1';
  n131_o <= n129_o & n123_o & n117_o & n111_o & n105_o & n99_o & n93_o & n87_o;
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
  signal n78_o : std_logic;
  signal n79_o : std_logic;
  signal n81_o : std_logic_vector (7 downto 0);
begin
  dm_out <= n81_o;
  -- uart_rx.vhd:157:34
  n50_o <= '1' when addr = "0000" else '0';
  -- uart_rx.vhd:157:24
  n51_o <= '0' when n50_o = '0' else dm_in;
  -- uart_rx.vhd:158:34
  n54_o <= '1' when addr = "0001" else '0';
  -- uart_rx.vhd:158:24
  n55_o <= '0' when n54_o = '0' else dm_in;
  -- uart_rx.vhd:159:34
  n58_o <= '1' when addr = "0010" else '0';
  -- uart_rx.vhd:159:24
  n59_o <= '0' when n58_o = '0' else dm_in;
  -- uart_rx.vhd:160:34
  n62_o <= '1' when addr = "0011" else '0';
  -- uart_rx.vhd:160:24
  n63_o <= '0' when n62_o = '0' else dm_in;
  -- uart_rx.vhd:161:34
  n66_o <= '1' when addr = "0100" else '0';
  -- uart_rx.vhd:161:24
  n67_o <= '0' when n66_o = '0' else dm_in;
  -- uart_rx.vhd:162:34
  n70_o <= '1' when addr = "0101" else '0';
  -- uart_rx.vhd:162:24
  n71_o <= '0' when n70_o = '0' else dm_in;
  -- uart_rx.vhd:163:34
  n74_o <= '1' when addr = "0110" else '0';
  -- uart_rx.vhd:163:24
  n75_o <= '0' when n74_o = '0' else dm_in;
  -- uart_rx.vhd:164:34
  n78_o <= '1' when addr = "0111" else '0';
  -- uart_rx.vhd:164:24
  n79_o <= '0' when n78_o = '0' else dm_in;
  n81_o <= n79_o & n75_o & n71_o & n67_o & n63_o & n59_o & n55_o & n51_o;
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
  signal n36_o : std_logic;
  signal n39_o : std_logic;
  signal n41_o : std_logic_vector (3 downto 0);
  signal n43_o : std_logic_vector (3 downto 0);
  signal n46_o : std_logic_vector (3 downto 0);
  signal n47_q : std_logic_vector (3 downto 0) := "0000";
begin
  cnt_out <= cnt_sig;
  -- uart_rx.vhd:122:8
  cnt_sig <= n47_q; -- (isignal)
  -- uart_rx.vhd:136:13
  n36_o <= '1' when rising_edge (cnt_in) else '0';
  -- uart_rx.vhd:137:25
  n39_o <= '1' when cnt_sig = "1111" else '0';
  -- uart_rx.vhd:140:36
  n41_o <= std_logic_vector (unsigned (cnt_sig) + unsigned'("0001"));
  -- uart_rx.vhd:137:13
  n43_o <= n41_o when n39_o = '0' else "0000";
  -- uart_rx.vhd:39:8
  n46_o <= cnt_sig when cnt_ce = '0' else n43_o;
  -- uart_rx.vhd:136:9
  process (cnt_in)
  begin
    if rising_edge (cnt_in) then
      n47_q <= n46_o;
    end if;
  end process;
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uart_rx_fsm is
  port (
    clk : in std_logic;
    rst : in std_logic;
    din : in std_logic;
    clk_cnt : in std_logic_vector (3 downto 0);
    bit_cnt : in std_logic_vector (3 downto 0);
    reg_enable : out std_logic;
    rst_reg : out std_logic;
    dout_vld : out std_logic;
    rst_bit : out std_logic;
    inc_bit : out std_logic;
    rst_clk_cnt : out std_logic);
end entity uart_rx_fsm;

architecture rtl of uart_rx_fsm is
  constant n23_o : std_logic := 'Z';
  constant n24_o : std_logic := 'Z';
  constant n25_o : std_logic := 'Z';
  constant n26_o : std_logic := 'Z';
  constant n27_o : std_logic := 'Z';
  constant n28_o : std_logic := 'Z';
begin
  reg_enable <= n23_o;
  rst_reg <= n24_o;
  dout_vld <= n25_o;
  rst_bit <= n26_o;
  inc_bit <= n27_o;
  rst_clk_cnt <= n28_o;
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
  signal dmx_out : std_logic_vector (7 downto 0);
  signal reg_out : std_logic_vector (7 downto 0);
  signal reg_in : std_logic_vector (7 downto 0);
  signal dmx_addr : std_logic_vector (3 downto 0);
  signal rst_clk_cnt : std_logic;
  signal clk_cnt : std_logic_vector (3 downto 0);
  signal inc_bit : std_logic;
  signal rst_bit : std_logic;
  signal bit_cnt : std_logic_vector (3 downto 0);
  signal fsm_reg_enable : std_logic;
  signal fsm_rst_reg : std_logic;
  signal fsm_dout_vld : std_logic;
  signal fsm_rst_bit : std_logic;
  signal fsm_inc_bit : std_logic;
  signal fsm_rst_clk_cnt : std_logic;
  signal cnt_clk_cnt_out : std_logic_vector (3 downto 0);
  constant n8_o : std_logic := '1';
  signal cnt_bit_cnt_out : std_logic_vector (3 downto 0);
  constant n10_o : std_logic := '1';
  signal dmx_dm_out : std_logic_vector (7 downto 0);
  signal or88_or_8_out : std_logic_vector (7 downto 0);
  signal registr_reg_val : std_logic_vector (7 downto 0);
  constant n14_o : std_logic := '1';
  constant n16_o : std_logic := '0';
begin
  wrap_clk <= clk;
  wrap_rst <= rst;
  wrap_din <= din;
  dout <= wrap_dout;
  dout_vld <= wrap_dout_vld;
  wrap_DOUT <= dmx_out;
  wrap_DOUT_VLD <= fsm_dout_vld;
  -- uart_rx.vhd:183:12
  dmx_out <= dmx_dm_out; -- (signal)
  -- uart_rx.vhd:186:12
  reg_out <= registr_reg_val; -- (signal)
  -- uart_rx.vhd:189:12
  reg_in <= or88_or_8_out; -- (signal)
  -- uart_rx.vhd:192:12
  dmx_addr <= cnt_bit_cnt_out; -- (signal)
  -- uart_rx.vhd:195:12
  rst_clk_cnt <= fsm_rst_clk_cnt; -- (signal)
  -- uart_rx.vhd:196:12
  clk_cnt <= cnt_clk_cnt_out; -- (signal)
  -- uart_rx.vhd:197:12
  inc_bit <= fsm_inc_bit; -- (signal)
  -- uart_rx.vhd:198:12
  rst_bit <= fsm_rst_bit; -- (signal)
  -- uart_rx.vhd:199:12
  bit_cnt <= dmx_addr; -- (signal)
  -- uart_rx.vhd:207:5
  fsm : entity work.uart_rx_fsm port map (
    clk => wrap_CLK,
    rst => wrap_RST,
    din => wrap_DIN,
    clk_cnt => clk_cnt,
    bit_cnt => bit_cnt,
    reg_enable => open,
    rst_reg => open,
    dout_vld => fsm_dout_vld,
    rst_bit => fsm_rst_bit,
    inc_bit => fsm_inc_bit,
    rst_clk_cnt => fsm_rst_clk_cnt);
  -- uart_rx.vhd:223:5
  cnt_clk : entity work.counter_4 port map (
    cnt_in => wrap_CLK,
    cnt_ce => n8_o,
    cnt_res => rst_clk_cnt,
    cnt_out => cnt_clk_cnt_out);
  -- uart_rx.vhd:232:5
  cnt_bit : entity work.counter_4 port map (
    cnt_in => inc_bit,
    cnt_ce => n10_o,
    cnt_res => rst_bit,
    cnt_out => cnt_bit_cnt_out);
  -- uart_rx.vhd:240:5
  dmx : entity work.demux_4_8 port map (
    dm_in => wrap_DIN,
    addr => dmx_addr,
    dm_out => dmx_dm_out);
  -- uart_rx.vhd:247:5
  or88 : entity work.or_8 port map (
    or_8_in_1 => dmx_out,
    or_8_in_2 => reg_out,
    or_8_out => or88_or_8_out);
  -- uart_rx.vhd:254:5
  registr : entity work.reg port map (
    reg_in => reg_in,
    reg_enable => n14_o,
    reg_res => n16_o,
    reg_val => registr_reg_val);
end rtl;
