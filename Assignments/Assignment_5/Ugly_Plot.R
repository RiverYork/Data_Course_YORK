library(tidyverse)
library(ggplot2)
library(png)
library(ggpubr)
library(jpeg)
library(ggimage)
library(showtext)


### The Craft
background_imagez <-'2.png'

df2 <- iris
df3 <- df2$Sepal.Width

df <- data.frame(x= c(101,3,48,5,91,-27), y= c(53,89,90,1,-78,23),
                 icon = c('1.png','3.png','4.png','5.png','6.png','7.png'))
legends <- "The 'cursed' Nutter Butter Instagram page is a 
  highly coordinated, years-long alternate reality game (ARG) and 'anti-marketing' 
  campaign designed by the ad agency Dentsu Creative to capture the surreal humor 
  of Gen Z and Gen Alpha. Rather than being hacked, the brand intentionally 
  abandoned traditional advertising to build a dark, analog horror lore centering 
  on a fictional character named Aiden, who is trapped in a creepy, 
  peanut-butter-smeared alternate reality while being hunted by a demonic entity 
  known as the Nutter Butter Man (a twisted version of the brand's 1970s mascot."
peanuts <- '"peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts","peanuts"'

my_plot <- ggplot(df, aes(x= x,y= y)) +
  geom_image(aes(image=icon), size = 0.5) +
  scale_x_continuous(breaks= c(-30:500), labels = c(-30:500))+
  scale_y_continuous(breaks= c(-80:500), labels = (-80:500))+
  theme(axis.text.x=element_text(angle=180,vjust=3,hjust=6)) +
  geom_bgimage(background_imagez) +
  labs(title="The Nutter Butter Man Will Be At The End of Your Bed Tonight", x= legends, y= "Scary")+
  theme(plot.title=element_text(family="sans",size=10,face='bold',color="green",hjust=0.5))

  ggsave(filename="Ugly_Plot_contest.png",plot=my_plot,
         path="~/Desktop",width=8,height=6,units="in",dpi=300)

  