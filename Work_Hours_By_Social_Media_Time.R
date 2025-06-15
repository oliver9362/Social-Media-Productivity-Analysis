library(tidyverse)

Social_Media_Vs_Productivity <- Social_Media_Vs_Productivity %>%
  mutate(
    daily_social_media_time = as.numeric(daily_social_media_time),
    social_media_range = case_when(
      daily_social_media_time < 1 ~ "<1 hr",
      daily_social_media_time < 2 ~ "1-2 hrs",
      daily_social_media_time < 3 ~ "2-3 hrs",
      daily_social_media_time < 4 ~ "3-4 hrs",
      TRUE ~ "4+ hrs"
    ),
    social_media_range = factor(social_media_range, levels = c("<1 hr", "1-2 hrs", "2-3 hrs", "3-4 hrs", "4+ hrs"))
  )

social_media_vs_work <- Social_Media_Vs_Productivity %>%
  group_by(social_media_range) %>%
  summarise(
    avg_work_hours = mean(work_hours_per_day, na.rm = TRUE),
    count = n()
  ) %>%
  ungroup()

ggplot(social_media_vs_work, aes(x = social_media_range, y = avg_work_hours, fill = social_media_range)) +
  geom_col() +
  scale_fill_manual(values = c(
    "<1 hr" = "#1b9e77",
    "1-2 hrs" = "#d95f02",
    "2-3 hrs" = "#7570b3",
    "3-4 hrs" = "#e7298a",
    "4+ hrs" = "#66a61e"
  )) +
  labs(title = "Average Work Hours by Social Media Time",
       x = "Social Media Use",
       y = "Average Work Hours") +
  theme_minimal() +
  theme(legend.position = "none")
