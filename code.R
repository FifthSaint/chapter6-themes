library(tidyverse)
library(ggthemes)

#-----------------------------------------------------
# ggtheme으로 다양하게 변경해보자
#-----------------------------------------------------
df_sample <- data.frame(
  x = 1:3, 
  y = 1:3)

# 기본 차트 저장
sample <- ggplot(df_sample, aes(x, y)) + geom_point(size = 4, color = "red")

# theme_bw(), theme_grey() 등 다양한 스타일의 themes
c1 <- sample + theme_bw() + labs(title = "theme_bw()")
c2 <- sample + theme_grey() + labs(title = "theme_grey()")
c3 <- sample + theme_gdocs() + labs(title = "theme_gdocs()")
c4 <- sample + theme_minimal() + labs(title = "theme_minimal()")
c5 <- sample + theme_economist() + labs(title = "theme_economist()")
c6 <- sample + theme_wsj() + labs(title = "theme_wsj()")

gridExtra::grid.arrange(c1, c2, c3, c4, c5, c6, ncol = 3)


#-----------------------------------------------------
# Theme Elements를 알아보자
#-----------------------------------------------------

## Plot 요소
sample + theme(plot.background = element_rect(color = "black", size = 3))
sample + theme(
  plot.background = element_rect(color = "red", size = 2),
  plot.margin = margin(2, 2, 2, 2)
)
sample + theme(
  plot.background = element_rect(fill = "pink")
)

## Axis(축) 요소
sample + theme(axis.line = element_line(color = "red", size = 2))
sample + theme(axis.text = element_text(color = "blue", size = 15))
sample + theme(axis.text.x = element_text(color = "blue", size = 15,
                                          angle = -90))

## Legend(범례) 요소
df_sample2 <- data.frame(
  x = 1:10, y = 1:10, z = rep(c("category_A", "category_B"), each = 5)
)

sample2 <- ggplot(df_sample2, aes(x, y, color = z)) + geom_point()
sample2

sample2 + theme(
  legend.background = element_rect(
    fill = "#FDAC44",
    color = "#7F44F7", size = 1
  ))

sample2 + theme(
  legend.key = element_rect(color = "#1CB2A6", size = 3),
  legend.key.width = unit(0.9, "cm"),
  legend.key.height = unit(2, "cm")
)

sample2 + theme(
  legend.text = element_text(family = "Arial", size = 15, color = "red"),
  legend.title = element_text(family = "NanumGothic", size = 20, color = "blue")
)

## panel(좌표계 범위) 요소
sample + theme(panel.background = element_rect(fill = "#FDAC44"))
sample + theme(
  panel.grid.major = element_line(color = "#1CB2A6", size = 1),
  panel.grid.minor = element_line(color = "#7F44F7", size = 1, linetype = "dashed")
)

sample + theme(aspect.ratio = 9 / 16)
sample + theme(aspect.ratio = 3 / 4)

#-----------------------------------------------------
# ggthemes가 아닌 원하는 스타일로 고쳐보자
#-----------------------------------------------------

# 한글 안되는 이슈가 발생한 기본 스타일 차트
base <- ggplot(mpg, aes(x = cty, y = hwy, color = factor(cyl))) +
  geom_jitter() +
  geom_abline(color = "grey70") +
  labs(title = "테마를 고쳐봅시다", 
       subtitle = "서브타이틀은 어떻게 고쳐질까요?", 
       caption = "출처 : 건국대학교")

# 몇 가지 테마요소를 추가해보자
test_theme <- theme(
    plot.title = element_text(family = "NanumGothic", 
                              face = "bold",
                              size = 15, 
                              color = "#7F44F7"),
    plot.subtitle = element_text(family = "NanumGothic", 
                                 size = 8, 
                                 color = "grey50"),
    plot.caption = element_text(family = "NanumGothic", 
                                size = 8, 
                                color = "grey50"),
    legend.background = element_rect(fill = "white",
                                     size = 2, color = "white"),
    axis.ticks = element_line(color = "red", size = 0.7),
    panel.background = element_rect(fill = "#FEE94E")
)

base + test_theme

