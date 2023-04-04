// Copyright 2020 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51

// Author: Nils Wistoff <nwistoff@iis.ee.ethz.ch>
//
// AUTOMATICALLY GENERATED by genoccamy.py; edit the script instead.

`include "axi_flat.sv"

module occamy_xilinx
  import occamy_pkg::*;
(
    input  logic             clk_i,
    input  logic             rst_ni,
    /// Peripheral clock
    input  logic             clk_periph_i,
    input  logic             rst_periph_ni,
    /// Real-time clock (for time keeping)
    input  logic             rtc_i,
    input  logic             test_mode_i,
    input  logic [ 1:0]      chip_id_i,
    input  logic [ 1:0]      boot_mode_i,
    // pad cfg
    output logic [31:0]      pad_slw_o,
    output logic [31:0]      pad_smt_o,
    output logic [31:0][1:0] pad_drv_o,
    // `uart` Interface
    output logic             uart_tx_o,
    input  logic             uart_rx_i,
    // `gpio` Interface
    input  logic [31:0]      gpio_d_i,
    output logic [31:0]      gpio_d_o,
    output logic [31:0]      gpio_oe_o,
    output logic [31:0]      gpio_puen_o,
    output logic [31:0]      gpio_pden_o,
    // `jtag` Interface
    input  logic             jtag_trst_ni,
    input  logic             jtag_tck_i,
    input  logic             jtag_tms_i,
    input  logic             jtag_tdi_i,
    output logic             jtag_tdo_o,
    // `i2c` Interface
    output logic             i2c_sda_o,
    input  logic             i2c_sda_i,
    output logic             i2c_sda_en_o,
    output logic             i2c_scl_o,
    input  logic             i2c_scl_i,
    output logic             i2c_scl_en_o,
    // `SPI Host` Interface
    output logic             spim_sck_o,
    output logic             spim_sck_en_o,
    output logic [ 1:0]      spim_csb_o,
    output logic [ 1:0]      spim_csb_en_o,
    output logic [ 3:0]      spim_sd_o,
    output logic [ 3:0]      spim_sd_en_o,
    input        [ 3:0]      spim_sd_i,

    input logic [11:0] ext_irq_i,

    // Boot ROM
    output logic        bootrom_en_o,
    // This is actually too wide. But the address width depends on the ROM size, so let Vivado handle
    // this for now
    output logic [47:0] bootrom_addr_o,
    input  logic [31:0] bootrom_data_i,

    /// HBM2e Ports
    input  logic                     m_axi_hbm_0_awready,
    output logic                     m_axi_hbm_0_awvalid,
    output logic             [  6:0] m_axi_hbm_0_awid,
    output logic             [ 47:0] m_axi_hbm_0_awaddr,
    output axi_pkg::len_t            m_axi_hbm_0_awlen,
    output axi_pkg::size_t           m_axi_hbm_0_awsize,
    output axi_pkg::burst_t          m_axi_hbm_0_awburst,
    output logic                     m_axi_hbm_0_awlock,
    output axi_pkg::cache_t          m_axi_hbm_0_awcache,
    output axi_pkg::prot_t           m_axi_hbm_0_awprot,
    output axi_pkg::qos_t            m_axi_hbm_0_awqos,
    output axi_pkg::region_t         m_axi_hbm_0_awregion,
    output logic             [  0:0] m_axi_hbm_0_awuser,
    input  logic                     m_axi_hbm_0_wready,
    output logic                     m_axi_hbm_0_wvalid,
    output logic             [511:0] m_axi_hbm_0_wdata,
    output logic             [ 63:0] m_axi_hbm_0_wstrb,
    output logic                     m_axi_hbm_0_wlast,
    output logic             [  0:0] m_axi_hbm_0_wuser,
    input  logic                     m_axi_hbm_0_arready,
    output logic                     m_axi_hbm_0_arvalid,
    output logic             [  6:0] m_axi_hbm_0_arid,
    output logic             [ 47:0] m_axi_hbm_0_araddr,
    output axi_pkg::len_t            m_axi_hbm_0_arlen,
    output axi_pkg::size_t           m_axi_hbm_0_arsize,
    output axi_pkg::burst_t          m_axi_hbm_0_arburst,
    output logic                     m_axi_hbm_0_arlock,
    output axi_pkg::cache_t          m_axi_hbm_0_arcache,
    output axi_pkg::prot_t           m_axi_hbm_0_arprot,
    output axi_pkg::qos_t            m_axi_hbm_0_arqos,
    output axi_pkg::region_t         m_axi_hbm_0_arregion,
    output logic             [  0:0] m_axi_hbm_0_aruser,
    output logic                     m_axi_hbm_0_rready,
    input  logic                     m_axi_hbm_0_rvalid,
    input  logic             [  6:0] m_axi_hbm_0_rid,
    input  logic             [511:0] m_axi_hbm_0_rdata,
    input  axi_pkg::resp_t           m_axi_hbm_0_rresp,
    input  logic                     m_axi_hbm_0_rlast,
    input  logic             [  0:0] m_axi_hbm_0_ruser,
    output logic                     m_axi_hbm_0_bready,
    input  logic                     m_axi_hbm_0_bvalid,
    input  logic             [  6:0] m_axi_hbm_0_bid,
    input  axi_pkg::resp_t           m_axi_hbm_0_bresp,
    input  logic             [  0:0] m_axi_hbm_0_buser,
    input  logic                     m_axi_hbm_1_awready,
    output logic                     m_axi_hbm_1_awvalid,
    output logic             [  6:0] m_axi_hbm_1_awid,
    output logic             [ 47:0] m_axi_hbm_1_awaddr,
    output axi_pkg::len_t            m_axi_hbm_1_awlen,
    output axi_pkg::size_t           m_axi_hbm_1_awsize,
    output axi_pkg::burst_t          m_axi_hbm_1_awburst,
    output logic                     m_axi_hbm_1_awlock,
    output axi_pkg::cache_t          m_axi_hbm_1_awcache,
    output axi_pkg::prot_t           m_axi_hbm_1_awprot,
    output axi_pkg::qos_t            m_axi_hbm_1_awqos,
    output axi_pkg::region_t         m_axi_hbm_1_awregion,
    output logic             [  0:0] m_axi_hbm_1_awuser,
    input  logic                     m_axi_hbm_1_wready,
    output logic                     m_axi_hbm_1_wvalid,
    output logic             [511:0] m_axi_hbm_1_wdata,
    output logic             [ 63:0] m_axi_hbm_1_wstrb,
    output logic                     m_axi_hbm_1_wlast,
    output logic             [  0:0] m_axi_hbm_1_wuser,
    input  logic                     m_axi_hbm_1_arready,
    output logic                     m_axi_hbm_1_arvalid,
    output logic             [  6:0] m_axi_hbm_1_arid,
    output logic             [ 47:0] m_axi_hbm_1_araddr,
    output axi_pkg::len_t            m_axi_hbm_1_arlen,
    output axi_pkg::size_t           m_axi_hbm_1_arsize,
    output axi_pkg::burst_t          m_axi_hbm_1_arburst,
    output logic                     m_axi_hbm_1_arlock,
    output axi_pkg::cache_t          m_axi_hbm_1_arcache,
    output axi_pkg::prot_t           m_axi_hbm_1_arprot,
    output axi_pkg::qos_t            m_axi_hbm_1_arqos,
    output axi_pkg::region_t         m_axi_hbm_1_arregion,
    output logic             [  0:0] m_axi_hbm_1_aruser,
    output logic                     m_axi_hbm_1_rready,
    input  logic                     m_axi_hbm_1_rvalid,
    input  logic             [  6:0] m_axi_hbm_1_rid,
    input  logic             [511:0] m_axi_hbm_1_rdata,
    input  axi_pkg::resp_t           m_axi_hbm_1_rresp,
    input  logic                     m_axi_hbm_1_rlast,
    input  logic             [  0:0] m_axi_hbm_1_ruser,
    output logic                     m_axi_hbm_1_bready,
    input  logic                     m_axi_hbm_1_bvalid,
    input  logic             [  6:0] m_axi_hbm_1_bid,
    input  axi_pkg::resp_t           m_axi_hbm_1_bresp,
    input  logic             [  0:0] m_axi_hbm_1_buser,
    input  logic                     m_axi_hbm_2_awready,
    output logic                     m_axi_hbm_2_awvalid,
    output logic             [  6:0] m_axi_hbm_2_awid,
    output logic             [ 47:0] m_axi_hbm_2_awaddr,
    output axi_pkg::len_t            m_axi_hbm_2_awlen,
    output axi_pkg::size_t           m_axi_hbm_2_awsize,
    output axi_pkg::burst_t          m_axi_hbm_2_awburst,
    output logic                     m_axi_hbm_2_awlock,
    output axi_pkg::cache_t          m_axi_hbm_2_awcache,
    output axi_pkg::prot_t           m_axi_hbm_2_awprot,
    output axi_pkg::qos_t            m_axi_hbm_2_awqos,
    output axi_pkg::region_t         m_axi_hbm_2_awregion,
    output logic             [  0:0] m_axi_hbm_2_awuser,
    input  logic                     m_axi_hbm_2_wready,
    output logic                     m_axi_hbm_2_wvalid,
    output logic             [511:0] m_axi_hbm_2_wdata,
    output logic             [ 63:0] m_axi_hbm_2_wstrb,
    output logic                     m_axi_hbm_2_wlast,
    output logic             [  0:0] m_axi_hbm_2_wuser,
    input  logic                     m_axi_hbm_2_arready,
    output logic                     m_axi_hbm_2_arvalid,
    output logic             [  6:0] m_axi_hbm_2_arid,
    output logic             [ 47:0] m_axi_hbm_2_araddr,
    output axi_pkg::len_t            m_axi_hbm_2_arlen,
    output axi_pkg::size_t           m_axi_hbm_2_arsize,
    output axi_pkg::burst_t          m_axi_hbm_2_arburst,
    output logic                     m_axi_hbm_2_arlock,
    output axi_pkg::cache_t          m_axi_hbm_2_arcache,
    output axi_pkg::prot_t           m_axi_hbm_2_arprot,
    output axi_pkg::qos_t            m_axi_hbm_2_arqos,
    output axi_pkg::region_t         m_axi_hbm_2_arregion,
    output logic             [  0:0] m_axi_hbm_2_aruser,
    output logic                     m_axi_hbm_2_rready,
    input  logic                     m_axi_hbm_2_rvalid,
    input  logic             [  6:0] m_axi_hbm_2_rid,
    input  logic             [511:0] m_axi_hbm_2_rdata,
    input  axi_pkg::resp_t           m_axi_hbm_2_rresp,
    input  logic                     m_axi_hbm_2_rlast,
    input  logic             [  0:0] m_axi_hbm_2_ruser,
    output logic                     m_axi_hbm_2_bready,
    input  logic                     m_axi_hbm_2_bvalid,
    input  logic             [  6:0] m_axi_hbm_2_bid,
    input  axi_pkg::resp_t           m_axi_hbm_2_bresp,
    input  logic             [  0:0] m_axi_hbm_2_buser,
    input  logic                     m_axi_hbm_3_awready,
    output logic                     m_axi_hbm_3_awvalid,
    output logic             [  6:0] m_axi_hbm_3_awid,
    output logic             [ 47:0] m_axi_hbm_3_awaddr,
    output axi_pkg::len_t            m_axi_hbm_3_awlen,
    output axi_pkg::size_t           m_axi_hbm_3_awsize,
    output axi_pkg::burst_t          m_axi_hbm_3_awburst,
    output logic                     m_axi_hbm_3_awlock,
    output axi_pkg::cache_t          m_axi_hbm_3_awcache,
    output axi_pkg::prot_t           m_axi_hbm_3_awprot,
    output axi_pkg::qos_t            m_axi_hbm_3_awqos,
    output axi_pkg::region_t         m_axi_hbm_3_awregion,
    output logic             [  0:0] m_axi_hbm_3_awuser,
    input  logic                     m_axi_hbm_3_wready,
    output logic                     m_axi_hbm_3_wvalid,
    output logic             [511:0] m_axi_hbm_3_wdata,
    output logic             [ 63:0] m_axi_hbm_3_wstrb,
    output logic                     m_axi_hbm_3_wlast,
    output logic             [  0:0] m_axi_hbm_3_wuser,
    input  logic                     m_axi_hbm_3_arready,
    output logic                     m_axi_hbm_3_arvalid,
    output logic             [  6:0] m_axi_hbm_3_arid,
    output logic             [ 47:0] m_axi_hbm_3_araddr,
    output axi_pkg::len_t            m_axi_hbm_3_arlen,
    output axi_pkg::size_t           m_axi_hbm_3_arsize,
    output axi_pkg::burst_t          m_axi_hbm_3_arburst,
    output logic                     m_axi_hbm_3_arlock,
    output axi_pkg::cache_t          m_axi_hbm_3_arcache,
    output axi_pkg::prot_t           m_axi_hbm_3_arprot,
    output axi_pkg::qos_t            m_axi_hbm_3_arqos,
    output axi_pkg::region_t         m_axi_hbm_3_arregion,
    output logic             [  0:0] m_axi_hbm_3_aruser,
    output logic                     m_axi_hbm_3_rready,
    input  logic                     m_axi_hbm_3_rvalid,
    input  logic             [  6:0] m_axi_hbm_3_rid,
    input  logic             [511:0] m_axi_hbm_3_rdata,
    input  axi_pkg::resp_t           m_axi_hbm_3_rresp,
    input  logic                     m_axi_hbm_3_rlast,
    input  logic             [  0:0] m_axi_hbm_3_ruser,
    output logic                     m_axi_hbm_3_bready,
    input  logic                     m_axi_hbm_3_bvalid,
    input  logic             [  6:0] m_axi_hbm_3_bid,
    input  axi_pkg::resp_t           m_axi_hbm_3_bresp,
    input  logic             [  0:0] m_axi_hbm_3_buser,
    input  logic                     m_axi_hbm_4_awready,
    output logic                     m_axi_hbm_4_awvalid,
    output logic             [  6:0] m_axi_hbm_4_awid,
    output logic             [ 47:0] m_axi_hbm_4_awaddr,
    output axi_pkg::len_t            m_axi_hbm_4_awlen,
    output axi_pkg::size_t           m_axi_hbm_4_awsize,
    output axi_pkg::burst_t          m_axi_hbm_4_awburst,
    output logic                     m_axi_hbm_4_awlock,
    output axi_pkg::cache_t          m_axi_hbm_4_awcache,
    output axi_pkg::prot_t           m_axi_hbm_4_awprot,
    output axi_pkg::qos_t            m_axi_hbm_4_awqos,
    output axi_pkg::region_t         m_axi_hbm_4_awregion,
    output logic             [  0:0] m_axi_hbm_4_awuser,
    input  logic                     m_axi_hbm_4_wready,
    output logic                     m_axi_hbm_4_wvalid,
    output logic             [511:0] m_axi_hbm_4_wdata,
    output logic             [ 63:0] m_axi_hbm_4_wstrb,
    output logic                     m_axi_hbm_4_wlast,
    output logic             [  0:0] m_axi_hbm_4_wuser,
    input  logic                     m_axi_hbm_4_arready,
    output logic                     m_axi_hbm_4_arvalid,
    output logic             [  6:0] m_axi_hbm_4_arid,
    output logic             [ 47:0] m_axi_hbm_4_araddr,
    output axi_pkg::len_t            m_axi_hbm_4_arlen,
    output axi_pkg::size_t           m_axi_hbm_4_arsize,
    output axi_pkg::burst_t          m_axi_hbm_4_arburst,
    output logic                     m_axi_hbm_4_arlock,
    output axi_pkg::cache_t          m_axi_hbm_4_arcache,
    output axi_pkg::prot_t           m_axi_hbm_4_arprot,
    output axi_pkg::qos_t            m_axi_hbm_4_arqos,
    output axi_pkg::region_t         m_axi_hbm_4_arregion,
    output logic             [  0:0] m_axi_hbm_4_aruser,
    output logic                     m_axi_hbm_4_rready,
    input  logic                     m_axi_hbm_4_rvalid,
    input  logic             [  6:0] m_axi_hbm_4_rid,
    input  logic             [511:0] m_axi_hbm_4_rdata,
    input  axi_pkg::resp_t           m_axi_hbm_4_rresp,
    input  logic                     m_axi_hbm_4_rlast,
    input  logic             [  0:0] m_axi_hbm_4_ruser,
    output logic                     m_axi_hbm_4_bready,
    input  logic                     m_axi_hbm_4_bvalid,
    input  logic             [  6:0] m_axi_hbm_4_bid,
    input  axi_pkg::resp_t           m_axi_hbm_4_bresp,
    input  logic             [  0:0] m_axi_hbm_4_buser,
    input  logic                     m_axi_hbm_5_awready,
    output logic                     m_axi_hbm_5_awvalid,
    output logic             [  6:0] m_axi_hbm_5_awid,
    output logic             [ 47:0] m_axi_hbm_5_awaddr,
    output axi_pkg::len_t            m_axi_hbm_5_awlen,
    output axi_pkg::size_t           m_axi_hbm_5_awsize,
    output axi_pkg::burst_t          m_axi_hbm_5_awburst,
    output logic                     m_axi_hbm_5_awlock,
    output axi_pkg::cache_t          m_axi_hbm_5_awcache,
    output axi_pkg::prot_t           m_axi_hbm_5_awprot,
    output axi_pkg::qos_t            m_axi_hbm_5_awqos,
    output axi_pkg::region_t         m_axi_hbm_5_awregion,
    output logic             [  0:0] m_axi_hbm_5_awuser,
    input  logic                     m_axi_hbm_5_wready,
    output logic                     m_axi_hbm_5_wvalid,
    output logic             [511:0] m_axi_hbm_5_wdata,
    output logic             [ 63:0] m_axi_hbm_5_wstrb,
    output logic                     m_axi_hbm_5_wlast,
    output logic             [  0:0] m_axi_hbm_5_wuser,
    input  logic                     m_axi_hbm_5_arready,
    output logic                     m_axi_hbm_5_arvalid,
    output logic             [  6:0] m_axi_hbm_5_arid,
    output logic             [ 47:0] m_axi_hbm_5_araddr,
    output axi_pkg::len_t            m_axi_hbm_5_arlen,
    output axi_pkg::size_t           m_axi_hbm_5_arsize,
    output axi_pkg::burst_t          m_axi_hbm_5_arburst,
    output logic                     m_axi_hbm_5_arlock,
    output axi_pkg::cache_t          m_axi_hbm_5_arcache,
    output axi_pkg::prot_t           m_axi_hbm_5_arprot,
    output axi_pkg::qos_t            m_axi_hbm_5_arqos,
    output axi_pkg::region_t         m_axi_hbm_5_arregion,
    output logic             [  0:0] m_axi_hbm_5_aruser,
    output logic                     m_axi_hbm_5_rready,
    input  logic                     m_axi_hbm_5_rvalid,
    input  logic             [  6:0] m_axi_hbm_5_rid,
    input  logic             [511:0] m_axi_hbm_5_rdata,
    input  axi_pkg::resp_t           m_axi_hbm_5_rresp,
    input  logic                     m_axi_hbm_5_rlast,
    input  logic             [  0:0] m_axi_hbm_5_ruser,
    output logic                     m_axi_hbm_5_bready,
    input  logic                     m_axi_hbm_5_bvalid,
    input  logic             [  6:0] m_axi_hbm_5_bid,
    input  axi_pkg::resp_t           m_axi_hbm_5_bresp,
    input  logic             [  0:0] m_axi_hbm_5_buser,
    input  logic                     m_axi_hbm_6_awready,
    output logic                     m_axi_hbm_6_awvalid,
    output logic             [  6:0] m_axi_hbm_6_awid,
    output logic             [ 47:0] m_axi_hbm_6_awaddr,
    output axi_pkg::len_t            m_axi_hbm_6_awlen,
    output axi_pkg::size_t           m_axi_hbm_6_awsize,
    output axi_pkg::burst_t          m_axi_hbm_6_awburst,
    output logic                     m_axi_hbm_6_awlock,
    output axi_pkg::cache_t          m_axi_hbm_6_awcache,
    output axi_pkg::prot_t           m_axi_hbm_6_awprot,
    output axi_pkg::qos_t            m_axi_hbm_6_awqos,
    output axi_pkg::region_t         m_axi_hbm_6_awregion,
    output logic             [  0:0] m_axi_hbm_6_awuser,
    input  logic                     m_axi_hbm_6_wready,
    output logic                     m_axi_hbm_6_wvalid,
    output logic             [511:0] m_axi_hbm_6_wdata,
    output logic             [ 63:0] m_axi_hbm_6_wstrb,
    output logic                     m_axi_hbm_6_wlast,
    output logic             [  0:0] m_axi_hbm_6_wuser,
    input  logic                     m_axi_hbm_6_arready,
    output logic                     m_axi_hbm_6_arvalid,
    output logic             [  6:0] m_axi_hbm_6_arid,
    output logic             [ 47:0] m_axi_hbm_6_araddr,
    output axi_pkg::len_t            m_axi_hbm_6_arlen,
    output axi_pkg::size_t           m_axi_hbm_6_arsize,
    output axi_pkg::burst_t          m_axi_hbm_6_arburst,
    output logic                     m_axi_hbm_6_arlock,
    output axi_pkg::cache_t          m_axi_hbm_6_arcache,
    output axi_pkg::prot_t           m_axi_hbm_6_arprot,
    output axi_pkg::qos_t            m_axi_hbm_6_arqos,
    output axi_pkg::region_t         m_axi_hbm_6_arregion,
    output logic             [  0:0] m_axi_hbm_6_aruser,
    output logic                     m_axi_hbm_6_rready,
    input  logic                     m_axi_hbm_6_rvalid,
    input  logic             [  6:0] m_axi_hbm_6_rid,
    input  logic             [511:0] m_axi_hbm_6_rdata,
    input  axi_pkg::resp_t           m_axi_hbm_6_rresp,
    input  logic                     m_axi_hbm_6_rlast,
    input  logic             [  0:0] m_axi_hbm_6_ruser,
    output logic                     m_axi_hbm_6_bready,
    input  logic                     m_axi_hbm_6_bvalid,
    input  logic             [  6:0] m_axi_hbm_6_bid,
    input  axi_pkg::resp_t           m_axi_hbm_6_bresp,
    input  logic             [  0:0] m_axi_hbm_6_buser,
    input  logic                     m_axi_hbm_7_awready,
    output logic                     m_axi_hbm_7_awvalid,
    output logic             [  6:0] m_axi_hbm_7_awid,
    output logic             [ 47:0] m_axi_hbm_7_awaddr,
    output axi_pkg::len_t            m_axi_hbm_7_awlen,
    output axi_pkg::size_t           m_axi_hbm_7_awsize,
    output axi_pkg::burst_t          m_axi_hbm_7_awburst,
    output logic                     m_axi_hbm_7_awlock,
    output axi_pkg::cache_t          m_axi_hbm_7_awcache,
    output axi_pkg::prot_t           m_axi_hbm_7_awprot,
    output axi_pkg::qos_t            m_axi_hbm_7_awqos,
    output axi_pkg::region_t         m_axi_hbm_7_awregion,
    output logic             [  0:0] m_axi_hbm_7_awuser,
    input  logic                     m_axi_hbm_7_wready,
    output logic                     m_axi_hbm_7_wvalid,
    output logic             [511:0] m_axi_hbm_7_wdata,
    output logic             [ 63:0] m_axi_hbm_7_wstrb,
    output logic                     m_axi_hbm_7_wlast,
    output logic             [  0:0] m_axi_hbm_7_wuser,
    input  logic                     m_axi_hbm_7_arready,
    output logic                     m_axi_hbm_7_arvalid,
    output logic             [  6:0] m_axi_hbm_7_arid,
    output logic             [ 47:0] m_axi_hbm_7_araddr,
    output axi_pkg::len_t            m_axi_hbm_7_arlen,
    output axi_pkg::size_t           m_axi_hbm_7_arsize,
    output axi_pkg::burst_t          m_axi_hbm_7_arburst,
    output logic                     m_axi_hbm_7_arlock,
    output axi_pkg::cache_t          m_axi_hbm_7_arcache,
    output axi_pkg::prot_t           m_axi_hbm_7_arprot,
    output axi_pkg::qos_t            m_axi_hbm_7_arqos,
    output axi_pkg::region_t         m_axi_hbm_7_arregion,
    output logic             [  0:0] m_axi_hbm_7_aruser,
    output logic                     m_axi_hbm_7_rready,
    input  logic                     m_axi_hbm_7_rvalid,
    input  logic             [  6:0] m_axi_hbm_7_rid,
    input  logic             [511:0] m_axi_hbm_7_rdata,
    input  axi_pkg::resp_t           m_axi_hbm_7_rresp,
    input  logic                     m_axi_hbm_7_rlast,
    input  logic             [  0:0] m_axi_hbm_7_ruser,
    output logic                     m_axi_hbm_7_bready,
    input  logic                     m_axi_hbm_7_bvalid,
    input  logic             [  6:0] m_axi_hbm_7_bid,
    input  axi_pkg::resp_t           m_axi_hbm_7_bresp,
    input  logic             [  0:0] m_axi_hbm_7_buser,

    /// PCIe Ports
    input  logic                    m_axi_pcie_awready,
    output logic                    m_axi_pcie_awvalid,
    output logic             [ 7:0] m_axi_pcie_awid,
    output logic             [47:0] m_axi_pcie_awaddr,
    output axi_pkg::len_t           m_axi_pcie_awlen,
    output axi_pkg::size_t          m_axi_pcie_awsize,
    output axi_pkg::burst_t         m_axi_pcie_awburst,
    output logic                    m_axi_pcie_awlock,
    output axi_pkg::cache_t         m_axi_pcie_awcache,
    output axi_pkg::prot_t          m_axi_pcie_awprot,
    output axi_pkg::qos_t           m_axi_pcie_awqos,
    output axi_pkg::region_t        m_axi_pcie_awregion,
    output logic             [ 4:0] m_axi_pcie_awuser,
    input  logic                    m_axi_pcie_wready,
    output logic                    m_axi_pcie_wvalid,
    output logic             [63:0] m_axi_pcie_wdata,
    output logic             [ 7:0] m_axi_pcie_wstrb,
    output logic                    m_axi_pcie_wlast,
    output logic             [ 4:0] m_axi_pcie_wuser,
    input  logic                    m_axi_pcie_arready,
    output logic                    m_axi_pcie_arvalid,
    output logic             [ 7:0] m_axi_pcie_arid,
    output logic             [47:0] m_axi_pcie_araddr,
    output axi_pkg::len_t           m_axi_pcie_arlen,
    output axi_pkg::size_t          m_axi_pcie_arsize,
    output axi_pkg::burst_t         m_axi_pcie_arburst,
    output logic                    m_axi_pcie_arlock,
    output axi_pkg::cache_t         m_axi_pcie_arcache,
    output axi_pkg::prot_t          m_axi_pcie_arprot,
    output axi_pkg::qos_t           m_axi_pcie_arqos,
    output axi_pkg::region_t        m_axi_pcie_arregion,
    output logic             [ 4:0] m_axi_pcie_aruser,
    output logic                    m_axi_pcie_rready,
    input  logic                    m_axi_pcie_rvalid,
    input  logic             [ 7:0] m_axi_pcie_rid,
    input  logic             [63:0] m_axi_pcie_rdata,
    input  axi_pkg::resp_t          m_axi_pcie_rresp,
    input  logic                    m_axi_pcie_rlast,
    input  logic             [ 4:0] m_axi_pcie_ruser,
    output logic                    m_axi_pcie_bready,
    input  logic                    m_axi_pcie_bvalid,
    input  logic             [ 7:0] m_axi_pcie_bid,
    input  axi_pkg::resp_t          m_axi_pcie_bresp,
    input  logic             [ 4:0] m_axi_pcie_buser,
    output logic                    s_axi_pcie_awready,
    input  logic                    s_axi_pcie_awvalid,
    input  logic             [ 3:0] s_axi_pcie_awid,
    input  logic             [47:0] s_axi_pcie_awaddr,
    input  axi_pkg::len_t           s_axi_pcie_awlen,
    input  axi_pkg::size_t          s_axi_pcie_awsize,
    input  axi_pkg::burst_t         s_axi_pcie_awburst,
    input  logic                    s_axi_pcie_awlock,
    input  axi_pkg::cache_t         s_axi_pcie_awcache,
    input  axi_pkg::prot_t          s_axi_pcie_awprot,
    input  axi_pkg::qos_t           s_axi_pcie_awqos,
    input  axi_pkg::region_t        s_axi_pcie_awregion,
    input  logic             [ 4:0] s_axi_pcie_awuser,
    output logic                    s_axi_pcie_wready,
    input  logic                    s_axi_pcie_wvalid,
    input  logic             [63:0] s_axi_pcie_wdata,
    input  logic             [ 7:0] s_axi_pcie_wstrb,
    input  logic                    s_axi_pcie_wlast,
    input  logic             [ 4:0] s_axi_pcie_wuser,
    output logic                    s_axi_pcie_arready,
    input  logic                    s_axi_pcie_arvalid,
    input  logic             [ 3:0] s_axi_pcie_arid,
    input  logic             [47:0] s_axi_pcie_araddr,
    input  axi_pkg::len_t           s_axi_pcie_arlen,
    input  axi_pkg::size_t          s_axi_pcie_arsize,
    input  axi_pkg::burst_t         s_axi_pcie_arburst,
    input  logic                    s_axi_pcie_arlock,
    input  axi_pkg::cache_t         s_axi_pcie_arcache,
    input  axi_pkg::prot_t          s_axi_pcie_arprot,
    input  axi_pkg::qos_t           s_axi_pcie_arqos,
    input  axi_pkg::region_t        s_axi_pcie_arregion,
    input  logic             [ 4:0] s_axi_pcie_aruser,
    input  logic                    s_axi_pcie_rready,
    output logic                    s_axi_pcie_rvalid,
    output logic             [ 3:0] s_axi_pcie_rid,
    output logic             [63:0] s_axi_pcie_rdata,
    output axi_pkg::resp_t          s_axi_pcie_rresp,
    output logic                    s_axi_pcie_rlast,
    output logic             [ 4:0] s_axi_pcie_ruser,
    input  logic                    s_axi_pcie_bready,
    output logic                    s_axi_pcie_bvalid,
    output logic             [ 3:0] s_axi_pcie_bid,
    output axi_pkg::resp_t          s_axi_pcie_bresp,
    output logic             [ 4:0] s_axi_pcie_buser
    /// HBI Ports
);

  // AXI ports of Occamy top-level
  //////////
  // PCIe //
  //////////
  axi_a48_d64_i8_u5_req_t  pcie_axi_req_o;
  axi_a48_d64_i8_u5_resp_t pcie_axi_rsp_i;

  axi_a48_d64_i4_u5_req_t  pcie_axi_req_i;
  axi_a48_d64_i4_u5_resp_t pcie_axi_rsp_o;

  // Assign structs to flattened ports
  `AXI_FLATTEN_MASTER(pcie, pcie_axi_req_o, pcie_axi_rsp_i)
  `AXI_FLATTEN_SLAVE(pcie, pcie_axi_req_i, pcie_axi_rsp_o)

  /////////
  // HBM //
  /////////
  axi_a48_d512_i7_u0_req_t  hbm_0_req_o;
  axi_a48_d512_i7_u0_resp_t hbm_0_rsp_i;

  // Assign structs to flattened ports
  `AXI_FLATTEN_MASTER(hbm_0, hbm_0_req_o, hbm_0_rsp_i)
  axi_a48_d512_i7_u0_req_t  hbm_1_req_o;
  axi_a48_d512_i7_u0_resp_t hbm_1_rsp_i;

  // Assign structs to flattened ports
  `AXI_FLATTEN_MASTER(hbm_1, hbm_1_req_o, hbm_1_rsp_i)
  axi_a48_d512_i7_u0_req_t  hbm_2_req_o;
  axi_a48_d512_i7_u0_resp_t hbm_2_rsp_i;

  // Assign structs to flattened ports
  `AXI_FLATTEN_MASTER(hbm_2, hbm_2_req_o, hbm_2_rsp_i)
  axi_a48_d512_i7_u0_req_t  hbm_3_req_o;
  axi_a48_d512_i7_u0_resp_t hbm_3_rsp_i;

  // Assign structs to flattened ports
  `AXI_FLATTEN_MASTER(hbm_3, hbm_3_req_o, hbm_3_rsp_i)
  axi_a48_d512_i7_u0_req_t  hbm_4_req_o;
  axi_a48_d512_i7_u0_resp_t hbm_4_rsp_i;

  // Assign structs to flattened ports
  `AXI_FLATTEN_MASTER(hbm_4, hbm_4_req_o, hbm_4_rsp_i)
  axi_a48_d512_i7_u0_req_t  hbm_5_req_o;
  axi_a48_d512_i7_u0_resp_t hbm_5_rsp_i;

  // Assign structs to flattened ports
  `AXI_FLATTEN_MASTER(hbm_5, hbm_5_req_o, hbm_5_rsp_i)
  axi_a48_d512_i7_u0_req_t  hbm_6_req_o;
  axi_a48_d512_i7_u0_resp_t hbm_6_rsp_i;

  // Assign structs to flattened ports
  `AXI_FLATTEN_MASTER(hbm_6, hbm_6_req_o, hbm_6_rsp_i)
  axi_a48_d512_i7_u0_req_t  hbm_7_req_o;
  axi_a48_d512_i7_u0_resp_t hbm_7_rsp_i;

  // Assign structs to flattened ports
  `AXI_FLATTEN_MASTER(hbm_7, hbm_7_req_o, hbm_7_rsp_i)

  ///////////////////
  // Boot ROM      //
  ///////////////////
  // TODO(niwis, aottaviano) This is a temporary solution. Either put this in a dedicated module for
  // regbus <-> Xilinx memory conversion and add support to solder, or replace by a different ROM

  axi_lite_a48_d32_req_t bootrom_axi_lite_req;
  axi_lite_a48_d32_rsp_t bootrom_axi_lite_rsp;

  reg_a48_d32_req_t bootrom_req;
  reg_a48_d32_rsp_t bootrom_rsp;

  axi_lite_to_reg #(
      .ADDR_WIDTH    (48),
      .DATA_WIDTH    (32),
      .axi_lite_req_t(axi_lite_a48_d32_req_t),
      .axi_lite_rsp_t(axi_lite_a48_d32_rsp_t),
      .reg_req_t     (reg_a48_d32_req_t),
      .reg_rsp_t     (reg_a48_d32_rsp_t)
  ) i_bootrom_pc (
      .clk_i         (clk_periph_i),
      .rst_ni        (rst_periph_ni),
      .axi_lite_req_i(bootrom_axi_lite_req),
      .axi_lite_rsp_o(bootrom_axi_lite_rsp),
      .reg_req_o     (bootrom_req),
      .reg_rsp_i     (bootrom_rsp)
  );



  logic bootrom_req_ready_d, bootrom_req_ready_q;

  assign bootrom_en_o        = bootrom_req.valid;
  assign bootrom_addr_o      = bootrom_req.addr;
  assign bootrom_rsp.ready   = bootrom_req_ready_q;
  assign bootrom_rsp.rdata   = bootrom_data_i;
  assign bootrom_rsp.error   = '0;
  assign bootrom_req_ready_d = bootrom_req.valid & ~bootrom_req_ready_q;

  always_ff @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) begin
      bootrom_req_ready_q <= 1'b0;
    end else begin
      bootrom_req_ready_q <= bootrom_req_ready_d;
    end
  end

  /// FLLs
  axi_lite_a48_d32_req_t fll_system_axi_lite_req;
  axi_lite_a48_d32_rsp_t fll_system_axi_lite_rsp;

  axi_lite_a48_d32_req_t fll_periph_axi_lite_req;
  axi_lite_a48_d32_rsp_t fll_periph_axi_lite_rsp;

  axi_lite_a48_d32_req_t fll_hbm2e_axi_lite_req;
  axi_lite_a48_d32_rsp_t fll_hbm2e_axi_lite_rsp;

  reg_a48_d32_req_t fll_system_req;
  reg_a48_d32_rsp_t fll_system_rsp;

  axi_lite_to_reg #(
      .ADDR_WIDTH    (48),
      .DATA_WIDTH    (32),
      .axi_lite_req_t(axi_lite_a48_d32_req_t),
      .axi_lite_rsp_t(axi_lite_a48_d32_rsp_t),
      .reg_req_t     (reg_a48_d32_req_t),
      .reg_rsp_t     (reg_a48_d32_rsp_t)
  ) i_fll_system_pc (
      .clk_i         (clk_periph_i),
      .rst_ni        (rst_periph_ni),
      .axi_lite_req_i(fll_system_axi_lite_req),
      .axi_lite_rsp_o(fll_system_axi_lite_rsp),
      .reg_req_o     (fll_system_req),
      .reg_rsp_i     (fll_system_rsp)
  );


  reg_a48_d32_req_t fll_periph_req;
  reg_a48_d32_rsp_t fll_periph_rsp;

  axi_lite_to_reg #(
      .ADDR_WIDTH    (48),
      .DATA_WIDTH    (32),
      .axi_lite_req_t(axi_lite_a48_d32_req_t),
      .axi_lite_rsp_t(axi_lite_a48_d32_rsp_t),
      .reg_req_t     (reg_a48_d32_req_t),
      .reg_rsp_t     (reg_a48_d32_rsp_t)
  ) i_fll_periph_pc (
      .clk_i         (clk_periph_i),
      .rst_ni        (rst_periph_ni),
      .axi_lite_req_i(fll_periph_axi_lite_req),
      .axi_lite_rsp_o(fll_periph_axi_lite_rsp),
      .reg_req_o     (fll_periph_req),
      .reg_rsp_i     (fll_periph_rsp)
  );


  reg_a48_d32_req_t fll_hbm2e_req;
  reg_a48_d32_rsp_t fll_hbm2e_rsp;

  axi_lite_to_reg #(
      .ADDR_WIDTH    (48),
      .DATA_WIDTH    (32),
      .axi_lite_req_t(axi_lite_a48_d32_req_t),
      .axi_lite_rsp_t(axi_lite_a48_d32_rsp_t),
      .reg_req_t     (reg_a48_d32_req_t),
      .reg_rsp_t     (reg_a48_d32_rsp_t)
  ) i_fll_hbm2e_pc (
      .clk_i         (clk_periph_i),
      .rst_ni        (rst_periph_ni),
      .axi_lite_req_i(fll_hbm2e_axi_lite_req),
      .axi_lite_rsp_o(fll_hbm2e_axi_lite_rsp),
      .reg_req_o     (fll_hbm2e_req),
      .reg_rsp_i     (fll_hbm2e_rsp)
  );



  // Occamy top-level
  occamy_top i_occamy (
      .bootrom_req_o   (bootrom_axi_lite_req),
      .bootrom_rsp_i   (bootrom_axi_lite_rsp),
      .fll_system_req_o(fll_system_axi_lite_req),
      .fll_system_rsp_i(fll_system_axi_lite_rsp),
      .fll_periph_req_o(fll_periph_axi_lite_req),
      .fll_periph_rsp_i(fll_periph_axi_lite_rsp),
      .fll_hbm2e_req_o (fll_hbm2e_axi_lite_req),
      .fll_hbm2e_rsp_i (fll_hbm2e_axi_lite_rsp),
      .ext_irq_i(ext_irq_i),
      // Tie-off unused ports
      .pcie_cfg_rsp_i  ('0),
      .hbi_wide_cfg_rsp_i ('0),
      .hbi_narrow_cfg_rsp_i ('0),
      .hbm_cfg_rsp_i ('0),
      .chip_ctrl_rsp_i ('0),
      .hbi_wide_req_i ('0),
      .hbi_wide_rsp_i ('0),
      .hbi_narrow_req_i ('0),
      .hbi_narrow_rsp_i ('0),
      .*
  );

endmodule
