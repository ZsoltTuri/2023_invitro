# Description ----
# You will find more information about performing the search at: https://github.com/ZsoltTuri/2023_invitro
# Execute each line of code by pressing "cntrl (=strg) + enter"

library('ProjectTemplate')
load.project()

# SEARCH 1: Petri dish is completely filled with liquid
params <- list()
# Please fill in the details of your experiment below. 
# 1. brain tissue properties 
# 1.1. width of brain tissue in mm
params$bt_width <- 2.5   
# 1.2. depth of brain tissue in mm
params$bt_depth <- 2.1  
# 1.3. height of brain tissue in mm
params$bt_height <- 0.15
# 2. Petri dish properties
params$liquid_height <- 10
# 3. Stimulation properties
# 3.1. stimulation intensity
params$mso <- 65       
# 3.2. coil_distance (negative value: stimulation from below; positive value: Stimulation from top)
params$coil_distance <- -3 
# Get electric field results ----
search1 <- get_efield(params)
search1


# SEARCH 2: Petri dish is not completely filled with liquid, as the liquid only covers the OTC. 
params <- list()
# Please fill in the details of your experiment below.
# 1. brain tissue properties 
# 1.1. width of brain tissue in mm
params$bt_width <- 2.5   
# 1.2. depth of brain tissue in mm
params$bt_depth <- 2.1  
# 1.3. height of brain tissue in mm
params$bt_height <- 0.15
# 2. Petri dish properties
params$liquid_height <- round(2.01 + params$bt_height, 2) 
# 3. Stimulation properties
# 3.1. stimulation intensity
params$mso <- 65       
# 3.2. coil_distance (negative value: stimulation from below; positive value: Stimulation from top)
params$coil_distance <- -3 
# Get electric field results ----
search2 <- get_efield(params)
search2


# SEARCH 3: Get E-fields for multiple stimulation intensities
params <- list()
# 1. brain tissue properties 
# 1.1. width of brain tissue in mm
params$bt_width <- 3  
# 1.2. depth of brain tissue in mm
params$bt_depth <- 2.4 
# 1.3. height of brain tissue in mm
params$bt_height <- 0.3
# 2. Petri dish properties
params$liquid_height <- round(2.01 + params$bt_height, 2)
# 3. Stimulation properties
# 3.1. stimulation intensity
params$mso <- seq(from = 30, to = 45, by = 1)       
# 3.2. coil_distance (negative value: stimulation from below; positive value: stimulation from top)
params$coil_distance <- -1 
# Get electric field results ----
search3 <- get_efield_mso_range(params)
search3

# Some useful functions ----
str(data)
range(data$bt_height)
unique(data$bt_height)
length(unique(data$bt_height))
length(unique(data$mso))
unique(round(data$bt_width, 2))
round(unique(data$bt_depth), 2)
length(unique(data$bt_width))
length(unique(data$bt_depth))
a <- unique(data$bt_width)[-1]
tail(unique(data$bt_width), 1)

# Example figures
ggplot(data = data |> dplyr::filter(mso == 1), aes(x = bt_height, y =  EF_median)) + 
  stat_summary(fun.data = mean_se, geom = "errorbar", alpha = 1, size = 0.5, width = 0.01) +
  stat_summary(fun = mean, geom = "point", shape = 21, size = 2, stroke = 0.5) +
  labs(x = "Brain tissue's height", y = "Median E-field (V/m)") +
  scale_x_continuous(breaks = seq(from = 0.15, to = 0.4, by = 0.05)) +
  coord_cartesian(ylim = c(0.55, 0.7)) +
  theme_bw()

ggplot(data = data |> dplyr::filter(mso == 1, coil_distance < 0), aes(x = bt_height, y =  EF_median)) + 
  stat_summary(fun.data = mean_se, geom = "errorbar", alpha = 1, size = 0.5, width = 0.01) +
  stat_summary(fun = mean, geom = "point", shape = 21, size = 2, stroke = 0.5) +
  labs(x = "Brain tissue's height", y = "Median E-field (V/m)") +
  scale_x_continuous(breaks = seq(from = 0.15, to = 0.4, by = 0.05)) +
  coord_cartesian(ylim = c(0.7, 0.9)) +
  theme_bw()

data <- data |> 
  dplyr::mutate('coil_position' = dplyr::case_when(
    coil_distance < 0 ~ 'bellow',
    coil_distance > 0 ~ 'top', 
    TRUE ~ 'error'))

ggplot(data = data |> dplyr::filter(mso == 1), aes(x = bt_height, y =  EF_median)) + 
  facet_grid(cols = vars(coil_position)) +
  stat_summary(fun.data = mean_se, geom = "errorbar", alpha = 1, size = 0.5, width = 0.01) +
  stat_summary(fun = mean, geom = "point", shape = 21, size = 2, stroke = 0.5) +
  labs(x = "Brain tissue's height", y = "Median E-field (V/m)") +
  scale_x_continuous(breaks = seq(from = 0.15, to = 0.4, by = 0.05)) +
  coord_cartesian(ylim = c(0.2, 0.85)) +
  theme_bw()
