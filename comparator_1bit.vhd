library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparator_1bit is
    Port ( A  : in  STD_LOGIC;
           B  : in  STD_LOGIC;
           Eq : out STD_LOGIC;  -- A equal to B
           Gt : out STD_LOGIC;  -- A greater than B
           Lt : out STD_LOGIC); -- A less than B
end comparator_1bit;

architecture Dataflow of comparator_1bit is
begin
    Eq <= '1' when (A = B) else '0';
    Gt <= '1' when (A = '1' and B = '0') else '0';
    Lt <= '1' when (A = '0' and B = '1') else '0';
end Dataflow;