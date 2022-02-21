#This code extracts portions of intrest from the entire trace.

# takes how many times to run the code
num_traces <- as.integer(
  readline(prompt="How many traces do you want to extract? ")) 

x<- 1
while(x <= num_traces){
  peak_time <- as.integer(
    readline(prompt="Enter the peak time: ")) # takes the peak time
  
  #Select the portion of the trace you want to use
  df2 <- df %>%
    select(Time, Micromolar)  %>%
    filter(Time > peak_time - 50 & Time <  peak_time + 180)
  
  # changing the time scale so the first number = 0
  df2$Time <- df2$Time - df2$Time[1]
  
  # Save cleaned up csv file in new directory
  csv_name <- readline(prompt="Name the CSV file: ")
  write.csv(df2, paste0(dir_name, '/', csv_name, '.csv'))
  
  # Plot the data
#  short_data_plot <- df2%>%
#    ggplot() +
#    geom_line(data = df2, aes(x=Time, y = Micromolar), color = "black") +
#    theme_bw() +
#    theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
#    labs(x = "Time (s)", y = "Serotonin  (μM)") +
#    scale_x_continuous(breaks = seq(min(df2$Time), max(df2$Time), by = 50))
#  ggplotly(short_data_plot)
  x<- x+1
}

# Prints out to move to the following bit of code
cat(red("Move to line 15!"))