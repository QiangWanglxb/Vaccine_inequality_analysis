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
world_2 <- left_join(world, supply, by = c("gu_a3" = "ISO")) 
class(world_1)

pDTPCV <- ggplot(data = world_2) +
  geom_sf(aes(fill = factor(DTPCV_code)), show.legend = FALSE)+  
  theme_void() + 
  scale_fill_manual(values = c("1"="#8B0000","2" = "#D73027","3" = "#FC8D59","4"="#FEE08B","5"= "#4393c3","6"="grey90"), 
                    labels=c("5~6 years","3~4 years","2 years","1 year","No reported stock-out all 8 years","Others"), name="Type") +
  labs(title="DTPCV stock-outs") +
  theme(plot.title = element_text(hjust = 0.5, size =12))+
  theme(legend.position = "None")

pMCV <- ggplot(data = world_2) +
  geom_sf(aes(fill = factor(MCV_code)), show.legend = FALSE)+  
  theme_void() + 
  scale_fill_manual(values = c("1"="#8B0000","2" = "#D73027","3" = "#FC8D59","4"="#FEE08B","5"= "#4393c3","6"="grey90"), 
                    labels=c("5~6 years","3~4 years","2 years","1 year","No reported stock-out all 8 years","Others"), name="Type") +
  labs(title="MCV stock-outs") +
  theme(plot.title = element_text(hjust = 0.5, size =12)) +
  theme(legend.position = "None")

pIPV <- ggplot(data = world_2) +
  geom_sf(aes(fill = factor(IPV_code)), show.legend = TRUE)+  
  theme_void() + 
  scale_fill_manual(values = c("1"="#8B0000","2" = "#D73027","3" = "#FC8D59","4"="#FEE08B","5"= "#4393c3","6"="grey90"), 
                    labels=c("5~6 years","3~4 years","2 years","1 year","No reported stock-out all 8 years","Others"), name="Type") +
  labs(title="IPV stock-outs") +
  theme(plot.title = element_text(hjust = 0.5, size =12)) +
   theme(legend.position = "bottom")

pDTPCV / pMCV / pIPV 

ggplot(data = world_2) +
  geom_sf(aes(fill = factor(HBR_code)), show.legend = TRUE)+  
  theme_void() + 
  scale_fill_manual(values = c("1"="#8B0000","2" = "#D73027","3" = "#FC8D59","4"="#FEE08B","5"= "#4393c3","6"="grey90"), 
                    labels=c("7~8 years","5~6 years","3~4 years","1~2 years","No reported stock-out all 9 years","Others"), name="Type") +
  labs(title="HBR stock-outs") +
  theme(plot.title = element_text(hjust = 0.5, size =12)) +
  theme(legend.position = "None")

