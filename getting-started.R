# # # # # # # # # # # # # # # # # # # #
# Getting started with R for spatial  #
# # # # # # # # # # # # # # # # # # # #

# Ctl-Shift-C comments code in RStudio. Alt-Shift-K shows more shortcuts
install.packages("sf") # install sf package for 'spatial powers'
# see https://geocompr.robinlovelace.net/spatial-class.html for more on set-up
library(sf) # attach the package - use it's functions without sf::
?plot #  get help on the plot function
# read-in data
nc = st_read(system.file("gpkg/nc.gpkg", package="sf"))
plot(nc)
