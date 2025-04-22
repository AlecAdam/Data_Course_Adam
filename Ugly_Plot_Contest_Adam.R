View(cereal)
 good_soup <- cereal
View(good_soup)
 
 good_soup %>% 
   ggplot(aes(x = calories, y = name)) +
 geom_point()
 rasterImage(img, xleft = 0, ybottom = 0, xright = 1, ytop = 1) 
 
 library(png)
library(jpeg)

 img <- readJPEG("cerealmeme2.jpg")
 plot(good_soup_plot,1, type = "n", xlab = "", ylab = "", xlim = c(0, 1), ylim = c(0, 1))
 rasterImage(img, xleft = 0, ybottom = 0, xright = 1, ytop = 1)

good_soup_plot <- good_soup %>% 
  ggplot(aes(x = calories, y = name)) +
  geom_point() +
  
  good_soup_plot



set.seed(42)
x <- rnorm(50)
y <- rnorm(50)

par(bg = "yellow") # Change background color to something obnoxious
plot(
  x, y, 
  col = "limegreen", # Clashing color
  pch = 8, # Asterisk symbols
  cex = 3, # Too large points
  main = "Ugly Plot",
  xlab = "X-axis (Why so bright?)",
  ylab = "Y-axis (Too big text)",
  col.main = "red", # Bad color choice
  col.lab = "blue", # Another bad color
  font.main = 3, # Italicized title
  font.lab = 4  # Weird italic labels
)
grid(col = "purple", lwd = 3, lty = 3)
ext(0, 0, "Why does this exist?", col = "orange", cex = 2, font = 4)
abline(h = seq(-2, 2, by = 0.5), col = "pink", lwd = 2, lty = 2)
abline(v = seq(-2, 2, by = 0.5), col = "cyan", lwd = 2, lty = 2)



x <- c(-2, -1.5, -1, -0.5, 0, 0.5, 1, 1.5, 2,  # Bottom
       -1.5, -1, -0.5, 0, 0.5, 1, 1.5,         # Middle
       -1, -0.5, 0, 0.5, 1,                    # Top
       -0.5, 0, 0.5)                           # Tip

y <- c(0, 0.2, 0, 0.2, 0, 0.2, 0, 0.2, 0,      # Bottom
       0.5, 0.7, 0.9, 1, 0.9, 0.7, 0.5,        # Middle
       1.3, 1.5, 1.7, 1.5, 1.3,                # Top
       2, 2.2, 2) 

poop_data <- data.frame(x, y)

ggplot(poop_data, aes(x, y)) +
  geom_point(color = "brown", shape = 8, size = 10) +  # Bad symbol and huge size
  theme_minimal(base_size = 20) +  # Too large font
  theme(panel.background = element_rect(fill = "yellow"),  # Bad background color
        plot.background = element_rect(fill = "pink"),     # Worse plot background
        axis.title.x = element_text(color = "blue", size = 18, face = "italic"),
        axis.title.y = element_text(color = "red", size = 18, face = "bold")) +
  labs(title = "Poop Emoji Plot (Why?)", x = "Ugly X", y = "Disastrous Y") +
  geom_text(aes(label = "💩"), size = 12, color = "orange", vjust = -2) # Extra unnecessary text