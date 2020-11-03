library(ggplot2)

p <- ggplot(iris, aes(x = Petal.Length, y = Petal.Width, colour = Species))

p <- p + geom_point() + geom_smooth() + facet_grid(~ Species)

p