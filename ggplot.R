library(ggplot2)

p <- ggplot(iris, aes(x = Petal.Length, y = Petal.Width, colour = Species))

p <- p + geom_point() + geom_smooth() + facet_grid(~ Species)

p

################################### ggplot con base de datos de desaparecidos

library(tidyverse)
library(ggplot2)
library(treemap)

str(data)

tmp <- data %>% 
  filter(year == 2011) %>%
  group_by(inegi, nom_ent, nom_mun) %>%
  summarise(total = sum(total)) %>%
  arrange(inegi) %>%
  ungroup()

gr <- ggplot(tmp, aes(x=inegi, y=total)) + geom_point()
gr