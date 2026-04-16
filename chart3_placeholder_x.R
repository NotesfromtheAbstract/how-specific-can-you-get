# Chart 3: The Placeholder X
# Copyright © 2026 Andrew R. Crocker

library(ggplot2)
library(dplyr)

theme_1950s <- function() {
  theme_minimal(base_family = "Arial", base_size = 14) +
    theme(
      plot.background = element_rect(fill = "#FAF5E9", color = NA),
      panel.background = element_rect(fill = "#FAF5E9", color = NA),
      panel.grid.major = element_line(color = "#E6DECA", linewidth = 0.6),
      panel.grid.minor = element_blank(),
      axis.title = element_text(face = "bold", color = "#3A3A3A"),
      axis.text = element_text(color = "#4A4A4A"),
      plot.title = element_text(face = "bold", size = 20, color = "#3A3A3A"),
      plot.subtitle = element_text(size = 13, color = "#5A5A5A"),
      plot.margin = margin(15, 15, 15, 15),
      legend.position = "none"
    )
}

data <- data.frame(
  x = 1:7,
  char = c("W", "0", "1", "0", "X", "X", "A"),
  position = paste("Position", 1:7),
  meaning = c(
    "Chapter 20\nExternal causes",
    "Category\nFalls (W00\u2013W19)",
    "Subcategory\nSlipping/tripping",
    "Type\nWithout striking\nan object",
    "Placeholder\nNo clinical\nmeaning",
    "Placeholder\nNo clinical\nmeaning",
    "7th character\nInitial\nencounter"
  ),
  fill = c("#2471A3", "#2471A3", "#2471A3", "#2471A3",
           "#D5D0C4", "#D5D0C4", "#C0392B"),
  text_color = c(rep("white", 4), "#8A8478", "#8A8478", "white")
)

p <- ggplot(data, aes(x = x, y = 0.6)) +
  geom_tile(aes(fill = fill), width = 0.85, height = 0.25,
            color = "#FAF5E9", linewidth = 2) +
  scale_fill_identity() +
  geom_text(aes(label = char, color = text_color), size = 12,
            fontface = "bold", family = "Arial") +
  scale_color_identity() +
  geom_text(aes(y = 0.82, label = position), size = 3.2, color = "#8A8478",
            family = "Arial") +
  geom_text(aes(y = 0.32, label = meaning), size = 3.5, color = "#5A5A5A",
            lineheight = 0.85, family = "Arial") +
  annotate("segment", x = 4.6, xend = 6.4, y = 0.47, yend = 0.47,
           color = "#8A8478", linewidth = 0.8) +
  annotate("text", x = 5.5, y = 0.44,
           label = "X fills the seat so A lands in position 7",
           size = 3.3, color = "#8A8478", fontface = "italic", family = "Arial") +
  coord_cartesian(xlim = c(0.2, 7.8), ylim = c(0.1, 0.95)) +
  labs(
    title = "The Placeholder X",
    subtitle = "W01.0XXA \u2014 Fall on same level from slipping, tripping, and stumbling, initial encounter.\nThe X's carry no clinical meaning. They hold positions 5 and 6 so the 7th character stays in its designated slot."
  ) +
  theme_1950s() +
  theme(
    panel.grid.major = element_blank(),
    axis.text = element_blank(),
    axis.title = element_blank(),
    plot.title = element_text(size = 22),
    plot.subtitle = element_text(size = 11, lineheight = 1.2)
  )

print(p)
ggsave("~/Downloads/chart3_placeholder_x.png", p, width = 16, height = 9,
       units = "in", dpi = 150, bg = "#FAF5E9")
