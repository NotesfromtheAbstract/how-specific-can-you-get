# How Specific Can You Get?

**Medical Coding Fundamentals, Lesson 2**
*Notes from the Abstract*

R code for all charts in Lesson 2 of the Medical Coding Fundamentals series.

## Charts

- `chart1_laterality_comparison.R` — **The Laterality Ladder.** E11.319 vs E11.3211: what each code captures and what's missing.
- `chart2_episode_of_care.R` — **One Fracture, Three Codes.** S62.101A → S62.101D → S62.101S across Dale's three encounters.
- `chart3_placeholder_x.R` — **The Placeholder X.** Code anatomy of W01.0XXA, character by character.
- `chart4_what_the_record_sees.R` — **What the Record Sees.** Six clinical facts about Dale. His Stamford record captures one.

## Requirements

- R (≥ 4.0)
- `ggplot2`
- `dplyr`
- `tidyr` (chart 1 only)

All charts use the publication's `theme_1950s()` custom theme, defined within each script. Output sized at 16:9 (1456px wide at 150 DPI) for Substack.

## Running

Open any script in RStudio or VS Code, select all (Cmd+A), and run (Cmd+Enter). Each script displays the chart and saves a PNG to `~/Downloads/`. To save to the working directory instead, change the `ggsave` path from `~/Downloads/filename.png` to just `filename.png`.

## License

See LICENSE file.

## Series

This is Lesson 2. Lesson 1 ("What's Wrong With You?") is available at [andrewrcrocker.substack.com](https://andrewrcrocker.substack.com).

---

Copyright © 2026 Andrew R. Crocker
