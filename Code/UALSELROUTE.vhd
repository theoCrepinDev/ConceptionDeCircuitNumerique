entity UALSELROUTE is 
port (
	SEL_ROUTE : in STD_LOGIC_VECTOR(3 downto 0);
    s : in STD_LOGIC_VECTOR(7 downto 0);
    A : in STD_LOGIC_VECTOR(3 downto 0);
    B : in STD_LOGIC_VECTOR(3 downto 0);
    Buf_A_out : in STD_LOGIC_VECTOR(3 downto 0);
    Buf_B_out : in STD_LOGIC_VECTOR(3 downto 0);
    Mem_1_out : in STD_LOGIC_VECTOR(7 downto 0);
    Mem_2_out : in STD_LOGIC_VECTOR(7 downto 0);
    Buf_A_in : out STD_LOGIC_VECTOR(3 downto 0);
    Buf_B_in : out STD_LOGIC_VECTOR(3 downto 0);
    Mem_1_in : out STD_LOGIC_VECTOR(7 downto 0);
    Mem_2_in : out STD_LOGIC_VECTOR(7 downto 0);
    CE_Buf_A : out STD_LOGIC;
    CE_Buf_B : out STD_LOGIC;
    CE_Mem_1 : out STD_LOGIC;
    CE_Mem_2 : out STD_LOGIC;
    
);
end UALSELROUTE;

architecture UALSELROUTE_Arch of UALSELROUTE is
begin
	
	MySelRouteProc : process (SEL_ROUTE, S, A, B, Buf_A_out, Buf_B_out, Mem_1_out, Mem_2_out)--dès qu'une netrée bouge on regarde ce qui se passe
	begin
		case SEL_ROUTE is 
        	when "0000" => --stockage de l'entree A_IN dans Buffer_A
            	CE_Buf_A <=	'1'; CE_Buf_B <= '0' ; CE_Mem_1 <= '0' ; CE_Mem_2 <= '0';
                Buf_A_In <= A; Buf_B_in <= (others => '0'); Mem_1_In <= (others => '0'); Mem_2_in <= (others => '0');
                
                when "0001"	=> --stockage de  MEM_CAHE_1 dans buffer_A(4 bits de poids faibles)
            	CE_Buf_A <=	'1'; CE_Buf_B <= '0' ; CE_Mem_1 <= '0' ; CE_Mem_2 <= '0';
                Buf_A_In <= Mem_1_out(3 downto 0); Buf_B_in <= (others => '0'); Mem_1_In <= (others => '0'); Mem_2_in <= (others => '0');
                
                 when "0010"	=> --stockage de  MEM_CAHE_1 dans buffer_A(4 bits de poids forts)
            	CE_Buf_A <=	'1'; CE_Buf_B <= '0' ; CE_Mem_1 <= '0' ; CE_Mem_2 <= '0';
                Buf_A_In <= Mem_1_out(7 downto 4); Buf_B_in <= (others => '0'); Mem_1_In <= (others => '0'); Mem_2_in <= (others => '0');
                
                when "0011"	=> --stockage de  MEM_CAHE_2 dans buffer_A(4 bits de poids fibles)
            	CE_Buf_A <=	'1'; CE_Buf_B <= '0' ; CE_Mem_1 <= '0' ; CE_Mem_2 <= '0';
                Buf_A_In <= Mem_2_out(3 downto 0); Buf_B_in <= (others => '0'); Mem_1_In <= (others => '0'); Mem_2_in <= (others => '0');
                
                when "0100"	=> --stockage de  MEM_CAHE_2 dans buffer_A(4 bits de poids forts)
            	CE_Buf_A <=	'1'; CE_Buf_B <= '0' ; CE_Mem_1 <= '0' ; CE_Mem_2 <= '0';
                Buf_A_In <= Mem_2_out(7 downto 4); Buf_B_in <= (others => '0'); Mem_1_In <= (others => '0'); Mem_2_in <= (others => '0');
                
                when "0101"	=> --stockage de  S dans buffer_A(4 bits de poids faibles)
            	CE_Buf_A <=	'1'; CE_Buf_B <= '0' ; CE_Mem_1 <= '0' ; CE_Mem_2 <= '0';
                Buf_A_In <= S(3 downto 0); Buf_B_in <= (others => '0'); Mem_1_In <= (others => '0'); Mem_2_in <= (others => '0');
            	when "0110"	=> --stockage de  S dans buffer_A(4 bits de poids forts)
            	CE_Buf_A <=	'1'; CE_Buf_B <= '0' ; CE_Mem_1 <= '0' ; CE_Mem_2 <= '0';
                Buf_A_In <= S(7 downto 4); Buf_B_in <= (others => '0'); Mem_1_In <= (others => '0'); Mem_2_in <= (others => '0');  
                when "0111"	=> --stockage de  B_IN dans buffer_B
            	CE_Buf_A <=	'0'; CE_Buf_B <= '1' ; CE_Mem_1 <= '0' ; CE_Mem_2 <= '0';
                Buf_A_In <= (others => 0); Buf_B_in <= B; Mem_1_In <= (others => '0'); Mem_2_in <= (others => '0');  
              
              	when "1000"	=> --stockage de  MEM_CAHE_1 dans buffer_B(4 bits de poids faibles)
            	CE_Buf_A <=	'0'; CE_Buf_B <= '1' ; CE_Mem_1 <= '0' ; CE_Mem_2 <= '0';
                Buf_A_In <= (others => '0'); Buf_B_in <= Mem_1_out(3 downto 0); Mem_1_In <= (others => '0'); Mem_2_in <= (others => '0');
                
                 when "1001"	=> --stockage de  MEM_CAHE_1 dans buffer_B(4 bits de poids forts)
            	CE_Buf_A <=	'0'; CE_Buf_B <= '1' ; CE_Mem_1 <= '0' ; CE_Mem_2 <= '0';
                Buf_A_In <= (others => '0'); Buf_B_in <= Mem_1_out(7 downto 4); Mem_1_In <= (others => '0'); Mem_2_in <= (others => '0');
                
                when "1010"	=> --stockage de  MEM_CAHE_2 dans buffer_B(4 bits de poids faibles)
            	CE_Buf_A <=	'0'; CE_Buf_B <= '1' ; CE_Mem_1 <= '0' ; CE_Mem_2 <= '0';
                Buf_A_In <= ; Buf_B_in <= (others => '0')Mem_2_out(3 downto 0); Mem_1_In <= (others => '0'); Mem_2_in <= (others => '0');
                
                when "1011"	=> --stockage de  MEM_CAHE_2 dans buffer_B(4 bits de poids forts)
            	CE_Buf_A <=	'0'; CE_Buf_B <= '1' ; CE_Mem_1 <= '0' ; CE_Mem_2 <= '0';
                Buf_A_In <= (others => '0'); Buf_B_in <= Mem_2_out(7 downto 4); Mem_1_In <= (others => '0'); Mem_2_in <= (others => '0');
                
                when "1100"	=> --stockage de  S dans buffer_B(4 bits de poids faibles)
            	CE_Buf_A <=	'0'; CE_Buf_B <= '1' ; CE_Mem_1 <= '0' ; CE_Mem_2 <= '0';
                Buf_A_In <= (others => '0'); Buf_B_in <= S(3 downto 0); Mem_1_In <= (others => '0'); Mem_2_in <= (others => '0');
            	when "1101"	=> --stockage de  S dans buffer_A(4 bits de poids forts)
            	CE_Buf_A <=	'0'; CE_Buf_B <= '1' ; CE_Mem_1 <= '0' ; CE_Mem_2 <= '0';
                Buf_A_In <= (others => '0'); Buf_B_in <= S(7 downto 4); Mem_1_In <= (others => '0'); Mem_2_in <= (others => '0');  
                when "1110"	=> --stockage de  S dans Mem_CAHCE_1
            	CE_Buf_A <=	'0'; CE_Buf_B <= '0' ; CE_Mem_1 <= '1' ; CE_Mem_2 <= '0';
                Buf_A_In <= (others => '0'); Buf_B_in <= (others => 0); Mem_1_In <= S; Mem_2_in <= (others => '0');  
                
                when "1111"	=> --stockage de  S dans Mem_CAHCE_2
            	CE_Buf_A <=	'0'; CE_Buf_B <= '0' ; CE_Mem_1 <= '0' ; CE_Mem_2 <= '1';
                Buf_A_In <= (others => '0'); Buf_B_in <= (others => 0); Mem_1_In <= (others => '0'); Mem_2_in <= S;