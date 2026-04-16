# Chart 2: One Fracture, Three Codes
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
  x = c(1, 2, 3),
  code = c("S62.101A", "S62.101D", "S62.101S"),
  ext = c("A", "D", "S"),
  meaning = c("Initial encounter\nClosed fracture",
              "Subsequent encounter\nRoutine healing",
              "Sequela\nResidual weakness"),
  timepoint = c("Day 1\nER visit", "Week 2\nOrthopedist", "Month 6\nFollow-up"),
  color = c("#C0392B", "#2471A3", "#5A5A5A")
)

p <- ggplot(data, aes(x = x, y = 0.5)) +
  geom_segment(aes(x = 1, xend = 3, y = 0.5, yend = 0.5),
               color = "#D5D0C4", linewidth = 2) +
  geom_point(aes(color = color), size = 22) +
  scale_color_identity() +
  geom_text(aes(label = ext), color = "white", size = 10,
            fontface = "bold", family = "Arial") +
  geom_text(aes(y = 0.72, label = code), size = 5.5, fontface = "bold",
            color = "#3A3A3A", family = "Arial") +
  geom_text(aes(y = 0.28, label = meaning), size = 4, color = "#5A5A5A",
            lineheight = 0.9, family = "Arial") +
  geom_text(aes(y = 0.1, label = timepoint), size = 3.5, color = "#8A8478",
            lineheight = 0.9, family = "Arial") +
  annotate("text", x = 2, y = 0.88,
           label = "S62.101 stays the same. Only the 7th character changes.",
           size = 4, color = "#8A8478", fontface = "italic", family = "Arial") +
  coord_cartesian(xlim = c(0.3, 3.7), ylim = c(0, 1)) +
  labs(
    title = "One Fracture, Three Codes",
    subtitle = "Dale's wrist fracture generates a different code at each encounter.\nThe first six characters identify the injury. The seventh tracks the phase of care."
  ) +
  theme_1950s() +
  theme(
    panel.grid.major = element_blank(),
    axis.text = element_blank(),
    axis.title = element_blank(),
    plot.title = element_text(size = 22),
    plot.subtitle = element_text(size = 12, lineheight = 1.2)
  )

print(p)
ggsave("~/Downloads/chart2_episode_of_care.png", p, width = 16, height = 9,
       units = "in", dpi = 150, bg = "#FAF5E9")
