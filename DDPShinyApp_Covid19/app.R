#---------------------------------------------------------------------------------------
#' This is a Shiny web application. You can run the application by clicking
#' the 'Run App' button above.
#' @title 
#' "Building Covid-19 Shiny App Dashboard using Covid-19 Data Hub."
#' @description 
#' In this app, we are going to build a simple yet complete
#' Shiny application using the R Package COVID19: R Interface to COVID-19 Data Hub.
#' @author Shubhendu Dash
#---------------------------------------------------------------------------------------
#' @details COVID19:
#' The COVID19 R package provides a seamless integration with COVID-19 Data Hub
#' via the covid19() function. Type ?covid19 for the full list of arguments.
#' Here we are going to use:
#'  1. country: vector of country names or ISO codes.
#'  2. level: granularity level; data by (1) country, (2) region, (3) city.
#'  3. start: the start date of the period of interest.
#'  4. end: the end date of the period of interest.
#---------------------------------------------------------------------------------------
#' @details Define UI:
#' Define the following inputs…
#'  1. country: the country name. Note that the options are automatically populated 
#'  using the covid19() function.
#'  2. type: the metric to use. One of c("confirmed", "tests", "recovered", "deaths"),
#'  but many others are avaibale. See here for the full list.
#'  3. level: granularity level (country - region - city).
#'  4. date: start and end dates.
#' …and the output:
#'  1. covid19plot: plotly output that will render an interactive plot.
#' Wrap everything into a fluidPage:
#---------------------------------------------------------------------------------------
#' @details Server logic:
#' After defining the reactive inputs in the UI, we connect such inputs
#' to the covid19() function to fetch the data.
#' The following code snippet shows how to render an interactive plot(ly)
#' that automatically updates when any of the input is changed. 
#' Note that the covid19() function uses an internal memory caching system
#' so that the data are never downloaded twice. Calling the function multiple times
#' is highly efficient and user friendly.
#---------------------------------------------------------------------------------------
#' @details Run the application:
#' The functionshinyApp builds an app from the ui.R and server.R
#' arguments implemented above.
#---------------------------------------------------------------------------------------


# Installing the required packages.
# install.packages("shiny")
# install.packages("plotly")
# install.packages("COVID19")


# Loading the required packages.
library(shiny)
library(plotly)
library(COVID19)


# Define UI for application
ui <- fluidPage(
    titlePanel("Covid-19 Dashboard"),
    sidebarLayout(
        sidebarPanel(
            selectInput(
                "country", 
                label    = "Country", 
                multiple = TRUE, 
                choices  = unique(covid19()$administrative_area_level_1), 
                selected = "India"
            ),
            selectInput(
                "type", 
                label    = "type", 
                choices  = c("confirmed", "tests", "recovered", "deaths")
            ),
            selectInput(
                "level", 
                label    = "Granularity", 
                choices  = c("Country" = 1, "Region" = 2, "City" = 3), 
                selected = 2
            ),
            dateRangeInput(
                "date", 
                label    = "Date", 
                start    = "2020-01-01"
            ),
        ),
        
        mainPanel(
            h3("Visualization Covid-19"),
            plotlyOutput("covid19plot")
        )
    )
)


# Define server logic
server <- function(input, output) {
    output$covid19plot <- renderPlotly({
        if(!is.null(input$country)){
            
            x <- covid19(
                country = input$country, 
                level   = input$level, 
                start   = input$date[1], 
                end     = input$date[2]
            )
            
            color <- paste0("administrative_area_level_", input$level)
            plot_ly(x = x[["date"]], y = x[[input$type]], color = x[[color]])
        }
    })
    
}


# Run the application 
shinyApp(ui = ui, server = server)