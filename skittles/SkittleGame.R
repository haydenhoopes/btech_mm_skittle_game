library(ggplot2)

SkittleColor <- c('Orange', 'Yellow', 'Green', 'Purple', 'Red')
skcol <- c('#e64808', '#f1be02', '#048207', '#441349', '#B53021')
SkittleCount <- as.numeric(c(10, 12, 14, 9, 15))
sk1 <- as.numeric(c(3, 5, 8, 3, 4))

SkittleCount <- SkittleCount + sk1
SkittleData <- as.data.frame(cbind(skcol, SkittleColor, SkittleCount))
SkittleData$SkittleCount <- as.integer(SkittleData$SkittleCount)
SkittleData$SkittleColor <- factor(SkittleData$SkittleColor, 
                                   levels = unique(SkittleData$SkittleColor))


SkittlePlot <- ggplot(data = SkittleData,
                      #aes(x = reorder(SkittleColor, -SkittleCount),
                      aes(x = SkittleColor,  
                          y = SkittleCount,
                          fill = SkittleColor)) +
  geom_bar(stat = "identity") +
  labs(y = "Skittle Count", x = "Skittle Color", title = "Skittle Bar Chart") +
  scale_fill_manual(values = skcol, labels = SkittleColor, name = "Skittle Color") +
  scale_y_continuous(breaks = seq(0, max(SkittleData$SkittleCount) + 10, 10),
                     labels = seq(0, max(SkittleData$SkittleCount) + 10, 10),
                     limits = c(0, max(SkittleData$SkittleCount) + 10)) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5, size = 18),
        axis.title = element_text(size = 12),
        legend.position = "none",
        # legend.title = element_text(size = 13),
        # legend.position = "right",
        # legend.text = element_text(size = 12),
        axis.text = element_text(size = 12)) 

SkittlePlot



