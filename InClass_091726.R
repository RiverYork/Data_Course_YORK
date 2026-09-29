df_car = mtcars

View(df_car)
mean(df_car$mpg)

#first row first column (option 1)
df_car[1,1]

df_mpg_20 = df_car[df_car$mpg > 20,]
View(df_mpg_20)

#option 2
df_mpg_20 = df_car[df_car$mpg >20 & df_car$cyl == 4, ]
View(df_mpg_20)


# - = remove numbers
# ! = true/false

#names just gives a list of names and doesn't actually change anything
names(df_car)

dim()

#remove hp, wt and save car w mpg > 20
### this is how we can delete the specific columns
df_NewCars = df_car[,-c(4, 6)]
View(df_NewCars)

# and cyl not 4
## don't forget commas to make sure all data is accounted for
### don't forget to change the df to have everything accuratley
df_NewCarsAgain = df_NewCars[df_NewCars$mpg >20 & df_NewCars$cyl != 4,]
View(df_NewCarsAgain)





#how to install a package in the command line, not on the right side.
## on right side click the check mark to add
install.packages("")
library()

# package::function



##install tidyverse package and qrcode package
install.packages("qrcode")
library(qrcode)

install.packages('tidyverse')
library(tidyverse)


url = 'https://github.com/RiverYork/Data_Course_YORK'
qr = qr_code(url)
qr
plot(qr)



#save cars w mpg >22, cyl = 4, wt < 3
# and hp >90 in. a new obj
# use tidyverse

df_RY = mtcars

new_OBJ = df_RY %>% 
  filter(mpg > 22, cyl == 4, wt < 3, hp > 90) %>%
  View()
  


#can be added in the pipe to delete things
new_OBJ = df_RY %>% 
  filter(mpg > 22, cyl == 4, wt < 3, hp > 90) %>%



select(-mpg, -cyl)

#pluck helps pull out specific data
new_OBJ %>%
  pluck('mpg') %>%
  mean()



#remove cars w cyl = 4
#calcukate average mpg

df_RY %>%
  filter(cyl != 4) %>%
  pluck('mpg') %>%
  mean()

