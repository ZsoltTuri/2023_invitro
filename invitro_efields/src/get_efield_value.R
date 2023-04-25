library('ProjectTemplate')
load.project()

# Define search parameters -------
params <- list()

# 1. brain tissue properties 
# 1.1. width of brain tissue in mm
params["bt_width"] <- 4.9   
# 1.2. depth of brain tissue in mm
params["bt_depth"] <- 3.7  
# 1.3. height of brain tissue in mm
params["bt_height"] <- 0.2

# 2. Petri dish properties
params["liquid_height"] <- 10

# 3. Stimulation properties
# 3.1. maximum stimulator intensity stimulation intensity
params["mso"] <- 1       
# 3.2. coil_distance
params["coil_distance"] <- 1 

# Get electric field results
results <- get_efield(params)
results