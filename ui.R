# ui
shinyUI(fluidPage(
        titlePanel("Expected Return Calculator"),
        
        sidebarLayout(
                sidebarPanel(
                helpText("Compute Markowitz portfolio from"),
                checkboxGroupInput("companies", 
                                   label = h3("Select tickers"), 
                                   choices = list("Microsoft Corporation"="MSFT",
                                                  "Apple" = "AAPL" , 
                                                  "PowerShares"= "QQQ",
                                                  "Yahoo"="YHOO",
                                                  "Facebook" = "FB",
                                                  "Tesla Motors"="TSLA",
                                                  "NetFlix" = "NFLX",
                                                  "Google" = "GOOG", 
                                                  "Amazon"= "AMZN", 
                                                  "Bank of America"="BAC",
                                                  "Baidu" = "BIDU", 
                                                  "American Airlines"="AAL",
                                                  "Goldman Sachs" = "GS", 
                                                  "Blackberry"="BBRY", 
                                                  "Sina" = "SINA"),
                                   selected = "Goldman Sachs"),
                helpText('Choose View'),
                selectInput("select", 
                             label = h3("View"),
                             choices = c("Portfolio Cloud", "Efficient Frontier" ),
                             selected = "Portfolio Cloud"),
                                
                sliderInput("range", 
                            label = h3("Enter Wealth"), 
                            min = 0, max = 10000, value = 5000)
                ),
               
                mainPanel(
                        tabsetPanel(
                                tabPanel("Introduction",
                                         p("Thanks for checking out the Expected Return Calculator"),
                                         p("With this app, you can determine the expected return you would obtain from investing up to $10 000 in the stocks of 15 of the most highly traded companies on the stock market at current market price, using slider on the bottom left."),
                                         p("If you build a portfolio of two or more apps, you can can toggle views between the risk-return portfolio cloud and the efficient frontier plot with the radio button on the left."),
                                         p("The source code is available at https://github.com/Budotron/Data-Products"),
                                         p("Click the Allocation tab to get started")
                                         ),
                                tabPanel(
                                        "Allocation", 
                                        textOutput("text1"), 
                                        br(),
                                        br(),
                                        dataTableOutput('mytable1'),
                                        br(),
                                        br(),
                                        textOutput("text2")
                                        ),
                                tabPanel(
                                        "Plots",
                                        textOutput("text3"),
                                        br(),
                                        plotOutput("plots")
                                        )
                                )
                        )
        )
))