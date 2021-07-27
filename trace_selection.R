# This file takes all the cleaned up data and plots the entire trace
# This is used to check the amplitude and get the regions of intrest from entire trace

# Import libraries used
library(plotly)

#Creating variable to use in ggplotly
data_plot <- df%>%
  ggplot() +
  geom_line(data = df, aes(x=Time, y = Micromolar), color = "black") +
  theme_bw() +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  labs(x = "Time (s)", y = "Serotonin  (μM)") +
  scale_x_continuous(breaks = seq(min(df$Time), max(df$Time), by = 300))

# Make the graph interactive
ggplotly(data_plot)
#ggsave(paste0(dir_name, "/", user_input, ".pdf"))


