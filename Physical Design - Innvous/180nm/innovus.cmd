#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Fri Oct 31 10:57:27 2025                
#                                                     
#######################################################

#@(#)CDS: Innovus v20.14-s095_1 (64bit) 04/19/2021 14:41 (Linux 2.6.32-431.11.2.el6.x86_64)
#@(#)CDS: NanoRoute 20.14-s095_1 NR210411-1939/20_14-UB (database version 18.20.547) {superthreading v2.13}
#@(#)CDS: AAE 20.14-s018 (64bit) 04/19/2021 (Linux 2.6.32-431.11.2.el6.x86_64)
#@(#)CDS: CTE 20.14-s027_1 () Apr 13 2021 21:29:07 ( )
#@(#)CDS: SYNTECH 20.14-s017_1 () Mar 25 2021 13:07:27 ( )
#@(#)CDS: CPE v20.14-s080
#@(#)CDS: IQuantus/TQuantus 20.1.1-s460 (64bit) Fri Mar 5 18:46:16 PST 2021 (Linux 2.6.32-431.11.2.el6.x86_64)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
getVersion
getVersion
getVersion
win
zoomBox -0.04500 -0.02500 0.28800 0.13600
set init_gnd_net VSS
set init_lef_file ../../../../install/FOUNDRY/digital/180nm/dig/lef/all.lef
set init_verilog kogge_stone_adder_180nm_netlist.v
set init_mmmc_file Default.view
set init_pwr_net VDD
init_design
init_design
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site tsm3site -r 1 0.7 6 0.0 0.0 0.0
uiSetTool select
getIoFlowFlag
fit
zoomBox -39.68100 -7.83200 108.71900 63.91400
zoomBox -30.07100 -2.77250 96.07000 58.21200
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site tsm3site -r 1 0.7 6 6 6 6
uiSetTool select
getIoFlowFlag
fit
setIoFlowFlag 0
floorPlan -site tsm3site -r 0.933333333333 0.693939 6.6 6.16 6.6 6.16
uiSetTool select
getIoFlowFlag
fit
clearGlobalNets
globalNetConnect VDD -type pgpin -pin VDD -instanceBasename * -hierarchicalInstance {}
clearGlobalNets
globalNetConnect VDD -type pgpin -pin VDD -instanceBasename * -hierarchicalInstance {}
clearGlobalNets
globalNetConnect VDD -type pgpin -pin VDD -instanceBasename * -hierarchicalInstance {}
clearGlobalNets
globalNetConnect VDD -type pgpin -pin VDD -instanceBasename * -hierarchicalInstance {}
globalNetConnect VSS -type pgpin -pin VSS -instanceBasename * -hierarchicalInstance {}
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer Metal6 -stacked_via_bottom_layer Metal1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets {VDD VSS} -type core_rings -follow core -layer {top Metal6 bottom Metal6 left Metal5 right Metal5} -width {top 1.8 bottom 1.8 left 1.8 right 1.8} -spacing {top 0.46 bottom 0.46 left 0.28 right 0.28} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 1 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer Metal6 -stacked_via_bottom_layer Metal1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets {VDD VSS} -type core_rings -follow core -layer {top Metal6 bottom Metal6 left Metal5 right Metal5} -width {top 1.8 bottom 1.8 left 1.8 right 1.8} -spacing {top 0.46 bottom 0.46 left 0.28 right 0.28} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 1 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
setAddStripeMode -ignore_block_check false -break_at none -route_over_rows_only false -rows_without_stripes_only false -extend_to_closest_target none -stop_at_last_wire_for_area false -partial_set_thru_domain false -ignore_nondefault_domains false -trim_antenna_back_to_shape none -spacing_type edge_to_edge -spacing_from_block 0 -stripe_min_length stripe_width -stacked_via_top_layer Metal6 -stacked_via_bottom_layer Metal1 -via_using_exact_crossover_size false -split_vias false -orthogonal_only true -allow_jog { padcore_ring  block_ring } -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape   }
addStripe -nets {VDD VSS} -layer Metal6 -direction vertical -width 1.8 -spacing 0.46 -number_of_sets 5 -start_from left -switch_layer_over_obs false -max_same_layer_jog_length 2 -padcore_ring_top_layer_limit Metal6 -padcore_ring_bottom_layer_limit Metal1 -block_ring_top_layer_limit Metal6 -block_ring_bottom_layer_limit Metal1 -use_wire_group 0 -snap_wire_center_to_grid None
setAddStripeMode -ignore_block_check false -break_at none -route_over_rows_only false -rows_without_stripes_only false -extend_to_closest_target none -stop_at_last_wire_for_area false -partial_set_thru_domain false -ignore_nondefault_domains false -trim_antenna_back_to_shape none -spacing_type edge_to_edge -spacing_from_block 0 -stripe_min_length stripe_width -stacked_via_top_layer Metal6 -stacked_via_bottom_layer Metal1 -via_using_exact_crossover_size false -split_vias false -orthogonal_only true -allow_jog { padcore_ring  block_ring } -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape   }
addStripe -nets {VDD VSS} -layer Metal6 -direction vertical -width 1.8 -spacing 0.46 -number_of_sets 5 -start_from left -switch_layer_over_obs false -max_same_layer_jog_length 2 -padcore_ring_top_layer_limit Metal6 -padcore_ring_bottom_layer_limit Metal1 -block_ring_top_layer_limit Metal6 -block_ring_bottom_layer_limit Metal1 -use_wire_group 0 -snap_wire_center_to_grid None
setAddStripeMode -ignore_block_check false -break_at none -route_over_rows_only false -rows_without_stripes_only false -extend_to_closest_target none -stop_at_last_wire_for_area false -partial_set_thru_domain false -ignore_nondefault_domains false -trim_antenna_back_to_shape none -spacing_type edge_to_edge -spacing_from_block 0 -stripe_min_length stripe_width -stacked_via_top_layer Metal6 -stacked_via_bottom_layer Metal1 -via_using_exact_crossover_size false -split_vias false -orthogonal_only true -allow_jog { padcore_ring  block_ring } -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape   }
addStripe -nets {VDD VSS} -layer Metal5 -direction vertical -width 1.8 -spacing 0.28 -number_of_sets 5 -start_from left -switch_layer_over_obs false -max_same_layer_jog_length 2 -padcore_ring_top_layer_limit Metal6 -padcore_ring_bottom_layer_limit Metal1 -block_ring_top_layer_limit Metal6 -block_ring_bottom_layer_limit Metal1 -use_wire_group 0 -snap_wire_center_to_grid None
setAddStripeMode -ignore_block_check false -break_at none -route_over_rows_only false -rows_without_stripes_only false -extend_to_closest_target none -stop_at_last_wire_for_area false -partial_set_thru_domain false -ignore_nondefault_domains false -trim_antenna_back_to_shape none -spacing_type edge_to_edge -spacing_from_block 0 -stripe_min_length stripe_width -stacked_via_top_layer Metal6 -stacked_via_bottom_layer Metal1 -via_using_exact_crossover_size false -split_vias false -orthogonal_only true -allow_jog { padcore_ring  block_ring } -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape   }
addStripe -nets {VDD VSS} -layer Metal5 -direction vertical -width 1.8 -spacing 0.28 -number_of_sets 5 -start_from left -switch_layer_over_obs false -max_same_layer_jog_length 2 -padcore_ring_top_layer_limit Metal6 -padcore_ring_bottom_layer_limit Metal1 -block_ring_top_layer_limit Metal6 -block_ring_bottom_layer_limit Metal1 -use_wire_group 0 -snap_wire_center_to_grid None
setPlaceMode -fp false
place_design
setOptMode -fixCap true -fixTran true -fixFanoutLoad false
optDesign -preCTS
setSrouteMode -viaConnectToShape { noshape }
sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { Metal1(1) Metal6(6) } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { Metal1(1) Metal6(6) } -nets { VDD VSS } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { Metal1(1) Metal6(6) }
setNanoRouteMode -quiet -timingEngine {}
setNanoRouteMode -quiet -routeWithTimingDriven 1
setNanoRouteMode -quiet -routeWithSiDriven 1
setNanoRouteMode -quiet -routeTopRoutingLayer 6
setNanoRouteMode -quiet -routeBottomRoutingLayer 1
setNanoRouteMode -quiet -drouteEndIteration 1
setNanoRouteMode -quiet -routeWithTimingDriven true
setNanoRouteMode -quiet -routeWithSiDriven true
routeDesign -globalDetail
getMultiCpuUsage -localCpu
get_verify_drc_mode -disable_rules -quiet
get_verify_drc_mode -quiet -area
get_verify_drc_mode -quiet -layer_range
get_verify_drc_mode -check_ndr_spacing -quiet
get_verify_drc_mode -check_only -quiet
get_verify_drc_mode -check_same_via_cell -quiet
get_verify_drc_mode -exclude_pg_net -quiet
get_verify_drc_mode -ignore_trial_route -quiet
get_verify_drc_mode -max_wrong_way_halo -quiet
get_verify_drc_mode -use_min_spacing_on_block_obs -quiet
get_verify_drc_mode -limit -quiet
set_verify_drc_mode -disable_rules {} -check_ndr_spacing auto -check_only default -check_same_via_cell false -exclude_pg_net false -ignore_trial_route false -ignore_cell_blockage false -use_min_spacing_on_block_obs auto -report kogge_stone_adder_32.drc.rpt -limit 1000
verify_drc
set_verify_drc_mode -area {0 0 0 0}
verifyConnectivity -type all -error 1000 -warning 50
verifyProcessAntenna -report kogge_stone_adder_32.antenna.rpt -error 1000
setLayerPreference node_layer -isVisible 0
setLayerPreference node_layer -isVisible 1
ui_view_box
ui_view_box
dbquery -area {-40.7855 -3.388 113.3855 71.148} -objType inst
dbquery -area {-40.7855 -3.388 113.3855 71.148} -objType regular
dbquery -area {-40.7855 -3.388 113.3855 71.148} -objType special
saveDesign kogge_stone_adder_32.enc
saveDesign kogge_stone_adder_32.enc
saveDesign kogge_stone_adder_32.enc
streamOut ksa_32bit_180nm.enc -libName DesignLib -units 2000 -mode ALL
streamOut ksa_32bit_180.gds -libName DesignLib -units 2000 -mode ALL
streamOut ksa_32bit_180.gds -libName DesignLib -units 2000 -mode ALL
