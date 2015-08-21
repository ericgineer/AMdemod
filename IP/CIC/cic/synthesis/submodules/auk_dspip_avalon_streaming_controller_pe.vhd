-- (C) 2001-2015 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions and other 
-- software and tools, and its AMPP partner logic functions, and any output 
-- files any of the foregoing (including device programming or simulation 
-- files), and any associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License Subscription 
-- Agreement, Altera MegaCore Function License Agreement, or other applicable 
-- license agreement, including, without limitation, that your use is for the 
-- sole purpose of programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the applicable 
-- agreement for further details.


-------------------------------------------------------------------------
-------------------------------------------------------------------------
--
-- Revision Control Information
--
-- $RCSfile: auk_dspip_avalon_streaming_controller_pe.vhd,v $
-- $Source: /cvs/uksw/dsp_cores/lib/fu/avalon_streaming/rtl/auk_dspip_avalon_streaming_controller_pe.vhd,v $
--
-- $Revision: #1 $
-- $Date: 2015/02/08 $
-- Check in by     : $Author: swbranch $
-- Author   :  Suleyman Demirsoy
--
-- Project      :  Avalon Streaming Wrapper for DSPIP
--
-- Description : 
--
-- This file is the Interface controller for the Avalon Streaming Wrapper.
-- It can be used for designs with pipelined enable. This module includes a
-- FIFO that stores the valid data that is produced during a back pressure.
--
--
-- ALTERA Confidential and Proprietary
-- Copyright 2006 (c) Altera Corporation
-- All rights reserved
--
-------------------------------------------------------------------------
-------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

library altera_mf;
use altera_mf.altera_mf_components.all;
library work;
use work.auk_dspip_math_pkg.all;

entity auk_dspip_avalon_streaming_controller_pe is
  generic (
    FIFO_WIDTH_g            : natural := 8;
    ENABLE_PIPELINE_DEPTH_g : natural := 0;  -- this value should match the depth of the enable pipeline in the core
    FAMILY_g                : string  := "Stratix II";
    MEM_TYPE_g              : string  := "Auto"
    );  
  port(
    clk                 : in  std_logic;
    clk_en              : in  std_logic := '1';
    reset_n             : in  std_logic;
    ready               : in  std_logic;
    sink_packet_error   : in  std_logic_vector (1 downto 0);
    sink_stall          : in  std_logic;
    source_stall        : in  std_logic;
    valid               : in  std_logic;
    reset_design        : out std_logic;
    sink_ready_ctrl     : out std_logic;
    source_packet_error : out std_logic_vector (1 downto 0);
    source_valid_ctrl   : out std_logic;
    stall               : out std_logic;
    data_in             : in  std_logic_vector(FIFO_WIDTH_g-1 downto 0);
    data_out            : out std_logic_vector(FIFO_WIDTH_g-1 downto 0);
    design_stall        : out std_logic
    );

-- Declarations

end auk_dspip_avalon_streaming_controller_pe;

-- hds interface_end

architecture struct of auk_dspip_avalon_streaming_controller_pe is

  signal stall_int           : std_logic;
--  signal res                 : std_logic;
  signal sink_stall_reg      : std_logic;
  signal stall_reg_pipelined : std_logic;
  signal source_stall_reg    : std_logic;
  signal stall_reg           : std_logic;
  signal out_data_exists_int : std_logic;
  signal out_data_exists     : std_logic;
  signal valid_out           : std_logic;

-- attributes for stall_reg to limit max fanout
  attribute maxfan              : integer;
  attribute maxfan of stall_reg : signal is 500;
--  attribute maxfan of res       : signal is 500;

-- attributes for res
--  attribute altera_attribute        : string;
--  attribute altera_attribute of res : signal is "-name ADV_NETLIST_OPT_ALLOWED ""ALWAYS ALLOW"" ";


--fifo signals
  constant FIFO_HINT_c  : string  := "RAM_BLOCK_TYPE="& MEM_TYPE_g;
  constant FIFO_DEPTH_c : natural := ENABLE_PIPELINE_DEPTH_g;
  signal clear_fifo     : std_logic;
  signal fifo_rdreq     : std_logic;
  signal fifo_rdreq_d   : std_logic;
  signal fifo_wrreq     : std_logic;
  signal fifo_full      : std_logic;
  signal fifo_empty     : std_logic;
  signal fifo_alm_full  : std_logic;
  signal fifo_count     : std_logic_vector(log2_ceil(FIFO_DEPTH_c)-1 downto 0);
  signal fifo_alm_empty : std_logic;
	signal reset_design_int : std_logic;
  
begin

  reset_design        <= not reset_n;
	reset_design_int    <= not reset_n;
  out_data_exists_int <= not fifo_alm_empty;
  stall_int           <= sink_stall or source_stall or out_data_exists_int;

  source_valid_ctrl <= valid_out and (not stall_reg_pipelined) and clk_en when source_stall_reg = '0' else
                       valid_out;
  sink_ready_ctrl <= ready and (not source_stall_reg) and clk_en and (out_data_exists) when sink_stall_reg = '0' else
                     ready;
  stall        <= stall_reg when clk_en = '1' else '1';
  design_stall <= source_stall_reg;

  other_reg : process (clk, reset_n)
    variable stall_delay : std_logic_vector(ENABLE_PIPELINE_DEPTH_g+1 downto 0);  --there will always be at least one delay.
  begin  -- process res_reg
    if reset_n = '0' then
      out_data_exists     <= '0';
      sink_stall_reg      <= '0';
      stall_delay         := (others => '0');
      source_stall_reg    <= '0';
      stall_reg           <= '0';
      source_packet_error <= "00";
    elsif rising_edge(clk) then
      out_data_exists     <= out_data_exists_int;
      sink_stall_reg      <= sink_stall;
      stall_delay         := stall_delay(stall_delay'high-1 downto 0) & stall_int;
      source_stall_reg    <= source_stall;
      stall_reg           <= stall_int;
      source_packet_error <= sink_packet_error;
    end if;
    stall_reg_pipelined <= stall_delay(stall_delay'high);
  end process other_reg;


  clear_fifo <= '0';
  valid_out  <= (not fifo_empty) and (not source_stall_reg);
  fifo_wrreq <= '1' when valid = '1' and stall_reg_pipelined = '0' else '0';
  fifo_rdreq <= '1' when source_stall_reg = '0' else '0';
  out_fifo : scfifo
    generic map (
      add_ram_output_register => "ON",
      almost_empty_value      => 1,
      almost_full_value       => FIFO_DEPTH_c - 2,
      intended_device_family  => FAMILY_g,
      lpm_hint                => FIFO_HINT_c,  --shouldn't exist when use_eab is
                                               -- "OFF"
      lpm_numwords            => FIFO_DEPTH_c,
      lpm_showahead           => "OFF",
      lpm_type                => "scfifo",
      lpm_width               => FIFO_WIDTH_g,
      lpm_widthu              => log2_ceil(FIFO_DEPTH_c),
      overflow_checking       => "OFF",
      underflow_checking      => "OFF",
      use_eab                 => "ON"   --"OFF" for LE implementation
      )
    port map (
      aclr         => reset_design_int,
      sclr         => clear_fifo,
      clock        => clk,
      data         => data_in,
      q            => data_out,
      wrreq        => fifo_wrreq,
      rdreq        => fifo_rdreq,
      almost_full  => fifo_alm_full,
      usedw        => fifo_count,
      empty        => fifo_empty,
      almost_empty => fifo_alm_empty,
      full         => fifo_full
      );    
end struct;
