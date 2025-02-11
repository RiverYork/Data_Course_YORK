csv_files <- list.files(path = "Data/", pattern = "\\.csv$", full.names = TRUE)

length(csv_files)
df <- read.csv("Data/wingspan_vs_mass.csv")

head(df, 5)
b_files <- list.files(path = "Data/", pattern = "^b", full.names = TRUE, recursive = TRUE)

for (file in b_files) {
  first_line <- read.csv(file, nrows = 1)
  print(first_line)
}

for (file in csv_files) {
  first_line <- read.csv(file, nrows = 1)
  print(first_line)
}
