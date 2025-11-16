library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity d_latch is 
  port(
    clk : in std_logic;
    D : in std_logic;
    reset : in std_logic;
    enable : in std_logic;
    Q : out std_logic
  );
end d_latch;

architecture d_latch_ARCH of d_latch is 
begin
  process(clk)
    if risin'edge(clk) then
      Q <= D;
    end if;
  else
      Q <= Q;
    end process;
end d_latch_ARCH;
