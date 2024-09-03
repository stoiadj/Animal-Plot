setwd("~/Desktop/Miami Metrics/Fall 24")


url <- "https://raw.githubusercontent.com/stoiadj/Animal-Data/main/animal_species_50.csv"

data <- read.csv(url)


install.packages("tidyverse")
library(tidyverse)

View(data)

ggplot(data) +
  geom_point(aes(x=Weight_kg, y=Height_m))


filtered_data <- data %>%
  filter(Weight_kg <= 200 & Height_m <= 1.5)



ggplot(filtered_data) +
  geom_point(aes(x=Weight_kg, y=Height_m)) +
  geom_text(aes(x = Weight_kg, y = Height_m, label = Species))


install.packages("ggrepel")
library(ggrepel)
ggplot(filtered_data) +
  geom_point(aes(x = Weight_kg, y = Height_m)) +
  geom_text_repel(aes(x = Weight_kg, y = Height_m, label = Species))


ggplot(filtered_data) +
  geom_point(aes(x = Weight_kg, y = Height_m)) +
  geom_text_repel(aes(x = Weight_kg, y = Height_m, label = Species)) +
  labs(x="Weight (kg)", y="Height (m)",
       title="The Weight and Height of Different Animals") +
  theme_bw() +
  theme(plot.title = element_text(face="bold", size=20, hjust=0.5),
        axis.title = element_text(face="bold", size=13),
        axis.text = element_text(size=12))


ggsave("Animal_plot.png")





