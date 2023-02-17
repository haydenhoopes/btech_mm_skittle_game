skittles_graph <- function(orange, yellow, green, purple, red) {
  SkittleColor <- c('Orange', 'Yellow', 'Green', 'Purple', 'Red')
  skcol <- c('#e64808', '#f1be02', '#048207', '#441349', '#B53021')
  SkittlesCount <- as.numeric(c(orange, yellow, green, purple, red))
  
  SkittlesData <- as.data.frame(cbind(skcol, SkittleColor, SkittlesCount))
  SkittlesData$SkittlesCount <- as.integer(SkittlesData$SkittlesCount)
  SkittlesData$SkittleColor <- factor(SkittlesData$SkittleColor, 
                             levels = unique(SkittlesData$SkittleColor))
  
  
  SkittlesPlot <- ggplot(data = SkittlesData,
                    aes(x = SkittleColor, 
                        y = SkittlesCount)) +
    geom_bar(stat = "identity", fill= SkittlesData$skcol, colour = "black") +
    labs(y = "Skittles Count", x = "Skittles Color" +
    scale_fill_manual(values = skcol, labels = SkittleColor, name = "Skittles Color") +
    scale_y_continuous(breaks = seq(0, max(SkittlesData$SkittlesCount) + 10, 10),
                       labels = seq(0, max(SkittlesData$SkittlesCount) + 10, 10),
                       limits = c(0, max(SkittlesData$SkittlesCount) + 10)) +
    theme_bw()) + 
    theme(text = element_text(size = 26))
  
  return(SkittlesPlot)
}



