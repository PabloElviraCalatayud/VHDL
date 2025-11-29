----------------------------------------------------------------------------------
-- Single-Port RAM with Asynchronous Read
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity SP_AR_RAM is
    port(
        clk : in std_logic;
        we : in std_logic;
        a : in std_logic_vector(5 downto 0);
        di : in std_logic_vector(15 downto 0);
        do : out std_logic_vector(15 downto 0)
    );
end SP_AR_RAM;

architecture syn of SP_AR_RAM is
    type ram_type is array(63 downto 0) of std_logic_vector(15 downto 0);
    signal RAM : ram_type;
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if(we = '1') then
                RAM(to_integer(unsigned(a))) <= di;
            end if;
        end if;
    end process;
    do <= RAM(to_integer(unsigned(a)));
end syn;
