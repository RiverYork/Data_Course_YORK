# In Class Practice 09/01/26 ####

## see where you are and set where you are ####
getwd()
setwd()

### reading a csv file from "Data" using the ABSOLUTE PATH ####
read.csv(file = '~/Desktop/Data_Course_YORK/Data/1620_scores.csv')

#### reading a csv file from "Data" using the RELATIVE PATH ####
read.csv(file = 'Data/1620_scores.csv')

##### can insert an object to see if something what you want it to be ####
is.character()
is.logical()
is.numeric()

# to change the value, but not in the actual object
as.numeric()
as.character()
# Can permanently change if needed:
# object = as.numeric(Object2)


###### Make a vector

vector1 = c(1, 2, 3, 4)
vector2 = c( '1', '2', '3')
vector3 = c(TRUE, FALSE)

vector1 + 5

#list each value in a vector
vector1[1]
vector1[2]

#see the length of the vector
length(vector2)

####### How to ue Matrix
mdat <- matrix(c(1, 2, 3, 4, 12))

######## Array
#multiple dimentions

arr = array(1:12, dim = c(2,2,6)
arr[2,1,6]

######### Data Frame ####

dat = data.frame(
  id = c(1,2,3),
  weight = c(4,5,6),
  color = c('red','sienna',"magenta")
)
#pulls whichever data set you want out of the "data"
dat$id
# add a new column
dat$animal = c(17, 'giraffe', 'tiger')

dat

########### Lists ####
lis = list( 
  id = c(1,2,3),
            weight = c(4,5,6),
            color = c('red','sienna',"magenta")
  dat = dat
)
lis




