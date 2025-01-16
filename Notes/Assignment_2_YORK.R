getwd()

#the ? in front of this will bring up the help
?list.files()
list.files(path = "Data")
list.files(path = "Data", pattern = ".csv")
list.files(path = "Data", pattern = ".csv", all.files = TRUE)
list.files(path = "Data", pattern = ".csv", all.files = TRUE,
           full.names = TRUE)
file.exists("Data/wingspan_vs_mass.csv")

# recursive = TRUE means that it will look through all folders inside one folder.

list.files(path = "Data", pattern = ".csv", all.files = TRUE,
           full.names = TRUE, recursive = TRUE)

# ignore.case helps with capitals in the file names to not matter.
list.files(path = "Data", pattern = ".cSV", all.files = TRUE,
           full.names = TRUE, recursive = TRUE, ignore.case = TRUE)
file.exists("Data/wide_rent_income.csv")

csv_files <-
list.files(path = "Data", pattern = ".cSV", all.files = TRUE,
           full.names = TRUE, recursive = TRUE, ignore.case = TRUE)
# what is this value?
class(csv_files)
length(csv_files)
csv_files[1]
#first 10 csv files
csv_files[1:10]
# highlight 1:10 and hit enter

#
csv_files[c(1,3,5)]
#combine/concatenate
c(1,3,5)
1:100
c(1:50, 53, 54, 57)
c("your","mom", 100)

#a vector in R requires the same class... # or "A". The deafault is character not number.

#as.numeric will help transfer everything to numbers instead of characters
as.numeric()

y<- c(1,2,3,4,5,6,7,10,99,100,NA)
mean(y)
?mean()
# will get rid of the NA and just use numbers
mean(y,na.rm =TRUE)



6L+1
#order doesn't matter as long as they are named
head(x=csv_files, n=10)
head(n=10,x=csv_files)

#find relative path to cleaned bird data
#save object as bird
#save to data course file
bird<-
list.files(recursive=TRUE, pattern= "cleaned_bird_data.csv",full.names=TRUE)
file.copy(bird,".")
bird

?read.csv()
dat<-
read.csv(bird)

class(dat)

#rows and columns
dim(dat)

#rows 1, 3, and 5 of dat
## leave the space for showing all columns
dat[c(1,3,5),]

#just the egg column (boht do the same)
dat[,("Egg_mass")]
dat$Egg_mass

keepers<- dat$Egg_mass > 10
big_egg_mamas <- dat[keepers,]

#to find na's
is.na(dat$Egg_mass)

#get rid of NAs
#subset where egg_mass is greater than 10 and is not NA
## ! means the invert true or false
dat$Egg_mass >10 & !is.na(dat$Egg_mass)


#update our existing data to be only big eggs and no NAs
big_egg_mamas<-
dat[dat$Egg_mass > 10 & !is.na(dat$Egg_mass),]

plot(big_egg_mamas$Egg_mass)
plot(density(big_egg_mamas$Egg_mass) )

summary(big_egg_mamas$Egg_mass)

#data frame is just a list of vectors



#shows the same thing as what is in the top right drop down
str(dat)




#practice
summary(dat$mass)
summary(dat$tarsus)



bigmassbuddies<-
dat$mass > median(dat$mass,na.rm = TRUE) &
dat$tarsus > median(dat$tarsus, na.rm=TRUE)
dat[bigmassbuddies,]

#make a plot
plot(dat[bigmassbuddies,"Egg_mass"])


#remove a file
file.remove("./cleaned_bird_data.csv")



