#' Question 5:
#' How have emissions from motor vehicle sources changed from 1999–2008 in
#' Baltimore City?

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
png(filename = "plot5.png")

# Plot total annual emissions from mobile sources in Baltimore
mv_scc <- SCC[grepl("^Mobile.*", SCC$EI.Sector), 1]
mv_nei <- NEI[NEI$SCC %in% mv_scc, ]
mv_balt <- subset(mv_nei, fips == "24510")
plot_total_emissions(mv_balt,  "from Mobile Sources in Baltimore City")

# Save and close the PNG
dev.off()
