Visualization

plot<- function(a,b){
  {
    Country<-a
    data2<- filter(b, Country==a, Year>1996)
    c<-ggplot(data=data2)+geom_col(aes(x=Year, y=Aid, fill=Health_Percent))+ggtitle(Country)
    print(c)
  }
}

plot("Canada", compareaid)