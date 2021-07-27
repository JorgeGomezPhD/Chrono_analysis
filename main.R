# This script prepares chrono data for visualization and analysis

# Imports file that cleans up the Chrono data
source("data_cleanup.R")

# Imports trace selection file
source("trace_selection.R")
ggplotly(data_plot) #Make interactive graph

# Save individual CSV for different time points
source("short_trace.R")

# Run this code if you want to visualize individual traces
source("view_short_trace.R")
ggplotly(short_data_plot) #Make interactive graph for shorten trace

source("calculations.R") # Calculates peak amplitude and area under curve

