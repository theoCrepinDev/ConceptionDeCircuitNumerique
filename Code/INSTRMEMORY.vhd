entity INSTRMEMORY is
port(
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    INSTR_in : in STD_LOGIC_VECTOR(9 downto 0);
    INSTR_out : out STD_LOGIC_VECTOR(9 downto 0);
    INSTR_addr : in STD_LOGIC_VECTOR(6 downto 0);
    INSTR_CE : in STD_LOGIC;
    RIW0 : in STD_LOGIC;
);
end INSTRMEMORY

architecture INSTRMEMORY_Arch of INSTRMEMORY is
    begin

        