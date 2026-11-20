library(tidyverse)

#load the data

utah_raw = read.csv('./Utah_Religions_by_County.csv')

glimpse(utah_raw)
head(utah_raw)
names(utah_raw)

#clean up the data

utah_tidy <- utah_raw %>%
  pivot_longer(cols = -c(County,Pop_2010,Religious,Non.Religious),
    names_to = "Religion",values_to = "Proportion")

glimpse(utah_tidy)
head(utah_tidy)

###exploring data now :)

# population range in utah counties
utah_raw %>%
  summarize(smallest_population = min(Pop_2010),largest_population = max(Pop_2010),
    mean_population = mean(Pop_2010))

#average proportions
religion_summary <- utah_tidy %>%
  group_by(Religion) %>%
  summarize(Mean_Proportion = mean(Proportion, na.rm = TRUE),
    Median_Proportion = median(Proportion, na.rm = TRUE),
    Maximum_Proportion = max(Proportion, na.rm = TRUE),.groups = "drop") %>%
  arrange(desc(Mean_Proportion))


## populations per county
population_plot <- ggplot(utah_raw,aes(x = reorder(County, Pop_2010),
                                       y = Pop_2010)) +
  geom_col(fill = "tan") +
  coord_flip() +
  scale_y_continuous(labels = scales::comma) +
  labs(title = "Population of Utah Counties in 2010",
    x = "County",
    y = "Population") +
  theme_minimal()

print(population_plot)

## population average by religion

average_religion_plot <- ggplot(religion_summary,
  aes(x = reorder(Religion, Mean_Proportion), y = Mean_Proportion)) +
  geom_col(fill = "magenta") +
  coord_flip() +
  scale_y_continuous(
    labels = scales::percent) +
  labs(
    title = "Average Religious-Group Proportion Across Utah Counties",
    x = "Religious group", y = "Mean proportion") +
  theme_minimal()

print(average_religion_plot)

## religions by county

county_religion_plot <- ggplot(
  utah_tidy,
  aes(x = County,y = Proportion,fill = Religion)) +
  geom_col() +
  coord_flip() +
  scale_y_continuous(labels = scales::percent) +
  labs(title = "Religious-Group Proportions by Utah County",
    x = "County",y = "Proportion",fill = "Religion") +
  theme_minimal()

print(county_religion_plot)

## 1. Does population of a county correlate with the proportions
# of any specific religious group in that county?

# Calculate the Pearson correlation between population and the
# proportion of each religious group.

population_correlations <- utah_tidy %>%
  group_by(Religion) %>%
  summarize(Correlation = cor(Pop_2010,Proportion,use = "complete.obs"),
    .groups = "drop") %>%
  arrange(desc(abs(Correlation)))

population_correlations

## the positives mean that the religious group is at a higher proportion
# negatives show that the proportion is lower in the more populated counties

## graph that interprets this data - population and religion correlation
population_correlation_plot <- ggplot(population_correlations,
  aes(x = reorder(Religion, Correlation),y = Correlation,fill = Correlation > 0)) +
  geom_col() +
  coord_flip() +
  geom_hline(yintercept = 0,linetype = "dashed") +
  scale_fill_manual(values = c("TRUE" = "orange","FALSE" = "pink"),
    guide = "none") +
  labs(title = "Correlation Between County Population and Religion",
    subtitle = "Pearson correlation coefficients",
    x = "Religious group",
    y = "Correlation with population") +
  theme_minimal()

print(population_correlation_plot)


## 2. Does proportion of any specific religion in a given county correlate
# with the proportion of non-religious people?

nonreligious_correlations <- utah_tidy %>%
  group_by(Religion) %>%
  summarize(Correlation = cor(Non.Religious,Proportion,
      use = "complete.obs"),.groups = "drop") %>%
  arrange(desc(abs(Correlation)))

nonreligious_correlations

# the negative correlation means that the counties w a larger proportion
# of the religion is usually a smaller proportion of non religious residents.
# the positive correlation shows that both of the proportions are increasing
# together across the counties.

# correlation of non religious proportions

nonreligious_correlation_plot <- ggplot(
  nonreligious_correlations,
  aes(x = reorder(Religion, Correlation),y = Correlation,fill = Correlation > 0)) +
  geom_col() +
  coord_flip() +
  geom_hline(yintercept = 0,linetype = "dashed") +
  scale_fill_manual(
    values = c("TRUE" = "green","FALSE" = "purple"),
    guide = "none") +
  labs(
    title = "Religion and the Non-Religious Proportion",
    subtitle = "Pearson correlation coefficients across Utah counties",
    x = "Religious group",y = "Correlation with non-religious proportion") +
  theme_minimal()

print(nonreligious_correlation_plot)

##figures saved now

ggsave("population_by_county.png",
  plot = population_plot,width = 9,height = 7,dpi = 300)

ggsave("average_religion_proportions.png",
  plot = average_religion_plot,width = 9,height = 7,dpi = 300)

ggsave("population_correlations.png",
  plot = population_correlation_plot,width = 9,height = 7,dpi = 300)

ggsave("nonreligious_correlations.png",
  plot = nonreligious_correlation_plot,width = 9,height = 7,dpi = 300)

