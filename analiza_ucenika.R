# Load data from CSV file
mydata <- read.csv("number1.csv", header = TRUE)

# Assign first and second column to x and y
x <- mydata[,1]  # real years
y <- mydata[,2]  # number of high school students

# Fit linear model
linear_model <- lm(y ~ x, data = mydata)


# Predict future values from 2023 to 2030
future_years <- data.frame(x = 2023:2030)
predicted_values <- predict(linear_model, newdata = future_years)

# Plot original data and regression line
plot(x, y,
     col = 'blue', pch = 16,
     main = "Trend of High School Student Numbers in Serbia",
     xlab = "Year", ylab = "Number of Students",
     xlim = c(2010, 2030),
     ylim = c(min(y, predicted_values), max(y)))


# Save plot to PNG file
png("student_trend_serbia.png", width = 800, height = 600)

# Plotting block
plot(x, y,
     col = 'blue', pch = 16,
     main = "Trend of High School Student Numbers in Serbia",
     xlab = "Year", ylab = "Number of Students",
     xlim = c(2010, 2030),
     ylim = c(min(y, predicted_values), max(y)))
abline(linear_model, col = 'red', lwd = 2)
points(future_years$x, predicted_values, col = 'darkgreen', pch = 17)
lines(future_years$x, predicted_values, col = 'darkgreen', lty = 2)
legend("topright",
       legend = c("Observed", "Linear Model", "Prediction (2023–2030)"),
       col = c("blue", "red", "darkgreen"),
       pch = c(16, NA, 17),
       lty = c(NA, 1, 2),
       bty = "n")

# Close the PNG device
dev.off()



# Add regression line
abline(linear_model, col = 'red', lwd = 2)

# Add predicted points and line
points(future_years$x, predicted_values, col = 'darkgreen', pch = 17)
lines(future_years$x, predicted_values, col = 'darkgreen', lty = 2)

# Add legend
legend("topright",
       legend = c("Observed", "Linear Model", "Prediction (2023–2030)"),
       col = c("blue", "red", "darkgreen"),
       pch = c(16, NA, 17),
       lty = c(NA, 1, 2),
       bty = "n")



