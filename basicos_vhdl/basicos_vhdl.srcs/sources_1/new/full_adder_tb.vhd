library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_tb is 
end full_adder_tb;

architecture full_adder_tb_ARCH of full_adder_tb is 

  constant input_length : integer := 4;

  signal vector_A : std_logic_vector(input_length - 1 downto 0);
  signal vector_B : std_logic_vector(input_length - 1 downto 0);
  signal output_vector : std_logic_vector(input_length - 1 downto 0);
  signal Cin : std_logic;
  signal Cout : std_logic;
  
  begin
    UUT : entity.work.full_adder
      generic map(
        input_length => input_length
      )
      port(
        vector_A => vector_A,
        vector_B => vector_B,
        output_vector => output_vector,
        Cin => Cin,
        Cout => Cout
      );

    stim : process 
    begin
      vector_A <= "0000"; vector_B <= "0000"; Cin <= '0';
      wait for 10ns;

      vector_A <= "0001"; vector_B <= "0000"; Cin <= '0';
      wait for 10ns;

      vector_A <= "0001"; vector_B <= "0000"; Cin <= '1';
      wait for 10ns;

      vector_A <= "0001"; vector_B <= "0001"; Cin <= '0';
      wait for 10ns;

      vector_A <= "0001"; vector_B <= "0001"; Cin <= '1';
      wait for 10ns;

      vector_A <= "1111"; vector_B <= "0000"; Cin <= '1';
      wait for 10ns;

      vector_A <= "1111"; vector_B <= "1111"; Cin <= '0';
      wait for 10ns;

      vector_A <= "1111"; vector_B <= "1111"; Cin <= '1';
      wait for 10ns;

      wait;
    end process;

end full_adder_tb_ARCH;

