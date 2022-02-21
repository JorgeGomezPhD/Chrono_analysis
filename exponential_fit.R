# Import neccesary libraries
library(broom)

## load, explore and process the datasset
mydata <-read.csv(paste0(dir_name, "/", plot1_name, ".csv"))
mydata2 <-read.csv(paste0(dir_name, "/", plot2_name, ".csv"))
#head(mydata)
mydata <- mydata[50:"200",] #load a portion of the dcay data
mydata2 <- mydata[50:"200",] #load a portion of the dcay data
# Making variables to be used for plotting partial trace
t <- mydata$Time
t2 <- mydata2$Time
y1 <- mydata$Micromolar
y2 <- mydata$Micromolar

# Create data from from data
df <- tibble(t = t, y = y1, condition = plot1_name) %>% 
  rbind(. , data.frame(t = t2, y = y2, condition = plot2_name))

# Plot 2 exponential lines with qplot
qplot(t, y, data = df, colour = condition)
ggplot(data = df, aes(t, y, colour = condition)) + geom_line()

# Fitting with NLS NOTE does not work.
Control <- df %>% filter(condition == plot1_name)
#nls(y ~ yf + (y0 - yf) * exp(-alpha * t), 
#    data = Control,
#    start = list(y0 = 54, yf = 25, alpha = 1))

# NLS using SSasymp comand
# Self-starting function, a special function for curve fitting that guesses its own start parameters.
# The asymptotic regression function, SSasymp is equivalent to our exponential decay:
fit <- nls(y ~ SSasymp(t, yf, y0, log_alpha), data = Control)
fit

qplot(t, y, data = augment(fit)) + geom_line(aes(y = .fitted))

# Fit the data
fitted <- df %>% 
  nest(-condition) %>%
  mutate(
    fit = map(data, ~nls(y ~ SSasymp(t, yf, y0, log_alpha), data = .)),
    tidied = map(fit, tidy),
    augmented = map(fit, augment),
  )  

# Produce a table of fit parameters: y0, yf, alpha
fitted %>% 
  unnest(tidied) %>% 
  select(condition, term, estimate) %>% 
  spread(term, estimate) %>% 
  mutate(alpha = exp(log_alpha))

augmented <- fitted %>% 
  unnest(augmented)
qplot(t, y, data = augmented, geom = 'point', colour = condition) +
  geom_line(aes(y=.fitted)) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
                                    panel.background = element_blank(), axis.line = element_line(colour = "black")) # remove grid lines

# Saves image to existing folder
ggsave(paste0(dir_name,"/", rem_ext,"_exponential_fit.png"))

