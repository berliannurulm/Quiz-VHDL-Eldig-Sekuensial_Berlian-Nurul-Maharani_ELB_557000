library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparator_1bit_tb is
end comparator_1bit_tb;

architecture behavior of comparator_1bit_tb is
    component comparator_1bit
    Port ( A : in STD_LOGIC; B : in STD_LOGIC; 
           Eq : out STD_LOGIC; Gt : out STD_LOGIC; Lt : out STD_LOGIC);
    end component;

    signal A_tb, B_tb : STD_LOGIC := '0';
    signal Eq_tb, Gt_tb, Lt_tb : STD_LOGIC;
begin
    uut: comparator_1bit PORT MAP (
        A => A_tb, B => B_tb, 
        Eq => Eq_tb, Gt => Gt_tb, Lt => Lt_tb
    );

    stim_proc: process
    begin
        -- Uji semua kombinasi A dan B
        A_tb <= '0'; B_tb <= '0'; wait for 10 ns; -- Harusnya Eq=1
        A_tb <= '0'; B_tb <= '1'; wait for 10 ns; -- Harusnya Lt=1
        A_tb <= '1'; B_tb <= '0'; wait for 10 ns; -- Harusnya Gt=1
        A_tb <= '1'; B_tb <= '1'; wait for 10 ns; -- Harusnya Eq=1
        wait;
    end process;
end behavior;