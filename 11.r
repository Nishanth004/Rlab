library(readr)
library(dplyr)
library(ggplot2)

# Load and Rename Columns
purchase_data <- read_csv("customer_purchases.csv", show_col_types = FALSE) %>%
  rename(CustomerID = Customer_ID, PurchaseAmount = Purchase_Amount)

# Summary Statistics
cat("Total records:", nrow(purchase_data), "\n")
cat("Unique customers:", n_distinct(purchase_data$CustomerID), "\n")
cat("Mean:", mean(purchase_data$PurchaseAmount), "\n",
    "Median:", median(purchase_data$PurchaseAmount), "\n",
    "Std Dev:", sd(purchase_data$PurchaseAmount), "\n")

# Add Segmentation
purchase_data <- purchase_data %>%
  mutate(Segment = ifelse(PurchaseAmount < median(PurchaseAmount), "Low Spender", "High Spender"))
print(head(purchase_data))

# Histogram
ggplot(purchase_data, aes(x = PurchaseAmount)) +
  geom_histogram(binwidth = 10, fill = "blue", color = "black") +
  labs(title = "Distribution of Purchase Amounts", x = "Purchase Amount", y = "Frequency")
