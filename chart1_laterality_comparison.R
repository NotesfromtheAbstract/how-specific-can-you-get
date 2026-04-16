# Chart 1: The Laterality Ladder
# Copyright © 2026 Andrew R. Crocker

library(ggplot2)
library(dplyr)
library(tidyr)

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
  detail = factor(c(
    "Retinopathy\npresent",
    "Severity\nspecified",
    "Macular edema\nstatus",
    "Laterality\n(which eye)"
  ), levels = c(
    "Retinopathy\npresent",
    "Severity\nspecified",
    "Macular edema\nstatus",
    "Laterality\n(which eye)"
  )),
  E11.319 = c(1, 0, 0, 0),
  E11.3211 = c(1, 1, 1, 1)
)

plot_data <- data %>%
  pivot_longer(cols = c(E11.319, E11.3211),
               names_to = "code", values_to = "captured") %>%
  mutate(
    code = factor(code, levels = c("E11.319", "E11.3211")),
    fill_color = ifelse(captured == 1, "#2471A3", "#D5D0C4"),
    label = ifelse(captured == 1, "\u2713", "\u2717"),
    text_color = ifelse(captured == 1, "white", "#8A8478")
  )

p <- ggplot(plot_data, aes(x = code, y = detail)) +
  geom_tile(aes(fill = fill_color), color = "#FAF5E9", linewidth = 3,
            width = 0.85, height = 0.85) +
  geom_text(aes(label = label, color = text_color),
            size = 8, family = "Arial") +
  scale_fill_identity() +
  scale_color_identity() +
  labs(
    title = "The Laterality Ladder",
    subtitle = "Same patient, same disease. E11.319 captures one clinical detail.\nE11.3211 captures four. The missing three change everything downstream.",
    x = NULL, y = NULL
  ) +
  theme_1950s() +
  theme(
    panel.grid.major = element_blank(),
    axis.text.x = element_text(face = "bold", size = 14, color = "#3A3A3A"),
    axis.text.y = element_text(size = 12, color = "#3A3A3A", hjust = 1),
    plot.title = element_text(size = 22),
    plot.subtitle = element_text(size = 12, lineheight = 1.2)
  )

print(p)
ggsave("~/Downloads/chart1_laterality_comparison.png", p, width = 16, height = 9,
       units = "in", dpi = 150, bg = "#FAF5E9")
