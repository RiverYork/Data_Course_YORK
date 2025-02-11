install.packages("palmerpenguins")
install.packages("gganimate")
install.packages("ggimage")
install.packages("GGally")
library(GGally)
library(tidyverse)
library(gganimate)
library(ggimage)
library(palmerpenguins)
penguins


pen<- penguins

plot(pen)
?ggplot

#THIS IS BROKEN IDK HOW IT WORKS
theme_set(theme_minimal)+
  theme(axis.text=element_text(size=15, face='bold'))
#---



p<-
filter(pen, !is.na(sex)) %>% 
  mutate(sex=sex %>% str_to_sentence()) %>%
  # pen %>% 
  ggplot(aes(x=flipper_length_mm, y=body_mass_g,color=species))+
  # geom_line()+
  geom_point()+ 
  facet_wrap(~ sex) +
  stat_ellipse()+
  labs(y="Body mass (g)",x="Flipper length (mm)",color="Species")

#tell you everything in a package
tidyverse::

#character strings
str
p

p + gganimate::transition_states(species,) + gganimate::ease_aes()
scale_color_brewer()

#shows all of the data for everything against everything
GGally::ggpairs(pen)


#study and look into "geom"
ggplot(aes(x=bill_length_mm, color=species,fill=species))+ geom_desnity(alpha=.25)
