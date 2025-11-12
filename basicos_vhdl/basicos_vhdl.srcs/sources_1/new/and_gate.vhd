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
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity and_gate is
    generic(
        input_length : integer := 2
    );
    port(
        input_vector : in std_logic_vector(input_length - 1 downto 0);
        output : out std_logic
    );
end and_gate;

architecture and_gate_ARCH of and_gate is

begin
    process(input_vector)
        variable result : std_logic := '1';
        begin
            for value in input_vector'range loop
                result := result AND input_vector(value);
            end loop;
            output <= result;
        end process;
end and_gate_ARCH;
