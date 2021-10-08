#Visualization

#create a function to filter the data set
#want to be able to get a specific country and year span
#fill the bar with the percentage of health aid given that year
#I chose to look at Canada from 1997 to 2006, the end of data collected
plot<- function(a,b){
  {
    country<-a
    data2<- filter(b, country==a, Year>1996)
    c<-ggplot(data=data2)+geom_col(aes(x=Year, y=Aid, fill=Health_Percent))+ggtitle(country)
    print(c)
  }
}

plot("United States", compareaid)
plot("Japan", compareaid)




