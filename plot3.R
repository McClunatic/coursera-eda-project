#' Question 3:
#' Of the four types of sources indicated by the \color{red}{\verb|type|}type
#' (point, nonpoint, onroad, nonroad) variable, which of these four sources have
#' seen decreases in emissions from 1999–2008 for Baltimore City? Which have
#' seen increases in emissions from 1999–2008? Use the ggplot2 plotting system
#' to make a plot answer this question.
library(ggplot2)

# Load the dataset
NEI <- readRDS("summarySCC_PM25.rds")

# Set up a PNG device
png(filename = "plot3.png")

# Plot Emissions by year faceted by type as bar plots
ggplot(NEI, aes(factor(year), Emissions)) +
    facet_grid(vars(type)) +
    stat_summary(fun = "sum", geom = "bar") +
    labs(title = "Annual PM2.5 Emissions, Faceted by Type") +
    labs(x = "Year", y = "Total PM2.5 Emissions (tons)")

# Save and close the PNG
dev.off()
