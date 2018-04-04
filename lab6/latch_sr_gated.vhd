library ieee;
use ieee.std_logic_1164.all;

entity latch_sr_gated is
  port (
    S:   in  std_logic;
    R :  in  std_logic;
	 Clk: in std_logic;
    Q:   inout  std_logic;
    Q_n:   inout  std_logic
  );
end latch_sr_gated;

architecture structure of latch_sr_gated is
	signal R1, S1, tmpQ, tmpQ_n: std_logic;
begin
	R1 <= R AND Clk;
	S1 <= S AND Clk;
	tmpQ <= R1 NOR tmpQ_n;
	tmpQ_n <= S1 NOR tmpQ;
	Q <= tmpQ;
	Q_n <= tmpQ_n;
end structure;