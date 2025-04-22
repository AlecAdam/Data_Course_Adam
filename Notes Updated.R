# submit homework
git .
git commit -m 'assign'
git push

#### all packages ####
library(ggplot2)
library(tidyverse)
library(tidyr)
library(leaflet)
library(ggmap)
library(GGally)
library(gapminder)
library(patchwork)
library(gganimate)
library(ggimage)
library(readxl)
library(easystats)
library(janitor)
library(skimr)
library(measurements)
library(MASS)
library(caret)
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

#clean environment ####
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

#save graphs into csv####

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

#week 6

penguins %>% 
  filter(!is.na(bill_depth_mm),!is.na(body_mass_g), !is.na(sex)) %>% 
  ggplot(aes(x =bill_depth_mm, y = body_mass_g,
             color = sex)) +
  geom_point(size = 3, alpha = 0.5) +
  facet_wrap(~species) +
  labs(x = 'Bill depth (mm)',
      y = 'Body mass (g)',
      color = 'sex') +
  theme_bw() +
  theme(axis.title = element_text(face = 'bold', size = 14),
        strip.background = element_blank(),
        strip.text = element_text(face = 'bold', size = 14),
  F_color_viridis_d(end = .08)

  
# take a look at gapminder data, make graph, save to local

View(gapminder)
dim(gapminder)

gapminder$year %>% unique()

gap <- gapminder

gap %>% 
  ggplot(aes(x = pop, y = continent)) +
  geom_boxplot()

gap %>% 
  ggplot(aes(x = pop, y = continent)) +
  geom_dotplot()

p1 <- gap %>% 
  ggplot(aes (x = year,
         y = lifeExp,
         color = continent)) +
  geom_point(aes(size = pop)) +
  facet_wrap(~ continent)
p1

#save graph####
ggsave('gap_graph.png', plot = p1)

p2 <- p1 + theme()
p3 <- p2 + theme_dark()

p1 + p2
p1 / p3
(p1 + p2) / p3 + plot_annotation('Main title')

c1 <- ggplot(mtcars, aes(wt, mpg)) + geom_point() + ggtitle('plot 1')
c2 <- ggplot(mtcars, aes(disp, mpg)) + geom_point() + ggtitle('plot 1')
c3 <- ggplot(mtcars, aes(cyl, mpg)) + geom_point() + ggtitle('plot 1')

(c1 + c2) / c3 +
  plot_annotation(
    title = 'main title',
    tag_levels = 'A')

p3 + transition_time(time = year)

p5 <- p1 +p2
p5/p3
(p1 + p2) / p3 + plot_annotation('Main title') +
  
#gg animate####

View(gapminder)

df <- gapminder

p3 <- df %>%
  ggplot(aes(x = gdpPercap,
             y = lifeExp,
             color = continent)) +
  geom_point()
p3

p3 + transition_time(time = year) +
  labs(title = 'year:{frame}')

#make graph and animate it ####

p4 <- df %>% 
  ggplot(aes(x = lifeExp,
             y = pop,
             color = continent)) +
  geom_point()
p4

# how to save graph with animation
anim_save('p4.gif')


df$country %>% unique()


my_country <- c("China", "Malasia", "Singapore","Japan", "Nepal",
                "Iceland", "Uganda", "Cote d'Ivoire", "Rwanda")
df %>% 
  mutate(my_country = case_when(country %in% my_country ~ country)) %>% 
  view()

df2 <- df %>% 
  mutate(my_country = case_when(country %in% my_country ~ country)) %>% 
  view()


p5 <- df %>% 
  mutate(my_country = case_when(country %in% my_country ~ country)) %>% 
  ggplot(aes(x = gdpPercap, y = lifeExp,
             color = continent)) +
  geom_point() +
  geom_text(aes(label = my_country))
p5

p5 + transition_time(time = year) +
  labs(title = 'year:{frame_time}')


#data cleaning####
install ggmap
install.packages("ggmap")
ggmap::register_google(key = "<your-api-key>", write = TRUE)


## https://www.appsilon.com/post/r-ggmap
# plot the map
ggmap(nyc_map)

geocode("800 W Univeristy parkway, Orem, UT 84058")


# read this data and plot rent for each state 
# ugly data to clean ####

df <- read.csv('data/wide_income_rent.csv')
view(df)

# step by step to clean data

dat.ex <- data.frame(
  ID = c(1,2,3),
  Weight = c(78, 88, 100),
  Height = c(167, 180, 155))
dat.ex

dat.ex %>% 
  pivot_longer(cols = c(Weight, Height),
                names_to = 'Measure',
                values_to = 'value') %>% 
                view()

dat.ex %>% 
  pivot_longer(cols = Height,
               names_to = 'Height',
               values_to = 'cm') %>% 
  view()


dat_long <- dat.ex %>% 
  pivot_longer(cols = everything(),
               names_to = 'measure',
               values_to = 'value') %>% 
  view()

View(dat_long)

dat_long %>% 
  pivot_wider(names_from = 'measure',
              values_from = 'value')
  View(dat_long)

# Week 7
install leaflet and ggmap

geocode('lisbon')

leaflet() %>% 
  addTiles() %>% 
  addMarkers(lng = -9.14, lat = 38.7)


df <- read_csv('Data/wide_income_rent.csv')
View(df)
# read data and plot rent for each state
# make it a good format for plotting
#hint pivot_longer , pivot_wider
# x-axis = state, y-axis = rent, bar chart

df <- read_csv('Data/wide_income_rent.csv')
View(df)

df %>% 
  pivot_longer(cols = -variable,
    names_to = 'state',
               values_to ='value') %>% 
  pivot_wider(names_from ='variable' ,
              values_from ='value') %>% 
  View()

df %>% 
  pivot_longer(cols = -variable,
               names_to = 'state',
               values_to ='value') %>% 
  pivot_wider(names_from ='variable' ,
              values_from ='value') %>%
  ggplot(aes(x = rent, y = income)) +
  geom_point() +
  geom_text(aes(label = state))

Datab <- table2

Datab %>% 
  pivot_wider(names_from ='type',
              values_from ='count') %>% 
  view()

table3
Data3 <- table3

Data3 %>% 
  separate(rate, c('col1','col2'))

table1

table4a
table4b

data4a <- table4a
data4a %>% 
  pivot_longer()



## make table4a and table4b tide (like table1)

table1
table4a
table4b



#table 4a to 1
table1
table4a

data1 <- table1
data4a <- table4a

data4a %>% 
  pivot_longer( cols = -country,
                names_to = 'year',
                values_to = 'cases')
#table 4b to look like 1
data4b <- table4b

data4b %>% 
  pivot_longer(cols = -country,
               names_to = 'year',
               values_to = 'cases')

# combine 4a and 4b
table4_tidy <- full_join(data4a,data4b)


# fix table 5 combine, seperate, delete columns
table5
data5 <- table5

data5 %>% 
  paste0(data5$century, data5$year)
  paste0(data5$year, data5$country)
  paste0(data5$year, data5$century, 'i')
  paste0(data5$year, data5$century, 'i' sep = '')  

data5 %>% 
  separate(rate, c('cases', 'population')) %>% 
   mutate(year = paste0(data5$century, data5$year)) %>% 
   select(-century) %>%
   View()

table_5fixed <- data5 %>% 
  separate(rate, c('cases', 'population'), convert = T) %>% 
  mutate(year = paste0(data5$century, data5$year)) %>% 
  select(-century)
table_5fixed  

## enter data to excel or google sheet
## path ..//Exercises/Data_Entry_Case_Study.txt
getwd()

text <- read.delim('Exercises/Data_Entry_Case_Study.txt')
#excel notes
Data validation allows you to select a column and only allow  
what you want to be entered

## read in excel = .xlsx
library(readxl)
# Skip funciton skips the rows in excel

dat <- read_xlsx('Data/messy_bp.xlsx', skip = 3)
View(dat)

# Week 8

# remove a column this removed heart rate
bp <- dat %>% 
  select(-starts_with('HR'))

# create a column
bp %>%
  pivot_longer(starts_with('BP'),  #select what you want
               names_to = 'visit',  #change name
               values_to = 'bp') %>% # puts data in new column
  View()



bp <- bp %>%
  pivot_longer(starts_with('BP'),  #select what you want
               names_to = 'visit',  #change name
               values_to = 'bp') %>% 
  mutate(visit = case_when(visit == 'BP...8'~ 1,
         visit == 'BP...10'~ 2,
         visit == 'BP...12'~ 3)) %>% 
  separate(bp, into = c('systolic', 'diatolic'))
View(bp)



bp %>%
  pivot_longer(starts_with('BP'),  #select what you want
               names_to = 'visit',  #change name
               values_to = 'bp') %>% 
  mutate(visit = case_when(visit == 'BP...8'~ 1,
         visit == 'BP...10'~ 2,
         visit == 'BP...12'~ 3)) %>% 
  separate(bp, into = c('systolic', 'diatolic')) %>% 
  View()



hr <- dat %>% 
  select(- starts_with('BP'))
View(hr)

hr <- hr %>%
  pivot_longer(starts_with('HR'),  #select what you want
               names_to = 'visit',  #change name
               values_to = 'hr') %>% 
  mutate(visit = case_when(visit == 'HR...9'~ 1,
                           visit == 'HR...11'~ 2,
                           visit == 'HR...13'~ 3))
  View(hr)
  
dat_join <- full_join(bp, hr)
View(dat_join)


head(dat_join)
colnames(dat_join)

dat_join$
  
library(janitor)
clean_names()
make_clean_names()


make_clean_names('# of bacteria')
make_clean_names('# of growth')
make_clean_names(c(# of bacteria, '# of growth'))
  
)
  

dat <- read_xlsx('Data/messy_bp.xlsx', skip = 3)
View(dat)

bp <- dat %>% 
  select(-starts_with('HR'))

bp %>%
  pivot_longer(starts_with('BP'),  #select what you want
               names_to = 'visit',  #change name
               values_to = 'bp') %>% 
  View()



dat <- read_xlsx('Data/messy_bp.xlsx', skip = 3)
View(dat)

for (i in 2:nrow(dat)) {
  if(dat$pat_id[i] == dat$pat_id[i-1]) {
    dat$pat_id[i] <- dat$pat_id[i] +1 
}}

duplicated()
id <- c(1, 2, 3, 4, 4, 5)

dat %>% 
  mutate(id_fix = pat_id + cumsum(duplicated(pat_id))) %>% 
  view()

dat %>% 
  arrange(`Year birth`) %>% 
  View()

pat_id <- c(1, 2, 3, 4, 4, 5)

dat %>% 
  clean_names() %>% 
  arrange(`Year birth`) %>% 
  
)

dat_join$race %>% unique()
  
  
dat_join %>% 
  mutate(Race = case_when(Race == 'caucasian' ~ 'White',
                          Race == 'WHITE' ~ 'White,
                          true ~ Race')) %>% View()
dat_join %>% 
  mutate(Race = case_when(Race == 'caucasian' | ~ 'White',
                          Race == 'WHITE' ~ 'White,
                          true ~ Race')) %>% View()

| # or
 # and

dat_join %>% 
  mutate(Race_new_3 = case_when(race == 'Asian'))

# to see structure of data
str()

# back to numeric

df <- dat_join %>% 
  mutate(Race = case_when(Race == 'caucasian' | ~ 'White',
                          Race == 'WHITE' ~ 'White,
                          true ~ Race'))
df$systolic <- as.numeric(systolic)

df <- dat_join %>% 
  mutate(Race = case_when(Race == 'caucasian' | ~ 'White',
                          Race == 'WHITE' ~ 'White,
                          true ~ Race')) %>% 
  mutate(systolic = as.numeric(systolic),
         diastolic = as.numeric(diastolic)) %>%
  view()

dat_join %>% 
  mutate(Race = case_when(Race == 'caucasian' | ~ 'White',
                          Race == 'WHITE' ~ 'White,
                          true ~ Race')) %>% 
  mutate(systolic = as.numeric(systolic),
         diastolic = as.numeric(diastolic)) %>%
  mutate(birthday = paste(year_birth, month_birth, day_birth, sep = '-')) %>%
  select(-year_birth, -month_birth, -day_birth) %>% 
  View()

mm/d/y


#delete columns
use select(-)

#make graph to show blood pressure changes throughout visit

df_2 <- dat_join %>% 
  ggplot(aes( x = visit, y = )) %>% 
  geom_point() %>% 
  view()

df_2 %>% 
  pivot_longer(cols = c('systolic', 'diastolic'),
               names_to = 'bp_type,' values_to = 'bp')
View(df_2)

df_3 <- df_2 %>% 
  pivot_longer(cols = c('systolic', 'diastolic'),
               names_to = 'bp_type,' values_to = 'bp')
df_3 %>% 
  ggplot(aes(x = visit, y = bp, color = bp_type)) +
  geom_path() +
  facet_wrap(~bp_type) +
  facet_grid(hispanic ~ race)




## new data set

Bird <- read.csv('Data/Bird_Measurements.csv')
View(Bird)
dim(Bird)

# give overview show what percent of data is imputed
library(skimr)

skim(Bird)
?skim

# week 9

# read Height.xlsx file and make it tidy

library(readxl)
library(measurements)
height <- read_xlsx('Data/height.xlsx')
View(height)

height1 <- height
View(height1)

height1 %>% 
  pivot_longer(everything(),
               names_to = 'sex',
               values_to = 'height') %>% 
  separate(height, into = c('feet', 'inches'), convert = T) %>% 
  mutate(inches_all = (feet*12) + inches)
  mutate(cm = conv_unit(inches_all, from = 'inch', to = 'cm'))
View(height1)

height1 %>% 
  ggplot(aes(x = cm, fill = sex)) +
  geom_density()


#statistical test

t.test(cm ~ sex, data = height1) # campare means
cor.test() # correlation
glm()

mod <- glm(data = dat_2,
           formula = cm ~ sex)
# left side is dependent right is predictor
car_insurance_price = age + gender + education + .....

#lm = linear model must be continuous data
#glm = better one
#t/f = true or false 

# build a model to predict city (mpg in city) as a function of displ
#(total volume oc cylander)

View(mpg)
cars <- mpg

cars %>% 
  ggplot(aes(x = displ, y = cty)) +
  geom_point()

mod <- glm(data = mpg,
           formula = cty ~ displ)
summary(mod)

cty = 25.0015 + (-2.63)*displ

cars %>% 
  ggplot(aes(x = displ, y = cty)) +
  geom_point() + 
  geom_smooth(method = 'glm', se = F)

str(mod)
mod$model
mod$formula
mod$coefficients
mod$fitted.values

library(easystats)
report(mod)
performance(mod)
# lower AIC better and closer value to 1 R2 is better


# to check if assumptions are right
check_model(mod)


mod <- glm(data = mpg,
           formula = cty ~ displ)
names(mpg)

mod2 <- glm(data = mpg,
           formula = cty ~ displ + year)
summary(mod2)

mod3 <- glm(data = mpg,
            formula = cty ~ displ + manufacturer)
summary(mod3)

mod4 <- glm(data = mpg,
            formula = cty ~ displ + manufacturer + displ + model + trans
            + cyl + hwy + fl + drv + class )

mod1 <- glm(data = mpg,
           formula = cty ~ displ)
summary(mod1)

mod2 <- glm(data = mpg,
           formula = cty ~ displ + cyl)
summary(mod2)

mod3 <- glm(data = mpg,
           formula = cty ~ displ * cyl)
summary(mod3)


mpg %>% 
  ggplot(aes(x = displ, y = cty, color = factor(cyl))) +
  geom_smooth(method = 'glm')


compare_models(mod1, mod2, mod3)
compare_performance(mod1, mod2, mod3)
compare_performance(mod1, mod2, mod3) %>% plot()
# want bigger r2 and smaller everything else

# predict function

predict(mod1, mpg)
mod1$formula

plot(mod1$fitted.values, predict(mod1, mpg))


mpgg<-pred1 <- predict(mod2, mpg)
mpgg<-pred2 <- predict(mod2, mpg)
mpgg<-pred3 <- predict(mod3, mpg)

mgpp %>% 
  ggplot(aes(x = cty, y = pred1)) +
  geom_point()

mgpp %>% 
  pivot_longer(starts_with('pred')) %>% 
  ggplot(aes(x = displ, y = cty, color = factor(cyl))) +
  geom_point() +
  geom_point(aes(y = value), color = 'black') +
  facet_wrap(~ name)

# make your model 4 and compare with all other models and make prediction

mod5 <- glm(data = mpg,
            formula =  ~ )


## does body weight vary significantly between penguins species
library(palmerpenguins)
peng <- penguins
View(peng)

glm(data = peng,
    formula = body_mass_g ~ species)

pengfat <- glm(data = peng,
    formula = body_mass_g ~ species)
summary(pengfat)

peng$species <- relevel(peng$species, ref = 'Gentoo')
peng$species <- factor(peng$species, levels = c('Gentoo', 'Chinstrap',
                                                'Adelie'))
summary(peng)

names(peng)

#create a new column with T/F

peng1 <- peng %>% 
  mutate(gentoo = case_when(species == 'Gentoo'~ TRUE,
                            TRUE ~ FALSE))
View(peng1)

glm(data = peng1,
    formula = gentoo ~ bill_length_mm + bill_depth_mm + flipper_length_mm + 
      body_mass_g,
    family = 'binomial')


peng1 <- peng %>% 
  mutate(gentoo = case_when(species == 'Gentoo'~ TRUE,
                            TRUE ~ FALSE)) %>% 
  glm(data = .,
    formula = gentoo ~ bill_length_mm + bill_depth_mm + flipper_length_mm + 
      body_mass_g,
    family = 'binomial')
View(peng1)


mod <- glm(data = peng1,
    formula = gentoo ~ bill_length_mm + bill_depth_mm + flipper_length_mm + 
      body_mass_g,
    family = 'binomial')

predict(mod, peng, type = 'response')

peng$pred <- predict(mod, peng, type = 'response')

peng %>% 
  ggplot(aes(x = body_mass_g, y = pred, color = species)) +
  geom_point()

pred <- peng %>%
  mutate(outcome = case_when(pred < 0.01 ~ 'Not gentoo',
                             pred > 0.75 ~ 'Gentoo')) %>% 
  select(species, outcome) %>% 
  mutate(accurate = case_when(species == 'Gentoo' & outcome == 'Gentoo' ~ TRUE,
                              species != 'Gentoo' & outcome == 'Not Gentoo' ~ TRUE,
                              TRUE ~ FALSE))

pred %>% 
  pluck('accurate') %>% 
  sum()/nrow(pred)



## Data/Gradschool_Admission.csv
## build logical regression model and predict the admission of grad school

admissions <- read.csv('Data/GradSchool_Admissions.csv')
View(admissions)

adm <- admissions
View(adm)

mod3 <- glm(data = adm,
            formula = as.logical(admit ) ~ (gre + gpa) * rank,
            family = 'binomial')

cyl*displ = cyl + displ + cyl:displ

as.logical(adm$admit)
interaction(gre:rank, gpa:rank)
names(adm)

mod3

adm$predict_mod3 <- predict(mod3, adm, type = 'response')

compare_performance(mod1, mod2) %>% plot()

gpa*rank = gpa + rank + gpa:rank

dat %>% 
  mutate(outcome = case_when(pred_1 > 0.4 ~ 'Admit',
                             pred_1 >= 0.2 & pred_1 <= 0.4 ~ 'I dont know'
                             pred-1 < O.2 ~ 'Not Admit')) %>% 
  mutate(accurate = case_when(admit == 1 & outcome == 'Admit' ~ TRUE,
                              admit == 0 & outcome == ' Not Admit' ~ TRUE,
                              TRUE ~ FALSE)) %>% 
  pluck('accurate') %>% 
  sum()/nrow(dat)

sum(pred$accurate)
nrow()

## Automatically chose best model

library(MASS)

full_model <- glm(data = dat,
                  formula = as.logical(admit) ~
                    gre*gpa*rank,
                  family = 'binomial')
full_model$formula
summary(full_model)

stepwise_mod <- stepAIC(full_model, direction = 'both')
summary(stepwise_mod)

stepwise$mod$formula

best_model <- glm(data = dat,
                  )
compare_performance(mod1,mod2,best_model) %>% plot()

dat$pred_2 <- predict(best_model, dat, type = 'response')

pluck('accurate_2') %>% 
  sum()/nrow(dat)


## seperate data

library(caret)

createDataPartition()
id <- createDataPartition(dat$admit, p = 0.8, list = F)
dat_train <- dat[id, ]
dim(dat_train)
dim(dat)

dat_test <- dat[-id,n]

train_mod <- glm(data = dat,
                 formula = stepwise_mod$formula,
                 family = 'binomial')
dat_test$pred <- predict(train_mod, dat_test, type = 'response')
View(dat_test)


## anova for each specfic variable 

library(palmerpenguins)

mod <- aov(data = penguins,
           formula = body_mass_g ~ species + sex + year)
summary(mod)

mod_glm <- glm(data = penguins,
           formula = body_mass_g ~ species)
summary(mod_glm)


# CREATE r markdown
#makes html file for final project










