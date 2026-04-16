# Chart 4: What the Record Sees
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
  fact = factor(c(
    "Type 2 diabetes",
    "Diabetic retinopathy\n(right eye)",
    "Mild nonproliferative\nseverity",
    "Macular edema\npresent",
    "Medication switched\nto SGLT2 inhibitor",
    "Hyperglycemia\n(erratic blood sugar)"
  ), levels = rev(c(
    "Type 2 diabetes",
    "Diabetic retinopathy\n(right eye)",
    "Mild nonproliferative\nseverity",
    "Macular edema\npresent",
    "Medication switched\nto SGLT2 inhibitor",
    "Hyperglycemia\n(erratic blood sugar)"
  ))),
  captured = c(1, 0, 0, 0, 0, 0),
  code_needed = c("E11.9", "E11.3211", "E11.3211", "E11.3211",
                   "Z79.899", "E11.65"),
  source = c(
    "Stamford clinic",
    "Ophthalmologist\n(Abilene)",
    "Ophthalmologist\n(Abilene)",
    "Ophthalmologist\n(Abilene)",
    "Telehealth\nprovider",
    "Stamford clinic\n(undocumented)"
  )
)

data <- data %>%
  mutate(
    fill = ifelse(captured == 1, "#2471A3", "#C0392B"),
    status_label = ifelse(captured == 1, "In the record", "Not in the record")
  )

p <- ggplot(data, aes(y = fact, x = 1)) +
  geom_tile(aes(fill = fill), width = 1.6, height = 0.75,
            color = "#FAF5E9", linewidth = 2) +
  scale_fill_identity() +
  geom_text(aes(x = 1, label = status_label),
            color = "white", size = 4.5, fontface = "bold", family = "Arial") +
  geom_text(aes(x = 2.1, label = code_needed),
            color = "#3A3A3A", size = 3.8, fontface = "bold", family = "Arial",
            hjust = 0) +
  geom_text(aes(x = 3.0, label = source),
            color = "#8A8478", size = 3.2, family = "Arial",
            hjust = 0, lineheight = 0.85) +
  annotate("text", x = 1, y = 7.2, label = "Status", fontface = "bold",
           size = 4, color = "#3A3A3A", family = "Arial") +
  annotate("text", x = 2.1, y = 7.2, label = "Code", fontface = "bold",
           size = 4, color = "#3A3A3A", family = "Arial", hjust = 0) +
  annotate("text", x = 3.0, y = 7.2, label = "Source", fontface = "bold",
           size = 4, color = "#3A3A3A", family = "Arial", hjust = 0) +
  coord_cartesian(xlim = c(0, 4.2), ylim = c(0.3, 7.5)) +
  labs(
    title = "What the Record Sees",
    subtitle = "Six clinical facts about Dale Hammond. His Stamford record captures one.\nThe code E11.9 says Type 2 diabetes without complications. His body disagrees."
  ) +
  theme_1950s() +
  theme(
    panel.grid.major = element_blank(),
    axis.text.x = element_blank(),
    axis.text.y = element_text(size = 11, color = "#3A3A3A", hjust = 1),
    axis.title = element_blank(),
    plot.title = element_text(size = 22),
    plot.subtitle = element_text(size = 12, lineheight = 1.2)
  )

print(p)
ggsave("~/Downloads/chart4_what_the_record_sees.png", p, width = 16, height = 9,
       units = "in", dpi = 150, bg = "#FAF5E9")
