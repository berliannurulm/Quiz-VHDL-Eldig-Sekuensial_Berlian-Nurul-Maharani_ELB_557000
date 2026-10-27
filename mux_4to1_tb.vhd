library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_4to1_tb is
end mux_4to1_tb;

architecture behavior of mux_4to1_tb is
    component mux_4to1
    Port ( D0  : in STD_LOGIC;
           D1  : in STD_LOGIC;
           D2  : in STD_LOGIC;
           D3  : in STD_LOGIC;
           Sel : in STD_LOGIC_VECTOR (1 downto 0);
           Y   : out STD_LOGIC);
    end component;

    signal D0_tb, D1_tb, D2_tb, D3_tb : STD_LOGIC := '0';
    signal Sel_tb : STD_LOGIC_VECTOR(1 downto 0) := "00";
    signal Y_tb   : STD_LOGIC;
begin
    uut: mux_4to1 PORT MAP (
        D0 => D0_tb, D1 => D1_tb, D2 => D2_tb, D3 => D3_tb, 
        Sel => Sel_tb, Y => Y_tb
    );

    stim_proc: process
    begin
        -- Set nilai input data
        D0_tb <= '1'; D1_tb <= '0'; D2_tb <= '1'; D3_tb <= '0';

        -- Uji setiap kombinasi Selector
        Sel_tb <= "00"; wait for 10 ns; -- Y harusnya 1 (D0)
        Sel_tb <= "01"; wait for 10 ns; -- Y harusnya 0 (D1)
        Sel_tb <= "10"; wait for 10 ns; -- Y harusnya 1 (D2)
        Sel_tb <= "11"; wait for 10 ns; -- Y harusnya 0 (D3)
        wait;
    end process;
end behavior;