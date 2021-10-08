#Wrangling code

pacman::p_load('dplyr', 'ggplot2', 'tidyr', 'knitr', 'stringr', 'tibble', 'readr')

aid <- read_csv("aid_given_2007_us.csv")
health <- read_csv("health_aid_given_percent_of_aid.csv")

#tidy data
aidgiven<- aid %>% pivot_longer(!country, names_to ="Year", values_to ="count")
healthaid<- health %>% pivot_longer(!country, names_to="Year", values_to="count")

#left join the data and call it compareaid
#used left join with aid on left because aid has more rows than healthaid
#join by year and country because those variables are on both data sets
compareaid<- left_join(aidgiven, healthaid, by=c("Year", "country"))

#rename the columns appropriately 
compareaid<- rename(.data=compareaid, Aid=count.x, Health_Percent=count.y)
#make compareaid into a kable
compareaid%>%kable()
#check that compareaid is tibble
#is_tibble(compareaid)

