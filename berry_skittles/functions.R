skittles_graph <- function(green, pink, blue, red, purple, orange, yellow) {
  SkittleColor <- c('Green', 'Pink', 'Blue', 'Red', 'Purple', 'Orange', 'Yellow')
  skcol <- c('#65cb06', '#f28686', '#4c8cd4', '#b12527', '#483d8b', '#e64808', '#f1be02')
  SkittlesCount <- as.numeric(c(green, pink, blue, red, purple, orange, yellow))
  
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



