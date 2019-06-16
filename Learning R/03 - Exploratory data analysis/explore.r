library(tidyverse)

diamonds %>% count(cut)

ggplot(data = diamonds)+
  geom_histogram(mapping = aes(x=carat), binwidth = 0.5)

smaller <- diamonds %>% filter(carat <3)

ggplot(data = smaller)+
  geom_histogram(mapping = aes(x=carat), binwidth = .1)

ggplot(data = smaller, aes(x=carat, colour=cut))+
  geom_freqpoly(binwidth = .1)

ggplot(data = smaller, mapping = aes(x=carat))+
  geom_histogram( binwidth = .01)

ggplot(data=faithful, mapping=aes(x=eruptions))+
  geom_histogram(binwidth = .25)

?diamonds

diamonds %>% filter(carat == 1)
