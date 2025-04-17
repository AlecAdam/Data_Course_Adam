# Load required packages
library(tidyverse)
library(caret)
library(broom)
library(knitr)
library(pROC)
library(ggplot2)
library(modelr)
library(easystats)
library(GGally)

## read in data set
Grad <- read.csv("../../Data/GradSchool_Admissions.csv")
View(Grad)
data <- Grad
View(data)

str(data)
summary(data)

data$rank <- as.factor(data$rank)


## plots

plot_multiple <- data %>% 
  select(admit,gre,gpa,rank) %>% 
  ggpairs()
plot_multiple

table(data$admit)

plot_adm <- ggplot(data, aes(x = factor(admit), fill = factor(admit))) +
  geom_bar() +
  labs(title = "Admission Counts")
plot_adm

plot_gpa <- ggplot(data, aes(x = gre, fill = factor(admit))) +
  geom_histogram(bins = 30, alpha = 0.7, position = 'identity') +
  labs(title = "GRE Scores by Admission")
plot_gpa

ggplot(data, aes(x = gpa, fill = factor(admit))) +
  geom_histogram(bins = 30, alpha = 0.7, position = 'identity') +
  labs(title = "GPA by Admission")

ggplot(data, aes(x = rank, fill = factor(admit))) +
  geom_bar(position = "fill") +
  labs(title = "Admission Rate by Rank (Proportional)", y = "Proportion")

## model



model_full <- glm(admit ~ gre + gpa + rank, data = data, family = "binomial")

summary(model_full)
tidy(model_full)


## model evaluation

set.seed(123)
train_index <- createDataPartition(data$admit, p = 0.8, list = FALSE)
train_data <- data[train_index, ]
test_data <- data[-train_index, ]


model_train <- glm(admit ~ gre + gpa + rank, data = train_data, family = "binomial")


pred_probs <- predict(model_train, test_data, type = "response")
pred_class <- ifelse(pred_probs > 0.5, 1, 0)


conf_matrix <- confusionMatrix(factor(pred_class), factor(test_data$admit))
conf_matrix


roc_curve <- roc(test_data$admit, pred_probs)
plot(roc_curve, main = "ROC Curve")
auc(roc_curve)



model_gre_gpa <- glm(admit ~ gre + gpa, data = train_data, family = "binomial")


AIC(model_train, model_gre_gpa)


data %>% 
  gather_predictions(model_full) %>% 
  ggplot(aes(x= gre,gpa,color=model)) +
  geom_segment(aes(x=0,y=0,xend=6000,yend=6000),linetype=2, color="black",alpha=.5) +
  geom_smooth(method = "lm",se=FALSE) +
  facet_wrap(~admit) +
  theme_minimal() +
  scale_color_viridis_d() +
  labs(title = "Predictions vs observations",
       subtitle = "dashed line indicates perfect overlap 
       between observed values and model predictions")

