require(ggplot2)

# --- Create linear regression data ---
x <- seq(0, 100, by = 0.1)
y <- -4 + 0.25 * x + rnorm(length(x), mean = 0, sd = 2.5)

# --- Put them in a dataframe ---
my_data <- data.frame(x = x, y = y)

# --- Perform a linear regression ---
my_lm <- summary(lm(y ~ x, data = my_data))

# --- Build base plot ---
p <- ggplot(my_data, aes(x = x, y = y, colour = abs(my_lm$residual))) +
  geom_point() +
  scale_colour_gradient(low = "black", high = "red") +
  theme_bw() +
  theme(legend.position = "none") +
  # Add mathematical notation to x-axis
  scale_x_continuous(
    expression(alpha^2 * pi / beta * sqrt(Theta))
  )

# --- Add regression line ---
p <- p + geom_abline(
  intercept = my_lm$coefficients[1][1],
  slope = my_lm$coefficients[2][1],
  colour = "red",
  linewidth = 1
)

# --- Add mathematical text annotation on plot ---
p <- p + annotate(
  "text",
  x = 60, y = 0,
  label = "sqrt(alpha) * 2 * pi",
  parse = TRUE,
  size = 6,
  colour = "blue"
)

# --- Save the plot as PDF ---
pdf("../Results/MyLinReg.pdf")
print(p)
dev.off()
