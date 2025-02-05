library(ggplot2)
library(reshape2)

matrix_A <- matrix(1:9, 3, 3, byrow = TRUE)
matrix_B <- matrix(9:1, 3, 3, byrow = TRUE)

sum_matrix <- matrix_A + matrix_B
scaled_matrix <- matrix_A * 2
transposed_A <- t(matrix_A)
product_matrix <- matrix_A %*% matrix_B

sum_matrix_A <- sum(matrix_A)
mean_matrix_B <- mean(matrix_B)
sd_matrix_B <- sd(matrix_B)

heatmap_plot <- ggplot(melt(matrix_A), aes(Var1, Var2, fill = value)) + 
  geom_tile() + scale_fill_gradient(low = "yellow", high = "red") + 
  labs(title = "Heatmap of Matrix A", x = "Column", y = "Row")

barplot_data <- data.frame(Row = paste("Row", 1:3), Sum = rowSums(matrix_B))
barplot_plot <- ggplot(barplot_data, aes(Row, Sum)) + 
  geom_bar(stat = "identity", fill = "blue") + 
  labs(title = "Sums of Rows in Matrix B", x = "Row", y = "Sum")

print(heatmap_plot)
print(barplot_plot)
