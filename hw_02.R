library(gapminder)
library (tidyverse)
# Exercise 1: 1.1
filter(gapminder, 
       country == 'Canada'| country== 'United Kingdom' | country== 'Germany') %>%
  filter(year %in% (1970:1979)) %>%
  DT::datatable() 

# Exercise 1: 1.2
filter(gapminder, country == 'Canada'| country == 'United Kingdom'| country== 'Germany') %>% 
  filter(year %in% (1970:1979)) %>%
  select(country,gdpPercap) %>%
  DT::datatable() 

# Exercise 1: 1.3
gapminder %>%
mutate (increaseLifeExp = if_else(country == lag(country), 
                                  lifeExp-lag(lifeExp),0)) %>% 
  filter( increaseLifeExp<0)%>%
  DT::datatable() 

# Exercise 1: 1.4
gapminder %>% 
  group_by(country) %>%
  filter(gdpPercap== max(gdpPercap)) %>%
  DT::datatable() 
# Exercise 1: 1.5

gapminder %>%
  select (country,gdpPercap,lifeExp) %>%
  filter (country=='Canada') %>%
  ggplot(aes(gdpPercap,lifeExp)) +  geom_point(alpha = 0.5) +
  scale_x_log10("GDP per capita in Canada", labels = scales::dollar_format()) +
  theme_bw() + ylab("LifeExp in Canada") + 
ggtitle("Life Expectancy vs GDP per capita in Canada")

# Exercise 2:
# categorical variable = continent
# quantitative variable = gdpPercap

# What are possible values for each variable?
# Range for continent
summary(gapminder$continent)
# Range for gdp per capita
summary (gapminder$gdpPercap)  
boxplot(gapminder$gdpPercap)

#Spread of continents
gapminder$continent %>%
summary() %>% barplot()

# Standard Deviation for GDP per Cap
sd(gapminder$gdpPercap)

# Exercise 3: Explore various plot types


 
#ggplot(aes(Ozone,Temp)) + geom_point(alpha=0.5) +  scale_x_continuous("Ozone") +
# theme_bw() + ylab("Temp") + ggtitle("Mean Ozone vs Temperature")


airquality %>%
  select(Month, Ozone) %>%
  # removing NA values
  filter(!is.na(Month) & !is.na(Ozone)) %>%
  group_by(Month) %>% 
  mutate(meanOzone=mean(Ozone)) %>%
  select(unique(Month),unique(meanOzone))
  #mutate(mean)
  #barplot()
  
# Bonus
# The following code (filter(gapminder, country == c("Rwanda", "Afghanistan"))) doesn't work because :

library(gapminder)
# The code described in teh assignment does not achieve the desired result.
# It returns only hald the entries needed. 
# It skips every second entry for Rwanda and every first for Afghanistan.
# This is because the filter function was looking for Rwanda and Afghanistan together and not first for all the entries of Rwanda and then all the entries of Afghanistan
# It recycled the vector. It looked for Rwanda, then Afghanistan, then Rwanda and so on.
# Corrected Version:
gapminder %>%
  filter( country == "Rwanda"| country== "Afghanistan")

