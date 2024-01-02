# Example preprocessing script.
data <- rbind(sim_001, sim_002, sim_003, sim_004, sim_005, sim_006, sim_007, sim_008, sim_009, sim_010,
              sim_011, sim_012, sim_013, sim_014, sim_015, sim_016, sim_017, sim_018)
rm(sim_001, sim_002, sim_003, sim_004, sim_005, sim_006, sim_007, sim_008, sim_009, sim_010, 
   sim_011, sim_012, sim_013, sim_014, sim_015, sim_016, sim_017, sim_018)

data <- data |> dplyr::mutate(bt_width = round(bt_width, 2), 
                              bt_depth = round(bt_depth, 2),
                              bt_height == round(bt_height, 2),
                              liquid_height = round(liquid_height, 2))