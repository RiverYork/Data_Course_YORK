## River York Exam 1, October 20th 2026
library(tidyverse)

### 1 Read the cleaned_covid_data.csv file into an R data frame. (20 pts)

covid_df <- read.csv("cleaned_covid_data.csv")

#### 2 Subset the data set to just show states that begin with "A" and save this
## as an object called A_states. (20 pts)

A_states <- covid_df[grep("^A", covid_df$Province_State),]

##### 3 Create a plot _of that subset_ showing Deaths over time, with a separate
## facet for each state. (20 pts)

ggplot(A_states, aes(x=Last_Update, y=Deaths, color=Province_State)) +
  geom_line() +
  geom_point() +
  facet_wrap(~ Province_State, scales= "free_y")+
  labs(title="Deaths Over Time by States Starting with A",x="Date",
       y="Number of Deaths")+
  theme_minimal()+
  theme(legend.position="none")

###### 4 Find the "peak" of Case_Fatality_Ratio for each state and save this
## as a new data frame object called state_max_fatality_rate. (20 pts)

CLEANING_df <- covid_df %>%
  filter(!is.na(Case_Fatality_Ratio))

state_max_fatality_rate <- CLEANING_df %>%
  group_by(Province_State) %>%
  summarise(Maximum_Fatality_Ratio = max(Case_Fatality_Ratio, na.rm = TRUE)) %>%
  arrange(desc(Maximum_Fatality_Ratio))

print(state_max_fatality_rate)

####### 5 Use that new data frame from task IV to create another plot. (20 pts)

state_max_fatality_rate$Province_State <- 
  factor(state_max_fatality_rate$Province_State,levels = 
  state_max_fatality_rate$Province_State
  [order(state_max_fatality_rate$Maximum_Fatality_Ratio,decreasing = TRUE)])

ggplot(state_max_fatality_rate, aes(x = Province_State, y = Maximum_Fatality_Ratio)) +
  geom_bar(stat = "identity", fill = "pink") + labs(title = "Maximum Fatality Ratio by State",
                                                    x = "State", 
                                                    y = "Maximum Case Fatality Ratio") +
  theme_minimal() +  theme(axis.text.x = element_text(angle = 90, hjust = 1))

######## 6 !!BONUS!! Using the FULL data set, plot cumulative deaths for the entire
## US over time

All_Deaths <- covid_df %>%
  group_by(Last_Update) %>%
  summarize(Total_Deaths = sum(Deaths, na.rm = T))

ggplot(All_Deaths, aes(x= Last_Update, y = Total_Deaths)) +
  geom_line() + 
  geom_point(color = "chartreuse") + 
  labs(title = "Cumulative Deaths over Time in the US",
                     x = "Date", y= "Cumulative Deaths") +
  theme_minimal()
