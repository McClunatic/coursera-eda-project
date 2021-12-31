#' A collection of functions to complete the course project.

#' Builds a plot to answer question 1
plot_total_emissions <- function(nei, fips_code) {
    if (missing(fips_code)) {
        year_totals <- tapply(nei$Emissions, nei$year, sum)
        main <- "Total Annual PM2.5 Emissions"
    } else {
        local <- subset(nei, nei$fips == fips_code)
        year_totals <- tapply(local$Emissions, local$year, sum)
        main <- sprintf(
            "Total Annual PM2.5 Emissions, fips = %s",
            fips_code
        )
    }
    barplot(
        year_totals,
        xlab = "Year",
        ylab = "Total PM2.5 Emissions (tons)",
        main = main
    )
}
