----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/16/2025 06:27:29 PM
-- Design Name: 
-- Module Name: ud_counter - Behavioral
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

entity ud_counter is
    generic(
        output_length : integer := 4
    );
    port(
        clk : in std_logic;
        enable : in std_logic;
        up_down : in std_logic;
        reset : in std_logic
    );
end ud_counter;

architecture ud_counter_ARCH of ud_counter is

begin


end ud_counter_ARCH;
