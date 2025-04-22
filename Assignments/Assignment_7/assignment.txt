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
library(janitor)
library(skimr)
library(measurements)
library(easystats)

Religion <- read.csv('Utah_Religions_by_County.csv')
reli <- Religion
View(Religion)
View(reli)


df <- read_csv("Utah_Religions_by_County.csv")


df_tidy <- df %>%
  pivot_longer(
    cols = -c(County, Pop_2010),
    names_to = "Religion",      
    values_to = "Proportion"     
  )
View(df_tidy)



Explore the cleaned data set with a series of figures (I want to see you exploring the data set)

df %>%
  select(County, Religious, Non_Religious = `Non-Religious`) %>%
  pivot_longer(cols = -County, names_to = "Category", values_to = "Proportion") %>%
  ggplot(aes(x = Category, y = Proportion, fill = Category)) +
  geom_bar(stat = "summary", fun = "sum") +
  theme_minimal() +
  labs(title = "Total Proportion of Religious vs. Non-Religious Population in Utah Counties",
       y = "Total Proportion") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


df_tidy %>%
  group_by(Religion) %>%
  summarize(Average_Proportion = mean(Proportion, na.rm = TRUE)) %>%
  arrange(desc(Average_Proportion)) %>%
  slice_head(n = 10) %>%
  ggplot(aes(x = reorder(Religion, Average_Proportion), y = Average_Proportion, fill = Religion)) +
  geom_col() +
  coord_flip() +
  theme_minimal() +
  labs(title = "Top 10 Religions in Utah by Average Proportion",
       x = "Religion", y = "Average Proportion")


df_tidy %>%
  ggplot(aes(x = Religion, y = County, fill = Proportion)) +
  geom_tile() +
  scale_fill_viridis_c() +
  theme_minimal() +
  labs(title = "Religious Diversity Across Utah Counties",
       x = "Religion", y = "County")

df_tidy %>%
  ggplot(aes(x = Religion, y = Proportion, fill = Religion)) +
  geom_boxplot() +
  coord_flip() +
  theme_minimal() +
  labs(title = "Distribution of Religious Proportions Across Counties",
       x = "Religion", y = "Proportion")


Address the questions:
  
“Does population of a county correlate with the proportion of any specific religious group in that county?”
“Does proportion of any specific religion in a given county correlate with the proportion of non-religious people?”
Just stick to figures and maybe correlation indices…no need for statistical tests yet

Add comment lines that show your thought processes _____________
# for the first question I do not beleieve the population of a country 
#correlates to a specfic religion. I dont see how simply going off a number
# of the size of country influences relgion. Instead its what kids are taught
#at a young age.
#Im not sure I fully understand what question number 2 is asking.
#I do think a specifc religion would correlate with non religous beacause
#as more people join a religion there would be less religous people
#vice versa