
##install tidyverse everytime :)
library(tidyverse)

##make df of data we want to read
Birds = read.csv(file= 'Data/cleaned_bird_data.csv')

##view all data
view(Birds)
view(NewBirds)
view(BigEggs)

##get rid of all NAs for the data
NewBirds = Birds %>%
  filter(Egg_mass != 'NA')

##calculate average egg size
NewBirds %>%
  pluck('Egg_mass') %>%
  mean()

##save birds into new df w egg sizes that are greater than average to new df
BigEggs = NewBirds %>%
  filter(Egg_mass > 21.784)

##look over data and verify without actually "viewing"
min(BigEggs$Egg_mass)

##Honestly unsure whats bugging this::: Summarise gives new collumns
BigEggs %>%
  filter(Egg_mass > avg) %>%
  summarise(min_egg)= min(), max_egg = (), avg_egg = mean()

##Save as a .csv on the computer in the working directory : relative path goes inside the brackets
write_csv(BigEggs, "Big_Eggs.csv")




