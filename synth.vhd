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
  signal n32_o : std_logic;
  signal n35_o : std_logic;
  signal n37_o : std_logic_vector (3 downto 0);
  signal n39_o : std_logic_vector (3 downto 0);
  signal n42_o : std_logic_vector (3 downto 0);
  signal n43_q : std_logic_vector (3 downto 0) := "0000";
begin
  cnt_out <= cnt_sig;
  -- uart_rx.vhd:117:8
  cnt_sig <= n43_q; -- (isignal)
  -- uart_rx.vhd:131:13
  n32_o <= '1' when rising_edge (cnt_in) else '0';
  -- uart_rx.vhd:132:25
  n35_o <= '1' when cnt_sig = "1111" else '0';
  -- uart_rx.vhd:135:36
  n37_o <= std_logic_vector (unsigned (cnt_sig) + unsigned'("0001"));
  -- uart_rx.vhd:132:13
  n39_o <= n37_o when n35_o = '0' else "0000";
  -- uart_rx.vhd:39:8
  n42_o <= cnt_sig when cnt_ce = '0' else n39_o;
  -- uart_rx.vhd:131:9
  process (cnt_in)
  begin
    if rising_edge (cnt_in) then
      n43_q <= n42_o;
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
  constant n19_o : std_logic := 'Z';
  constant n20_o : std_logic := 'Z';
  constant n21_o : std_logic := 'Z';
  constant n22_o : std_logic := 'Z';
  constant n23_o : std_logic := 'Z';
  constant n24_o : std_logic := 'Z';
begin
  reg_enable <= n19_o;
  rst_reg <= n20_o;
  dout_vld <= n21_o;
  rst_bit <= n22_o;
  inc_bit <= n23_o;
  rst_clk_cnt <= n24_o;
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
  signal rst_clk_cnt : std_logic;
  signal clk_cnt : std_logic_vector (3 downto 0);
  signal bit_cnt : std_logic_vector (3 downto 0);
  signal fsm_reg_enable : std_logic;
  signal fsm_rst_reg : std_logic;
  signal fsm_dout_vld : std_logic;
  signal fsm_rst_bit : std_logic;
  signal fsm_inc_bit : std_logic;
  signal fsm_rst_clk_cnt : std_logic;
  signal cnt_clk_cnt_out : std_logic_vector (3 downto 0);
  constant n8_o : std_logic := '1';
  constant n10_o : std_logic_vector (7 downto 0) := "00000000";
begin
  wrap_clk <= clk;
  wrap_rst <= rst;
  wrap_din <= din;
  dout <= wrap_dout;
  dout_vld <= wrap_dout_vld;
  wrap_DOUT <= n10_o;
  wrap_DOUT_VLD <= fsm_dout_vld;
  -- uart_rx.vhd:181:12
  rst_clk_cnt <= fsm_rst_clk_cnt; -- (signal)
  -- uart_rx.vhd:182:12
  clk_cnt <= cnt_clk_cnt_out; -- (signal)
  -- uart_rx.vhd:185:12
  bit_cnt <= "XXXX"; -- (signal)
  -- uart_rx.vhd:193:5
  fsm : entity work.uart_rx_fsm port map (
    clk => wrap_CLK,
    rst => wrap_RST,
    din => wrap_DIN,
    clk_cnt => clk_cnt,
    bit_cnt => bit_cnt,
    reg_enable => open,
    rst_reg => open,
    dout_vld => fsm_dout_vld,
    rst_bit => open,
    inc_bit => open,
    rst_clk_cnt => fsm_rst_clk_cnt);
  -- uart_rx.vhd:209:5
  cnt_clk : entity work.counter_4 port map (
    cnt_in => wrap_CLK,
    cnt_ce => n8_o,
    cnt_res => rst_clk_cnt,
    cnt_out => cnt_clk_cnt_out);
end rtl;
