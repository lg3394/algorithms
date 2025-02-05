library(ggplot2)
library(readr)

data <- data.frame(
  Model = c("DeepSeek R1", "GPT-4", "RoBERTa Large", "Llama 2 70B", "Gemini Ultra", "Llama 3.1"),
  TrainingCost = c(5.58, 100, NA, NA, NA, NA),
  HardwareCost = c(500, 40.59, NA, NA, NA, NA)
)

model_colors <- c(
  "DeepSeek R1" = "#1F77B4",
  "GPT-4" = "#FF7F0E",
  "RoBERTa Large" = "#2CA02C",
  "Llama 2 70B" = "#D62728",
  "Gemini Ultra" = "#9467BD",
  "Llama 3.1" = "#8C564B"
)

plot <- ggplot(data, aes(x = Model)) +
  geom_point(aes(y = TrainingCost, color = Model, shape = "Training Cost"), size = 4, alpha = 0.9) +
  geom_point(aes(y = HardwareCost, color = Model, shape = "Hardware Cost"), size = 4, alpha = 0.4) +
  scale_color_manual(values = model_colors) + 
  scale_shape_manual(values = c("Training Cost" = 16, "Hardware Cost" = 15)) +  
  labs(
    title = "How Much Does It Really Cost to Make Frontier AI Models?  
            Why DeepSeek May Not Be as Cheap as You Think",
    subtitle = "Last week, DeepSeek made headlines with its claims of low training costs,  
                but its hardware expenses may actually surpass those of other Frontier AI models.",
    x = "AI Model",
    y = "Cost (in Million USD)",
    color = "Model",
    shape = "Darker = Training Cost, Lighter = Hardware Cost"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    plot.title = element_text(face = "bold", size = 16, margin = margin(b = 10)),
    plot.subtitle = element_text(size = 12, margin = margin(b = 15)),
    legend.position = "bottom",
    plot.margin = margin(b = 50)
  ) +
  annotate("text", x = 3, y = 0, label = "Sources: DeepSeek's own paper, SemiAnalysis, others TBC", hjust = 0, size = 3)

print(plot)
