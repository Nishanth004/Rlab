# Load required library
library(forecast)

# Create a data frame with Month and Sales
sales_data <- data.frame(
  Month = seq(as.Date("2023-01-01"), as.Date("2023-06-01"), by = "months"),
  Sales = c(12000, 15000, 18000, 16000, 20000, 22000)
)

# Convert sales data into a time series object with monthly frequency
sales_ts <- ts(sales_data$Sales, frequency = 12, start = c(2023, 1))  
print(sales_ts)  # Print time series data

# Fit ARIMA model automatically
arima_model <- auto.arima(sales_ts)

# Forecast sales for the next 3 months
forecast_result <- forecast(arima_model, h = 3)

# Display forecast results
print(forecast_result)

# Plot the forecast results
plot(forecast_result)
