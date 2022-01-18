library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

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
    Mem_1_In : out STD_LOGIC_VECTOR(7 downto 0);
    Mem_2_In : out STD_LOGIC_VECTOR(7 downto 0);
    CE_Buf_A : out STD_LOGIC;
    CE_Buf_B : out STD_LOGIC;
    CE_Mem_1 : out STD_LOGIC;
    CE_Mem_2 : out STD_LOGIC
    
);
end UALSELROUTE;

architecture UALSELROUTE_Arch of UALSELROUTE is
	
    signal sMem_1_in, sMem_2_in :STD_LOGIC_VECTOR( 7 downto 0) := (others => '0');
    signal sBuf_A_in, sBuf_B_in :STD_LOGIC_VECTOR( 3 downto 0) := (others => '0');
    signal sCE_Buf_A, sCE_Buf_B, sCE_Mem_1, sCE_Mem_2 : STD_LOGIC := '0';

    
begin
	
	Mem_1_in <= sMem_1_in;
	Mem_2_in <= sMem_2_in;
	Buf_A_in <= sBuf_A_in;
	Buf_B_in <= sBuf_A_in;
    CE_Mem_1 <= sCE_Mem_1;
	CE_Mem_2 <= sCE_Mem_2;
	CE_Buf_A <= sCE_Buf_A;
	CE_Buf_B <= sCE_Buf_A;
    
	MySelRouteProc : process (SEL_ROUTE, S, A, B, Buf_A_out, Buf_B_out, Mem_1_out, Mem_2_out)--dès qu'une netrée bouge on regarde ce qui se passe
	begin
		case SEL_ROUTE is 
        	when "0000" => --stockage de l'entree A_IN dans Buffer_A
            	sCE_Buf_A <=	'1'; sCE_Buf_B <= '0' ; sCE_Mem_1 <= '0' ; sCE_Mem_2 <= '0';
                sBuf_A_In <= A; sBuf_B_in <= (others => '0'); sMem_1_In <= (others => '0'); sMem_2_in <= (others => '0');
                
                when "0001"	=> --stockage de  MEM_CAHE_1 dans buffer_A(4 bits de poids faibles)
            	sCE_Buf_A <=	'1'; sCE_Buf_B <= '0' ; sCE_Mem_1 <= '0' ; sCE_Mem_2 <= '0';
                sBuf_A_In <= Mem_1_out(3 downto 0); sBuf_B_in <= (others => '0'); sMem_1_In <= (others => '0'); sMem_2_in <= (others => '0');
                
                 when "0010"	=> --stockage de  MEM_CAHE_1 dans buffer_A(4 bits de poids forts)
            	sCE_Buf_A <=	'1'; sCE_Buf_B <= '0' ; sCE_Mem_1 <= '0' ; sCE_Mem_2 <= '0';
                sBuf_A_In <= Mem_1_out(7 downto 4); sBuf_B_in <= (others => '0'); sMem_1_In <= (others => '0'); sMem_2_in <= (others => '0');
                
                when "0011"	=> --stockage de  MEM_CAHE_2 dans buffer_A(4 bits de poids fibles)
            	sCE_Buf_A <=	'1'; sCE_Buf_B <= '0' ; sCE_Mem_1 <= '0' ; sCE_Mem_2 <= '0';
                sBuf_A_In <= Mem_2_out(3 downto 0); sBuf_B_in <= (others => '0'); sMem_1_In <= (others => '0'); sMem_2_in <= (others => '0');
                
                when "0100"	=> --stockage de  MEM_CAHE_2 dans buffer_A(4 bits de poids forts)
            	sCE_Buf_A <=	'1'; sCE_Buf_B <= '0' ; sCE_Mem_1 <= '0' ; sCE_Mem_2 <= '0';
                sBuf_A_In <= Mem_2_out(7 downto 4); sBuf_B_in <= (others => '0'); sMem_1_In <= (others => '0'); sMem_2_in <= (others => '0');
                
                when "0101"	=> --stockage de  S dans buffer_A(4 bits de poids faibles)
            	sCE_Buf_A <=	'1'; sCE_Buf_B <= '0' ;sCE_Mem_1 <= '0' ; sCE_Mem_2 <= '0';
                sBuf_A_In <= S(3 downto 0); sBuf_B_in <= (others => '0'); sMem_1_In <= (others => '0'); sMem_2_in <= (others => '0');
            	when "0110"	=> --stockage de  S dans buffer_A(4 bits de poids forts)
            	sCE_Buf_A <=	'1'; sCE_Buf_B <= '0' ; sCE_Mem_1 <= '0' ; sCE_Mem_2 <= '0';
                sBuf_A_In <= S(7 downto 4); sBuf_B_in <= (others => '0'); sMem_1_In <= (others => '0'); sMem_2_in <= (others => '0');  
                when "0111"	=> --stockage de  B_IN dans buffer_B
            	sCE_Buf_A <=	'0'; sCE_Buf_B <= '1' ; sCE_Mem_1 <= '0' ; sCE_Mem_2 <= '0';
                sBuf_A_In <= (others => '0'); sBuf_B_in <= B; sMem_1_In <= (others => '0'); sMem_2_in <= (others => '0');  
              
              	when "1000"	=> --stockage de  MEM_CAHE_1 dans buffer_B(4 bits de poids faibles)
            	sCE_Buf_A <=	'0'; sCE_Buf_B <= '1' ; sCE_Mem_1 <= '0' ; sCE_Mem_2 <= '0';
                sBuf_A_In <= (others => '0'); sBuf_B_in <= Mem_1_out(3 downto 0); sMem_1_In <= (others => '0'); sMem_2_in <= (others => '0');
                
                 when "1001"	=> --stockage de  MEM_CAHE_1 dans buffer_B(4 bits de poids forts)
            	sCE_Buf_A <=	'0'; sCE_Buf_B <= '1' ; sCE_Mem_1 <= '0' ; sCE_Mem_2 <= '0';
                sBuf_A_In <= (others => '0'); sBuf_B_in <= Mem_1_out(7 downto 4); sMem_1_In <= (others => '0'); sMem_2_in <= (others => '0');
                
                when "1010"	=> --stockage de  MEM_CAHE_2 dans buffer_B(4 bits de poids faibles)
            	sCE_Buf_A <=	'0'; sCE_Buf_B <= '1' ; sCE_Mem_1 <= '0' ; sCE_Mem_2 <= '0';
                sBuf_A_In <= (others => '0'); sBuf_B_in <= Mem_2_out(3 downto 0); sMem_1_In <= (others => '0'); sMem_2_in <= (others => '0');
                
                when "1011"	=> --stockage de  MEM_CAHE_2 dans buffer_B(4 bits de poids forts)
            	sCE_Buf_A <=	'0'; sCE_Buf_B <= '1' ; sCE_Mem_1 <= '0' ; sCE_Mem_2 <= '0';
               sBuf_A_In <= (others => '0'); sBuf_B_in <= Mem_2_out(7 downto 4); sMem_1_In <= (others => '0'); sMem_2_in <= (others => '0');
                
                when "1100"	=> --stockage de  S dans buffer_B(4 bits de poids faibles)
            	sCE_Buf_A <=	'0'; sCE_Buf_B <= '1' ; sCE_Mem_1 <= '0' ; sCE_Mem_2 <= '0';
                sBuf_A_In <= (others => '0'); sBuf_B_in <= S(3 downto 0); sMem_1_In <= (others => '0'); sMem_2_in <= (others => '0');
            	when "1101"	=> --stockage de  S dans buffer_A(4 bits de poids forts)
            	sCE_Buf_A <=	'0'; sCE_Buf_B <= '1' ; sCE_Mem_1 <= '0' ; sCE_Mem_2 <= '0';
                sBuf_A_In <= (others => '0'); sBuf_B_in <= S(7 downto 4); sMem_1_In <= (others => '0'); sMem_2_in <= (others => '0');  
                when "1110"	=> --stockage de  S dans Mem_CAHCE_1
            	sCE_Buf_A <=	'0'; sCE_Buf_B <= '0' ; sCE_Mem_1 <= '1' ; sCE_Mem_2 <= '0';
                sBuf_A_In <= (others => '0'); sBuf_B_in <= (others => '0'); sMem_1_In <= S; sMem_2_in <= (others => '0');  
                
                when others	=> --stockage de  S dans Mem_CAHCE_2
            	sCE_Buf_A <=	'0'; sCE_Buf_B <= '0' ; sCE_Mem_1 <= '0' ; sCE_Mem_2 <= '1';
                sBuf_A_In <= (others => '0'); sBuf_B_in <= (others => '0'); sMem_1_In <= (others => '0'); sMem_2_in <= S;
            end case;
    end process;
end UALSELROUTE_Arch; 