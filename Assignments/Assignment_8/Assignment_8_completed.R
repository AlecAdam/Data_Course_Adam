Make a new Rproj and Rscript in your personal Assignment_8 directory and work from there.
Write a script that:
  
library(modelr)
library(easystats)
library(broom)
library(tidyverse)
library(fitdistrplus)  
library(ggplot2)
library(skimr)
library(Metrics)
library(MASS)

##loads the “/Data/mushroom_growth.csv” data set

Mush <- read.csv("../../Data/mushroom_growth.csv")

View(Mush)
##creates several plots exploring relationships between the response and predictors
Plot1 <- Mush %>% 
  ggplot(aes( x = Light, y = GrowthRate)) +
  geom_point() +
  geom_smooth() +
  facet_wrap(~Species)

Plot1

Plot2 <- Mush %>% 
  ggplot(aes( x = Nitrogen, y = GrowthRate)) +
  geom_point() +
  geom_smooth() +
  facet_wrap(~Species)

Plot2

Plot3 <- Mush %>% 
  ggplot(aes( x = Humidity, y = GrowthRate)) +
  geom_point() +
  geom_smooth() +
  facet_wrap(~Species)

Plot3


Plot4 <- Mush %>% 
  ggplot(aes( x = Temperature, y = GrowthRate)) +
  geom_point() +
  geom_smooth() +
  facet_wrap(~Species)

Plot4

##defines at least 4 models that explain the dependent variable “GrowthRate”

mod1 <- glm(data = Mush,
            formula = GrowthRate ~ Light)
summary(mod1)

mod2 <- glm(data = Mush,
            formula = GrowthRate ~ Light + Nitrogen)
summary(mod2)

mod3 <- glm(data = Mush,
            formula = GrowthRate ~ Light + Nitrogen + Humidity)
summary(mod3)

mod4 <- glm(data = Mush,
            formula = GrowthRate ~ Light + Nitrogen + Humidity + Temperature)
summary(mod4)

##calculates the mean sq. error of each model


y_true <- Mush$GrowthRate

pred1 <- predict(mod1, newdata = Mush)
pred2 <- predict(mod2, newdata = Mush)
pred3 <- predict(mod3, newdata = Mush)
pred4 <- predict(mod4, newdata = Mush)


mse1 <- mse(y_true, pred1)
mse2 <- mse(y_true, pred2)
mse3 <- mse(y_true, pred3)
mse4 <- mse(y_true, pred4)


cat("MSE for mod1:", mse1, "\n")
cat("MSE for mod2:", mse2, "\n")
cat("MSE for mod3:", mse3, "\n")
cat("MSE for mod4:", mse4, "\n")



##selects the best model you tried

aic1 <- AIC(mod1)
aic2 <- AIC(mod2)
aic3 <- AIC(mod3)
aic4 <- AIC(mod4)


adj_r2_1 <- summary(mod1)$adj.r.squared
adj_r2_2 <- summary(mod2)$adj.r.squared
adj_r2_3 <- summary(mod3)$adj.r.squared
adj_r2_4 <- summary(mod4)$adj.r.squared


rsq <- function(model, actual) {
  pred <- predict(model, newdata = Mush)
  ss_res <- sum((actual - pred)^2)
  ss_tot <- sum((actual - mean(actual))^2)
  return(1 - ss_res / ss_tot)
}

r2_1 <- rsq(mod1, y_true)
r2_2 <- rsq(mod2, y_true)
r2_3 <- rsq(mod3, y_true)
r2_4 <- rsq(mod4, y_true)


model_comparison <- data.frame(
  Model = c("mod1", "mod2", "mod3", "mod4"),
  MSE = c(mse1, mse2, mse3, mse4),
  AIC = c(aic1, aic2, aic3, aic4),
  R_squared = c(r2_1, r2_2, r2_3, r2_4)
)

print(model_comparison)

#best model is 4

##adds predictions based on new hypothetical values 
##for the independent variables used in your model

str(Mush)

Mush$Humidity <- as.factor(Mush$Humidity)

mod1 <- glm(data = Mush, formula = GrowthRate ~ Light)
mod2 <- glm(data = Mush, formula = GrowthRate ~ Light + Nitrogen)
mod3 <- glm(data = Mush, formula = GrowthRate ~ Light + Nitrogen + Humidity)
mod4 <- glm(data = Mush, formula = GrowthRate ~ Light + Nitrogen + Humidity + Temperature)


levels(Mush$Humidity)

new_data <- data.frame(
  Light = c(50, 70),
  Nitrogen = c(5, 7),
  Humidity = factor(c("High", "Low"), levels = levels(Mush$Humidity)), 
  Temperature = c(20, 25)
)

new_data_mod1 <- new_data[, c("Light"), drop = FALSE]
new_data_mod2 <- new_data[, c("Light", "Nitrogen"), drop = FALSE]
new_data_mod3 <- new_data[, c("Light", "Nitrogen", "Humidity"), drop = FALSE]
new_data_mod4 <- new_data


pred_mod1 <- predict(mod1, newdata = new_data_mod1)
pred_mod2 <- predict(mod2, newdata = new_data_mod2)
pred_mod3 <- predict(mod3, newdata = new_data_mod3)
pred_mod4 <- predict(mod4, newdata = new_data_mod4)

predictions <- cbind(
  new_data,
  Pred_mod1 = pred_mod1,
  Pred_mod2 = pred_mod2,
  Pred_mod3 = pred_mod3,
  Pred_mod4 = pred_mod4
)

print(predictions)

####plots these predictions alongside the real data

Mush$Pred_mod1 <- predict(mod1)
Mush$Pred_mod2 <- predict(mod2)
Mush$Pred_mod3 <- predict(mod3)
Mush$Pred_mod4 <- predict(mod4)

ggplot(Mush, aes(x = Light, y = GrowthRate)) +
  geom_point(color = "black", alpha = 0.6, size = 2) +  # actual data
  geom_line(aes(y = Pred_mod1), color = "blue", size = 1, linetype = "dashed") +
  geom_line(aes(y = Pred_mod2), color = "green", size = 1, linetype = "dashed") +
  geom_line(aes(y = Pred_mod3), color = "purple", size = 1, linetype = "dashed") +
  geom_line(aes(y = Pred_mod4), color = "red", size = 1.2) +
  labs(
    title = "Actual vs Predicted GrowthRate",
    x = "Light",
    y = "Growth Rate",
    caption = "Red = mod4 (full model), Blue = mod1, Green = mod2, Purple = mod3"
  ) +
  theme_minimal()

ggplot(Mush, aes(x = Nitrogen, y = GrowthRate)) +
  geom_point(color = "black", alpha = 0.6, size = 2) +  # actual data
  geom_line(aes(y = Pred_mod1), color = "blue", size = 1, linetype = "dashed") +
  geom_line(aes(y = Pred_mod2), color = "green", size = 1, linetype = "dashed") +
  geom_line(aes(y = Pred_mod3), color = "purple", size = 1, linetype = "dashed") +
  geom_line(aes(y = Pred_mod4), color = "red", size = 1.2) +
  labs(
    title = "Actual vs Predicted GrowthRate",
    x = "Nitrogen",
    y = "Growth Rate",
    caption = "Red = mod4 (full model), Blue = mod1, Green = mod2, Purple = mod3"
  ) +
  theme_minimal()


ggplot(Mush, aes(x = Humidity, y = GrowthRate)) +
  geom_point(color = "black", alpha = 0.6, size = 2) +  # actual data
  geom_line(aes(y = Pred_mod1), color = "blue", size = 1, linetype = "dashed") +
  geom_line(aes(y = Pred_mod2), color = "green", size = 1, linetype = "dashed") +
  geom_line(aes(y = Pred_mod3), color = "purple", size = 1, linetype = "dashed") +
  geom_line(aes(y = Pred_mod4), color = "red", size = 1.2) +
  labs(
    title = "Actual vs Predicted GrowthRate",
    x = "Humidity",
    y = "Growth Rate",
    caption = "Red = mod4 (full model), Blue = mod1, Green = mod2, Purple = mod3"
  ) +
  theme_minimal()


ggplot(Mush, aes(x = Temperature, y = GrowthRate)) +
  geom_point(color = "black", alpha = 0.6, size = 2) +  # actual data
  geom_line(aes(y = Pred_mod1), color = "blue", size = 1, linetype = "dashed") +
  geom_line(aes(y = Pred_mod2), color = "green", size = 1, linetype = "dashed") +
  geom_line(aes(y = Pred_mod3), color = "purple", size = 1, linetype = "dashed") +
  geom_line(aes(y = Pred_mod4), color = "red", size = 1.2) +
  labs(
    title = "Actual vs Predicted GrowthRate",
    x = "Temperature",
    y = "Growth Rate",
    caption = "Red = mod4 (full model), Blue = mod1, Green = mod2, Purple = mod3"
  ) +
  theme_minimal()

##Upload responses to the following as a numbered plaintext document to Canvas:
##Are any of your predicted response values 
#from your best model scientifically meaningless? Explain.

summary(Mush$GrowthRate)

# I dont think the data is scientifically meaningless. When looking
#at the summary the data all falls within the min and max.
#if the data was outside of it then i would think it is meaningless.


##In your plots, did you find any non-linear relationships? 
#Do a bit of research online and give a link 

https://stats.stackexchange.com/questions/595101/methods-for-measuring-non-linear-correlation
# I did find non linear reltionships in my plots. You can identify this
#by ploting the data and seeing if there are any straight lines. If 
#there are straight lines this means the data is non linear.


##Write the code you would use to model the data found 
#in “/Data/non_linear_relationship.csv” with a linear model 
(there are a few ways of doing this)

non <- read.csv("../../Data/non_linear_relationship.csv")
View(non)

mod5 <- glm(data = non,
            formula = response ~ predictor)
summary(mod5)



