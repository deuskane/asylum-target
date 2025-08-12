-------------------------------------------------------------------------------
-- Title      : 
-- Project    : PicoSOC
-------------------------------------------------------------------------------
-- File       : tb_dummy.vhd
-- Author     : Mathieu Rosière
-- Company    : 
-- Created    : 2025-01-06
-- Last update: 2025-08-11
-- Platform   : 
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: Instance of techno cells
-------------------------------------------------------------------------------
-- Copyright (c) 2013 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author   Description
-- 2025-01-06  2.0      mrosiere Created
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity tb_dummy is
end tb_dummy;

architecture rtl of tb_dummy is
begin
  
  cbufg : entity work.cbufg(rtl)
  port map (
    d_i   => '0',
    d_o   => open
    );
  
  cgate : entity work.cgate(rtl)
  port map (
    clk_i    => '0',
    cke_i    => '0',
    dft_te_i => '0',
    clk_o    => open
    );

  sync2dff : entity work.sync2dff(rtl)
  port map (
    clk_i => '0',
    d_i   => '0',
    q_o   => open
    );

  sync2dffrn : entity work.sync2dffrn(rtl)
  port map (
    clk_i    => '0',
    arst_b_i => '0',
    d_i      => '0',
    q_o      => open
    );

end rtl;
