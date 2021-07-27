# This file allows you to bring up individual traces

# What is the file name?
trace_name <- readline(prompt="Enter name: ")
file_loc <- paste0(dir_name, "/", trace_name, '.CSV')

#file_loc2 <- 'data/20-4-21/641.csv'

# Import data
df2 <- read.csv(file_loc, header = TRUE)
#head(df2)

# Plot the data
short_data_plot <- df2%>%
  ggplot() +
  geom_line(data = df2, aes(x=Time, y = Micromolar), color = "black") +
  theme_bw() +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  labs(x = "Time (s)", y = paste0(nt, " uM")) +
  scale_x_continuous(breaks = seq(min(df2$Time), max(df2$Time), by = 50))
ggplotly(short_data_plot)