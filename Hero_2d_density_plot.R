# Packages
library(tidyverse)
library(RColorBrewer)


#204051 darkest


#cae8d5 lightest 1
#84a9ac 2
#3b6978 3
#204051 darkest 4

# color scheme
#1 #f1f3f4
#2 #79bac1
#3 #2a7886
#4 #512b58


# Create data


# create coordinate vectors for background 
x_all <- c()
y_all <- c()

# fill the background with data points
for (i in 1:10){
  mean <- rnorm(mean = 3, 1, sd = 0.1)
  x <- rnorm(mean = (5+3*i), 115, sd = 1)
  y <- rnorm(mean = mean, 115, sd = 1)
  
  x_all <- c(x_all, x)
  y_all <- c(y_all, y)
}

# create extra patches to add flair
x1 <- rnorm(mean = 12, 80, sd = 1)
y1 <- rnorm(mean = 5, 80, sd = 1)

x2 <- rnorm(mean = 19, 40, sd = 1)
y2 <- rnorm(mean = 4, 40, sd = 1)

x3 <- rnorm(mean = 32, 50, sd = 1)
y3 <- rnorm(mean = 2, 50, sd = 1)

x4 <- rnorm(mean = 22, 50, sd = 1)
y4 <- rnorm(mean = 2, 50, sd = 1)

x5 <- rnorm(mean = 27, 80, sd = 1)
y5 <- rnorm(mean = 4, 80, sd = 1)

x6 <- rnorm(mean = 3, 45, sd = 1)
y6 <- rnorm(mean = 1, 45, sd = 1)

x7 <- rnorm(mean = 42, 80, sd = 1)
y7 <- rnorm(mean = 2, 80, sd = 1)

x8 <- rnorm(mean = 47, 80, sd = 1)
y8 <- rnorm(mean = 5, 80, sd = 1)

values <- tibble(x = c(x_all, x1, x2, x3, x4, x5, x6, x7, x8),
                 y = c(y_all, y1, y2, y3, y4, y5, y6, y7, y8))

low <- "#79bac1"
high <- "#204051"

# Show the density plot only
ggplot(values, aes(x = x, y = y)) +
  stat_density_2d(aes(fill = after_stat(level)), geom = "polygon", bins = 8) +
  scale_fill_gradient(low = low, high = high) +
  scale_x_continuous(limit = c(0, 55), expand = c(0, 0)) +
  scale_y_continuous(limit = c(0, 8), expand = c(0, 0)) +
  theme_bw() +
  theme(legend.position = "none",
        panel.background = element_rect("white"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank()
        )
        
# Show the grid and axis only
ggplot(values, aes(x = x + 50, y = y + 50)) +
  stat_density_2d(aes(fill = after_stat(level)), geom = "polygon", bins = 8) +
  scale_fill_gradient(low = low, high = high) +
  scale_x_continuous(
    limit = c(0, 12),
    expand = c(0, 0),
    breaks = seq(0, 12, length.out = 7)
  ) +
  scale_y_continuous(
    limit = c(0, 8),
    expand = c(0, 0),
    breaks = seq(0, 8, length.out = 5)
  ) +
  theme_bw() +
  theme(
    legend.position = "none",
    panel.background = element_rect(color = "#f1f3f4", fill = "#f1f3f4"),
    plot.background = element_rect(color = "#f1f3f4", fill = "#f1f3f4"),
    panel.grid.major = element_line(size = 0.2, color = "#204051"),
    panel.grid.minor = element_line(size = 0.05, color = "black"),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    axis.ticks.x.bottom = element_line(size = 0.2, color = "#204051"),
    axis.ticks.y.left = element_line(size = 0.2, color = "#204051"),
    axis.text.x =  element_text(face = "plain", size = 8, color = "#204051"),
    axis.text.y = element_text(face = "plain", size =8, color = "#204051"),
    panel.border = element_rect(size = 0.6, color = "#204051"),
    panel.ontop = TRUE
  )


# Using raster
ggplot(data, aes(x=x, y=y) ) +
  stat_density_2d(aes(fill = ..density..), geom = "raster", contour = FALSE) +
  scale_x_continuous(expand = c(0, 0)) +
  scale_y_continuous(expand = c(0, 0)) +
  theme(
    legend.position='none'
  )

#annotate(
#"text",
#label = "Alec Sharp",
#x = 25,
#y = 3,
#size = 8,
#colour = "#f1f3f4",
#family = "serif",
#fontface = "bold"
#) +