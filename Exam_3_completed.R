## 1. Load and clean FacultySalaries_1995.csv file and 
## Re-create the graph below…

library(tidyverse)
library(ggplot2)
library(janitor)
library(dplyr)
library(broom)

faculty_raw <- read_csv("Data/FacultySalaries_1995.csv")
View(faculty_raw)

faculty_raw <- faculty_raw %>% 
  clean_names()

faculty_long <- faculty_raw %>%
  pivot_longer(
    cols = starts_with("avg_"),      
    names_to  = "rank",
    values_to = "salary"
  )

View(faculty_long)

faculty_clean <- faculty_long %>%
  mutate(
    rank = case_when(
      rank == "avg_assist_prof_salary" ~ "Assist",
      rank == "avg_assoc_prof_salary"  ~ "Assoc",
      rank == "avg_full_prof_salary"   ~ "Full",
      TRUE                             ~ NA_character_
    )
  ) %>%
  
  drop_na(salary) %>%
  drop_na(rank) %>% 
  mutate(
    tier = factor(tier, levels = c("I", "IIA", "IIB")),
    rank = factor(rank, levels = c("Assist", "Assoc", "Full"))
  )

View(faculty_clean)

glimpse(faculty_clean)
head(faculty_clean)


faculty_plot <- faculty_clean %>%
  filter(tier %in% c("I", "IIA", "IIB")) %>%
  droplevels()

ggplot(faculty_plot, aes(x = rank, y = salary, fill = rank)) +
  geom_boxplot() +
  facet_wrap(~ tier, scales = "free_x") +
  scale_fill_manual(
    values = c(
      "Assist" = "#F8766D",
      "Assoc"  = "#00BA38",
      "Full"   = "#619CFF") ) +
  theme_minimal() +
  theme(
    axis.text.x      = element_text(angle = 45, hjust = 1),
    panel.grid.minor = element_blank(),
    legend.position  = "right") +
  labs(
    x    = "Rank",
    y    = "Salary",
    fill = "Rank")


## 2. Build an ANOVA model and display the summary output in your report.


faculty_plot <- faculty_clean %>%
  filter(tier %in% c("I", "IIA", "IIB")) %>%
  droplevels()

anova_model2 <- aov(salary ~ tier + rank + state, data = faculty_plot)
summary(anova_model2)


## 3. The rest of the test uses another data set. The “Juniper_Oils.csv” data.
##Get it loaded and take a look. Then tidy it! 
##(show the code used for tidying in your report)


juniper_raw <- read_csv("Data/Juniper_Oils.csv")
View(juniper_raw)

juniper <- juniper_raw %>% 
  clean_names()

View(juniper)


juniper <- juniper %>% 
  mutate(
    tracking_number = str_remove_all(tracking_number, "[#\\(\\)]"),
    tracking_id     = str_extract(tracking_number, "\\d+"),
    tracking_year   = parse_number(tracking_number)
  )

View(juniper)

juniper <- juniper %>% 
  mutate(
    sample_id       = as_factor(sample_id),
    project         = as_factor(project),
    amplicon        = as_factor(amplicon),
    tree_species    = as_factor(tree_species),
    burn_year       = as.integer(burn_year),
    field_office    = as_factor(field_office),
    blm_fire_name   = as_factor(blm_fire_name),
    latitude        = as.numeric(latitude),
    longitude       = as.numeric(longitude)
  )
View(juniper)

# 4. Pivot the chemical‑composition columns into long (tidy) form
#    All columns from alpha_pinene through thujopsenal become
#    a pair (compound, abundance)
juniper_tidy <- juniper %>% 
  pivot_longer(
    cols      = alpha_pinene:thujopsenal,
    names_to  = "compound",
    values_to = "abundance"
  ) %>%
  drop_na(abundance)

View(juniper_tidy)

glimpse(juniper_tidy)
head(juniper_tidy)

## 4. Make me a graph of the following:

ggplot(juniper_tidy, aes(x = years_since_burn, y = abundance)) +
  geom_smooth(method = "loess", se = TRUE) +
  facet_wrap(~ compound,
             scales = "free_y",
             ncol   = 5) +        
  labs(
    x = "Years Since Burn",
    y = "Concentration") +
  theme_minimal() +
  theme(
    panel.grid.minor = element_blank(),
    strip.text        = element_text(size = 9))

## 5. Use a generalized linear model to find which chemicals show 
##concentrations that are significantly (significant, as in P < 0.05) 
##affected by “Years Since Burn”.

colnames(juniper)

juniper_tidy2 <- juniper %>%
  pivot_longer(
    cols = c(alpha_pinene:thujopsenal), 
    names_to = "compound",
    values_to = "abundance" )
View(juniper_tidy2)

glm_results <- juniper_tidy2 %>%
  group_by(compound) %>%
  do(tidy(glm(abundance ~ years_since_burn, data = ., family = gaussian()))) %>%
  ungroup()

significant_chemicals <- glm_results %>%
  filter(term == "years_since_burn", p.value < 0.05)

significant_chemicals
