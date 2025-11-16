library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is  
  generic(
    input_length : integer := 2
  ); 
  port(
    vector_A : in std_logic_vector(input_length - 1 downto 0);
    vector_B : in std_logic_vector(input_length - 1 downto 0);
    output_vector : out std_logic_vector(input_length - 1 downto 0);
    Cin : in std_logic;
    Cout : out std_logic
  );
end full_adder;

architecture full_adder_ARCH of full_adder is 
begin
  process(vector_A, vector_B, Cin)
    variable result_vector : std_logic_vector(input_length - 1 downto 0) := (others => '0');
    variable midCarry : std_logic := '0';
    begin
      result_vector := (others => '0');
      midCarry := Cin;
      for i in 0 to input_length - 1 loop
        result_vector(i) := vector_A(i) XOR vector_B(i) XOR midCarry;
        midCarry := (vector_A(i) AND vector_B(i)) 
                      OR (midCarry AND (vector_A(i) XOR vector_B(i)));
      end loop;
      output_vector <= result_vector;
      Cout <= midCarry;
    end process;
end full_adder_ARCH;