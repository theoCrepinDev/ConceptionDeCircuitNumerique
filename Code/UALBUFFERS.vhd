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
    SR_OUT_L : in STD_LOGIC;
    SR_OUT_R : in STD_LOGIC;
    Mem_1_OUT : OUT STD_LOGIC_VECTOR( 7 downto 0);
    Mem_2_OUT : OUT STD_LOGIC_VECTOR( 7 downto 0);
    Buff_A_OUT : OUT STD_LOGIC_VECTOR( 3 downto 0);
	Buff_B_OUT : OUT STD_LOGIC_VECTOR( 3 downto 0)
 );
 end UALBUFFERS;
 
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
    SR_IN_LProc : process (reset, clk, CE_SR_IN_L)
    begin
        if reset = '1' then
            SR_OUT_L <= '0'; 
        elsif (rising_edge(clk) and CE_SR_IN_L = '1') then
            SR_OUT_L <= SR_IN_L;
        end if;
    end process;
    
    SR_IN_RProc : process (reset, clk, CE_SR_IN_R)
    begin
        if reset = '1' then
            SR_OUT_R <= '0'; 
        elsif (rising_edge(clk) and CE_SR_IN_R = '1') then
            SR_OUT_R <= SR_IN_R;
        end if;
    end process;
    
    Mem_1Proc : process (reset, clk, CE_Mem_1)
    begin
        if reset = '1' then
            Mem_1_out <= (others => '0'); 
        elsif (rising_edge(clk) and CE_Mem_1 = '1') then
            Mem_1_out <= Mem_1_in;
        end if;
    end process;
    
    Mem_2Proc : process (reset, clk, CE_Mem_2)
    begin
        if reset = '1' then
            Mem_2_out <= (others => '0'); 
        elsif (rising_edge(clk) and CE_Mem_2 = '1') then
            Mem_2_out <= Mem_2_in;
        end if;
    end process;
end UALBUFFERS_Arch;