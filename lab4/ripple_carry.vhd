library ieee;
use ieee.std_logic_1164.all;
use work.full_adder;

entity ripple_carry is
  generic (
    N : integer := 64
  );
  port (
    x,y : in std_logic_vector(N-1 downto 0);
    r : out std_logic_vector(N-1 downto 0);
    cin : in std_logic;
    cout : out std_logic;
    overflow : out std_logic
  );
end ripple_carry;

architecture rtl of ripple_carry is
	signal carry: std_logic_vector (0 to N);
begin
	carry(0) <= cin;
	gerador: for i in 0 to N-1 generate
			somador: full_adder port map (x(i), y(i), r(i), carry(i), carry(i+1));
	end generate;
	cout <= carry(N);
	overflow <= carry(N) XOR carry(N-1);
end rtl;
