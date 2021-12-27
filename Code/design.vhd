-- Code your design here
entity MCU_PRJ_2021_TopLevel is
    Port (
        CLK100MHZ : in STD_LOGIC;
        sw : in STD_LOGIC_VECTOR(3 downto 0);
        btn : in STD_LOGIC_VECTOR(3 downto 0);
        led : out STD_LOGIC_VECTOR(3 downto 0);
        led0_r : out STD_LOGIC; led0_g : out STD_LOGIC; led0_b : out STD_LOGIC;                
        led1_r : out STD_LOGIC; led1_g : out STD_LOGIC; led1_b : out STD_LOGIC;
        led2_r : out STD_LOGIC; led2_g : out STD_LOGIC; led2_b : out STD_LOGIC;                
        led3_r : out STD_LOGIC; led3_g : out STD_LOGIC; led3_b : out STD_LOGIC
    );
end MCU_PRJ_2021_TopLevel;


component UALSELROUTE
	Port (
		SEL_ROUTE : in STD_LOGIC_VECTOR ( 3 downto 0);
		S : in STD_LOGIC_VECTOR ( 7 downto 0 );
		A : in STD_LOGIC_VECTOR ( 3 downto 0 );
		B : in STD_LOGIC_VECTOR ( 3 downto 0 );
		Buf_A_out : in STD_LOGIC_VECTOR (3 downto 0);
		Buf_A_out : in STD_LOGIC_VECTOR (3 downto 0);
		Mem_1_out : in STD_LOGIC_VECTOR (7 downto 0);
		Mem_2_out : in STD_LOGIC_VECTOR (7 downto 0);
		Buf_A_in : out STD_LOGIC_VECTOR (3 downto 0);
		Buf_B_in : out STD_LOGIC_VECTOR (3 downto 0);
		Buf_1_in : out STD_LOGIC_VECTOR (7 downto 0);
		Buf_2_in : out STD_LOGIC_VECTOR (7 downto 0);
		CE_Buf_A : out STD_LOGIC;
		CE_Buf_B : out STD_LOGIC;
		CE_Mem_1 : out STD_LOGIC;
		CE_Mem_2 : out STD_LOGIC;
	);
	end component;


MyUALSELROUTE : UALSELROUTE
	Port Map (
		SEL_ROUTE => My_INSTR_out(5 downto 2),
		S => My_S,
		A => sw,
		B => sw,
		Buf_A_out => My_Buf_A_out,
		Buf_B_out => My_Buf_B_out,
		Mem_1_out => My_Mem_1_out,
		Mem_2_out => My_Mem_2_out,
		Buf_A_in => My_Buf_A_in,
		Buf_B_in => My_Buf_B_in,
		Mem_1_in => My_Mem_1_in,
		Mem_2_in => My_Mem_2_in,
		CE_Buf_A => My_CE_Buf_A,
		CE_Buf_B => My_CE_Buf_B,
		CE_Mem_1 => My_CE_Mem_1,
		CE_Mem_2 => My_CE_Mem_2,
	);
    
component UALCORE
	Port(
    	A : in STD_LOGIC_VECTOR(3 downto 0);
        B : in STD_LOGIC_VECTOR(3 downto 0);
        SEL_FCT : in STD_LOGIC_VECTOR(3 downto 0);
        SR_IN_L : in STD_LOGIC;
        SR_IN_R : in STD_LOGIC;
        S : out STD_LOGIC_VECTOR(7 downto 0);
        SR_OUT_R ; out STD_LOGIC;
        SR_OUT_L : out STD_LOGIC;
    );
    end component;
    
MYUALCORE : UALCORE 
	Port(
    	S => My_S,
        A => My_Buff_A_out,
        B => My_Buff_B_out,
        SR_IN_R => My_Buff_SR_OUT_R,
        SR_IN_L => My_Buff_SR_OUT_L,
        SEL_FCT => My_Mem_SEL_FCT,
        SEL_OUT_R => My_SEL_OUT_R,
        SEL_OUT_L => My_SEL_OUT_L,
        	
    );