library(tidyverse)

ggplot(Social_Media_Vs_Productivity, aes(x = daily_social_media_time, y = actual_productivity_score)) +
  geom_point(alpha = 0.6) +
  geom_smooth(method = "lm", color = "blue") +
  labs(title = "Social Media Time vs. Productivity",
       x = "Daily Social Media Time (hrs)",
       y = "Actual Productivity Score")
