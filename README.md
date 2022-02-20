# Purpose of script
This script takes chronoamperometry data and prepares it for: analysis and visualization.  It wil also record the max amplitude and area under the curve in a seperate csv file.
**Single trace:** ![](Images/single.jpeg)
**2 traces overlayed** ![](Images/overlay.jpeg)
**fitting decay kinetics** ![](Images/exponential_fit.jpeg)

## NOTE
- Before using this script make sure you have the following packages: tidyverse, filesstrings, plotly, Bolstad2, broom.
- If you do not have the packages, install them by copying and pasting the following command into the console:
- install.packages(c('tidyverse', 'filesstrings', 'plotly', 'Bolstad2', 'broom'))
