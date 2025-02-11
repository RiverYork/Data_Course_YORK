library(tidyverse)
install.packages("ggplot2")
library(ggplot2)
install.packages("dplyr")
library(dplyr)

#1
df <- read.csv("cleaned_covid_data.csv")
head(df)
#2
subset_df <- df[grep("^A",df$Province_State),]
head(subset_df)
#3
subset_df$Date <- as.Date(subset_df$Date)
ggplot(subset_df, aes(x=Last_Update, y=Deaths, color=Province_State)) +
  geom_line() +
  geom_point() +
  facet_wrap(~ Province_State, scales= "free_y")+
  labs(title="Deaths Over Time by States Starting with A",x="Date",y="Number of Deaths")+
  theme_minimal()+
  theme(legend.position="none")

#4
df_clean <- df %>%
  filter(!is.na(Case_Fatality_Ratio))

state_max_fatality_rate <- df_clean %>%
  group_by(Province_State) %>%
  summarise(Maximum_Fatality_Ratio = max(Case_Fatality_Ratio, na.rm = TRUE)) %>%
  arrange(desc(Maximum_Fatality_Ratio))

print(state_max_fatality_rate)
#5
state_max_fatality_rate$Province_State <- 
  factor(state_max_fatality_rate$Province_State,levels = state_max_fatality_rate$Province_State[order(state_max_fatality_rate$Maximum_Fatality_Ratio, 
                                                                                                      decreasing = TRUE)])

ggplot(state_max_fatality_rate, aes(x = Province_State, y = Maximum_Fatality_Ratio)) +
  geom_bar(stat = "identity", fill = "pink") + labs(title = "Maximum Fatality Ratio by State",
                                                         x = "State", 
                                                         y = "Maximum Case Fatality Ratio") +
  theme_minimal() +  theme(axis.text.x = element_text(angle = 90, hjust = 1))





