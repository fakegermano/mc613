library ieee;
use ieee.std_logic_1164.all;

entity latch_d_gated is
  port (
    D: in std_logic;
	 Clk: in std_logic;
    Q:   inout  std_logic;
    Q_n:   inout  std_logic
  );
end latch_d_gated;

architecture structure of latch_d_gated is
	signal tmpQ: std_logic;
begin
	tmpQ <= D when Clk = '1' else tmpQ;
	Q <= tmpQ;
	Q_n <= NOT(tmpQ);
end structure;