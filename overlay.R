# This script will overlay multiple recordings together

# Import packages
library(broom)

# load, explore and process the datasset
plot1 <- read.csv('data/20-4-21/1254.csv')
plot2 <- read.csv('data/20-4-21/1508.csv')

# Making variables to be used for plotting trace
t <- plot1$Time
y1 <- plot1$Micromolar # first trace
y2 <- plot2$Micromolar # second trace

# Reorganize data 
df4 <- tibble(t = t, y = y1, condition = 'Control') %>% 
  rbind(. , data.frame(t = t, y = y2, condition = 'Drug'))

# define color scheme
cls <- c("Control"="black", "Drug"="red")

ggplot(data = df4, aes(t, y, colour = condition)) + 
  geom_line() +
  theme_bw() +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  labs(x = "Time (s)", y = paste0(nt, " uM")) +
  scale_color_manual(values = cls)

