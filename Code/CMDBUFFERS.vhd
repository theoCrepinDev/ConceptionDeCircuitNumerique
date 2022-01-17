entity CMDBuffers is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           SEL_FCT_in : in STD_LOGIC_VECTOR (3 downto 0);
           SEL_OUT_In : in STD_LOGIC_VECTOR (1 downto 0);
           SEL_FCT_out : out STD_LOGIC_VECTOR (3 downto 0);
           SEL_OUT_out : out STD_LOGIC_VECTOR (1 downto 0)
         );
    end CMDBuffers;
    
    architecture CMDBuffers_Arch of CMDBuffers is
    begin
        
        SEL_FCT_Proc : process (reset, clk)
        begin
            if reset = '1' then
                SEL_FCT_out <= (others => '0'); 
            elsif (rising_edge(clk)) then
                SEL_FCT_out <= SEL_FCT_in;
            end if;
        end process;
        
        SEL_OUT_Proc : process (reset, clk)
        begin
            if reset = '1' then
                SEL_OUT_out <= (others => '0'); 
            elsif (rising_edge(clk)) then
                SEL_OUT_out <= SEL_OUT_In;
            end if;
        end process;
    
    end CMDBuffers_Arch;