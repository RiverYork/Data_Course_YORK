library(tidyverse)
#namespace
install.packages("tidyverse")


# SETUP ####
## load packages ####
library(tidyverse)

## Load data ####
#how to pull up our indo and specify to make a plot ####
dat<- read_delim("./Data/DatasaurusDozen.tsv")
dat$dataset
unique(dat$dataset)

# star<- dat[dat$dataset == "star",] THIS EQUALS filter(dat,dataset == "star")

star<- dat[dat$dataset == "star",]
plot(star$x,star$y)

filter(dat,dataset == "dino")





