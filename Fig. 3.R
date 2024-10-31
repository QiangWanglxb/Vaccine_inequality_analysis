library(tidyr)
library(dplyr)
library(ggplot2)
library(ggpubr) 
library(patchwork)
library(cowplot)

library(sf)
library(rnaturalearth)
library(rnaturalearthdata)
library(viridis)
library(RColorBrewer)

world <- ne_countries(scale = "medium", returnclass = "sf")

#supply <- read.csv('C:/Users/DELL/Desktop/supply_Income_group for map2.CSV',header = T) 
world_1 <- left_join(world, supply, by = c("geounit" = "COUNTRY_r"))
class(world_1)


pDTPCV <- ggplot(data = world_1) +
  geom_sf(aes(fill = factor(DTPCV)), show.legend = FALSE)+  
  theme_void() + 
  scale_fill_manual(values = c("1"="#b2182b","2" = "#d6604d","3" = "#f4a582","4"= "#4393c3","5"="grey90"), 
                    labels=c("4~5 years","2~3 years","1 year","No reported stock-out all 8 years","Others"), name="Type") +
  labs(title="Reported national DTPCV stock-outs from 2015 to 2022") +
  theme(plot.title = element_text(hjust = 0.5, size =12))

pMCV <- ggplot(data = world_1) +
  geom_sf(aes(fill = factor(MCV)), show.legend = FALSE)+  
  theme_void() + 
  scale_fill_manual(values = c("1"="#b2182b","2" = "#d6604d","3" = "#f4a582","4"= "#4393c3","5"="grey90"), 
                    labels=c("4~5 years","2~3 years","1 year","No reported stock-out all 8 years","Others"), name="Type") +
  labs(title="Reported national MCV stock-outs from 2015 to 2022") +
  theme(plot.title = element_text(hjust = 0.5, size =12))

pIPV <- ggplot(data = world_1) +
  geom_sf(aes(fill = factor(IPV_group)), show.legend = TRUE)+  
  theme_void() + 
  scale_fill_manual(values = c("1"="#b2182b","2" = "#d6604d","3" = "#f4a582","4"= "#4393c3","5"="grey90"), 
                    labels=c("4~5 years","2~3 years","1 year","No reported stock-out all 8 years","Others"), name="Type") +
  labs(title="Reported national IPV stock-outs from 2015 to 2022") +
  theme(plot.title = element_text(hjust = 0.5, size =12)) +
   theme(legend.position = "bottom")

pDTPCV / pMCV / pIPV 

ggplot(data = world_1) +
  geom_sf(aes(fill = factor(Mother_group)), show.legend = TRUE)+  
  theme_void() + 
  scale_fill_manual(values = c("0"="#b2182b","1" = "#d6604d","2" = "#f4a582","3"= "#fddbc7","4"="#4393c3","5"="grey90"), 
                    labels=c("6~7 years","4~5 years","2~3 years","1 year","No reported stock-out all 8 years","Others"), name="Type") +
  labs(title="Reported stock-out of home-based vaccination records for children and/or women from 2015 to 2022") +
  theme(plot.title = element_text(hjust = 0.5, size =12)) +
  theme(legend.position = "bottom")

