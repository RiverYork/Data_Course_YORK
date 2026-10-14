## Assignment 4 set up for final project/ideas
library(tidyverse)

getwd()
View()


AVG_TEMP = read.csv(file='Final_Project/Avg_Temp_2024.csv')

MAX_TEMP = read.csv(file='Final_Project/Max_Temp_2024.csv')

MIN_TEMP = read.csv(file='Final_Project/Min_Temp_2024.csv')

Ammonia_MADEUP = data.frame(id = c(1,2,3),
                            Ammonia = c(4,5,6),
                            color = c('red','sienna',"magenta"))

### I just looked into the actual lake samples and the analysis I have, it is in
  ## xlsx format... I hope I will still be able to use this, I think I will need to 
  ## clean it up a lot more than I thought originally. So for now, I just have
  ##the temperatures.

ggplot(data = Ammonia_MADEUP, mapping= aes(x=color, y=Ammonia)) +
  geom_point(aes(color = "orange")) +
  labs(title = "Ammonia color vs. Value", x= "color", y= "Ammonia")

#### I just made up a random group of data points for now. I am hopeful that i can
  ## clean up my real data so that I can use it for this idea/project :)



