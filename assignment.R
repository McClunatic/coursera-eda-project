#' A collection of functions to complete the course project.

#' Builds a plot to answer question 1
plot_total_emissions <- function(nei) {
    year_totals <- tapply(nei$Emissions, nei$year, sum)
    barplot(
        year_totals,
        xlab = "Year",
        ylab = "Total PM2.5 Emissions (tons)",
        main = "Total Annual PM2.5 Emissions"
    )
}
