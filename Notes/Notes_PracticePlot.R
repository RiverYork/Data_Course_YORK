library(tidyverse)

 
h <- c(12,23,34,5,7,65,43,32,5,57,7,789,3,5,423,2)
l <- c(12,45,67,88,99,65,3,21,1,2,3,34,45,6,121,7)

ugly <- data.frame(h,l)


ggplot(ugly,aes(x=h,y=l))+
  geom_point(size=2,shape=17,color="white")+
  geom_smooth(size=12,color="#6A4E23")+
  labs(title="bewtifull",y="HairColour",x="Age OF a group of PEOPLe")+
  xlim(min(ugly$h), max(ugly$h))+
  ylim(min(ugly$l), max(ugly$l)) +
  theme(panel.background=element_rect(fill="#FF1493"),
        plot.title=element_text(size=4.5, face="bold",color="black"),
        axis.title= element_text(size=200,color="#F5F5F5"),
        axis.text.x=element_blank(),
        axis.text.y= element_blank(),
        axis.ticks= element_blank())
