### load up packages

library(tidyverse)
library(broom)

# 1. read in unicef data

unicef <- read_csv("unicef-u5mr.csv")

## 2. tidy up data

unicef_tidy <- unicef %>%
  pivot_longer(cols = starts_with("U5MR."),names_to = "Year",values_to = "U5MR") %>%
  mutate(Year = as.numeric(gsub("U5MR\\.", "", Year)))

head(unicef_tidy)

### 3. Plot each country's U5MR over time

plot1 <- ggplot(unicef_tidy,
  aes(x = Year,y = U5MR, group = CountryName)) +
  geom_line(na.rm = TRUE,alpha = 0.40) +
  facet_wrap(~Continent) +
  labs(title = "Under-5 Mortality Rate by Country",x = "Time",y = "U5MR") +
  theme_minimal()

print(plot1)

#### 4. save as as LASTNAME_Plot_1.png

ggsave("YORK_Plot_1.png",
  plot = plot1,width = 12,height = 8)

##### 5. create another plot for mean U5MR for all countries within given
# continent at each year

continent_means <- unicef_tidy %>%
  group_by(Continent, Year) %>%
  summarize(mean_U5MR = mean(U5MR, na.rm = TRUE),.groups = "drop")

plot2 <- ggplot(
  continent_means,
  aes(x = Year,y = mean_U5MR,color = Continent)) +
  geom_line(linewidth = 1.2) +
  labs(title = "Mean U5MR by Continent",x = "Year",y = "Mean U5MR") +
  theme_minimal()

print(plot2)

###### 6. save plot as LASTNAME_Plot_2.png

ggsave("YORK_Plot_2.png",
  plot = plot2,width = 10,height = 7)

####### 7. create three models f U5MR

model_data <- unicef_tidy %>%
  filter(!is.na(U5MR))


mod1 <- lm(U5MR ~ Year,data = model_data)

mod2 <- lm(U5MR ~ Year + Continent,data = model_data)

mod3 <- lm(U5MR ~ Year * Continent,data = model_data)

######## 8. Compare the three models w respect to their performance

comparison <- bind_rows(glance(mod1) %>% mutate(Model = "mod1"),
  glance(mod2) %>% mutate(Model = "mod2"),glance(mod3) %>% mutate(Model = "mod3")) %>%
  select(Model,r.squared,adj.r.squared,AIC,BIC)

comparison

anova(mod1, mod2, mod3)

# My COMMENT: Mod 3 is going to be the preffered model because it has
# the continent, year, and what is going on between the two.

######### 9. Plot the 3 models' predictions like so:

model_data$pred1 <- predict(mod1)

model_data$pred2 <- predict(mod2)

model_data$pred3 <- predict(mod3)

pred_long <- model_data %>%
  select(Year,Continent,pred1,pred2,pred3) %>%
  pivot_longer(cols = starts_with("pred"),names_to = "Model",values_to = "Prediction")

pred_plot <- ggplot(pred_long,
  aes(x = Year,y = Prediction,color = Model)) +
  geom_line(alpha = 0.7) +
  facet_wrap(~Continent) +
  theme_minimal()

print(pred_plot)

