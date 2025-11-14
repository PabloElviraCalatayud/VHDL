----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/12/2025 07:13:27 PM
-- Design Name: 
-- Module Name: or_gate - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity or_gate is
    generic(
        input_length : integer := 2
    );
    port(
        input_vector : in std_logic_vector(input_length - 1 downto 0);
        output : out std_logic
    );
end or_gate;

architecture or_gate_ARCH of or_gate is

begin
    process(input_vector)
        variable result : std_logic := '0';
        begin
          result := '0';
          for value in input_vector'range loop
            result := result OR input_vector(value);
          end loop;
          output <= result;
    end process;
end or_gate_ARCH;
