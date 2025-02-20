set.seed(123)
x <- rnorm(100)
y <- rnorm(100)

#This is the actual mian plot code
plot(x, y,
     main = "River's Ugly Plot",
     xlab = "X-Axis", ylab = "Y-Axis",
     set.seed(123)
x <- rnorm(100)
y <- rnorm(100)

#This is the actual mian plot code
plot(x, y,
     main = "River's Ugly Plot",
     xlab = "X-Axis", ylab = "Y-Axis",
     
     pch = 20, col = sample(colors(), 100, replace = TRUE), # Random colors
     cex = runif(100, 1, 5), # Random point sizes
     bty = "o", # Border around the plot
     col.axis = "cyan", col.lab = "magenta", # Even worse colors for text
     xlim = c(-6, 6), ylim = c(-6, 6), # Wider limits for more mess
     xaxt = "n", yaxt = "n", # No axis ticks
     ann = TRUE)

abline(h = 0, v = 0, col = "salmon", lwd = 3)
text(0, 0, labels = "Not Too Bad Right?", col = "chartreuse", cex = 3)



# Add random gridlines with weird line widths and colors
grid(lwd = sample(1:10, 1), col = sample(colors(), 1), lty = sample(1:3, 1))

# Add random lines (ugly zigzag pattern)
for (i in 1:5) {
  lines(runif(100, -6, 6), runif(100, -6, 6), col = sample(colors(), 1), lwd = sample(1:5, 1))
}

# Add random text at random positions with chaotic sizes
for (i in 1:5) {
  text(runif(1, -6, 6), runif(1, -6, 6), labels = paste("IRIS", i), 
       col = sample(colors("pink"), 1), cex = runif(1, 2, 4), srt = sample(0:360, 1))
}

# Add random points (overlap madness)
points(runif(100, -6, 6), runif(100, -6, 6), pch = sample(1:25, 1), 
       col = sample(colors(), 100, replace = TRUE), cex = runif(100, 1, 5))

# Additional chaotic labels and lines
abline(h = 0, v = 0, col = "black", lwd = 3)
text(0, 0, labels = ":)", col = "brown", cex = 5)

# Add random dotted and dashed lines
for (i in 1:5) {
  abline(a = runif(1, -6, 6), b = runif(1, -6, 6), col = sample(colors(), 1), 
         lty = sample(c(2, 3), 1), lwd = sample(1:5, 1))
}



     pch = 20, col = sample(colors(), 100, replace = TRUE), # Random colors
     cex = runif(100, 1, 5), # Random point sizes
     bty = "o", # Border around the plot
     col.axis = "cyan", col.lab = "magenta", # Even worse colors for text
     xlim = c(-6, 6), ylim = c(-6, 6), # Wider limits for more mess
     xaxt = "n", yaxt = "n", # No axis ticks
     ann = TRUE)

abline(h = 0, v = 0, col = "salmon", lwd = 3)
text(0, 0, labels = "Not Too Bad Right?", col = "chartreuse", cex = 3)



# Add random gridlines with weird line widths and colors
grid(lwd = sample(1:10, 1), col = sample(colors(), 1), lty = sample(1:3, 1))

# Add random lines (ugly zigzag pattern)
for (i in 1:5) {
  lines(runif(100, -6, 6), runif(100, -6, 6), col = sample(colors(), 1), lwd = sample(1:5, 1))
}

# Add random text at random positions with chaotic sizes
for (i in 1:5) {
  text(runif(1, -6, 6), runif(1, -6, 6), labels = paste("IRIS", i), 
       col = sample(colors("pink"), 1), cex = runif(1, 2, 4), srt = sample(0:360, 1))
}

# Add random points (overlap madness)
points(runif(100, -6, 6), runif(100, -6, 6), pch = sample(1:25, 1), 
       col = sample(colors(), 100, replace = TRUE), cex = runif(100, 1, 5))

# Additional chaotic labels and lines
abline(h = 0, v = 0, col = "black", lwd = 3)
text(0, 0, labels = ":)", col = "brown", cex = 5)

# Add random dotted and dashed lines
for (i in 1:5) {
  abline(a = runif(1, -6, 6), b = runif(1, -6, 6), col = sample(colors(), 1), 
         lty = sample(c(2, 3), 1), lwd = sample(1:5, 1))
}


