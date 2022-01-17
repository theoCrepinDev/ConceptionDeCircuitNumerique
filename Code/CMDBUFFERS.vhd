entity CMDBUFFERS is 
port(
    SEL_OUT : in STD_LOGIC_VECTOR(1 downto 0);
    MEM_CACHE_1 : in STD_LOGIC_VECTOR(7 downto 0);
    MEM_CACHE_2 : in STD_LOGIC_VECTOR(7 downto 0);
    s : in STD_LOGIC_VECTOR(7 downto 0);
    RES_OUT : out STD_LOGIC_VECTOR(7 downto 0);
);
end CMDBUFFERS

architecture CMDBUFFERS_Arch of CMDBUFFERS is
begin
    