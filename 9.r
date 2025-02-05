library(ggplot2)
library(gridExtra)

set.seed(123)
students <- data.frame(
  Name = paste("Student", 1:15),
  Scores = sample(60:100, 15, replace = TRUE),
  Attendance = sample(60:100, 15, replace = TRUE)
)

scatter_plot <- ggplot(students, aes(Scores, Attendance)) + geom_point(color = "red") + labs(title = "Scores vs Attendance")
bar_plot <- ggplot(students, aes(Name, Scores)) + geom_bar(stat = "identity", fill = "orange") + theme(axis.text.x = element_text(angle = 45, hjust = 1)) + labs(title = "Distribution of Scores")
students$Time <- 1:15
line_plot <- ggplot(students, aes(Time, Scores)) + geom_line(color = "purple") + labs(title = "Trend of Scores")
histogram_plot <- ggplot(students, aes(Scores)) + geom_histogram(binwidth = 10, color = "brown") + scale_fill_brewer(palette = "Set3") + labs(title = "Scores Distribution")

grid.arrange(scatter_plot, bar_plot, line_plot, histogram_plot, ncol = 2)
