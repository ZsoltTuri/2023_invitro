library('ProjectTemplate')
load.project()

get_efield <- function(intensity, distance, otc_x, otc_y){
  d <- data |> dplyr::filter(mso == intensity & distance_mm == distance)  
  x <- d %>% filter(abs(otc_size_x - otc_x) == min(abs(otc_size_x - otc_x)))
  y <- d %>% filter(abs(otc_size_y - otc_y) == min(abs(otc_size_y - otc_y)))
  results <- data.frame(x)
  results <- rbind(results, data.frame(y))
}
# Set search parameters
# maximum stimulator intensity stimulation intensity
intensity <- 1       
# in mm from the Petri dish
distance <- 10 
# horizontal size of the OTC in mm
otc_x <- 4.9   
# vertical size of the OTC in mm
otc_y <- 3.7  
results <- get_efield(intensity, distance, otc_x, otc_y)
results
