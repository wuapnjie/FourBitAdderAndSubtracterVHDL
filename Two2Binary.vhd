----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:02:11 05/18/2016 
-- Design Name: 
-- Module Name:    Two2Binary - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Two2Binary is
    Port ( input : in  STD_LOGIC_VECTOR (3 downto 0);
           output : out  STD_LOGIC_VECTOR (3 downto 0));
end Two2Binary;

architecture Behavioral of Two2Binary is

begin
process(input)
begin
    case input is
			when "0000"=> output<="0000";
			when "0001"=> output<="0001";
			when "0010"=> output<="0010";
			when "0011"=> output<="0011";
			when "0100"=> output<="0100";
			when "0101"=> output<="0101";
			when "0110"=> output<="0110";
			when "0111"=> output<="0111";
			
			when "1001"=> output<="1111";
			when "1010"=> output<="1110";
			when "1011"=> output<="1101";
			when "1100"=> output<="1100";
			when "1101"=> output<="1011";
			when "1110"=> output<="1010";
			when "1111"=> output<="1001";
			when others => output<= "0000";
	 end case;
end process;

end Behavioral;

