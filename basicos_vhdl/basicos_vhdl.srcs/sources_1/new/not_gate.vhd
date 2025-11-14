library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity not_gate is
  port(
    input : in std_logic;
    output : out std_logic
  );
end not_gate;

architecture not_gate_ARCH of not_gate is 
begin
  output <= NOT(input);
end not_gate_ARCH;
  
