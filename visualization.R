Visualization

#create a function to filter the data set
#want to be able to get a specific country and year span
#fill the bar with the percentage of health aid given that year
#I chose to look at Canada from 1997 to 2006, the end of data collected
plot<- function(a,b){
  {
    Country<-a
    data2<- filter(b, Country==a, Year>1996)
    c<-ggplot(data=data2)+geom_col(aes(x=Year, y=Aid, fill=Health_Percent))+ggtitle(Country)
    print(c)
  }
}

plot("United States", compareaid)
plot("Japan", compareaid)

#same idea but with a bubble graph instead
library(viridis)
plot<- function(a,b){
  {
    Country<-a
    data2<- filter(b, Country==a, Year>1996)
    c<-ggplot(data=data2)+geom_point(aes(x=Year, y=Aid, size=Health_Percent))+scale_size(range = c(.5, 5), name="Health Aid Percentage")+ggtitle(Country)
    print(c)
  }
}

plot("United States", compareaid)
plot("Japan", compareaid)



plot<- function(a,b){
  {
    Year<-a
    data3<- filter(b, Year==a, Year>1996)
    c<-ggplot(data=data2)+geom_point(aes(x=Year, y=Aid, size=Health_Percent))+scale_size(range = c(.5, 5), name="Health Aid Percentage")+ggtitle(Country)
    print(c)
  }
}

plot("United States", compareaid)
plot("Japan", compareaid)


