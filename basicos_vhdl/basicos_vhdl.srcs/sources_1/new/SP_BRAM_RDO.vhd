----------------------------------------------------------------------------------
--Single Port BRAM with Resettable Data Output
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SP_BRAM_RDO is
    port(
        clk : in std_logic;
        en : in std_logic;
        we : in std_logic;
        rst : in std_logic;
        addr : in std_logic_vector(9 downto 0);
        di : in std_logic_vector(15 downto 0);
        do : out std_logic_vector(15 downto 0)
    );
end SP_BRAM_RDO;

architecture syn of SP_BRAM_RDO is
    type ram_type is array (1023 downto 0) of std_logic_vector(15 downto 0);
    signal ram : ram_type;
begin
    process(clk)
    begin
        if clk'event and clk = '1' then
            if en = '1' then -- optional enable
                if we = '1' then -- write enable
                    ram(to_integer(unsigned(addr))) <= di;
                end if;
                if rst = '1' then -- optional reset
                    do <= (others => '0');
                else
                    do <= ram(to_integer(unsigned(addr)));
                end if;
            end if;
        end if;
 end process;
    
end syn;
