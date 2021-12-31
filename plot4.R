#' Question 4:
#' Across the United States, how have emissions from coal combustion-related
#' sources changed from 1999–2008?

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
SCC <- readRDS("Source_Classification_Code.rds")

# Set up a PNG device
png(filename = "plot4.png")

# Plot total annual emissions from coal-related sources
coal_scc <- SSC[grepl("^Fuel Comb.*Coal$", SCC$EI.Sector), 1]
coal_nei <- NEI[NEI$SCC %in% coal_scc]
plot_total_emissions(coal_nei, "from Coal Sources")

# Save and close the PNG
dev.off()
