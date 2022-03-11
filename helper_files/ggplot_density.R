library(ggplot2)
library(tidyverse)
#make a normal distribution to graph
set.seed(3000)
xseq<-seq(1,7,.01)
densities <-dnorm(xseq, 4,1)

library(readxl)
dt <- read_excel("/Volumes/USB_MALTE/df_dekif.xlsx",
                       na = c("-9995","-9990","-9991","-9992","-999", "-99")) %>% select(problm_1,problm_2,problm_5,problm_6) %>% na.omit() %>%
  mutate(commitment=problm_1+problm_2)%>%
  mutate(communication=problm_5+problm_6) %>% sample_n(150)

saveRDS(dt,"/Users/maltehueckstaedt/Documents/Dokumente/GitHub/Shiny_DEKiF/Shiny-Collaborations/data/dt.rds")

ggplot(dt, aes(x=commitment)) + 
  geom_density(alpha=.2, fill="#FF6666", bw=0.5)+
  geom_vline(xintercept = 5, color="red")+ 
  annotate("text", x = 5, y = 0.1, label = "Your Score", 
           vjust = 1.5,angle = 90, color="red")+ ggtitle("Commitment: \n How does your score compare to others?")+theme(
             plot.title = element_text(color="red", size=14, face="bold.italic"))+
  theme(plot.title = element_text(hjust = 0.5))
 
library(psych)
skew(dt$commitment)
kurtosi(dt$commitment)
mean(dt$commitment)
var(dt$commitment)

library("PearsonDS")
moments <- c(mean = 8.04828,variance = 2.370136,skewness = -0.8688043, kurtosis = 0.9198085)
rpearson(10, moments = moments)
