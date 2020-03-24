library verilog;
use verilog.vl_types.all;
entity BFM_AHBSLAVE is
    generic(
        AWIDTH          : integer := 10;
        DEPTH           : integer := 256;
        INITFILE        : string  := " ";
        ID              : integer := 0;
        ENFUNC          : integer := 0;
        TPD             : integer := 1;
        DEBUG           : integer := -1
    );
    port(
        HCLK            : in     vl_logic;
        HRESETN         : in     vl_logic;
        HSEL            : in     vl_logic;
        HWRITE          : in     vl_logic;
        HADDR           : in     vl_logic_vector;
        HWDATA          : in     vl_logic_vector(31 downto 0);
        HRDATA          : out    vl_logic_vector(31 downto 0);
        HREADYIN        : in     vl_logic;
        HREADYOUT       : out    vl_logic;
        HTRANS          : in     vl_logic_vector(1 downto 0);
        HSIZE           : in     vl_logic_vector(2 downto 0);
        HBURST          : in     vl_logic_vector(2 downto 0);
        HMASTLOCK       : in     vl_logic;
        HPROT           : in     vl_logic_vector(3 downto 0);
        HRESP           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of AWIDTH : constant is 1;
    attribute mti_svvh_generic_type of DEPTH : constant is 1;
    attribute mti_svvh_generic_type of INITFILE : constant is 1;
    attribute mti_svvh_generic_type of ID : constant is 1;
    attribute mti_svvh_generic_type of ENFUNC : constant is 1;
    attribute mti_svvh_generic_type of TPD : constant is 1;
    attribute mti_svvh_generic_type of DEBUG : constant is 1;
end BFM_AHBSLAVE;
