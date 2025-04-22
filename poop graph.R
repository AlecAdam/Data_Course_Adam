 
library(ggplot2)

x <- c(-2, -1.5, -1, -0.5, 0, 0.5, 1, 1.5, 2, 
       -1.5, -1, -0.5, 0, 0.5, 1, 1.5,         
       -1, -0.5, 0, 0.5, 1,                    
       -0.5, 0, 0.5)                           

y <- c(0, 0.2, 0, 0.2, 0, 0.2, 0, 0.2, 0,      
       0.5, 0.7, 0.9, 1, 0.9, 0.7, 0.5,        
       1.3, 1.5, 1.7, 1.5, 1.3,                
       2, 2.2, 2)                              


poop_data <- data.frame(x, y)


ggplot(poop_data, aes(x, y)) +
  geom_point(color = "brown", shape = 111, size = 20) + 
  theme_minimal(base_size = 20) +  # Too large font
  theme(panel.background = element_rect(fill = "yellow"), 
        plot.background = element_rect(fill = "pink"),     
        axis.title.x = element_text(color = "blue", size = 18, face = "italic"),
        axis.title.y = element_text(color = "red", size = 18, face = "bold")) +
  labs(title = "oooooo smelly", x = "its probably too corny", y = "Do you want to hear a poop joke") +
  geom_text(aes(label = "💩"), size = 12, color = "orange", vjust = -2) 

ggsave("uglyplotALecAdam.jpg", width = 6, height = 6, dpi = 300)
