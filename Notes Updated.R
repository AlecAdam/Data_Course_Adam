# submit homework
git .
git commit -m 'assign'
git push


#Week 1








#week 2
Types of objects in r
vector (one dim, same type)
matrix (two dim, same type of data)
array (multiple dim, same type)
data frame (two dim, different type, different length)
listn (multi dim, )
function

numeric
vec1 <- vec*vec
logical

true or FALSE

chracter
chr <- as.character(vec)
vec <-(1,2,3)
vec[2]

is.vector(vec)
str(chr)
chr[1]

dat <- read.csv('Data/1620_scores.csv')
dim(dat) #89 25
dat[3,4]
dat[1:3, 1:4]
dat[,3]

##build data frame for 'mtcars' dataset
dat <- mtcars
dim(dat)
str(dat)
# get cars with cyl greater than 4
dat[dat$cyl >4,]
dat$cyl >4

# pull out mpg data and calculate average, min, and max mpg
# summary shows min, max, average
str(dat)
dat$mpg
mean(dat$mpg)
or
carmpg <- dat$mpg
summary(carmpg)
#pick what goes in rows
dat[, c("mpg", "cyl")]
dat[, c(1:2)]

##convert 'mpg' to character in mtcars data frame
as.character(dat$mpg)
chr_mpg <- as.character(dat$mpg)
str(chr_mpg)

dat$mpg <- chr_mpg
str(dat)

dat$mpg_num
dat$mpg_num <- as.numeric(chr_mpg)
veiw(dat)
str(dat)
##convert entire data frame to character

#Practice 
## load 'mtcars' data set
#what type of object is this
str(mtcars)
class(mtcars)
View(mtcars)
#to see data just type it in
mtcars
#find cars with an mpg greater than 20 and 4 cyl
mtcars <- mtcars[mtcars$mpg>20, ]
dim(mtcars)
my_mtcars <- mtcars
#option 1
my_mtcars <- my_mtcars[my_mtcars$mpg > 20,]
my_mtcars <- my_mtcars[my_mtcars$cyl == 4,]
my_mtcars
#option 2
my_mtcars <- my_mtcars[my_mtcars$mpg > 20 & my_mtcars$cyl == 4,]
my_mtcars

## convert mpg to a character data type
my_mtcars$mpg <- as.character(my_mtcars$mpg)
my_mtcars$mpg <- as.character(my_mtcars$mpg)
my_mtcars$new_col <- as.numeric(my_mtcars$mpg)
my_mtcars$new_col <- my_mtcars$gear * my_mtcars$cyl

#convert the entire data frame to character data type
str(mtcars)
names(mtcars)
#option 1


my_mtcars$mpg <- as.character(my_mtcars$mpg)
my_mtcars$cyl <- as.character(my_mtcars$cyl)
my_mtcars$disp <- as.character(my_mtcars$disp)
my_mtcars$hp <- as.character(my_mtcars$hp)
reapreat for all and see all by names(mtcars)
#option 2

for (col in names(my_mtcars)) {
  print(col)
  my_mtcars$[, col] <- as.character(my_mtcars[, col])
}

#option 3
apply(mtcars[1:3, ], 2, mean)
new_dat <- apply(mtcars, 2, as.character)
new_dat <- apply(mtcars[1:3, ], 2, as.character)


class(new_dat_w_new_ipubt)
new_dat <- as.data.frame(new_dat_w_new_ipubt)
class(new_dat)

#to save to computer
read.csv()
write.csv(new_dat, 'class_practice_28_jan25.csv', row.names = f)

?apply(array, margin, ...)

#week 3

library(tidyverse)
mtcars$mpg %>%
  mean()
mean(mtcars$mpg)

# load 'mtcars' data set
cars <- mtcars
str(mtcars)
# find cars with wt greater than 3 and 8 cyl
cars <- mtcars[mtcars$wt > 3 & cars$cyl == 8,]
dim(cars)
cars
#save them as new object
#calculate the mean
mean(cars$mpg)
#Create a numeric vector object named "hp.cyl"
#which is calulated by dividing hp by cyl
names(cars)
cars$hp.cyl <- cars$hp/cars$cyl
names(cars)
# save this as a .csv file on your laptob and open it

write.csv(cars, 'documents')


library(tidyverse)
mtcars %>% 
  filter (wt > 3 & cyl == 8) %>%
  mutate(hp.cyl = hp/cyl) %>%
  write_csv('test.csv')
#option 1
mean(mtcars$mpg) 
# option 2
mtcars$mpg %>%
  mean()

library(palmerpenguins)
library(palmerpenguins)
penguins
View(penguins)

penguins %>% 
  names()

names(penguins)

# find something
penguins %>% 
  filter(bill_length_mm > 40 & sex == 'female')
View(penguins %>% 
       filter(bill_length_mm > 40 & sex == 'female'))

#calculate value
#body mass

mean(dat_bill$body_mass_g)

dat_bill$body_mass_g %>% mean()

penguins %>% 
  filter(bill_length_mm > 40 & sex == 'female') %>% 
  pluck ('body_mass_g') %>% 
  mean()  
  
#mean body mass off species
penguins %>% 
  filter(bill_length_mm > 40 & sex == 'female') %>% 
  group_by(species) %>% 
    summarise(mean_body_mass = mean(body_mass_g))

#find bigboi penguins by species
penguins %>% 
  filter(bill_length_mm > 40 & sex == 'female') %>% 
  group_by(species) %>% 
  summarise(mean_body_mass = mean(body_mass_g), max_body_mass = max(body_mass_g))

#group by
penguins %>% 
  filter(bill_length_mm > 40 & sex == 'female') %>% 
  group_by(species, island) %>% 
  summarise(mean_body_mass = mean(body_mass_g), max_body_mass = max(body_mass_g))

#show count of penguins
penguins %>% 
  filter(bill_length_mm > 40 & sex == 'female') %>% 
  group_by(species, island) %>% 
  summarise(mean_body_mass = mean(body_mass_g), max_body_mass = max(body_mass_g),
  count = n())

# sort data
penguins %>% 
  filter(bill_length_mm > 40 & sex == 'female') %>% 
  group_by(species, island) %>% 
  summarise(mean_body_mass = mean(body_mass_g), max_body_mass = max(body_mass_g),
            count = n()) %>% 
  arrange(desc(mean_body_mass)
        
# how to save

write_csv('put path what to save as')

penguins %>% 
  filter(bill_length_mm > 40 & sex == 'female') %>% 
  group_by(species) %>% 
  summarise(mean_body_mass = mean(body_mass_g), 
            max_body_mass = max(body_mass_g),
            count = n()) %>% 
  write_csv('penguins-1.csv')

#week 4

#1.1 find the fattie penguins (body_mass >5000)
View(penguins)

penguins %>% 
  filter(body_mass_g > 5000)
fat_pen <- penguins %>% 
  filter(body_mass_g > 5000)

#1.2 count how many are female and male
penguins %>% 
  filter(sex == 'female')
penguins %>% 
  filter(sex == 'male')

penguins %>% 
  filter(body_mass_g > 5000) %>% 
  group_by(sex) %>% 
  summarise(count = n(),
            fattest = max(body_mass_g))

#1.3 return the max body mass for male and female

max(penguins$body_mass_g, na.rm = T)

penguins$body_mass_g %>% 
  max(na.rm = T)

#2.1 add new column to penguins dataset that say wether they are fat

dat_peng <- penguins
dat_peng$fat_state <- dat_peng$body_mass_g > 5000
View(dat_peng)

penguins %>% 
  mutate(fat_or_not = body_mass_g >5000) %>% 
  View()

penguins %>% 
  mutate(fat_or_not = case_when(body_mass_g > 5000 ~ 'fat',
                                body_mass_g <= 5000 & body_mass_g > 3000 ~ 'medium',
                                TRUE ~ 'skinny')) %>% 
View()
#remove column
new_dat <- dat_peng[, c(1:8)]
view(new_dat)

#specific column
bad_dat %>% 
  select(-islands) %>% 
  View()

# how to make graphs

plot(dat_peng$bill_length_mm, dat_peng$body_mass_g)
library(ggplot2)

ggplot(data = dat_peng)

dat_peng %>% 
  ggplot(aes(x = bill_length_mm,
             y = body_mass_g)) +
  geom_point()  +
  geom_smooth()


dat_peng %>% 
  filter(!is.na(sex)) %>% 
  ggplot(aes(x = bill_length_mm,
             y = body_mass_g,
             color = sex)) +
  geom_point()

## aes = asthetic

#number of coloum
ncol(dataset)
#number of row
nrow()

# delete na from data

# make plot to show fat penguins and their species

data(penguins)
View(penguins)
penguins %>% 
  filter(body_mass_g > 5000)

penguins %>% 
  ggplot(aes (x = species, y = body_mass_g > 5000)) +
  geom_dotplot(
  )
penguins %>% 
  filter(body_mass_g > 5000) %>% 
  ggplot(aes(x = body_mass_g, y = bill_length_mm,
             color = species)) +
  geom_point()
# group by

penguins %>% 
  filter(body_mass_g > 3000) %>% 
  group_by(species) %>% 
  summarise(mean_body_mass_g = mean(body_mass_g)) %>% 
  ggplot(aes(x = mean_body_mass_g, color = species)) +
  geom_bar()


penguins %>% 
  ggplot(aes(x = bill_length_mm, y = body_mass_g, color = species)) +
  geom_point() +
  geom_smooth(method = 'lm', se = F)

# pick colors
penguins %>% 
  ggplot(aes(x = bill_length_mm, y = body_mass_g, color = species)) +
  geom_point() +
  scale_color_manual(values = c('Gentoo' = 'pink', 'Chinstrap' = 'lightblue', 'Adelie' = 'grey4')) +
  theme_dark() +
  theme(axis.text = element_text(angle = 180, face = 'italic'))
install.packages('ghibli')

#bar grapgh
penguins %>% 
  ggplot(aes(x = flipper_length_mm)) +
  geom_bar()
  
penguins %>% 
  ggplot(aes(x = flipper_length_mm, 
             y = body_mass_g)) +
  geom_col()

penguins %>% 
  ggplot(aes(x = flipper_length_mm, 
             y = body_mass_g,
             fill = species)) +
  geom_col()

penguins %>% 
  ggplot(aes(x = flipper_length_mm, 
             y = body_mass_g,
             fill = species)) +
  geom_col(position = 'dodge')

#Week 5

#clean environment
rm(list = ls())

#graph
data(penguins)
View(penguins)
# bar graph tells you count
penguins %>% 
  ggplot(aes(x = species, y = body_mass_g)) +
  geom_bar(stat = 'identity')

penguins %>% 
  ggplot(aes(x = species, y = body_mass_g)) +
  geom_col(position = 'dodge')

penguins %>% 
  group_by(species) %>% 
  summarise(max_mass = mean(body_mass_g, na.rm = T))

penguins %>% 
  ggplot(aes(x = species, fill =island)) +
  geom_bar(stat = 'count', position = 'dodge')

# how to calc average

penguins %>% 
  group_by(species) %>% 
  summarise(avg_mass = mean(body_mass_g, na.rm = T)) %>% 
  ggplot(aes(x = species, y = avg_mass)) +
  geom_col()
#error bar

penguins %>% 
  group_by(species) %>% 
  summarise(avg_mass = mean(body_mass_g, na.rm = T),
            sd = sd(body_mass_g, na.rm = T)) %>% 
  ggplot(aes(x = species, y = avg_mass)) +
  geom_bar(stat = 'identity') +
  geom_errorbar(aes(ymin = avg_mass - sd, 
                    ymax = avg_mass + sd),
                width = .02)

# make an inrtresting graph for penguins data
# do not yse geom_point
penguins %>% 
  ggplot(aes(x = sex, y = body_mass_g)) +
  geom_col()


penguins %>% 
  ggplot(aes(x = body_mass_g, fill = species)) +
  geom_density(alpha = 0.2)

penguins %>% 
  filter(!is.na(body_mass_g)) %>% 
  ggplot(aes(x = body_mass_g, y = species)) +
  geom_boxplot() +
  geom_point() +
  geom_jitter()

penguins %>% 
  filter(!is.na(body_mass_g)) %>% 
  ggplot(aes(x = factor(year), y = body_mass_g)) +
  geom_boxplot() +
  geom_jitter()

#show qr 

install.packages('qrcode')
library(qrcode)
url <- 'https://www.amazon.com'
qr <- qrcode::qr_code(url)
plot(qr)

# make a plot with 'flipper_lenght' on the x axis
# body max on y axis

library('palmerpenguins')

View(penguins)

penguins %>% 
  filter(!is.na(flipper_length_mm)) %>% 
  filter(!is.na(body_mass_g)) %>% 
  ggplot(aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point() +
  geom_path()

penguins %>% 
  filter(!is.na(flipper_length_mm)) %>% 
  filter(!is.na(body_mass_g)) %>% 
  ggplot(aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_density_2d()

big_penguins <- penguins %>% 
  filter(!is.na(flipper_length_mm)) %>% 
  filter(!is.na(body_mass_g)) %>% 
  ggplot(aes(x = body_mass_g, fill = species)) +
  geom_histogram()
  
#how to save a plot as object

big_penguins <- penguins %>% 
  filter(!is.na(flipper_length_mm)) %>% 
  filter(!is.na(body_mass_g)) %>% 
  ggplot(aes(x = body_mass_g, fill = species)) +
  geom_histogram()

big_penguins

#save graphs into csv

ggsave("filename.jpg",plot = big_penguins)

ggsave("file.name.jpg", plot = big_penguins, width = 6, height = 8,
       dpi = 300)


#load in data set, DatasaurusDozen.tsv

DatasaurusDozen <- read_tsv('Data/DatasaurusDozen.tsv')
head(DatasaurusDozen)
View(DatasaurusDozen)


# not tidyverse
read.delim()

#overview of data

summary(DatasaurusDozen)

DatasaurusDozen %>% 
  summary()

DatasaurusDozen %>% 
  group_by(dataset) %>% 
  summarise(mean = mean(x),
            sd = sd(x),
            max = max(x),
            min = min(x))

DatasaurusDozen %>% 
  ggplot(aes(x = x,
             fill = dataset)) +
  geom_density()

DatasaurusDozen %>% 
  ggplot(aes(x = x,
             y = y)) +
  geom_point() +
  facet_wrap(~ dataset)

# install package GGally to show all data

install.packages('GGally')
library(GGally)
ggpairs(penguins)

#download package'gapminder

install.packages(gapminder)

#install kagglehub
install.packages('kagglehub')



# Download latest version
path = kagglehub.dataset_download("crawford/80-cereals")
