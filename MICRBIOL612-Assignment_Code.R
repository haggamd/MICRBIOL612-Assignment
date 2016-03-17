gapminder <- read.csv("gapminder-FiveYearData.csv")
Asia_Data <- gapminder[gapminder$continent == "Asia",]
lifeExp_over_time <- Asia_Data[,c(2,5)]
lifeExp_by_year <- function(time) {
  lifeExp_over_time[lifeExp_over_time$year == time,]
}
mean_lifeExp_by_year <- function(time) {
  lifeExp_by_year_matrix <- lifeExp_by_year(time)
  result_mean <- mean(lifeExp_by_year_matrix[,2])
  return(result_mean)
}

library(ggplot2)
ggplot(data = Asia_Data, aes(y = lifeExp, x = year, color = country)) + geom_point() + ggtitle("Life Expectancy in Asian Countries: 1952 to 2007") + labs(x="Year",y="Life Expectancy") + stat_summary(fun.y = mean,geom = "line", colour = "black", aes(group=1))

