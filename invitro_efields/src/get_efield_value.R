# Description ----
# Execute each line of code by pressing "cntrl (=strg) + enter"
library('ProjectTemplate')
load.project()

# SEARCH 1
params <- list()
# 1. brain tissue properties 
# 1.1. width of brain tissue in mm
params$bt_width <- 4   
# 1.2. depth of brain tissue in mm
params$bt_depth <- 3  
# 1.3. height of brain tissue in mm
params$bt_height <- 0.15
# 2. Petri dish properties
# params["liquid_height"] <- 10 or 
params$liquid_height <- 10 
# 3. Stimulation properties
# 3.1. maximum stimulator intensity stimulation intensity
params$mso <- 65       
# 3.2. coil_distance
params$coil_distance <- 1 
# Get electric field results ----
search1 <- get_efield(params)
search1

# SEARCH 2
params <- list()
# 1. brain tissue properties 
# 1.1. width of brain tissue in mm
params$bt_width <- 3.9885   
# 1.2. depth of brain tissue in mm
params$bt_depth <- 3.1463  
# 1.3. height of brain tissue in mm
params$bt_height <- 0.15
# 2. Petri dish properties
params$liquid_height <- 2.01 + params$bt_height 
# 3. Stimulation properties
# 3.1. maximum stimulator intensity stimulation intensity
params$mso <- seq(from = 40, to = 50, by = 1)       
# 3.2. coil_distance
params$coil_distance <- -1 
# Get electric field results ----
search2 <- get_efield_mso_range(params)
search2

# some useful functions ----
str(data)
range(data$bt_height)
unique(data$bt_height)
unique(data$bt_width)