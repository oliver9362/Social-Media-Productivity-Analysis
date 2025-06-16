library(tidyverse)

# Reshape data to long format
long_data <- Social_Media_Vs_Productivity %>%
  select(actual_productivity_score, daily_social_media_time, number_of_notifications, screen_time_before_sleep) %>%
  pivot_longer(
    cols = -actual_productivity_score,
    names_to = "digital_habit",
    values_to = "habit_value"
  )

# Plot
ggplot(long_data, aes(x = habit_value, y = actual_productivity_score)) +
  geom_point(alpha = 0.3, color = "steelblue") +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  facet_wrap(~ digital_habit, scales = "free_x") +
  labs(
    title = "Relationship Between Digital Habits and Productivity",
    x = "Digital Habit Value",
    y = "Productivity Score"
  ) +
  theme_minimal()
