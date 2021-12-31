#' A collection of functions to complete the course project.
library(ggplot2)

MAIN <- "Total Annual PM2.5 Emissions"

#' Builds a plot to answer question 1
plot_total_emissions <- function(nei, main) {
    main <- if (missing(main)) { MAIN } else { paste(MAIN, main) }
    year_totals <- tapply(nei$Emissions, nei$year, sum)
    barplot(
        year_totals,
        xlab = "Year",
        ylab = "Total PM2.5 Emissions (tons)",
        main = main
    )
}

question1 <- function(nei) {
    plot_total_emissions(nei)
}

question2 <- function(nei) {
    balt <- subset(nei, fips == "24510")
    plot_total_emissions(balt, "for Baltimore City")
}

question3 <- function(nei) {
    g <- ggplot(nei, aes(factor(year), Emissions))
    g + facet_grid(vars(type)) + geom_col()
}

question4 <- function(nei, scc) {
    coal_scc <- scc[grepl("^Fuel Comb.*Coal$", scc$EI.Sector), 1]
    coal_nei <- nei[nei$SCC %in% coal_scc]
    plot_total_emissions(coal_nei, "from Coal Sources")
}

question5 <- function(nei, scc) {
    mv_scc <- scc[grepl("^Mobile.*", scc$EI.Sector), 1]
    mv_nei <- nei[nei$SCC %in% mv_scc, ]
    mv_balt <- subset(mv_nei, fips == "24510")
    plot_total_emissions(mv_balt,  "from Mobile Sources in Baltimore City")
}

question6 <- function(nei, scc) {
    mv_scc <- scc[grepl("^Mobile.*", scc$EI.Sector), 1]
    mv_nei <- nei[nei$SCC %in% mv_scc, ]
    mv_sub <- subset(mv_nei, fips %in% c("24510", "06037"))
    g <- ggplot(mv_sub, aes(factor(year), Emissions))
    g + facet_grid(vars(factor(fips))) + geom_col()
}
