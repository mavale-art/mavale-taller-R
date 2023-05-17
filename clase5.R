# Create a sample data frame with a numeric column
df <- data.frame(numeric_col = c(1, 2, 3, 4, 5))

# Convert the numeric column to a character column using the as.character() function
df$character_col <- as.character(df$numeric_col)

# Check the class of the new character column
class(df$character_col)  # "character"

# Create a sample data frame with a character column
df <- data.frame(character_col = c("1", "2", "3", "4", "5"))

# Convert the character column to a numeric column using the as.numeric() function
df$numeric_col <- as.numeric(df$character_col)

# Check the class of the new numeric column
class(df$numeric_col)  # "numeric"



# Load required libraries
library(dplyr)
library(summarytools)
library(ggplot2)
library(readr)

# Load happiness index dataset
happiness_data <-read_csv("C:/Users/black/Downloads/2018.csv")

head(happiness_data)

#change names if necesary
names(happiness_data)[1] <- "Rank"
names(happiness_data)[2] <- "Country"
names(happiness_data)[3] <- "Score"

names(happiness_data)[4] <- "gdp"

# Check the structure of the dataset
str(happiness_data)

# Remove duplicates, missing values and irrelevant columns
happiness_data_cleaned <- happiness_data %>%
  distinct() %>%  # remove duplicates
  #select(-Country) %>%  # remove irrelevant column
  na.omit()       # remove missing values

# Generate summary statistics using summarytools library
summary(happiness_data_cleaned)

# Customize summary tables
freq(happiness_data_cleaned$Country, style = "rmarkdown")
ctable(happiness_data_cleaned$Score, happiness_data_cleaned$Country,
       method = "render", caption = "Happiness Scores by Country")

# Create statistical graphs using ggplot2
ggplot(happiness_data_cleaned, aes(x = Score)) +
  geom_histogram(binwidth = 1, fill = "lightblue", color = "black") +
  labs(title = "Distribution of Happiness Scores",
       x = "Happiness Scores", y = "Frequency")

ggplot(happiness_data_cleaned, aes(x = gdp, y = Score)) +
  geom_point(color = "red") +
  labs(title = "Happiness Score vs. GDP per Capita",
       x = "GDP per Capita", y = "Happiness Score")
