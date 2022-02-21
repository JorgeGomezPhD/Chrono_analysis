# This file allows you to bring up individual traces

# What is the file name?
trace_name <- readline(prompt="Enter trace name: ")
file_loc <- paste0(dir_name, "/", trace_name, '.CSV')


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

# Saves single trace to folder
ggsave(paste0(dir_name,"/", rem_ext,"_", trace_name,".png"))

# Prints out to move to the following bit of code
cat(red("Move to line 21 or line 15 to get another single trace"))