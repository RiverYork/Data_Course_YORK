library(tidyverse)

 
h <- rnorm(323)
l <- rnorm(323)

ugly <- data.frame(h,l)


ggplot(ugly,aes(x=h,y=l))+
  geom_point()+
  labs(title="bewtifull",y="Y",x="x")+
 
