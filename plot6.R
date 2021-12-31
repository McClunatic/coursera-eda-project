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

# Plot mobile Emissions by year for Baltimore and LA County
mv_scc <- SCC[grepl("^Mobile.*", SCC$EI.Sector), 1]
mv_nei <- NEI[NEI$SCC %in% mv_scc, ]
mv_sub <- subset(mv_nei, fips %in% c("24510", "06037"))
city <- c("24510" = "Baltimore City", "06037" = "Los Angeles County")
ggplot(mv_sub, aes(factor(year), Emissions)) +
    facet_grid(vars(factor(fips)), labeller = labeller(.rows = city)) +
    stat_summary(fun = "sum", geom = "bar") +
    labs(title = "Annual Mobile PM2.5 Emissions, Faceted by Region") +
    labs(x = "Year", y = "Total PM2.5 Emissions (tons)")

# Save and close the PNG
dev.off()
