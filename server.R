# server.R
library(stockPortfolio)
library(quadprog)
shinyServer(
        function(input, output) {
                output$text1 <- renderPrint({
                        print("Optimal wealth allocation for selected stocks (percent)")
                })  
                
                output$text2 <- renderPrint({
                        returns<-getReturns(input$companies)
                        model<-stockModel(returns)
                        op<-optimalPort(model)
                        options(digits=2)
                        exdreturn<-input$range*op$R
                        print(paste("Expected return is $", exdreturn, "per month"))
                        
                })
                
                output$text3 <- renderPrint({
                        print("Change View if you have chosen more than two stocks")
                }) 
                
                output$plots <- renderPlot({
                        returns<-getReturns(input$companies)
                        model<-stockModel(returns)
                        op<-optimalPort(model)
                        switch(input$select,
                               "Portfolio Cloud" = plot(op, addNames=T),
                               "Efficient Frontier" = portPossCurve(model)
                               )
                })
                
                output$mytable1 <- renderDataTable({
                        returns<-getReturns(input$companies)
                        model<-stockModel(returns)
                        op<-optimalPort(model)
                        table<-as.data.frame(rbind(op$X*100))
                        table[, drop = FALSE]
                })               
                
        }
)