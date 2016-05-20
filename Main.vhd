----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:10:50 05/18/2016 
-- Design Name: 
-- Module Name:    Main - Behavioral 
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

entity Main is
    Port ( num_one : in  STD_LOGIC_VECTOR (3 downto 0);
           num_two : in  STD_LOGIC_VECTOR (3 downto 0);
           symbol : in  STD_LOGIC;
           result : out  STD_LOGIC_VECTOR (3 downto 0);
           overflow : out  STD_LOGIC);
end Main;

architecture Behavioral of Main is

signal num_one_two : STD_LOGIC_VECTOR(3 downto 0);
signal num_two_two : STD_LOGIC_VECTOR(3 downto 0);
signal num_two_two_one : STD_LOGIC_VECTOR(3 downto 0);
signal result_temp : STD_LOGIC_VECTOR(3 downto 0);
signal result_two : STD_LOGIC_VECTOR(3 downto 0);
signal result_two_temp : STD_LOGIC_VECTOR(3 downto 0);
signal overflow_temp : STD_LOGIC_VECTOR(3 downto 0);
signal temp:	STD_LOGIC;
signal top:STD_LOGIC;

COMPONENT FourBitAdder
	 Port ( num_one : in  STD_LOGIC_VECTOR (3 downto 0);
           num_two : in  STD_LOGIC_VECTOR (3 downto 0);
           sum : out  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC);
END COMPONENT;

COMPONENT Binary2Two
    Port ( input : in  STD_LOGIC_VECTOR (3 downto 0);
           output : out  STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT;

COMPONENT Two2Binary
    Port ( input : in  STD_LOGIC_VECTOR (3 downto 0);
           output : out  STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT;

begin
     binary_to_two_one : Binary2Two PORT MAP(
			input => num_one,
			output => num_one_two
	);
	
	binary_to_two_two : Binary2Two PORT MAP(
			input => num_two,
			output => num_two_two
	);
	
	process(num_two_two_one)
			begin
					if symbol='0' then
						num_two_two_one <= num_two_two;
						temp<='0';
					else
						num_two_two_one <= not num_two_two;
						temp<='1';
					end if;
		end process;
	
--	four_bit_adder_one:FourBitAdder PORT MAP(
--			num_one=> num_one_two,
--			num_two => num_two_two_one,
--			sum => result_two_temp,
--			cin => '0'
--	);
	
--	four_bit_adder:FourBitAdder PORT MAP(
--			num_one=> result_two_temp,
--			num_two => temp,
--			sum => result_two,
--			cin => '0'
--	);
	
	four_bit_adder:FourBitAdder PORT MAP(
			num_one=> num_one_two,
			num_two => num_two_two_one,
			sum => result_two,
			cin => temp
	);
			
   two_to_binary_two : Two2Binary PORT MAP(
			input => result_two,
			output => result_temp
	);
	
	top<=result_temp(0);
	result<=result_temp;
	overflow_temp<=symbol&num_one(0)&num_two(0)&top;
	
	process(overflow_temp)
	begin
			case overflow_temp is
					when "0110"|"0001"|"1011"|"1100"=> overflow<='1';
					when others=>overflow <='0';
			end case;
	end process;

end Behavioral;

