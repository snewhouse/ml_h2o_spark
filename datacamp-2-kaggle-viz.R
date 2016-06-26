# ac_survey and dplyr are available
library(dplyr)

# URL to AC survey data
acs_url <- "http://s3.amazonaws.com/assets.datacamp.com/production/course_835/datasets/ac_survey.RData"

# Import data in .RData file at acs_url
load(url(acs_url))

# Print head of ac_survey
head(ac_survey, n=20)

# data frame that translates SCHL to Degree
degree_codes <- data.frame(SCHL = c(21, 22, 24),
                           Degree = c("Bachelor", "Masters", "Doctorate"))

# Add code to remove NAs, filter and join
ac_survey_clean <- ac_survey %>%
    tbl_df()  %>%
    na.omit() %>%
    filter(SCHL %in% c(21, 22, 24)) %>%
    inner_join(degree_codes)


# Print out ac_survey_clean

ac_survey_clean


# ac_survey_clean and dplyr are available

# group_by() and summarize()
degree_holders <- ac_survey_clean %>%
    group_by(Degree) %>%
    summarize(count=n())


# Print out degree_holders
degree_holders

# Load the ggplot2 package
library(ggplot2)

# Load the ggplot2 package
library(ggplot2)

# Visualize the number of Bachelor, Master and PhD holders
ggplot(degree_holders, aes(x = Degree, y = count, fill = Degree)) +
    geom_bar(stat = "identity") +
    xlab("Degree") +
    ylab("No of People") +
    ggtitle("Comparing Degree Holders in the US")

# income is available in the workspace, ggplot2 is pre-loaded

# Create the boxplots
ggplot(income, aes(x = Degree , y = MedianIncome, fill = Degree )) +
    geom_boxplot() +
    xlab("Degree") +
    ylab("MedianIncome") +
    ggtitle("Comparing Income of Degrees Holders")

# pigeon is pre-loaded

# Load required packages
library(dplyr)
library(ggplot2)

# Finish the chain of dplyr functions
pigeon %>%
    group_by(Color) %>%
    summarize(count = n()) %>%
    filter(count > 10) %>%
    inner_join(pigeon) %>%
    group_by(Color) %>%
    summarise(AvgSpeed=mean(Speed))

# Plot Speed against Pos
ggplot(pigeon, aes(x = Pos, y = Speed)) +
    geom_point() +
    xlab("Rank") +
    ylab("Pigeon Speed") +
    ggtitle("The correlation between speed and rank")

# Finish the ggplot() command
ggplot(chopstick, aes(x = pinching_eff, fill = chopstick_length)) +
    geom_density(alpha = 0.3) +
    xlab("Food Pinching Efficiency") +
    ylab("Relative Frequency")

# Silver minted over time
ggplot(silver, aes(x = year, y = silver_minted)) +
    geom_area(alpha = 0.3)

# Add cum_silver_minted column to silver
silver$cum_silver_minted <- cumsum(silver$silver_minted)

# Cumulative silver minted over time
ggplot(silver, aes(x = year, y = cum_silver_minted)) +
    geom_area(alpha = 0.5)

# Get the average price per state
avg_weed <- weed %>%
    group_by(state) %>%
    summarise(avg_weed=mean(price))

# Update column names
colnames(avg_weed) <- c("region", "value")

# Create a choropleth map
state_choropleth(avg_weed, title="Average Weed Price Per State", legend="Price in $")


#> state_choropleth
#function (df, title = "", legend = "", num_colors = 7, zoom = NULL,
#          reference_map = FALSE)
#{
#    c = StateChoropleth$new(df)
#    c$title = title
#    c$legend = legend
#    c$set_num_colors(num_colors)
#    c$set_zoom(zoom)
#    if (reference_map) {
#        if (is.null(zoom)) {
#            stop("Reference maps do not currently work with maps that have insets, such as maps of the 50 US States.")
#        }
#        c$render_with_reference_map()
#    }
#    else {
#        c$render()
#    }}
#<environment: namespace:choroplethr>

