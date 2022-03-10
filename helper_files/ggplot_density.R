library(ggplot2)
library(tidyverse)
#make a normal distribution to graph
set.seed(3000)
xseq<-seq(1,7,.01)
densities <-dnorm(xseq, 4,1)

library(readxl)
dt <- read_excel("/Volumes/USB_MALTE/df_dekif.xlsx",
                       na = c("-9995","-9990","-9991","-9992","-999", "-99")) %>% select(problm_1,problm_2) %>% na.omit() %>%
  mutate(commitment=problm_1+problm_2)

ggplot(dt, aes(x=commitment)) + 
  #geom_histogram(aes(y=..density..), colour="black", fill="white")+
  geom_density(alpha=.2, fill="#FF6666", bw=0.5) 
