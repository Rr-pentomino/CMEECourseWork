# --- Import data ---
a <- read.table("../data/Results.txt", header = TRUE)

# --- Add a column of zeros for ymin ---
a$ymin <- rep(0, nrow(a))

# --- Create the plot object ---
p <- ggplot(a) +
  # First linerange (orange)
  geom_linerange(
    aes(x = x, ymin = ymin, ymax = y1),
    colour = "#E69F00",
    linewidth = 0.5,
    alpha = 0.5,
    show.legend = FALSE
  ) +
  # Second linerange (blue)
  geom_linerange(
    aes(x = x, ymin = ymin, ymax = y2),
    colour = "#56B4E9",
    linewidth = 0.5,
    alpha = 0.5,
    show.legend = FALSE
  ) +
  # Third linerange (red)
  geom_linerange(
    aes(x = x, ymin = ymin, ymax = y3),
    colour = "#D55E00",
    linewidth = 0.5,
    alpha = 0.5,
    show.legend = FALSE
  ) +
  # Add text labels below x-axis
  geom_text(aes(x = x, y = -500, label = Label), na.rm = TRUE) +
  # Customize axes and theme
  scale_x_continuous("My x axis", breaks = seq(3, 5, by = 0.05)) +
  scale_y_continuous("My y axis") +
  theme_bw() +
  theme(legend.position = "none")

# --- Save the plot as PDF ---
pdf("../Results/MyBars.pdf")
print(p)
dev.off()
