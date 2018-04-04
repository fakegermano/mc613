library ieee;
use ieee.std_logic_1164.all;

entity latch_sr_nand is
  port (
    S_n:   in  std_logic;
    R_n :  in  std_logic;
    Qa:   out  std_logic;
    Qb:   out  std_logic
  );
end latch_sr_nand;

architecture structure of latch_sr_nand is
	signal tmpQa, tmpQb : std_logic;
begin
	tmpQa <= NOT(S_n) NAND tmpQb;
	tmpQb <= NOT(R_n) NAND tmpQa;
	Qa <= tmpQa;
	Qb <= tmpQb;
end structure;