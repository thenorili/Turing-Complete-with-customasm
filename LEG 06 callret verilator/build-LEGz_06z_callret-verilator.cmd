verilator --cc -Wno-WIDTH -Wno-SELRANGE -Ibuiltin_components -I"custom_components\LEG" -I"custom_components" -I"custom_components\Bit" --exe ./TC_Universe.cpp %* LEGz_06z_callret.v
