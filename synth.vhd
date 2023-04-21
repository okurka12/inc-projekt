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
  signal n141_o : std_logic;
  signal n142_o : std_logic;
  signal n143_o : std_logic;
  signal n144_o : std_logic;
  signal n147_o : std_logic;
  signal n148_o : std_logic;
  signal n149_o : std_logic;
  signal n150_o : std_logic;
  signal n153_o : std_logic;
  signal n154_o : std_logic;
  signal n155_o : std_logic;
  signal n156_o : std_logic;
  signal n159_o : std_logic;
  signal n160_o : std_logic;
  signal n161_o : std_logic;
  signal n162_o : std_logic;
  signal n165_o : std_logic;
  signal n166_o : std_logic;
  signal n167_o : std_logic;
  signal n168_o : std_logic;
  signal n171_o : std_logic;
  signal n172_o : std_logic;
  signal n173_o : std_logic;
  signal n174_o : std_logic;
  signal n177_o : std_logic;
  signal n178_o : std_logic;
  signal n179_o : std_logic;
  signal n180_o : std_logic;
  signal n183_o : std_logic;
  signal n184_o : std_logic;
  signal n185_o : std_logic;
  signal n186_o : std_logic;
  signal n188_o : std_logic_vector (7 downto 0);
begin
  or_8_out <= n188_o;
  -- uart_rx.vhd:106:38
  n141_o <= or_8_in_1 (0);
  -- uart_rx.vhd:106:60
  n142_o <= or_8_in_2 (0);
  -- uart_rx.vhd:106:48
  n143_o <= n141_o or n142_o;
  -- uart_rx.vhd:106:24
  n144_o <= '0' when n143_o = '0' else '1';
  -- uart_rx.vhd:107:38
  n147_o <= or_8_in_1 (1);
  -- uart_rx.vhd:107:60
  n148_o <= or_8_in_2 (1);
  -- uart_rx.vhd:107:48
  n149_o <= n147_o or n148_o;
  -- uart_rx.vhd:107:24
  n150_o <= '0' when n149_o = '0' else '1';
  -- uart_rx.vhd:108:38
  n153_o <= or_8_in_1 (2);
  -- uart_rx.vhd:108:60
  n154_o <= or_8_in_2 (2);
  -- uart_rx.vhd:108:48
  n155_o <= n153_o or n154_o;
  -- uart_rx.vhd:108:24
  n156_o <= '0' when n155_o = '0' else '1';
  -- uart_rx.vhd:109:38
  n159_o <= or_8_in_1 (3);
  -- uart_rx.vhd:109:60
  n160_o <= or_8_in_2 (3);
  -- uart_rx.vhd:109:48
  n161_o <= n159_o or n160_o;
  -- uart_rx.vhd:109:24
  n162_o <= '0' when n161_o = '0' else '1';
  -- uart_rx.vhd:110:38
  n165_o <= or_8_in_1 (4);
  -- uart_rx.vhd:110:60
  n166_o <= or_8_in_2 (4);
  -- uart_rx.vhd:110:48
  n167_o <= n165_o or n166_o;
  -- uart_rx.vhd:110:24
  n168_o <= '0' when n167_o = '0' else '1';
  -- uart_rx.vhd:111:38
  n171_o <= or_8_in_1 (5);
  -- uart_rx.vhd:111:60
  n172_o <= or_8_in_2 (5);
  -- uart_rx.vhd:111:48
  n173_o <= n171_o or n172_o;
  -- uart_rx.vhd:111:24
  n174_o <= '0' when n173_o = '0' else '1';
  -- uart_rx.vhd:112:38
  n177_o <= or_8_in_1 (6);
  -- uart_rx.vhd:112:60
  n178_o <= or_8_in_2 (6);
  -- uart_rx.vhd:112:48
  n179_o <= n177_o or n178_o;
  -- uart_rx.vhd:112:24
  n180_o <= '0' when n179_o = '0' else '1';
  -- uart_rx.vhd:113:38
  n183_o <= or_8_in_1 (7);
  -- uart_rx.vhd:113:60
  n184_o <= or_8_in_2 (7);
  -- uart_rx.vhd:113:48
  n185_o <= n183_o or n184_o;
  -- uart_rx.vhd:113:24
  n186_o <= '0' when n185_o = '0' else '1';
  n188_o <= n186_o & n180_o & n174_o & n168_o & n162_o & n156_o & n150_o & n144_o;
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
  signal n107_o : std_logic;
  signal n108_o : std_logic;
  signal n111_o : std_logic;
  signal n112_o : std_logic;
  signal n115_o : std_logic;
  signal n116_o : std_logic;
  signal n119_o : std_logic;
  signal n120_o : std_logic;
  signal n123_o : std_logic;
  signal n124_o : std_logic;
  signal n127_o : std_logic;
  signal n128_o : std_logic;
  signal n131_o : std_logic;
  signal n132_o : std_logic;
  signal n135_o : std_logic;
  signal n136_o : std_logic;
  signal n138_o : std_logic_vector (7 downto 0);
begin
  dm_out <= n138_o;
  -- uart_rx.vhd:157:34
  n107_o <= '1' when addr = "0000" else '0';
  -- uart_rx.vhd:157:24
  n108_o <= '0' when n107_o = '0' else dm_in;
  -- uart_rx.vhd:158:34
  n111_o <= '1' when addr = "0001" else '0';
  -- uart_rx.vhd:158:24
  n112_o <= '0' when n111_o = '0' else dm_in;
  -- uart_rx.vhd:159:34
  n115_o <= '1' when addr = "0010" else '0';
  -- uart_rx.vhd:159:24
  n116_o <= '0' when n115_o = '0' else dm_in;
  -- uart_rx.vhd:160:34
  n119_o <= '1' when addr = "0011" else '0';
  -- uart_rx.vhd:160:24
  n120_o <= '0' when n119_o = '0' else dm_in;
  -- uart_rx.vhd:161:34
  n123_o <= '1' when addr = "0100" else '0';
  -- uart_rx.vhd:161:24
  n124_o <= '0' when n123_o = '0' else dm_in;
  -- uart_rx.vhd:162:34
  n127_o <= '1' when addr = "0101" else '0';
  -- uart_rx.vhd:162:24
  n128_o <= '0' when n127_o = '0' else dm_in;
  -- uart_rx.vhd:163:34
  n131_o <= '1' when addr = "0110" else '0';
  -- uart_rx.vhd:163:24
  n132_o <= '0' when n131_o = '0' else dm_in;
  -- uart_rx.vhd:164:34
  n135_o <= '1' when addr = "0111" else '0';
  -- uart_rx.vhd:164:24
  n136_o <= '0' when n135_o = '0' else dm_in;
  n138_o <= n136_o & n132_o & n128_o & n124_o & n120_o & n116_o & n112_o & n108_o;
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
  signal n93_o : std_logic;
  signal n96_o : std_logic;
  signal n98_o : std_logic_vector (3 downto 0);
  signal n100_o : std_logic_vector (3 downto 0);
  signal n103_o : std_logic_vector (3 downto 0);
  signal n104_q : std_logic_vector (3 downto 0) := "0000";
begin
  cnt_out <= cnt_sig;
  -- uart_rx.vhd:122:8
  cnt_sig <= n104_q; -- (isignal)
  -- uart_rx.vhd:136:13
  n93_o <= '1' when rising_edge (cnt_in) else '0';
  -- uart_rx.vhd:137:25
  n96_o <= '1' when cnt_sig = "1111" else '0';
  -- uart_rx.vhd:140:36
  n98_o <= std_logic_vector (unsigned (cnt_sig) + unsigned'("0001"));
  -- uart_rx.vhd:137:13
  n100_o <= n98_o when n96_o = '0' else "0000";
  -- uart_rx.vhd:39:8
  n103_o <= cnt_sig when cnt_ce = '0' else n100_o;
  -- uart_rx.vhd:136:9
  process (cnt_in)
  begin
    if rising_edge (cnt_in) then
      n104_q <= n103_o;
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
  signal current_state : std_logic_vector (1 downto 0);
  signal next_state : std_logic_vector (1 downto 0);
  signal n23_o : std_logic;
  signal n28_q : std_logic_vector (1 downto 0);
  signal n31_o : std_logic;
  signal n33_o : std_logic;
  signal n35_o : std_logic;
  signal n38_o : std_logic_vector (1 downto 0);
  signal n40_o : std_logic;
  signal n42_o : std_logic;
  signal n45_o : std_logic;
  signal n48_o : std_logic_vector (1 downto 0);
  signal n50_o : std_logic;
  signal n52_o : std_logic;
  signal n55_o : std_logic;
  signal n58_o : std_logic;
  signal n60_o : std_logic;
  signal n62_o : std_logic;
  signal n65_o : std_logic_vector (1 downto 0);
  signal n67_o : std_logic;
  signal n69_o : std_logic;
  signal n70_o : std_logic_vector (3 downto 0);
  signal n71_o : std_logic;
  signal n74_o : std_logic;
  signal n76_o : std_logic;
  signal n79_o : std_logic;
  signal n80_o : std_logic;
  signal n81_o : std_logic;
  signal n84_o : std_logic_vector (1 downto 0);
begin
  reg_enable <= n71_o;
  rst_reg <= n74_o;
  dout_vld <= n76_o;
  rst_bit <= n79_o;
  inc_bit <= n80_o;
  rst_clk_cnt <= n81_o;
  -- uart_rx_fsm.vhd:31:8
  current_state <= n28_q; -- (signal)
  -- uart_rx_fsm.vhd:32:8
  next_state <= n84_o; -- (signal)
  -- uart_rx_fsm.vhd:40:16
  n23_o <= '1' when rising_edge (clk) else '0';
  -- uart_rx_fsm.vhd:40:9
  process (clk, rst)
  begin
    if rst = '1' then
      n28_q <= "00";
    elsif rising_edge (clk) then
      n28_q <= next_state;
    end if;
  end process;
  -- uart_rx_fsm.vhd:55:21
  n31_o <= not din;
  -- uart_rx_fsm.vhd:55:13
  n33_o <= '0' when n31_o = '0' else n76_o;
  -- uart_rx_fsm.vhd:55:13
  n35_o <= n81_o when n31_o = '0' else '1';
  -- uart_rx_fsm.vhd:55:13
  n38_o <= "00" when n31_o = '0' else "01";
  -- uart_rx_fsm.vhd:50:9
  n40_o <= '1' when current_state = "00" else '0';
  -- uart_rx_fsm.vhd:64:25
  n42_o <= '1' when clk_cnt = "1000" else '0';
  -- uart_rx_fsm.vhd:64:13
  n45_o <= '0' when n42_o = '0' else '1';
  -- uart_rx_fsm.vhd:64:13
  n48_o <= "01" when n42_o = '0' else "10";
  -- uart_rx_fsm.vhd:63:9
  n50_o <= '1' when current_state = "01" else '0';
  -- uart_rx_fsm.vhd:73:25
  n52_o <= '1' when clk_cnt = "1111" else '0';
  -- uart_rx_fsm.vhd:73:13
  n55_o <= '0' when n52_o = '0' else '1';
  -- uart_rx_fsm.vhd:73:13
  n58_o <= '0' when n52_o = '0' else '1';
  -- uart_rx_fsm.vhd:81:25
  n60_o <= '1' when bit_cnt = "1000" else '0';
  -- uart_rx_fsm.vhd:81:13
  n62_o <= n76_o when n60_o = '0' else '1';
  -- uart_rx_fsm.vhd:81:13
  n65_o <= "10" when n60_o = '0' else "11";
  -- uart_rx_fsm.vhd:72:9
  n67_o <= '1' when current_state = "10" else '0';
  -- uart_rx_fsm.vhd:88:9
  n69_o <= '1' when current_state = "11" else '0';
  n70_o <= n69_o & n67_o & n50_o & n40_o;
  -- uart_rx_fsm.vhd:47:9
  with n70_o select n71_o <=
    n71_o when "1000",
    n55_o when "0100",
    n71_o when "0010",
    n71_o when "0001",
    n71_o when others;
  -- uart_rx_fsm.vhd:47:9
  with n70_o select n74_o <=
    '1' when "1000",
    n74_o when "0100",
    n74_o when "0010",
    '0' when "0001",
    n74_o when others;
  -- uart_rx_fsm.vhd:47:9
  with n70_o select n76_o <=
    '0' when "1000",
    n62_o when "0100",
    n76_o when "0010",
    n33_o when "0001",
    n76_o when others;
  -- uart_rx_fsm.vhd:47:9
  with n70_o select n79_o <=
    '1' when "1000",
    n79_o when "0100",
    n79_o when "0010",
    '0' when "0001",
    n79_o when others;
  -- uart_rx_fsm.vhd:47:9
  with n70_o select n80_o <=
    n80_o when "1000",
    n58_o when "0100",
    n80_o when "0010",
    n80_o when "0001",
    n80_o when others;
  -- uart_rx_fsm.vhd:47:9
  with n70_o select n81_o <=
    n81_o when "1000",
    n81_o when "0100",
    n45_o when "0010",
    n35_o when "0001",
    n81_o when others;
  -- uart_rx_fsm.vhd:47:9
  with n70_o select n84_o <=
    "00" when "1000",
    n65_o when "0100",
    n48_o when "0010",
    n38_o when "0001",
    "00" when others;
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
  signal reg_enable : std_logic;
  signal rst_reg : std_logic;
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
begin
  wrap_clk <= clk;
  wrap_rst <= rst;
  wrap_din <= din;
  dout <= wrap_dout;
  dout_vld <= wrap_dout_vld;
  wrap_DOUT <= reg_out;
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
  -- uart_rx.vhd:200:12
  reg_enable <= fsm_reg_enable; -- (signal)
  -- uart_rx.vhd:201:12
  rst_reg <= fsm_rst_reg; -- (signal)
  -- uart_rx.vhd:207:5
  fsm : entity work.uart_rx_fsm port map (
    clk => wrap_CLK,
    rst => wrap_RST,
    din => wrap_DIN,
    clk_cnt => clk_cnt,
    bit_cnt => bit_cnt,
    reg_enable => fsm_reg_enable,
    rst_reg => fsm_rst_reg,
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
  -- uart_rx.vhd:255:5
  registr : entity work.reg port map (
    reg_in => reg_in,
    reg_enable => reg_enable,
    reg_res => rst_reg,
    reg_val => registr_reg_val);
end rtl;
