library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_SP_BRAM_RDO is
end tb_SP_BRAM_RDO;

architecture tb of tb_SP_BRAM_RDO is
  signal clk  : std_logic := '0';
  signal en   : std_logic := '0';
  signal we   : std_logic := '0';
  signal rst  : std_logic := '0';
  signal addr : std_logic_vector(9 downto 0) := (others => '0');
  signal di   : std_logic_vector(15 downto 0) := (others => '0');
  signal do   : std_logic_vector(15 downto 0);

  constant CLK_PERIOD : time := 10 ns;
begin

  dut : entity work.SP_BRAM_RDO
    port map(
      clk  => clk,
      en   => en,
      we   => we,
      rst  => rst,
      addr => addr,
      di   => di,
      do   => do
    );

  clk_process : process
  begin
    clk <= '0';
    wait for CLK_PERIOD / 2;
    clk <= '1';
    wait for CLK_PERIOD / 2;
  end process;

  stim : process
  begin
    en <= '1';

    addr <= "0000000001";
    di   <= x"1234";
    we   <= '1';
    wait for CLK_PERIOD;

    we <= '0';
    wait for CLK_PERIOD;
    assert do = x"1234" report "Error en lectura addr 1" severity error;

    addr <= "0000000010";
    di   <= x"CAFE";
    we   <= '1';
    wait for CLK_PERIOD;

    we <= '0';
    wait for CLK_PERIOD;
    assert do = x"CAFE" report "Error en lectura addr 2" severity error;

    rst <= '1';
    wait for CLK_PERIOD;
    assert do = std_logic_vector(to_unsigned(0, 16))
      report "Error: reset no pone do a cero" severity error;

    rst <= '0';
    addr <= "0000000010";
    wait for CLK_PERIOD;
    assert do = x"CAFE" report "Error tras reset" severity error;

    wait for CLK_PERIOD;
    assert false report "FIN DE SIMULACION" severity failure;
  end process;

end tb;
