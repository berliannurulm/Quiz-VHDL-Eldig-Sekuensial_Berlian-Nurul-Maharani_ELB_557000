library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2to1 is
    Port ( A   : in  STD_LOGIC;
           B   : in  STD_LOGIC;
           Sel : in  STD_LOGIC;
           Y   : out STD_LOGIC);
end mux_2to1;

architecture Dataflow of mux_2to1 is
begin
    Y <= A when (Sel = '0') else B;
end Dataflow;