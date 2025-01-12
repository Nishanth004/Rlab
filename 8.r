# Load required libraries
library(ggplot2)
#library(reshape2)

# Task 1: Create Matrices
matrix_A <- matrix(1:9, nrow = 3, byrow = TRUE)  # Matrix A (3x3)
matrix_B <- matrix(9:1, nrow = 3, byrow = TRUE)  # Matrix B (3x3)

# Task 2: Basic Matrix Operations
sum_matrix <- matrix_A + matrix_B  # Element-wise addition
scaled_matrix <- matrix_A * 2      # Scalar multiplication

# Task 3: Advanced Matrix Operations
transposed_A <- t(matrix_A)        # Transpose of Matrix A
product_matrix <- matrix_A %*% matrix_B  # Matrix multiplication

# Task 4: Matrix Statistics
sum_A <- sum(matrix_A)             # Sum of all elements in A
mean_B <- mean(matrix_B)           # Mean of all elements in B
sd_B <- sd(matrix_B)               # Standard deviation of elements in B

# Task 5: Visualization
# Heatmap of Matrix A
heatmap_data <- melt(matrix_A)
ggplot(heatmap_data, aes(x = Var2, y = Var1, fill = value)) +
  geom_tile() +
  scale_fill_gradient(low = "white", high = "blue") +
  labs(title = "Heatmap of Matrix A", x = "Column", y = "Row") +
  theme_minimal()

# Barplot of row sums in Matrix B
row_sums <- rowSums(matrix_B)  # Sums of rows in B
barplot_data <- data.frame(Row = paste("Row", 1:3), Sum = row_sums)
ggplot(barplot_data, aes(x = Row, y = Sum)) +
  geom_bar(stat = "identity", fill = "green") +
  labs(title = "Sums of Rows in Matrix B", x = "Row", y = "Sum") +
  theme_minimal()
