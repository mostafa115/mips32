library verilog;
use verilog.vl_types.all;
entity controller is
    port(
        op              : in     vl_logic_vector(5 downto 0);
        funct           : in     vl_logic_vector(5 downto 0);
        zero            : in     vl_logic;
        memtoreg        : out    vl_logic;
        memwrite        : out    vl_logic;
        pcsrc           : out    vl_logic;
        alusrc          : out    vl_logic_vector(1 downto 0);
        regdst          : out    vl_logic;
        regwrite        : out    vl_logic;
        jump            : out    vl_logic;
        jr              : out    vl_logic;
        ne              : out    vl_logic;
        half            : out    vl_logic;
        b               : out    vl_logic;
        alucontrol      : out    vl_logic_vector(3 downto 0);
        lbu             : out    vl_logic;
        link            : out    vl_logic
    );
end controller;
