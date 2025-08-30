
---

## 📊 Project: Data Visualizer  
📂 **r_project/**  
- `main.R`  
- `README.md`  

### `main.R`
```r
# Simple R Data Visualizer
# Usage: Rscript main.R data.csv

args <- commandArgs(trailingOnly = TRUE)
if (length(args) < 1) {
  stop("Usage: Rscript main.R data.csv", call. = FALSE)
}

data_file <- args[1]
library(ggplot2)

# Load data
df <- read.csv(data_file)

# Print summary
print(summary(df))

# Plot histogram of first numeric column
num_cols <- sapply(df, is.numeric)
if (any(num_cols)) {
  colname <- names(df)[which(num_cols)[1]]
  p <- ggplot(df, aes_string(x = colname)) +
    geom_histogram(binwidth = 10, fill = "blue", alpha = 0.7) +
    theme_minimal() +
    ggtitle(paste("Histogram of", colname))
  print(p)
} else {
  cat("No numeric columns found for plotting.\n")
}
