library(tidyverse)
library(dplyr)
library(palmerpenguins)

View(t1)
View(paste)
View(newt5)

t4a <- table4a
t4b <- table4b
t1 <- table1

x = t4a %>%
  pivot_longer(-country, names_to= 'year', values_to= 'population')


##full join can only be two items, but you can do it again...
full_join(x,t1)



t5 <- table5

### how to combine the century and year together and get rid of the underscore
## paste0 is what can be used instead of unite Both are same thing:
paste <- t5%>%
  mutate(year=paste0(t5$century,t5$year, sep='')) %>%
  select(-century)

newt5 <-t5 %>%
  unite("actualYears", century,year, remove=T, sep='')


##make numeric, and also seperates the cases and population from eachother...

paste <- t5%>%
  mutate(year=as.numeric(paste0(t5$century,t5$year, sep=''))) %>%
  select(-century) %>%
  separate(rate,into = c('cases','population'), convert=T)


## for final project - when saved in "excel" hwo to read there is a package
##for this
#### sheet = which page to read. skip = which data to ignore

library(readxl)
install.packages("readxl")
df = read_xlsx('full file path',
               sheet=number,
               skip=number,
               range='e18:f21',
               )

names(penguins)

##package to help clean up names !! clean names at the beginning!!
library(janitor)
make_clean_names('# of bacteria')
clean_names()

## clean up headers of the whole data frame
clean_names(df)

df %>%
  clean_names()


### look at messy_bp



