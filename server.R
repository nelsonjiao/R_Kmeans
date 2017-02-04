palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
          "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))
library(plyr)
shinyServer(function(input, output, session) {
  
  # Combine the selected variables into a new data frame
  output$plot1 <- renderPlot({
    data<-read.table("C:/Docus/shopsell.txt",header=F)   
    names(data)<-c("District","Sell","Amount","cluster")
    centers<-ddply(data[2:3],.(data$cluster),.fun=function(x) apply(x,2,mean))
    par(mar = c(5.1, 4.1, 0, 1))
    plot(data[,2:3],
         col = data$cluster+1,    
         pch = 20, cex = 3)
    points(centers[,-1], pch = 4, cex = 4, lwd = 4)
  })  
})

