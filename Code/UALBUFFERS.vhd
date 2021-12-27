entity UALBUFFERS is 
port( 
	clk : in STD_LOGIC;
    reset : in STD_LOGIC
	Mem_1_IN : in STD_LOGIC_VECTOR( 7 downto 0);
    CE_Mem_1 : in STD_LOGIC;
    Mem_2_IN : in STD_LOGIC_VECTOR( 7 downto 0);
    CE_Mem_2 : in STD_LOGIC;
	Buff_A_IN : in STD_LOGIC_VECTOR( 3 downto 0);
    CE_Buff_A : in STD_LOGIC;
    Buff_B_IN : in STD_LOGIC_VECTOR( 3 downto 0);
    CE_Buff_B : in STD_LOGIC;
    SR_IN_L : in STD_LOGIC;
    CE_SR_IN_L : in STD_LOGIC;
    SR_IN_R : in STD_LOGIC;
    CE_SR_IN_R : in STD_LOGIC;
    Mem_1_OUT : in STD_LOGIC_VECTOR( 7 downto 0);
    Mem_2_OUT : in STD_LOGIC_VECTOR( 7 downto 0);
    Buff_A_OUT : in STD_LOGIC_VECTOR( 3 downto 0);
	Buff_B_OUT : in STD_LOGIC_VECTOR( 3 downto 0);
 );
 end UALBUFFERS
 
 architecture UALBUFFERS_Arch of UALBUFFERS is
 begin
 	BufAProc : process (reset, clk, CE_Buf_A)
    begin
    	if reset = '1' then
        	Buff_A_OUT <= (others => 0);
        elseif(rising_edge(clk) and CE_Buff_A = '1') then
        	Buff_A_OUT <= Buff_A_IN;
        end if;
    end process;
    BufBProc : process (reset, clk, CE_Buf_B)
    begin
    	if reset = '1' then
        	Buff_B_OUT <= (others => 0);
        elseif(rising_edge(clk) and CE_Buff_B = '1') then
        	Buff_B_OUT <= Buff_B_IN;
        end if;
    end process;
    