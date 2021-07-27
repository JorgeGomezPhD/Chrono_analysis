# Here I am cleaning up Chrono data files to extract only the data I need to plot
# It will give me the entire trace

# import libraries to use
library(tidyverse)
library(filesstrings)

# What is the file name?
user_input <- toupper(
  readline(prompt="Enter name example '20-4-21.EDT' or '10-25-19.ACQ': "))
file_loc <- paste0('data/', user_input)
#print(file_loc)

# Create new directory to store files in
rem_ext <- unlist(strsplit(user_input, split='.', fixed=TRUE))[1]
dir_name <- paste0('data/', rem_ext)
dir.create(dir_name)


# Import data
df <- read.csv(file_loc, header = FALSE)
#head(df)

# Remove the first 42 rows containing no usable data
df <- df %>%
  slice(-1:-42)
#head(df)

# Select rows I need to visualize the data
df <- df %>% separate(V1, c("Time", NA, NA, "x", "y"))
#head(df)

# Joining x and y column by a decimal
df <- df %>% unite("Micromolar", x:y, remove = TRUE, sep = ".")
#head(df)

#Check data type of the data set
#str(df)

# Convert both columns to numeric values
i <- c(1, 2) # Specify columns you want to change

df[ , i] <- apply(df[ , i], 2,            # Specify own function within apply
                  function(x) as.numeric(as.character(x)))

#str(df)

# Save cleaned up csv file in new directory
write.csv(df, paste0(dir_name, '/', 'new_', rem_ext, '.csv'))

# Move original file to new directory
file.move(file_loc, dir_name)



