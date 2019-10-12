library verilog;
use verilog.vl_types.all;
entity signex is
    generic(
        extamount       : integer := 16;
        inputsize       : integer := 16
    );
    port(
        x               : in     vl_logic_vector;
        o               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of extamount : constant is 1;
    attribute mti_svvh_generic_type of inputsize : constant is 1;
end signex;
