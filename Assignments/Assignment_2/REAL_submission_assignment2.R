getwd()


csv_files <-
  list.files(path="Data/",pattern = ".csv", full.names=TRUE)

length("csv_files")


df<- 
  read.csv("Data/wingspan_vs_mass.csv")

head(df, 5)

b <-
list.files(path="Data/",pattern="^b",full.names=TRUE,
           recursive=TRUE,ignore.case=TRUE,all.files=TRUE)

#After this point, I am lost... For loop help

for(file in b){
  print(readLines(file,n=1))
}
print(b)
file.exists(b)
for (file in b) {
  (file.exists(file))
 print(b)
}
