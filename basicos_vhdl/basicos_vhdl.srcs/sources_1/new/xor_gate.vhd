library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xor_gate is 
  generic(
    input_length : integer := 8
  );
  port(
    input_vector : in std_logic_vector(input_length - 1 downto 0);
    output : out std_logic
  );
end xor_gate;

architecture xor_gate_ARCH of xor_gate is 
begin
  process(input_vector)
    variable result : std_logic := '0';
    begin
      result := '0';
      for value in input_vector'range loop
        result := result XOR input_vector(value);
      end loop;
      output <= result;
    end process;
end xor_gate_ARCH;
