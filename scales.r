library(ggplot2)
library(scales)

p1 <- ggplot(iris) + aes(x = Sepal.Width, y = Sepal.Length, color = Species) + geom_point()

p2 <- p1 + scale_x_continuous(labels = dollar) + scale_y_continuous(labels = comma)

p3 <- 