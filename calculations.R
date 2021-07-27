# import packages
require(Bolstad2)

# Get Maximum concentration
max_concentration <- max(df2$Micromolar)

# Calculates area under the curve
# Used one of the equations on (https://stackoverflow.com/questions/4954507/calculate-the-area-under-a-curve)
# and verified the results against 3 other equations in R and excell.
area <- sintegral(df2$Time,df2$Micromolar)$int

df3 <- read.csv('data/control.csv', header = TRUE)
#new_max <- data.frame("", 1, 2, row.names = "new_row")

new_max <- data.frame(paste0(rem_ext,'_trace_',trace_name), max_concentration, area)
names(new_max) <- names(df3)
df3 <- rbind(df3, new_max)

write_csv(df3, "data/control.csv")
