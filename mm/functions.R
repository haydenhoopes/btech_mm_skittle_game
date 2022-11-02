mm_graph <- function(br, bl, g, y, r, o) {
  MnMColor <- c('Brown', 'Red', 'Yellow', 'Blue', 'Green', 'Orange')
  mmcol <- c('#5d4b3c', '#b11224', '#fff200', '#2f9fd7', '#31ac55', '#f26f22')
  MnMCount <- as.numeric(c(br, r, y, bl, g, o))
  
  MnMData <- as.data.frame(cbind(mmcol, MnMColor, MnMCount))
  MnMData$MnMCount <- as.integer(MnMData$MnMCount)
  MnMData$MnMColor <- factor(MnMData$MnMColor, 
                             levels = unique(MnMData$MnMColor))
  
  
  MnMPlot <- ggplot(data = MnMData,
                    aes(x = reorder(MnMColor, -MnMCount),
                        #aes(x = MnMColor,  
                        y = MnMCount,
                        fill = MnMColor)) +
    geom_bar(stat = "identity", color="black") +
    labs(y = "M&M Count", x = "M&M Color" +
    scale_fill_manual(values = mmcol, labels = MnMColor, name = "M&M Color") +
    scale_y_continuous(breaks = seq(0, max(MnMData$MnMCount) + 10, 10),
                       labels = seq(0, max(MnMData$MnMCount) + 10, 10),
                       limits = c(0, max(MnMData$MnMCount) + 10)) +
    theme_bw() +
    theme(plot.title = element_text(hjust = 0.5, size = 18),
          axis.title = element_text(size = 12),
          legend.position = "none",
          # legend.title = element_text(size = 13),
          # legend.position = "right",
          # legend.text = element_text(size = 12),
          axis.text = element_text(size = 12)))
  
  return(MnMPlot)
}

