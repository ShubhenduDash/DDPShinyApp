\name{DDPShinyApp_Covid19}
\alias{DDPShinyApp_Covid19}

\title{
Interactive Dashboard using Covid-19 Data Hub.
}
\description{
COVID19:
The COVID19 R package provides a seamless integration with COVID-19 Data Hubvia the covid19() function. Type ?covid19 for the full list of arguments.
Here we are going to use:
1. country: vector of country names or ISO codes.
2. level: granularity level; data by (1) country, (2) region, (3) city.
3. start: the start date of the period of interest.
4. end: the end date of the period of interest.

Define UI:
Define the following inputs…
1. country: the country name. Note that the options are automatically populated using the covid19() function.
2. type: the metric to use. One of c("confirmed", "tests", "recovered", "deaths"), but many others are avaibale. See here for the full list.
3. level: granularity level (country - region - city).
4. date: start and end dates.
5. covid19plot: plotly output that will render an interactive plot.
6. Wrap everything into a fluidPage:

Server logic:
After defining the reactive inputs in the UI, we connect such inputs
to the covid19() function to fetch the data. The following code snippet shows how to render an interactive plot(ly) that automatically updates when any of the input is changed. Note that the covid19() function uses an internal memory caching system so that the data are never downloaded twice. Calling the function multiple times is highly efficient and user friendly.

Run the application:
The functionshinyApp builds an app from the ui.R and server.R arguments implemented above.
}
\usage{
DDPShinyApp_Covid19(x)
}
\value{
Arguments:
1. country: vector of country names or ISO codes.
2. level: granularity level; data by (1) country, (2) region, (3) city.
3. start: the start date of the period of interest.
4. end: the end date of the period of interest.

Inputs:
1. country: the country name. Note that the options are automatically populated using the covid19() function.
2. type: the metric to use. One of c("confirmed", "tests", "recovered", "deaths"), but many others are avaibale. See here for the full list.
3. level: granularity level (country - region - city).
4. date: start and end dates.

Outputs:
1. covid19plot: plotly output that will render an interactive plot.
2. Wrap everything into a fluidPage:
}
\references{
        \url{https://github.com/ShubhenduDash/DDPShinyApp}
}
\author{
Shubhendu Dash
\email{shubhendudash95@gmail.com}
KIIT University, Bhubaneswar
Odisha, India
}

