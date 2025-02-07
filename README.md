DeepSeek Cost Chart

## Overview
This project visualizes and compares the costs associated with three AI models—DeepSeek-R1, GPT-4, and Gemini 1.0—across four major categories:

1. **Software (Training)**
2. **Hardware (Cloud Computing Costs)**
3. **Hardware & Energy**
4. **R&D Staff Salaries**

## Purpose
The goal is to analyze and highlight cost differences between these AI models in a clear and impactful manner. This visualization sheds light on how training, hardware, and human resource costs contribute to the overall expense of AI development, with a special focus on the claim that DeepSeek-R1 incurred only $6 million in training costs.

## Key Features of the Script

- **Data Loading:**
  The script reads data from a CSV file located at `~/Desktop/COLUMBIA/GitHub/deepseekchart/aimodelscost.csv`.

- **Data Cleaning:**
  - Updates category names for better readability.
  - Renames "DeepSeek R1" to "DeepSeek-R1" to maintain consistent formatting.

- **Custom Visualization:**
  - A **facet-wrapped bar chart** splits costs into four categories, with custom colors assigned to each AI model for clarity.
  - The categories are displayed in a specific order: Software (Training) appears in the top left, followed by other categories.
  - Each bar includes the model name for better identification.

- **Stylized Output:**
  - The chart includes a bold title, a concise subtitle, and a smaller caption at the bottom for sources.
  - Categories are labeled directly above their respective charts for easy understanding.

## Instructions to Modify the Order of Charts
To change the order of the categories displayed in the chart, adjust the `levels` argument in the `factor()` function under:
```r
ai_costs$Category <- factor(ai_costs$Category, levels = c(
  "Software (Training)",
  "Hardware (Cloud Computing Costs)",
  "Hardware & Energy",
  "R&D Staff Salaries"
))
```
For example, to display "R&D Staff Salaries" first, update the levels like this:
```r
ai_costs$Category <- factor(ai_costs$Category, levels = c(
  "R&D Staff Salaries",
  "Software (Training)",
  "Hardware (Cloud Computing Costs)",
  "Hardware & Energy"
))
```

## Sources
The data is sourced from the following:
- Epoch AI
- SemiAnalysis
- Stanford AI Index Report 2024

## Usage
Run the R script in an environment that supports `ggplot2` and `readr` libraries. Ensure the CSV file path is correctly set before execution.

