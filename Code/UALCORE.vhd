entity UALCORE is
	port(
    	A : in STD_LOGIC_VECTOR(3 downto 0);
        B : in STD_LOGIC_VECTOR(3 downto 0);
        SEL_FCT : in STD_LOGIC_VECTOR(3 downto 0);
        SR_IN_L : in STD_LOGIC;
        SR_IN_R : in STD_LOGIC;
        S : out STD_LOGIC_VECTOR(7 downto 0);
        SR_OUT_R : out STD_LOGIC;
        SR_OUT_L : out STD_LOGIC
    );
end UALCORE;

architecture UALCORE_Arch of UALCORE is
begin

	MyUalCoreProc : process (A, B, SEL_FCT, SR_IN_L, SR_IN_R, S, SR_OUT_R, SR_OUT_L) -- dès qu'une entrée bouge on regarde ce qui se passe
    begin
    	case SEL_FCT is 
        	when "0000" => 
            	S <= (others => '0'); SR_OUT_L <= '0'; SR_OUT_R <= '0';
         	when "0001" => 
            	S(3 downto 0) <= A(3 downto 0); S(7 downto 4) <= (others => 0); SR_OUT_L <= '0'; SR_OUT_R <= '0';
            when "0010" => 
            	S(3 downto 0) <= B(3 downto 0); S(7 downto 4) <= (others => 0); SR_OUT_L <= '0'; SR_OUT_R <= '0';
            when "0011" => 
            	S(3 downto 0) <= not A(3 downto 0); S(7 downto 4) <= (others => 0); SR_OUT_L <= '0'; SR_OUT_R <= '0';
            when "0100" => 
            	S(3 downto 0) <= not B(3 downto 0); S(7 downto 4) <= (others => 0); SR_OUT_L <= '0'; SR_OUT_R <= '0';
            when "0101" => 
            	S(3 downto 0) <= (A and B); S(7 downto 4) <= (others => 0); SR_OUT_L <= '0'; SR_OUT_R <= '0';
            when "0110" => 
            	S(3 downto 0) <= (A or B); S(7 downto 4) <= (others => 0); SR_OUT_L <= '0'; SR_OUT_R <= '0';
            when "0111" => 
            	S(3 downto 0) <= (A xor B); S(7 downto 4) <= (others => 0); SR_OUT_L <= '0'; SR_OUT_R <= '0';
            when "1000" => 
            	S(3) <= SR_IN_L;S(2 downto 0) <= A(3 downto 1); S(7 downto 4) <= (others => 0); SR_OUT_L <= '0'; SR_OUT_R <= A(0);
            when "1001" => 
            	S(0) <= SR_IN_R;S(3 downto 1) <= A(2 downto 0); S(7 downto 4) <= (others => 0); SR_OUT_L <= A(3); SR_OUT_R <= '0';
            when "1010" => 
            	S(3) <= SR_IN_L;S(2 downto 0) <= B(3 downto 1); S(7 downto 4) <= (others => 0); SR_OUT_L <= '0'; SR_OUT_R <= B(0);
            when "1011" => 
            	S(0) <= SR_IN_R;S(3 downto 1) <= B(2 downto 0); S(7 downto 4) <= (others => 0); SR_OUT_L <= B(3); SR_OUT_R <= '0';
            when "1100" => 
            	S <= (A + B) ;SR_IN_R <= S(4); S(7 downto 4) <= (others => 0); SR_OUT_L <= '0'; SR_OUT_R <= '0';
           	when "1101" => 
            	S <= (A + B) ; S(7 downto 4) <= (others => 0); SR_OUT_L <= '0'; SR_OUT_R <= '0';
            when "1110" => 
            	S <= (A - B) ; S(7 downto 4) <= (others => 0); SR_OUT_L <= '0'; SR_OUT_R <= '0';
            when "1111" => 
            	S <= (A * B) ; S(7 downto 4) <= (others => 0); SR_OUT_L <= '0'; SR_OUT_R <= '0';
		end case;
	end process;
end UALCORE_Arch;