library(ShortRead)
library(ggplot2)
library(tidyverse)

# Veriyi okuma
fq_file <- "data/sample_R1.fastq"
reads <- readFastq(fq_file)

# Kalite skorlarını matris olarak çıkarma
qualities <- as(quality(reads), "matrix")

# Veriyi düzenleme (Her pozisyondaki ortalama kalite skorunu hesaplama)
mean_qualities <- colMeans(qualities, na.rm = TRUE)
positions <- 1:length(mean_qualities)

df_plot <- data.frame(
        Position = positions,
        Mean_Phred_Score = mean_qualities
)

# Grafik oluşturma
ggplot(df_plot, aes(x = Position, y = Mean_Phred_Score)) +
        geom_line(color = "#2c3e50", linewidth = 1) +  # Çizgi rengi ve kalınlığı
        geom_hline(yintercept = 20, linetype = "dashed", color = "red") + # Kritik eşik çizgisi (Phred 20)
        geom_hline(yintercept = 28, linetype = "dashed", color = "green") + # Yüksek kalite çizgisi (Phred 28)
        labs(
                title = "Per Base Sequence Quality",
                subtitle = "Quality check of raw RNA-seq reads",
                x = "Position in Read (bp)",
                y = "Mean Phred Score"
        ) +
        theme_minimal() +
        annotate("text", x = 10, y = 18, label = "Poor Quality (<20)", color = "red", size = 3)

# Grafiği kaydetme
ggsave("results/quality_plot_R.png", width = 8, height = 5)
