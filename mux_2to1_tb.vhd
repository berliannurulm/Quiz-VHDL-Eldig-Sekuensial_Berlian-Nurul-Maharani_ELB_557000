library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2to1_tb is
-- Testbench tidak memiliki port
end mux_2to1_tb;

architecture behavior of mux_2to1_tb is
    -- Deklarasi komponen yang akan diuji
    component mux_2to1
    Port ( A : in STD_LOGIC; B : in STD_LOGIC; Sel : in STD_LOGIC; Y : out STD_LOGIC);
    end component;

    -- Sinyal internal
    signal A_tb   : STD_LOGIC := '0';
    signal B_tb   : STD_LOGIC := '0';
    signal Sel_tb : STD_LOGIC := '0';
    signal Y_tb   : STD_LOGIC;

begin
    -- Mapping port komponen ke sinyal internal
    uut: mux_2to1 PORT MAP (
        A => A_tb, 
        B => B_tb, 
        Sel => Sel_tb, 
        Y => Y_tb
    );

    -- Proses pemberian nilai stimulus
    stim_proc: process
    begin
        -- Test Case 1: A=1, B=0. Jika Sel=0, output Y harusnya 1 (ikut A)
        A_tb <= '1'; B_tb <= '0'; Sel_tb <= '0';
        wait for 10 ns;
        
        -- Test Case 2: A=1, B=0. Jika Sel=1, output Y harusnya 0 (ikut B)
        Sel_tb <= '1';
        wait for 10 ns;

        -- Test Case 3: A=0, B=1. Jika Sel=0, output Y harusnya 0 (ikut A)
        A_tb <= '0'; B_tb <= '1'; Sel_tb <= '0';
        wait for 10 ns;

        -- Test Case 4: A=0, B=1. Jika Sel=1, output Y harusnya 1 (ikut B)
        Sel_tb <= '1';
        wait for 10 ns;

        wait; -- Hentikan simulasi
    end process;
end behavior;