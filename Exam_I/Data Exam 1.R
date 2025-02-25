#I. Read the cleaned_covid_data.csv file into an R data frame. (20 pts)

cleaned_covid_data <- read.csv('cleaned_covid_data.csv')

View(cleaned_covid_data)

Covid <- cleaned_covid_data
View (Covid)


#II. Subset the data set to just show states that begin with “A” and save this as an object called A_states. (20 pts)
Use the tidyverse suite of packages
Selecting rows where the state starts with “A” is tricky (you can use the grepl() function or just a vector of those states if you prefer)

A_states <- Covid %>%
  filter(grepl("^A",Province_State ))

View(A_states)


#III. Create a plot of that subset showing Deaths over time, with a separate facet for each state. (20 pts)
Create a scatterplot
Add loess curves WITHOUT standard error shading
Keep scales “free” in each facet

A_states %>% 
  ggplot(aes(x = Last_Update, y = Deaths)) +
  geom_point( size = .5) +
  facet_wrap(~ Province_State, scales = "free") +
  geom_smooth(method = "loess", se = FALSE) +
  labs( x = 'Over time',
        y = 'deaths')


#IV. (Back to the full dataset) Find the “peak” of Case_Fatality_Ratio for each state and save this as a new data frame object called state_max_fatality_rate. (20 pts)
I’m looking for a new data frame with 2 columns:
   “Province_State”
“Maximum_Fatality_Ratio”
Arrange the new data frame in descending order by Maximum_Fatality_Ratio take a few steps. Be careful about how you deal with missing values!

state_max_fatality_rate. <- Covid
  
state_max_fatality_rate. <- Covid %>%
  group_by(Province_State) %>%
  summarize(
    Maximum_Fatality_Ratio = max(Case_Fatality_Ratio, na.rm = TRUE)
  ) %>%
  arrange(desc(Maximum_Fatality_Ratio))
  
View(state_max_fatality_rate.)


V. Use that new data frame from task IV to create another plot. (20 pts)
X-axis is Province_State
Y-axis is Maximum_Fatality_Ratio
bar plot
x-axis arranged in descending order, just like the data frame (make it a factor to accomplish this)
X-axis labels turned to 90 deg to be readable
Even with this partial data set (not current), you should be able to see that (within these dates), different states had very different fatality ratios.

  
state_max_fatality_rate.$Province_State <- factor(
    state_max_fatality_rate.$Province_State, 
    levels = state_max_fatality_rate.$Province_State)
  
state_max_fatality_rate. %>% 
ggplot(aes(x = Province_State, y = Maximum_Fatality_Ratio)) +
  geom_bar(stat = "identity",) +
  theme(
    axis.text.x = element_text(angle = 90)) +
  labs(
    title = "Peak Case Fatality Ratio by State",
    x = "State",
    y = "Maximum Fatality Ratio")


VI. (BONUS 10 pts) Using the FULL data set, plot cumulative deaths for the entire US over time

You’ll need to read ahead a bit and use the dplyr package functions group_by() and summarize() to accomplish this.

install.packages("dplyr")

Cumulative_deaths <- Covid %>%
  group_by(Last_Update) %>%
  summarize(CumulativeD = sum(Deaths, na.rm = TRUE))

Cumulative_deaths %>% 
  ggplot(aes(x = Last_Update, y = CumulativeD)) +
  geom_point(size= .5) +
  labs(
    title = "Covid Deaths in the US Over Time",
    x = "Over time",
    y = "Deaths")



