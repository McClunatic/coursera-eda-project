#' Question 3:
#' Of the four types of sources indicated by the \color{red}{\verb|type|}type
#' (point, nonpoint, onroad, nonroad) variable, which of these four sources have
#' seen decreases in emissions from 1999–2008 for Baltimore City? Which have
#' seen increases in emissions from 1999–2008? Use the ggplot2 plotting system
#' to make a plot answer this question.

# Load the dataset
NEI <- readRDS("summarySCC_PM25.rds")

# Set up a PNG device
png(filename = "plot3.png")

# Plot Emissions by year faceted by type as bar plots
ggplot(NEI, aes(factor(year), Emissions)) + facet_grid(vars(type)) + geom_col()

# Save and close the PNG
dev.off()
