LIBRARY ieee;

USE ieee.std_logic_1164.all;

ENTITY estrutural IS
	PORT ( 	A: IN STD_LOGIC;
				B: IN STD_LOGIC;
				C: IN STD_LOGIC;
				D: IN STD_LOGIC;
				E: IN STD_LOGIC;
				F: OUT STD_LOGIC 
			);
END estrutural;

ARCHITECTURE Ors OF estrutural IS
	BEGIN
		F <= (( (NOT A) AND (NOT B) AND (NOT C) AND (NOT D) AND (NOT E) ) OR -- 0
			   ( (NOT A) AND (NOT B) AND (NOT C) AND D AND (NOT E) ) OR -- 2
				( (NOT A) AND (NOT B) AND C AND (NOT D) AND E ) OR -- 5
				( (NOT A) AND B AND (NOT C) AND (NOT D) AND (NOT E) ) OR -- 8
				( (NOT A) AND B AND C AND (NOT D) AND E ) OR -- 13
				( (NOT A) AND B AND C AND D AND E ) OR -- 15
				( A AND (NOT B) AND (NOT C) AND D AND (NOT E) ) OR -- 18
				( A AND (NOT B) AND C AND (NOT D) AND E ) OR -- 21
				( A AND B AND (NOT C) AND (NOT D) AND (NOT E) ) OR -- 24
				( A AND B AND C AND (NOT D) AND E ) OR -- 29
				( A AND B AND C AND D AND E ) -- 31
			 );
END Ors;
