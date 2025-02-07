library(ggplot2)
library(readr)

ai_costs <- read_csv("~/Desktop/COLUMBIA/GitHub/deepseekchart/aimodelscost.csv")

ai_costs$Category <- gsub("Hardware", "Hardware (Cloud Computing Costs)", ai_costs$Category)
ai_costs$Model <- gsub("DeepSeek R1", "DeepSeek-R1", ai_costs$Model)

custom_colors <- c("DeepSeek-R1" = "#007BFF", 
                   "GPT-4" = "#2AB674", 
                   "Gemini 1.0" = "#C19EE0")

ggplot(ai_costs, aes(x = Model, y = `Cost (Million Dollars)`, fill = Model)) +
  geom_bar(stat = "identity", width = 0.6) +
  scale_fill_manual(values = custom_colors) +
  labs(
    title = "Why DeepSeek May Not Be As Cheap As You Think",
    subtitle = "Cost comparison of DeepSeek, GPT-4, and Gemini 1.0 across key categories.",
    y = "Cost (Million USD)",
    x = "AI Models"
  ) +
  theme_minimal() +
  theme(
    legend.position = "none",
    strip.text = element_text(face = "bold", hjust = 0.5),
    axis.text.x = element_text(face = "bold", angle = 45, hjust = 1),
    plot.title = element_text(face = "bold", size = 14), 
    plot.subtitle = element_text(size = 10, margin = margin(b = 10))
  ) +
  facet_wrap(
    ~Category, 
    ncol = 2, 
    scales = "free_y", 
    labeller = labeller(Category = c(
      "Hardware & Energy" = "Hardware & Energy",
      "Software (Training)" = "Software (Training)",
      "Hardware (Cloud Computing Costs)" = "Hardware (Cloud Computing Costs)",
      "R&D Staff Salaries" = "R&D Staff Salaries"
      
    ))
  ) +
  theme(plot.caption = element_text(size = 10, hjust = 0.5)) +
  labs(caption = "Sources: Epoch AI, SemiAnalysis, Stanford AI Index Report 2024")
