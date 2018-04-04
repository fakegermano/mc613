-- brief : lab05 - question 2

library ieee;
use ieee.std_logic_1164.all;

entity cla_8bits is
  port(
    x    : in  std_logic_vector(7 downto 0);
    y    : in  std_logic_vector(7 downto 0);
    cin  : in  std_logic;
    sum  : out std_logic_vector(7 downto 0);
    cout : out std_logic
  );
end cla_8bits;

architecture rtl of cla_8bits is
	signal g, p : std_logic_vector(7 downto 0);
	signal c : std_logic_vector(7 downto 0);
begin
	c(0) <= cin;
	g(0) <= x(0) AND y(0);
	g(1) <= x(1) AND y(1);
	g(2) <= x(2) AND y(2);
	g(3) <= x(3) AND y(3);
	g(4) <= x(4) AND y(4);
	g(5) <= x(5) AND y(5);
	g(6) <= x(6) AND y(6);
	g(7) <= x(7) AND y(7);
	p(0) <= x(0) OR y(0);
	p(1) <= x(1) OR y(1);
	p(2) <= x(2) OR y(2);
	p(3) <= x(3) OR y(3);
	p(4) <= x(4) OR y(4);
	p(5) <= x(5) OR y(5);
	p(6) <= x(6) OR y(6);
	p(7) <= x(7) OR y(7);
	c(1) <= g(0) OR (p(0) AND c(0));
	c(2) <= g(1) OR (p(1) AND g(0)) OR (p(1) AND p(0) AND c(0));
	c(3) <= g(2) OR (p(2) AND g(1)) OR (p(2) AND p(1) AND g(0)) OR (p(2) AND p(1) AND p(0) AND c(0));
	c(4) <= g(3) OR (p(3) AND g(2)) OR (p(3) AND p(2) AND g(1)) OR (p(3) AND p(2) AND p(1) AND g(0)) OR (p(3) AND p(2) AND p(1) AND p(0) AND c(0));
	c(5) <= g(4) OR (p(4) AND g(3)) OR (p(4) AND p(3) AND g(2)) OR (p(4) AND p(3) AND p(2) AND g(1)) OR (p(4) AND p(3) AND p(2) AND p(1) AND g(0)) OR (p(4) AND p(3) AND p(2) AND p(1) AND p(0) AND c(0));
	c(6) <= g(5) OR (p(5) AND g(4)) OR (p(5) AND p(4) AND g(3)) OR (p(5) AND p(4) AND p(3) AND g(2)) OR (p(5) AND p(4) AND p(3) AND p(2) AND g(1)) OR (p(5) AND p(4) AND p(3) AND p(2) AND p(1) AND g(0)) OR (p(5) AND p(4) AND p(3) AND p(2) AND p(1) AND p(0) AND c(0));
	c(7) <= g(6) OR (p(6) AND g(5)) OR (p(6) AND p(5) AND g(4)) OR (p(6) AND p(5) AND p(4) AND g(3)) OR (p(6) AND p(5) AND p(4) AND p(3) AND g(2)) OR (p(6) AND p(5) AND p(4) AND p(3) AND p(2) AND g(1)) OR (p(6) AND p(5) AND p(4) AND p(3) AND p(2) AND p(1) AND g(0)) OR (p(6) AND p(5) AND p(4) AND p(3) AND p(2) AND p(1) AND p(0) AND c(0));
	cout <= g(7) OR (p(7) AND g(6)) OR (p(7) AND p(6) AND g(5)) OR (p(7) AND p(6) AND p(5) AND g(4)) OR (p(7) AND p(6) AND p(5) AND p(4) AND g(3)) OR (p(7) AND p(6) AND p(5) AND p(4) AND p(3) AND g(2)) OR (p(7) AND p(6) AND p(5) AND p(4) AND p(3) AND p(2) AND g(1)) OR (p(7) AND p(6) AND p(5) AND p(4) AND p(3) AND p(2) AND p(1) AND g(0)) OR (p(7) AND p(6) AND p(5) AND p(4) AND p(3) AND p(2) AND p(1) AND p(0) AND c(0));
	sum(0) <= x(0) XOR y(0) XOR c(0);
	sum(1) <= x(1) XOR y(1) XOR c(1);
	sum(2) <= x(2) XOR y(2) XOR c(2);
	sum(3) <= x(3) XOR y(3) XOR c(3);
	sum(4) <= x(4) XOR y(4) XOR c(4);
	sum(5) <= x(5) XOR y(5) XOR c(5);
	sum(6) <= x(6) XOR y(6) XOR c(6);
	sum(7) <= x(7) XOR y(7) XOR c(7);
end rtl;

