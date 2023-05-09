# NOTES on the research project "Electric field simulations for in-vitro TMS experiments"

## Preparations
1. Install the latest version of R and RStudio: https://posit.co/download/rstudio-desktop/
2. Open RStudio and install ProjectTemplate library by typing this in the console: install.packages('ProjectTemplate')
3. Download this github repository to a desired location on your notebook/computer.

## Variables
+ bt_width: widht of brain tissue in mm.
	+ range: from 2.66 to 4.88 mm
	+ 31 unique values
+ bt_depth: depth of brain tissue in mm.
	+ range: from 2.1 to 3.84 mm
	+ 31 unique values
+ bt_height: height of brain tissue in mm.
	+ value ranges from 0.15 mm to 0.4 mm with a step size of 0.05 mm.
	+ 6 unique values
+ liquid_height: height of the liquid in the Petri dish in mm. 
	+ 10 mm: petri dish is full with liquid_height
	+ 2.16: 2 mm + brain tissue height of 0.15 mm + 0.01 mm (10 micron) liquid on the top of the brain tissue 
+ coil_distance: 
	+ value ranges from -3 to 3 mm with a step size of 1 mm.
	+ 6 unique values
	+ if value is positive: distance between the top (lid) of the Petri dish and the TMS coil in mm. This is stimulating "from the top".
	+ if value is negative: distance between the bottom of the Petri dish and the TMS coil in mm. This is stimulating "from below".
+ mso: maximum stimulator intensity in percentage
	+ value ranges from 1% MSO (lowest possible intensity) to 100% MSO (heighest possible intensity).
	+ 100 unique values
+ EF_min: minimum electric field.
+ EF_mean: mean electric field. 
+ EF_median: median electric field. 
+ EF_robust_max98: 98th percentile of electric field.
+ EF_robust_max99: 99th percentile of electric field.

## Electric field values
Electric field values are extracted from the volume compartment of the entire brain tissue and are given in V/m (equivalent to mV/mm). 
 
## Usage
1. Open RStudio.
2. File > open project, select file "invitro.Rproj".
3. File > open file, go to "src" folder, and select file "get_efield_value.R".
4. In "get_efield_value.R", define the desired stimulation parameters (e.g., intensity, brain tissue size, etc.).
5. You can execute lines by pressing strg + enter. 
6. Results will be shown in the console window and in "results" variable that you can find in Environment > Global environment.