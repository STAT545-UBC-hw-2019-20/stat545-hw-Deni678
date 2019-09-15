Gapminder Data Set Exploration
================
Denitsa Vasileva
2019-09-14

Loading the gapminder data set
==============================

gapminder is a built-in data set in R. To load it we use the following code:

``` r
library(gapminder)
```

Exploring the gapminder data set
================================

Summary statistics
------------------

The following code provides summary statistics for the gapminder data set.

``` r
summary(gapminder)
```

    ##         country        continent        year         lifeExp     
    ##  Afghanistan:  12   Africa  :624   Min.   :1952   Min.   :23.60  
    ##  Albania    :  12   Americas:300   1st Qu.:1966   1st Qu.:48.20  
    ##  Algeria    :  12   Asia    :396   Median :1980   Median :60.71  
    ##  Angola     :  12   Europe  :360   Mean   :1980   Mean   :59.47  
    ##  Argentina  :  12   Oceania : 24   3rd Qu.:1993   3rd Qu.:70.85  
    ##  Australia  :  12                  Max.   :2007   Max.   :82.60  
    ##  (Other)    :1632                                                
    ##       pop              gdpPercap       
    ##  Min.   :6.001e+04   Min.   :   241.2  
    ##  1st Qu.:2.794e+06   1st Qu.:  1202.1  
    ##  Median :7.024e+06   Median :  3531.8  
    ##  Mean   :2.960e+07   Mean   :  7215.3  
    ##  3rd Qu.:1.959e+07   3rd Qu.:  9325.5  
    ##  Max.   :1.319e+09   Max.   :113523.1  
    ## 

How many countries are represented in this data set?
----------------------------------------------------

To find how many countries are represented in the data set we use the following code:

``` r
num_countries<- length(unique(gapminder$country))
print (num_countries)
```

    ## [1] 142

This shows that 142 countries were included in this study.

What was the country with the lowest GDP per capita overall?
------------------------------------------------------------

``` r
min_GDP_country <- data.frame(gapminder[gapminder$gdpPercap==min (gapminder$gdpPercap),])
print (min_GDP_country )
```

    ##            country continent year lifeExp      pop gdpPercap
    ## 1 Congo, Dem. Rep.    Africa 2002  44.966 55379852  241.1659

What was the country with the highest GDP per capita?
-----------------------------------------------------

``` r
max_GDP_country <- data.frame(gapminder[gapminder$gdpPercap==max (gapminder$gdpPercap),])
print (max_GDP_country)
```

    ##   country continent year lifeExp    pop gdpPercap
    ## 1  Kuwait      Asia 1957  58.033 212846  113523.1

What was the country with the lowest GDP per capita for each of the years the information was recorded?
-------------------------------------------------------------------------------------------------------

``` r
df_min_GDP_year <- data.frame()
years<- unique(gapminder$year)
for (year in years){
  new_df<-data.frame(gapminder[gapminder$year==year,])
  x<-new_df[(new_df$gdpPercap==min(new_df$gdpPercap)),]
  df_min_GDP_year<-rbind(df_min_GDP_year,x )
}
print(df_min_GDP_year)
```

    ##              country continent year lifeExp      pop gdpPercap
    ## 74           Lesotho    Africa 1952  42.138   748747  298.8462
    ## 741          Lesotho    Africa 1957  45.047   813338  335.9971
    ## 18           Burundi    Africa 1962  42.045  2961915  355.2032
    ## 88           Myanmar      Asia 1967  49.379 25870271  349.0000
    ## 881          Myanmar      Asia 1972  53.070 28466390  357.0000
    ## 882          Myanmar      Asia 1977  56.059 31528087  371.0000
    ## 883          Myanmar      Asia 1982  58.056 34680442  424.0000
    ## 884          Myanmar      Asia 1987  58.339 38028578  385.0000
    ## 885          Myanmar      Asia 1992  59.320 40546538  347.0000
    ## 28  Congo, Dem. Rep.    Africa 1997  42.587 47798986  312.1884
    ## 281 Congo, Dem. Rep.    Africa 2002  44.966 55379852  241.1659
    ## 282 Congo, Dem. Rep.    Africa 2007  46.462 64606759  277.5519

What was the country with the highest GDP per capita for each of the years the information was recorded?
--------------------------------------------------------------------------------------------------------

``` r
df_max_GDP_year <- data.frame()
years<- unique(gapminder$year)
for (year in years){
  new_df<-data.frame(gapminder[gapminder$year==year,])
  x<-new_df[(new_df$gdpPercap==max(new_df$gdpPercap)),]
  df_max_GDP_year<-rbind(df_max_GDP_year,x )
}
print(df_max_GDP_year)
```

    ##          country continent year lifeExp      pop gdpPercap
    ## 72        Kuwait      Asia 1952  55.565   160000 108382.35
    ## 721       Kuwait      Asia 1957  58.033   212846 113523.13
    ## 722       Kuwait      Asia 1962  60.470   358266  95458.11
    ## 723       Kuwait      Asia 1967  64.624   575003  80894.88
    ## 724       Kuwait      Asia 1972  67.712   841934 109347.87
    ## 725       Kuwait      Asia 1977  69.343  1140357  59265.48
    ## 110 Saudi Arabia      Asia 1982  63.012 11254672  33693.18
    ## 96        Norway    Europe 1987  75.890  4186147  31540.97
    ## 726       Kuwait      Asia 1992  75.190  1418095  34932.92
    ## 961       Norway    Europe 1997  78.320  4405672  41283.16
    ## 962       Norway    Europe 2002  79.050  4535591  44683.98
    ## 963       Norway    Europe 2007  80.196  4627926  49357.19
