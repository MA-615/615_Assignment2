#Wrangling code

pacman::p_load('dplyr', 'ggplot2', 'tidyr', 'knitr', 'stringr', 'tibble')

#assign data an easier name to call
aid<- aid_given_2007_us
#change column names of years to not include an X
names(aid)<- str_replace(names(aid), "X", "")
#change column name for country
aidgiven<- rename(.data=aid, Country=ï..country)
#tidy data
aidgiven<- aidgiven %>% pivot_longer(!Country, names_to ="Year", values_to ="count")

#repeat with health aid given data
health<- health_aid_given_percent_of_aid
names(health)<- str_replace(names(health), "X", "")
healthaid<- rename(.data=health, Country=ï..country)
healthaid<- healthaid %>% pivot_longer(!Country, names_to="Year", values_to="count")

compareaid<- left_join(aidgiven, healthaid, by=c("Year", "Country"))

compareaid<- rename(.data=compareaid, Aid=count.x, Health_Percent=count.y)
compareaid%>%kable()
is_tibble(compareaid)


