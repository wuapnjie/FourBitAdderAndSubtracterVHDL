----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:42:21 05/17/2016 
-- Design Name: 
-- Module Name:    FourBitAdder - Behavioral 
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

entity FourBitAdder is
    Port ( num_one : in  STD_LOGIC_VECTOR (3 downto 0);
           num_two : in  STD_LOGIC_VECTOR (3 downto 0);
           sum : out  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC);
end FourBitAdder;

architecture Behavioral of FourBitAdder is
COMPONENT OneBitAdder
	 Port(
			A : in STD_LOGIC;
			B : in STD_LOGIC;
			Cin : in STD_LOGIC;
			O : out STD_LOGIC;
			Cout:out STD_LOGIC
	 );
END COMPONENT;

signal ctemp:STD_LOGIC_VECTOR(3 downto 0);

begin
	one_bit_adder_0 : OneBitAdder PORT MAP(
			A=>num_one(0),
			B=>num_two(0),
			Cin=>cin,
			O=> sum(0),
			cout=>ctemp(0)
	);
	
	one_bit_adder_1 : OneBitAdder PORT MAP(
			A=>num_one(1),
			B=>num_two(1),
			Cin=>ctemp(0),
			O=> sum(1),
			cout=>ctemp(1)
	);
	
	one_bit_adder_2 : OneBitAdder PORT MAP(
			A=>num_one(2),
			B=>num_two(2),
			Cin=>ctemp(1),
			O=> sum(2),
			cout=>ctemp(2)
	);
	
	one_bit_adder_3 : OneBitAdder PORT MAP(
			A=>num_one(3),
			B=>num_two(3),
			Cin=>ctemp(2),
			O=> sum(3),
			cout=>ctemp(3)
	);

end Behavioral;

