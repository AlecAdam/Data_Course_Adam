
# I decided to redue exam 2. I fixed the erors given in the feednack.





## 1. Read in the unicef data (10 pts) 

library(easystats)
library(janitor)
library(tidyverse)

unicef <- read.csv("../../Exam_I/unicef-u5mr.csv")
View(unicef)

exam2data <- unicef
View(exam2data)
str(exam2data)
colnames(exam2data)


## 2. Get it into tidy format (10 pts) 
exam2data2 <- exam2data %>% 
  pivot_longer(starts_with('U5MR'),
               names_to = 'year',
               values_to = 'U5MR') %>% 
  mutate(year = str_remove(year, 'U5MR\\.')) %>% 
  clean_names() %>% 
  drop_na(u5mr)

view(exam2data2)

exam2data2.1 <- exam2data2 %>% 
  mutate(year = as.numeric(year)) %>% 
  mutate(continent = factor(continent))

View(exam2data2.1)


## 3. Plot each country’s U5MR over time (20 points)
plot_U5MRovertime <- exam2data2.1 %>% 
  ggplot(aes(x = year, y = u5mr,
             group = country_name)) +
  geom_line(color = 'black') +
  facet_wrap(~continent) +
  theme_minimal() + 
  labs(title = "Under-5 Mortality Rate (U5MR) Over Time",
       x = "Year",
       y = "U5MR",
       color = "Country")

print(plot_U5MRovertime)


## 4. Save this plot as LASTNAME_Plot_1.png (5 pts)
ggsave("Adam_Plot_1.png", plot = plot_U5MRovertime, width = 10, height = 8)


## 5. Create another plot that shows the mean U5MR for 
## all the countries within a given continent at each year (20 pts)

mean_U5MR_plot <- exam2data2.1 %>%
  group_by(continent, year) %>% 
  summarize(mean_u5mr = mean(u5mr, na.rm = TRUE)) %>%
  ggplot(aes(x = year, y = mean_u5mr, color = continent, group = continent)) +  # Line plot with color by continent
  geom_line(size = 1) +
  theme_minimal() + 
  labs(title = "Mean Under-5 Mortality Rate (U5MR) for Each Continent Over Time",
       x = "Year",
       y = "Mean U5MR",
       color = "Continent")

print(mean_U5MR_plot)


## 6. Save that plot as LASTNAME_Plot_2.png (5 pts) 
ggsave("Adam_Plot_2.png", plot = mean_U5MR_plot, width = 10, height = 8)


## 7. Create three models of U5MR (20 pts)
mod1 <- lm(u5mr ~ year, data = exam2data2.1)
summary(mod1)

mod2 <- lm(u5mr ~ year + continent, data = exam2data2.1)
summary(mod2)

mod3 <- lm(u5mr ~ year * continent, data = exam2data2.1)
summary(mod3)


## 8. Compare the three models with respect to their performance

model_comparison <- data.frame(
  Model = c("mod1", "mod2", "mod3"),
  R_squared = c(summary(mod1)$r.squared, summary(mod2)$r.squared, summary(mod3)$r.squared),
  Adjusted_R_squared = c(summary(mod1)$adj.r.squared, summary(mod2)$adj.r.squared, summary(mod3)$adj.r.squared),
  AIC = c(AIC(mod1), AIC(mod2), AIC(mod3)),
  BIC = c(BIC(mod1), BIC(mod2), BIC(mod3)))
print(model_comparison)

# The best model will be the one with the highest R squared value 
# and the lowest AIV BIC/ lowest of all the other values
# It looks like model 3 would be the best due to haveing the highest
# R squared and lowest everything else.

## 9. Plot the 3 models’ predictions like so: (10 pts)

years_all <- data.frame(year = unique(exam2data2.1$year))
continents_all <- unique(exam2data2.1$continent)

prediction_data <- expand.grid(year = years_all$year, continent = continents_all)

predictions_all <- data.frame(
  year = rep(prediction_data$year, 3),  
  continent = rep(prediction_data$continent, 3),  
  mod1_pred = predict(mod1, newdata = prediction_data),
  mod2_pred = predict(mod2, newdata = prediction_data),
  mod3_pred = predict(mod3, newdata = prediction_data))

predictions_long_all <- predictions_all %>%
  pivot_longer(cols = starts_with("mod"), 
               names_to = "model", 
               values_to = "predicted_u5mr")

ggplot(predictions_long_all, aes(x = year, y = predicted_u5mr, color = continent)) +
  geom_line(size = 1) +  
  facet_wrap(~model) +
  theme_minimal() + 
  labs(title = "Predicted U5MR Over Time by Model and Continent",
       x = "Year",
       y = "Predicted U5MR",
       color = "Continent") +
  scale_color_brewer(palette = "Set3") +
  theme(legend.position = "bottom") 



## 10. BONUS - Using your preferred model, predict what the U5MR 
## would be for Ecuador in the year 2020. The real value for Ecuador 
## for 2020 was 13 under-5 deaths per 1000 live births. How far off was 
## your model prediction???

new_data <- data.frame(
    year = 2020,              
    continent = "Americas")
  
predicted_u5mr <- predict(mod3, newdata = new_data)

real_u5mr <- 13


prediction_error <- abs(predicted_u5mr - real_u5mr)

cat("Predicted U5MR for Ecuador in 2020:", predicted_u5mr, "\n")
cat("Real U5MR for Ecuador in 2020:", real_u5mr, "\n")
cat("Prediction error:", prediction_error, "\n")

# my model was pretty far off by being -10.6

## 10 B. improved model

exam2data2.1 <- exam2data2.1 %>%
  mutate(log_u5mr = log(u5mr + 1))

mod_log <- lm(log_u5mr ~ year * continent, data = exam2data2.1)

summary(mod_log)

new_data_log <- data.frame(
  year = 2020,            
  continent = "Americas")

predicted_log_u5mr <- predict(mod_log, newdata = new_data_log)

predicted_u5mr_log <- exp(predicted_log_u5mr) - 1

real_u5mr <- 13 

prediction_error_log <- abs(predicted_u5mr_log - real_u5mr)

cat("Predicted U5MR for Ecuador in 2020 (log-transformed model):", predicted_u5mr_log, "\n")
cat("Real U5MR for Ecuador in 2020:", real_u5mr, "\n")
cat("Prediction error:", prediction_error_log, "\n") 
