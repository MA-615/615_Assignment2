## Modification Note: 
## creating a new ggplot function, to calculate the share of aid on non-health and health 
## also to reduce redundant codes 
## including only function codes in the file 
ggfun <- function(c, data){
  data1 <- data %>%
    mutate(cat = "health")
  
  data_extra <- data %>%
    mutate(Health_Percent = 100-Health_Percent) %>%
    mutate(cat = "non health")%>%
    subset(., select = c("country", "Year", "Aid","Health_Percent", "cat"))
  
  work_data <- rbind(data1, data_extra)%>%
    filter(., country == c, Year >1996)
  
  p <- ggplot(work_data, 
              aes(x = Year, y = Health_Percent, fill = cat)) +
    labs(y = "Share", x = "Year") + 
    ggtitle(c)
  
  return(p)
}
