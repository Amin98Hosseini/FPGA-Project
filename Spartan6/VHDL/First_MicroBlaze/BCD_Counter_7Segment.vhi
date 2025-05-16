
-- VHDL Instantiation Created from source file BCD_Counter_7Segment.vhd -- 18:36:10 05/02/2025
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT BCD_Counter_7Segment
	PORT(
		Clock : IN std_logic;
		Reset : IN std_logic;
		Up_Down : IN std_logic;          
		Seven_Segment_Int : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	Inst_BCD_Counter_7Segment: BCD_Counter_7Segment PORT MAP(
		Clock => ,
		Reset => ,
		Up_Down => ,
		Seven_Segment_Int => 
	);


