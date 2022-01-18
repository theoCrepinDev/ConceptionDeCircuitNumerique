library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

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
    	signal sSEL_OUT_out 			: std_logic_vector(1 downto 0) := (others => '0');
    	signal sSEL_FCT_out 			: std_logic_vector(3 downto 0) := (others => '0');
    
    
    	
    begin
        
    	SEL_FCT_out <= sSEL_FCT_out;
    	SEL_OUT_out <= sSEL_OUT_out;
        
        SEL_FCT_Proc : process (reset, clk)
        begin
            if reset = '1' then
                sSEL_FCT_out <= (others => '0'); 
            elsif (rising_edge(clk)) then
                sSEL_FCT_out <= SEL_FCT_in;
            end if;
        end process;
        
        SEL_OUT_Proc : process (reset, clk)
        begin
            if reset = '1' then
                sSEL_OUT_out <= (others => '0'); 
            elsif (rising_edge(clk)) then
                sSEL_OUT_out <= SEL_OUT_In;
            end if;
        end process;
        
    
    end CMDBuffers_Arch;