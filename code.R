library(tidyverse)
library(ggthemes)

#-----------------------------------------------------
# theme : 디자인을 고쳐봅시다
#-----------------------------------------------------

base <- ggplot(mpg, aes(x = cty, y = hwy, color = factor(cyl))) +
  geom_jitter() +
  geom_abline(color = "grey70") +
  labs(title = "테마를 고쳐봅시다", 
       subtitle = "서브타이틀은 어떻게 고쳐질까요?", 
       caption = "출처 : 건국대학교")
base

test_theme <- theme(
    plot.title = element_text(family = "NanumGothic", 
                              face = "bold",
                              size = 15),
    plot.subtitle = element_text(family = "NanumGothic", 
                                 size = 8, 
                                 color = "grey50"),
    plot.caption = element_text(family = "NanumGothic", 
                                size = 8, 
                                color = "grey50"),
    legend.background = element_rect(fill = "white",
                                     size = 2, color = "white"),
    axis.ticks = element_line(color = "red", size = 0.7)
)


