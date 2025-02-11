getwd()
list.files()

csv_files <-
list.files(path="Data")

length(csv_files)

df<-
list.files(path="Data/wingspan_vs_mass.csv")



list.files(path="wingspan_vs_mass.csv",pattern="b-",recursive=TRUE,ignore.case=TRUE,full.names=TRUE,
           all.files=TRUE,)
file.exists("Data/wingspan_vs_mass.csv")

#is this correct? for #9????
pattern="b-"





read.csv(df)

#confused on what this means????
head(x=csv_files)
