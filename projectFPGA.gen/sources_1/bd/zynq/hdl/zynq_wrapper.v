//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
//Date        : Tue Nov  5 12:06:11 2024
//Host        : DESKTOP-HTVV1N1 running 64-bit major release  (build 9200)
//Command     : generate_target zynq_wrapper.bd
//Design      : zynq_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module zynq_wrapper
   (fan_pin);
  output fan_pin;

  wire fan_pin;

  zynq zynq_i
       (.fan_pin(fan_pin));
endmodule
