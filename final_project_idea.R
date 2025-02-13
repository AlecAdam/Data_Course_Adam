read_csv(cereal.csv)
Cereal <- read_csv(file = 'cereal.csv')
View(Cereal)


Cereal %>% 
  ggplot(aes(x = name, y = calories)) +
  geom_bar(stat = 'identity')

