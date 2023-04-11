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
    reg_val : out std_logic_vector (7 downto 0));
end entity reg;

architecture rtl of reg is
  signal reg_val_sig : std_logic_vector (7 downto 0);
begin
  reg_val <= reg_val_sig;
  -- uart_rx.vhd:143:12
  reg_val_sig <= "XXXXXXXX"; -- (signal)
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity and_8_1 is
  port (
    and_8_in_1 : in std_logic_vector (7 downto 0);
    and_8_in_2 : in std_logic;
    and_8_out : out std_logic_vector (7 downto 0));
end entity and_8_1;

architecture rtl of and_8_1 is
  signal n164_o : std_logic;
  signal n165_o : std_logic;
  signal n166_o : std_logic;
  signal n169_o : std_logic;
  signal n170_o : std_logic;
  signal n171_o : std_logic;
  signal n174_o : std_logic;
  signal n175_o : std_logic;
  signal n176_o : std_logic;
  signal n179_o : std_logic;
  signal n180_o : std_logic;
  signal n181_o : std_logic;
  signal n184_o : std_logic;
  signal n185_o : std_logic;
  signal n186_o : std_logic;
  signal n189_o : std_logic;
  signal n190_o : std_logic;
  signal n191_o : std_logic;
  signal n194_o : std_logic;
  signal n195_o : std_logic;
  signal n196_o : std_logic;
  signal n199_o : std_logic;
  signal n200_o : std_logic;
  signal n201_o : std_logic;
  signal n203_o : std_logic_vector (7 downto 0);
begin
  and_8_out <= n203_o;
  -- uart_rx.vhd:175:40
  n164_o <= and_8_in_1 (0);
  -- uart_rx.vhd:175:50
  n165_o <= n164_o and and_8_in_2;
  -- uart_rx.vhd:175:25
  n166_o <= '0' when n165_o = '0' else '1';
  -- uart_rx.vhd:177:40
  n169_o <= and_8_in_1 (1);
  -- uart_rx.vhd:177:50
  n170_o <= n169_o and and_8_in_2;
  -- uart_rx.vhd:177:25
  n171_o <= '0' when n170_o = '0' else '1';
  -- uart_rx.vhd:179:40
  n174_o <= and_8_in_1 (2);
  -- uart_rx.vhd:179:50
  n175_o <= n174_o and and_8_in_2;
  -- uart_rx.vhd:179:25
  n176_o <= '0' when n175_o = '0' else '1';
  -- uart_rx.vhd:181:40
  n179_o <= and_8_in_1 (3);
  -- uart_rx.vhd:181:50
  n180_o <= n179_o and and_8_in_2;
  -- uart_rx.vhd:181:25
  n181_o <= '0' when n180_o = '0' else '1';
  -- uart_rx.vhd:183:40
  n184_o <= and_8_in_1 (4);
  -- uart_rx.vhd:183:50
  n185_o <= n184_o and and_8_in_2;
  -- uart_rx.vhd:183:25
  n186_o <= '0' when n185_o = '0' else '1';
  -- uart_rx.vhd:185:40
  n189_o <= and_8_in_1 (5);
  -- uart_rx.vhd:185:50
  n190_o <= n189_o and and_8_in_2;
  -- uart_rx.vhd:185:25
  n191_o <= '0' when n190_o = '0' else '1';
  -- uart_rx.vhd:187:40
  n194_o <= and_8_in_1 (6);
  -- uart_rx.vhd:187:50
  n195_o <= n194_o and and_8_in_2;
  -- uart_rx.vhd:187:25
  n196_o <= '0' when n195_o = '0' else '1';
  -- uart_rx.vhd:189:40
  n199_o <= and_8_in_1 (7);
  -- uart_rx.vhd:189:50
  n200_o <= n199_o and and_8_in_2;
  -- uart_rx.vhd:189:25
  n201_o <= '0' when n200_o = '0' else '1';
  n203_o <= n201_o & n196_o & n191_o & n186_o & n181_o & n176_o & n171_o & n166_o;
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
  signal n132_o : std_logic;
  signal n133_o : std_logic;
  signal n134_o : std_logic;
  signal n135_o : std_logic;
  signal n138_o : std_logic;
  signal n139_o : std_logic;
  signal n140_o : std_logic;
  signal n141_o : std_logic;
  signal n144_o : std_logic;
  signal n145_o : std_logic;
  signal n146_o : std_logic;
  signal n147_o : std_logic;
  signal n150_o : std_logic;
  signal n151_o : std_logic;
  signal n152_o : std_logic;
  signal n153_o : std_logic;
  signal n156_o : std_logic;
  signal n157_o : std_logic;
  signal n158_o : std_logic;
  signal n159_o : std_logic;
  signal n161_o : std_logic_vector (7 downto 0);
begin
  or_8_out <= n161_o;
  -- uart_rx.vhd:199:38
  n114_o <= or_8_in_1 (0);
  -- uart_rx.vhd:199:60
  n115_o <= or_8_in_2 (0);
  -- uart_rx.vhd:199:48
  n116_o <= n114_o or n115_o;
  -- uart_rx.vhd:199:24
  n117_o <= '0' when n116_o = '0' else '1';
  -- uart_rx.vhd:200:38
  n120_o <= or_8_in_1 (1);
  -- uart_rx.vhd:200:60
  n121_o <= or_8_in_2 (1);
  -- uart_rx.vhd:200:48
  n122_o <= n120_o or n121_o;
  -- uart_rx.vhd:200:24
  n123_o <= '0' when n122_o = '0' else '1';
  -- uart_rx.vhd:201:38
  n126_o <= or_8_in_1 (2);
  -- uart_rx.vhd:201:60
  n127_o <= or_8_in_2 (2);
  -- uart_rx.vhd:201:48
  n128_o <= n126_o or n127_o;
  -- uart_rx.vhd:201:24
  n129_o <= '0' when n128_o = '0' else '1';
  -- uart_rx.vhd:202:38
  n132_o <= or_8_in_1 (3);
  -- uart_rx.vhd:202:60
  n133_o <= or_8_in_2 (3);
  -- uart_rx.vhd:202:48
  n134_o <= n132_o or n133_o;
  -- uart_rx.vhd:202:24
  n135_o <= '0' when n134_o = '0' else '1';
  -- uart_rx.vhd:203:38
  n138_o <= or_8_in_1 (4);
  -- uart_rx.vhd:203:60
  n139_o <= or_8_in_2 (4);
  -- uart_rx.vhd:203:48
  n140_o <= n138_o or n139_o;
  -- uart_rx.vhd:203:24
  n141_o <= '0' when n140_o = '0' else '1';
  -- uart_rx.vhd:204:38
  n144_o <= or_8_in_1 (5);
  -- uart_rx.vhd:204:60
  n145_o <= or_8_in_2 (5);
  -- uart_rx.vhd:204:48
  n146_o <= n144_o or n145_o;
  -- uart_rx.vhd:204:24
  n147_o <= '0' when n146_o = '0' else '1';
  -- uart_rx.vhd:205:38
  n150_o <= or_8_in_1 (6);
  -- uart_rx.vhd:205:60
  n151_o <= or_8_in_2 (6);
  -- uart_rx.vhd:205:48
  n152_o <= n150_o or n151_o;
  -- uart_rx.vhd:205:24
  n153_o <= '0' when n152_o = '0' else '1';
  -- uart_rx.vhd:206:38
  n156_o <= or_8_in_1 (7);
  -- uart_rx.vhd:206:60
  n157_o <= or_8_in_2 (7);
  -- uart_rx.vhd:206:48
  n158_o <= n156_o or n157_o;
  -- uart_rx.vhd:206:24
  n159_o <= '0' when n158_o = '0' else '1';
  n161_o <= n159_o & n153_o & n147_o & n141_o & n135_o & n129_o & n123_o & n117_o;
end rtl;

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
  signal n110_o : std_logic_vector (3 downto 0);
begin
  sub_4_out <= n110_o;
  -- uart_rx.vhd:216:32
  n110_o <= std_logic_vector (unsigned (sub_4_min) - unsigned (sub_4_sub));
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
  signal n95_o : std_logic;
  signal n98_o : std_logic;
  signal n100_o : std_logic_vector (3 downto 0);
  signal n102_o : std_logic_vector (3 downto 0);
  signal n105_o : std_logic_vector (3 downto 0);
  signal n106_q : std_logic_vector (3 downto 0) := "0000";
begin
  cnt_out <= cnt_sig;
  -- uart_rx.vhd:246:8
  cnt_sig <= n106_q; -- (isignal)
  -- uart_rx.vhd:260:13
  n95_o <= '1' when rising_edge (cnt_in) else '0';
  -- uart_rx.vhd:261:25
  n98_o <= '1' when cnt_sig = "1111" else '0';
  -- uart_rx.vhd:264:36
  n100_o <= std_logic_vector (unsigned (cnt_sig) + unsigned'("0001"));
  -- uart_rx.vhd:261:13
  n102_o <= n100_o when n98_o = '0' else "0000";
  -- uart_rx.vhd:39:8
  n105_o <= cnt_sig when cnt_ce = '0' else n102_o;
  -- uart_rx.vhd:260:9
  process (cnt_in)
  begin
    if rising_edge (cnt_in) then
      n106_q <= n105_o;
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
  signal n56_o : std_logic;
  signal n57_o : std_logic;
  signal n60_o : std_logic;
  signal n61_o : std_logic;
  signal n64_o : std_logic;
  signal n65_o : std_logic;
  signal n68_o : std_logic;
  signal n69_o : std_logic;
  signal n72_o : std_logic;
  signal n73_o : std_logic;
  signal n76_o : std_logic;
  signal n77_o : std_logic;
  signal n80_o : std_logic;
  signal n81_o : std_logic;
  signal n84_o : std_logic;
  signal n85_o : std_logic;
  signal n87_o : std_logic_vector (7 downto 0);
begin
  dm_out <= n87_o;
  -- uart_rx.vhd:281:34
  n56_o <= '1' when addr = "0000" else '0';
  -- uart_rx.vhd:281:24
  n57_o <= '0' when n56_o = '0' else dm_in;
  -- uart_rx.vhd:282:34
  n60_o <= '1' when addr = "0001" else '0';
  -- uart_rx.vhd:282:24
  n61_o <= '0' when n60_o = '0' else dm_in;
  -- uart_rx.vhd:283:34
  n64_o <= '1' when addr = "0010" else '0';
  -- uart_rx.vhd:283:24
  n65_o <= '0' when n64_o = '0' else dm_in;
  -- uart_rx.vhd:284:34
  n68_o <= '1' when addr = "0011" else '0';
  -- uart_rx.vhd:284:24
  n69_o <= '0' when n68_o = '0' else dm_in;
  -- uart_rx.vhd:285:34
  n72_o <= '1' when addr = "0100" else '0';
  -- uart_rx.vhd:285:24
  n73_o <= '0' when n72_o = '0' else dm_in;
  -- uart_rx.vhd:286:34
  n76_o <= '1' when addr = "0101" else '0';
  -- uart_rx.vhd:286:24
  n77_o <= '0' when n76_o = '0' else dm_in;
  -- uart_rx.vhd:287:34
  n80_o <= '1' when addr = "0110" else '0';
  -- uart_rx.vhd:287:24
  n81_o <= '0' when n80_o = '0' else dm_in;
  -- uart_rx.vhd:288:34
  n84_o <= '1' when addr = "0111" else '0';
  -- uart_rx.vhd:288:24
  n85_o <= '0' when n84_o = '0' else dm_in;
  n87_o <= n85_o & n81_o & n77_o & n73_o & n69_o & n65_o & n61_o & n57_o;
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
  signal n49_o : std_logic;
  signal n52_o : std_logic;
begin
  eq_out <= n52_o;
  -- uart_rx.vhd:233:21
  n49_o <= '1' when eq_in_1 = eq_in_2 else '0';
  -- uart_rx.vhd:233:9
  n52_o <= '0' when n49_o = '0' else '1';
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
  constant n41_o : std_logic := 'Z';
  constant n42_o : std_logic := 'Z';
  constant n43_o : std_logic := 'Z';
  constant n44_o : std_logic := 'Z';
  constant n45_o : std_logic := 'Z';
begin
  ce <= n41_o;
  res <= n42_o;
  res_bit_cnt <= n43_o;
  res_reg <= n44_o;
  dout_valid <= n45_o;
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
  signal dmx_out : std_logic_vector (7 downto 0);
  signal new_reg_val_1 : std_logic_vector (7 downto 0);
  signal new_reg_val_2 : std_logic_vector (7 downto 0);
  signal curr_reg_val : std_logic_vector (7 downto 0);
  signal reg_enable : std_logic;
  signal res_reg : std_logic;
  signal not_res_reg : std_logic;
  signal fsm_ce : std_logic;
  signal fsm_res : std_logic;
  signal fsm_res_bit_cnt : std_logic;
  signal fsm_res_reg : std_logic;
  signal fsm_dout_valid : std_logic;
  signal clk_eq_15_eq_out : std_logic;
  constant n11_o : std_logic_vector (3 downto 0) := "1111";
  signal clk_eq_7_eq_out : std_logic;
  constant n13_o : std_logic_vector (3 downto 0) := "0111";
  signal dmx_dm_out : std_logic_vector (7 downto 0);
  signal cnt_clk_cnt_out : std_logic_vector (3 downto 0);
  signal cnt_bits_cnt_out : std_logic_vector (3 downto 0);
  constant n17_o : std_logic := '1';
  signal sub_sub_4_out : std_logic_vector (3 downto 0);
  constant n19_o : std_logic_vector (3 downto 0) := "0001";
  signal bits_eq_eq_out : std_logic;
  constant n21_o : std_logic_vector (3 downto 0) := "1000";
  signal or8_or_8_out : std_logic_vector (7 downto 0);
  signal and81_and_8_out : std_logic_vector (7 downto 0);
  signal registr_reg_val : std_logic_vector (7 downto 0);
  signal n28_o : std_logic;
  signal n32_o : std_logic;
  constant n35_o : std_logic_vector (7 downto 0) := "ZZZZZZZZ";
begin
  wrap_clk <= clk;
  wrap_rst <= rst;
  wrap_din <= din;
  dout <= wrap_dout;
  dout_vld <= wrap_dout_vld;
  wrap_DOUT <= n35_o;
  wrap_DOUT_VLD <= fsm_dout_valid;
  -- uart_rx.vhd:296:12
  din_not <= n28_o; -- (isignal)
  -- uart_rx.vhd:299:12
  dmx_address <= cnt_bits_cnt_out; -- (isignal)
  -- uart_rx.vhd:302:12
  dmx_address_sub <= sub_sub_4_out; -- (isignal)
  -- uart_rx.vhd:305:12
  clk_cnt <= cnt_clk_cnt_out; -- (isignal)
  -- uart_rx.vhd:308:12
  cnt_clk_eq_15 <= clk_eq_15_eq_out; -- (signal)
  -- uart_rx.vhd:311:12
  cnt_clk_res <= fsm_res; -- (signal)
  -- uart_rx.vhd:312:12
  cnt_clk_ce <= fsm_ce; -- (signal)
  -- uart_rx.vhd:315:12
  cnt_clk_eq_7 <= clk_eq_7_eq_out; -- (signal)
  -- uart_rx.vhd:318:12
  res_bit_cnt <= fsm_res_bit_cnt; -- (signal)
  -- uart_rx.vhd:321:12
  bits_eq_8 <= bits_eq_eq_out; -- (signal)
  -- uart_rx.vhd:324:12
  dmx_out <= dmx_dm_out; -- (signal)
  -- uart_rx.vhd:327:12
  new_reg_val_1 <= or8_or_8_out; -- (signal)
  -- uart_rx.vhd:330:12
  new_reg_val_2 <= and81_and_8_out; -- (signal)
  -- uart_rx.vhd:333:12
  curr_reg_val <= registr_reg_val; -- (signal)
  -- uart_rx.vhd:336:12
  reg_enable <= 'X'; -- (signal)
  -- uart_rx.vhd:339:12
  res_reg <= fsm_res_reg; -- (signal)
  -- uart_rx.vhd:342:12
  not_res_reg <= n32_o; -- (signal)
  -- uart_rx.vhd:347:5
  fsm : entity work.uart_rx_fsm port map (
    clk => wrap_CLK,
    rst => wrap_RST,
    start_bit => din_not,
    cnt7 => cnt_clk_eq_7,
    rx_end => bits_eq_8,
    ce => fsm_ce,
    res => fsm_res,
    res_bit_cnt => fsm_res_bit_cnt,
    res_reg => fsm_res_reg,
    dout_valid => fsm_dout_valid);
  -- uart_rx.vhd:362:5
  clk_eq_15 : entity work.eq_4 port map (
    eq_in_1 => clk_cnt,
    eq_in_2 => n11_o,
    eq_out => clk_eq_15_eq_out);
  -- uart_rx.vhd:370:5
  clk_eq_7 : entity work.eq_4 port map (
    eq_in_1 => clk_cnt,
    eq_in_2 => n13_o,
    eq_out => clk_eq_7_eq_out);
  -- uart_rx.vhd:378:5
  dmx : entity work.demux_4_8 port map (
    dm_in => wrap_DIN,
    addr => dmx_address_sub,
    dm_out => dmx_dm_out);
  -- uart_rx.vhd:386:5
  cnt_clk : entity work.counter_4 port map (
    cnt_in => wrap_CLK,
    cnt_ce => cnt_clk_ce,
    cnt_res => cnt_clk_res,
    cnt_out => cnt_clk_cnt_out);
  -- uart_rx.vhd:395:5
  cnt_bits : entity work.counter_4 port map (
    cnt_in => cnt_clk_eq_15,
    cnt_ce => n17_o,
    cnt_res => res_bit_cnt,
    cnt_out => cnt_bits_cnt_out);
  -- uart_rx.vhd:404:5
  sub : entity work.sub_4 port map (
    sub_4_min => dmx_address,
    sub_4_sub => n19_o,
    sub_4_out => sub_sub_4_out);
  -- uart_rx.vhd:412:5
  bits_eq : entity work.eq_4 port map (
    eq_in_1 => dmx_address,
    eq_in_2 => n21_o,
    eq_out => bits_eq_eq_out);
  -- uart_rx.vhd:421:5
  or8 : entity work.or_8 port map (
    or_8_in_1 => dmx_out,
    or_8_in_2 => curr_reg_val,
    or_8_out => or8_or_8_out);
  -- uart_rx.vhd:429:5
  and81 : entity work.and_8_1 port map (
    and_8_in_1 => new_reg_val_1,
    and_8_in_2 => not_res_reg,
    and_8_out => and81_and_8_out);
  -- uart_rx.vhd:437:5
  registr : entity work.reg port map (
    reg_in => new_reg_val_2,
    reg_enable => reg_enable,
    reg_val => registr_reg_val);
  -- uart_rx.vhd:447:20
  n28_o <= not wrap_DIN;
  -- uart_rx.vhd:453:24
  n32_o <= not res_reg;
end rtl;
