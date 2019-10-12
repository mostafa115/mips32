library verilog;
use verilog.vl_types.all;
entity datapath is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        memtoreg        : in     vl_logic;
        pcsrc           : in     vl_logic;
        alusrc          : in     vl_logic_vector(1 downto 0);
        ne              : in     vl_logic;
        regdst          : in     vl_logic;
        lbu             : in     vl_logic;
        link            : in     vl_logic;
        regwrite        : in     vl_logic;
        jump            : in     vl_logic;
        jr              : in     vl_logic;
        half            : in     vl_logic;
        b               : in     vl_logic;
        alucontrol      : in     vl_logic_vector(3 downto 0);
        zero            : out    vl_logic;
        pc              : out    vl_logic_vector(31 downto 0);
        instr           : in     vl_logic_vector(31 downto 0);
        aluout          : out    vl_logic_vector(31 downto 0);
        writedata       : out    vl_logic_vector(31 downto 0);
        readdata        : in     vl_logic_vector(31 downto 0)
    );
end datapath;
