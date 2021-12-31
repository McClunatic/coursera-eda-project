#' Question 2:
#' Have total emissions from PM2.5 decreased in the Baltimore City, Maryland
#' (\color{red}{\verb|fips == "24510"|}fips == "24510") from 1999 to 2008? Use
#' the base plotting system to make a plot answering this question.

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
png(filename = "plot2.png")

# Plot total annual emissions for Baltimore City
balt <- subset(nei, fips == "24510")
plot_total_emissions(balt, "for Baltimore City")

# Save and close the PNG
dev.off()
