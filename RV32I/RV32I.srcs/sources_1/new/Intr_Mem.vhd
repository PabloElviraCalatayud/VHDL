----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.11.2025 19:18:23
-- Design Name: 
-- Module Name: Intr_Mem - Behavioral
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

entity Intr_Mem is
    port(
        address : in std_logic_vector(5 downto 0);
        data : out std_logic_vector(31 downto 0)
    );
end Intr_Mem;

architecture Intr_Mem_ARCH of Intr_Mem is
    signal address_sel : std_logic_vector(5 downto 0);
    signal data_out : std_logic_vector(31 downto 0);
    
begin
    address_sel <= address;
    lookup_proc : process(address_sel) 
    begin
        case(address_sel) is
            when "000000" => data_out <= "0000000000000000000000000000000"; 
            when others => data_out <= (others => '0');
        end case;
    end process lookup_proc;
    data <= data_out;
end architecture Intr_Mem_ARCH;
