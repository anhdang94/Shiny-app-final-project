
#Load the Library
library(shiny)
library(ggplot2)
library(tidyverse)
library(RCurl)
x <- getURL("https://raw.githubusercontent.com/anhdang94/Shiny-app-final-project/master/Shareholder%20letters%20data.RData")
shletter<-read.csv(text = x)

summary(shletter)

#Rename columns
names(shletter)[3] <- "Net_Income"
names(shletter)[4] <- "Revenue"
names(shletter)[5] <- "Year_end_stock_price"
names(shletter)[6] <- "EPS"

names(shletter)[9] <- "Shareholders_Letter"
names(shletter)[10] <- "CEO_photo"
names(shletter)[11] <- "Other_Financial_info"


# Define UI for application 
ui <- fluidPage(
  
  # Application title
  titlePanel("Different financial statements elements interaction with shareholder letter elements"),
  
  # Sidebar layout
  sidebarLayout(
    #Inputs: Select which inputs from the data we want to display
    sidebarPanel(
      #Select variable for y-axis
      selectInput(inputId = "y", 
                  label = "Element of financial statements",
                  choices = c("Net_Income","Revenue","Year_end_stock_price","EPS"), 
                  selected = "Net_Income"),
      #Select X-axix variables
      selectInput(inputId = "x", 
                  label = "Elements of shareholder letters:",
                  choices = c("Shareholders_Letter", "CEO_photo", "Other_Financial_info"), 
                  selected = "Shareholders_Letter"),
      # Select Colors
      selectInput(inputId = "thecolors", 
                  label = "Choose Your Point Color",
                  choices = c("red", "green", "blue", "yellow", "black"), 
                  selected = "black"),
    ),
    
    #Output: Type of plot
    mainPanel(
      plotOutput(outputId = "ScatterPlot") 
    )
  )
)

# Define server logic required to draw a scatter plot
server <- function(input, output) {
  
  output$ScatterPlot <- renderPlot({
    # draw the scatter plot
    ggplot(shletter, aes_string(x=input$x, y=input$y)) + geom_point(colour=input$thecolors) #Notice the difference between the ggplots
  })
}
# Run the application 
shinyApp(ui = ui, server = server)