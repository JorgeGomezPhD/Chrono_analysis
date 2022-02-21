# Purpose of script
This script takes chronoamperometry data and prepares it for: analysis and visualization.  It wil also record the max amplitude and area under the curve in a seperate csv file.
<br />**Single trace:** <br />![](Images/single.jpeg)
<br />**2 traces overlayed** <br /> ![](Images/overlay.jpeg)
<br />**fitting decay kinetics** <br />![](Images/10-25-19_exponential_fit.png)

## NOTE
- Before using this script make sure you have the following packages: tidyverse, filesstrings, plotly, Bolstad2, broom, crayon.
- If you do not have the packages, install them by copying and pasting the following command into the console:
- install.packages(c('tidyverse', 'filesstrings', 'plotly', 'Bolstad2', 'broom', 'crayon'))
