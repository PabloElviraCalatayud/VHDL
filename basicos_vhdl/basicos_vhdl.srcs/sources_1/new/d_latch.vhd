library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity d_latch is 
  port(
    clk    : in  std_logic;
    D      : in  std_logic;
    reset  : in  std_logic;
    enable : in  std_logic;
    Q      : out std_logic
  );
end d_latch;

architecture d_latch_ARCH of d_latch is
  signal Q_int : std_logic;
begin
  process(clk, reset)
  begin
    if reset = '1' then
      Q_int <= '0';

    elsif rising_edge(clk) then
      if enable = '1' then
        Q_int <= D;
      end if;
    end if;
  end process;

  Q <= Q_int;
end d_latch_ARCH;
