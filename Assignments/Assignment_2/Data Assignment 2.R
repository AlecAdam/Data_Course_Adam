#4. Write a command that lists all of the .csv files found in the Data/ directory and stores that list in an object called “csv_files”

list.files(path = 'Data/', pattern = '.csv')
csv_files <- list.files(path = 'Data/', pattern = '.csv')

#5. Find how many files match that description using the length() function

length(csv_files)

#6. Open the wingspan_vs_mass.csv file and store the contents as an R object named “df” using the read.csv() function
df <- read.csv("Data/wingspan_vs_mass.csv")

#7. Inspect the first 5 lines of this data set using the head() function

head(df, n = 5)


#8. Find any files (recursively) in the Data/ directory that begin with the letter “b” (lowercase)
list.files(path = 'Data/', pattern = '^b', recursive = T)
getwd()

#9. Write a command that displays the first line of each of those “b” files (this is tricky… use a for-loop)

readLines('data/data-shell/creatures/basilisk.dat' , n = 1)
readLines('data/data-shell/data/pdb/benzaldehyde.pdb' , n = 1)
readLines('data/Messy_Take2/b_df.csv' , n = 1)

bfile <- list.files(, pattern = '^b' , recursive = T)

getwd()
for (file in bfile) {
    setwd('/Users/alecadam/Desktop/Data_Course_Adam/Data')
    first_line <- readLines(file, n = 1)
    print(first_line)
  }
  
#10. Do the same thing for all files that end in “.csv”
cfile <- list.files( , pattern = '.csv' , recursive = T)
                     
cfile <- list.files( , pattern = '.csv' , recursive = T)
for (file in cfile) {
  setwd('/Users/alecadam/Desktop/Data_Course_Adam/Data')
  first_line <- readLines(file, n = 1)
  print(first_line)
}

