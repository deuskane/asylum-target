library IEEE;
use     IEEE.STD_LOGIC_1164.ALL;
use     IEEE.NUMERIC_STD.ALL;

package techmap_pkg is
-- [COMPONENT_INSERT][BEGIN]
component cgate is
  port   (
    clk_i    : in  std_logic; -- Input Clock
    cke_i    : in  std_logic; -- Clock command (active high)
                              --   0 disable clock
                              --   1 enable  clock
    clk_o    : out std_logic; -- Output Clock
    dft_te_i : in  std_logic  -- Test enable (active high)
    );
end component cgate;

component sync2dff is
  port   (
    clk_i    : in  std_logic; -- Input  Clock
    d_i      : in  std_logic; -- Input  data
    q_o      : out std_logic  -- Output data
    );
end component sync2dff;

component sync2dffrn is
  port   (
    clk_i    : in  std_logic; -- Input  Clock
    arst_b_i : in  std_logic; -- Input  Asychronous Reset active low
    d_i      : in  std_logic; -- Input  data
    q_o      : out std_logic  -- Output data
    );
end component sync2dffrn;

component cbufg is
  port   (
    d_i    : in  std_logic; -- Input  Clock
    d_o    : out std_logic  -- Output Clock
    );
end component cbufg;

-- [COMPONENT_INSERT][END]

end techmap_pkg;
