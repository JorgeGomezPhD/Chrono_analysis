# This script fits exponential decays
# The code was addapted from https://rpubs.com/mengxu/exponential-model

# load and explore data
mydata <- read.csv("data/851.csv")

mydata <- mydata[50:"200",] #load a portion of the dcay data
#t <- mydata$Time
#y1 <- mydata$Micromolar

# plot data
plot(mydata$Time, mydata$Micromolar)

# Select an approximate $\theta$, since theta must be lower than min(y), and greater than zero
theta.0 <- min(mydata$Micromolar) * 0.5  

# Estimate the rest parameters using a linear model
model.0 <- lm(log(mydata$Micromolar - theta.0) ~ mydata$Time, data=mydata)  
alpha.0 <- exp(coef(model.0)[1])
beta.0 <- coef(model.0)[2]

# Starting parameters
start <- list(alpha = alpha.0, beta = beta.0, theta = theta.0)
start

# Fit the model (with estimated starting parameters)
model <- nls(mydata$Micromolar ~ alpha * exp(beta * mydata$Time) + theta , data = mydata, start = start)

# Plot fitted curve
plot(mydata$Time, mydata$Micromolar)
lines(mydata$Time, predict(model, list(x = mydata$Time)), col = 'skyblue', lwd = 3)

