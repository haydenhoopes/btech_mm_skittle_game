mm_graph <- function(brown, blue, green, yellow, red, orange) {
  MnMColor <- c('Brown', 'Red', 'Yellow', 'Blue', 'Green', 'Orange')
  mmcol <- c('#5d4b3c', '#b11224', '#fff200', '#2f9fd7', '#31ac55', '#f26f22')
  MnMCount <- as.numeric(c(brown, red, yellow, blue, green, orange))
  #MnMCount <- as.numeric(c(1, 2, 3, 4, 5, 6))
  
  MnMData <- as.data.frame(cbind(mmcol, MnMColor, MnMCount))
  MnMData$MnMCount <- as.integer(MnMData$MnMCount)
  MnMData$MnMColor <- factor(MnMData$MnMColor, 
                             levels = unique(MnMData$MnMColor))
  
  
  MnMPlot <- ggplot(data = MnMData,
                    aes(x = MnMColor, 
                        y = MnMCount)) +
    geom_bar(stat = "identity", fill= MnMData$mmcol, colour = "black") +
    labs(y = "M&M Count", x = "M&M Color" +
    scale_fill_manual(values = mmcol, labels = MnMColor, name = "M&M Color") +
    scale_y_continuous(breaks = seq(0, max(MnMData$MnMCount) + 10, 10),
                       labels = seq(0, max(MnMData$MnMCount) + 10, 10),
                       limits = c(0, max(MnMData$MnMCount) + 10)) +
    theme_bw()) + 
    theme(text = element_text(size = 26))
  
  return(MnMPlot)
}

