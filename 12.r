library(readr)
library(dplyr)
library(ggplot2)

# Load Dataset
IPL_data <- read_csv("data.csv", show_col_types = FALSE)

# Data Overview
cat("Total matches:", nrow(IPL_data), "\n")
unique_teams <- unique(c(IPL_data$team1, IPL_data$team2))
cat("Unique teams:", length(unique_teams), "\n")

# Matches Won by Each Team
cat("Matches won by each team:\n")
print(table(IPL_data$winner))

# Venue Insights
most_freq_venue <- IPL_data %>%
  count(venue, sort = TRUE) %>%
  slice(1)
cat("Most frequent venue:", most_freq_venue$venue, "with", most_freq_venue$n, "matches\n")

# Visualization: Matches Won
matches_won <- table(IPL_data$winner)
barplot(matches_won, main = "Matches Won by Each Team", col = rainbow(length(matches_won)),
        xlab = "Teams", ylab = "Wins")
