#####
## Constraints for ZCU104 FMC HDMI 2.0
## Version 1.0
#####


#####
## Pins
#####

# TBD
#set_property PACKAGE_PIN M11 [get_ports reset]
#set_property IOSTANDARD LVCMOS33 [get_ports reset]

# HDMI TX
set_property PACKAGE_PIN T8 [get_ports TX_REFCLK_P_IN]
create_clock -name tx_mgt_refclk -period 3.367 [get_ports TX_REFCLK_P_IN]

# rev B
set_property PACKAGE_PIN G21 [get_ports {HDMI_TX_CLK_P_OUT}]
set_property IOSTANDARD LVDS [get_ports {HDMI_TX_CLK_P_OUT}]

# TBD
# set_property PACKAGE_PIN G8 [get_ports tmds_clk_out]
# set_property IOSTANDARD LVCMOS33 [get_ports tmds_clk_out]

set_property PACKAGE_PIN E3 [get_ports TX_HPD_IN]
set_property IOSTANDARD LVCMOS33 [get_ports TX_HPD_IN]

set_property PACKAGE_PIN B1 [get_ports TX_DDC_OUT_scl_io]
set_property IOSTANDARD LVCMOS33 [get_ports TX_DDC_OUT_scl_io]

set_property PACKAGE_PIN C1 [get_ports TX_DDC_OUT_sda_io]
set_property IOSTANDARD LVCMOS33 [get_ports TX_DDC_OUT_sda_io]


# I2C
set_property IOSTANDARD LVCMOS33 [get_ports fmch_iic_scl_io]
set_property PACKAGE_PIN D1 [get_ports fmch_iic_scl_io]
set_property IOSTANDARD LVCMOS33 [get_ports fmch_iic_sda_io]
set_property PACKAGE_PIN E1 [get_ports fmch_iic_sda_io]

# Misc
#GPIO_LED_0_LS
set_property PACKAGE_PIN D5 [get_ports LED0]
set_property IOSTANDARD LVCMOS33 [get_ports {LED0}]
set_property PACKAGE_PIN N11 [get_ports IDT_8T49N241_LOL_IN]
set_property IOSTANDARD LVCMOS33 [get_ports IDT_8T49N241_LOL_IN]

set_property PACKAGE_PIN A2 [get_ports TX_EN_OUT]
set_property IOSTANDARD LVCMOS33 [get_ports TX_EN_OUT]

# TBD - not needed as it is duplicated of TX_EN_OUT
# set_property PACKAGE_PIN C2 [get_ports {RX_LS_OE[0]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {RX_LS_OE[0]}]

#####
## End
#####
