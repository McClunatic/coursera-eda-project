#' Question 6:
#' Compare emissions from motor vehicle sources in Baltimore City with emissions
#' from motor vehicle sources in Los Angeles County, California
#' (\color{red}{\verb|fips == "06037"|}fips == "06037"). Which city has seen
#' greater changes over time in motor vehicle emissions?
library(ggplot2)

# Load the dataset
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Set up a PNG device
png(filename = "plot6.png")

# Plot Emissions by year faceted by type as bar plots
mv_scc <- SCC[grepl("^Mobile.*", SCC$EI.Sector), 1]
mv_nei <- NEI[NEI$SCC %in% mv_scc, ]
mv_sub <- subset(mv_nei, fips %in% c("24510", "06037"))
g <- ggplot(mv_sub, aes(factor(year), Emissions))
g + facet_grid(vars(factor(fips))) + geom_col()

# Save and close the PNG
dev.off()
