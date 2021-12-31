#' Question 1:
#' Have total emissions from PM2.5 decreased in the United States from 1999 to
#' 2008? Using the base plotting system, make a plot showing the total PM2.5
#' emission from all sources for each of the years 1999, 2002, 2005, and 2008.

#' Plots total emissions
#'
#' @param nei A PM2.5 emissions dataframe
#' @param main A string to append to the default title
#'
#' @return The result of a call to builtin barplot
plot_total_emissions <- function(nei, main) {
    MAIN <- "Total Annual PM2.5 Emissions"
    main <- if (missing(main)) { MAIN } else { paste(MAIN, main) }
    year_totals <- tapply(nei$Emissions, nei$year, sum)
    barplot(
        year_totals,
        xlab = "Year",
        ylab = "Total PM2.5 Emissions (tons)",
        main = main
    )
}

# Load the dataset
NEI <- readRDS("summarySCC_PM25.rds")

# Set up a PNG device
png(filename = "plot1.png")

# Plot total annual emissions
plot_total_emissions(NEI)

# Save and close the PNG
dev.off()
