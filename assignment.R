#' A collection of functions to complete the course project.
library(ggplot2)

MAIN <- "Total Annual PM2.5 Emissions"

#' Builds a plot to answer question 1
plot_total_emissions <- function(nei, main) {
    year_totals <- tapply(nei$Emissions, nei$year, sum)
    barplot(
        year_totals,
        xlab = "Year",
        ylab = "Total PM2.5 Emissions (tons)",
        main = main
    )
}

ggplot_emissions_by_type <- function(nei) {
    g <- ggplot(nei, aes(factor(year), Emissions))
    g + facet_grid(vars(type)) + geom_col()
}

question1 <- function(nei) {
    plot_total_emissions(nei, MAIN)
}

question2 <- function(nei) {
    balt <- subset(nei, fips == "24510")
    main <- paste(MAIN, "for Baltimore City")
    plot_total_emissions(balt, main)
}

question3 <- function(nei) {
    ggplot_emissions_by_type(nei)
}

question4 <- function(nei, scc) {
    coal_scc <- scc[grepl("^Fuel Comb.*Coal$", scc$EI.Sector), 1]
    coal_nei <- nei[nei$SCC %in% coal_scc]
    main <- paste(MAIN, "from Coal Sources")
    plot_total_emissions(coal_nei, main)
}

question5 <- function(nei, scc) {
    mv_scc <- scc[grepl("^Mobile.*", scc$EI.Sector), 1]
    mv_nei <- nei[nei$SCC %in% mv_scc, ]
    mv_balt <- subset(mv_nei, fips == "24510")
    main <- paste(MAIN, "from Mobile Sources in Baltimore City")
    plot_total_emissions(mv_balt, main)
}
