library(tidyverse)
library(nycflights13)

flights

filter(flights, month==1, day==1)


sqrt(2)^2 ==1  # it is false, 

filter(flights, month ==11 | month ==12)

nov_dec <- filter(flights, month %in% c(11,12))   # %in% in operator
nov_dec


NA | TRUE

NA & TRUE

NA*0

is.na(NA)

df <- tibble(x=c(1,2,3))

df <- tibble(x=c(1:10))

df

flights

filter(flights, arr_delay>=120)


filter(flights, dest =="IAH" | dest =="HOU")

filter(flights, between(hour,0,6))

NA*0


arrange(flights, year, desc(month), desc(day))

arrange(flights, !is.na(dep_time))


select(flights,year, month, day, flight, tailnum, everything())

select(flights, -(year:dep_delay))

select(flights, contains("delay"))

rename(flights, car = carrier)  # carrier renamed as car

select(flights, starts_with("dep"), starts_with("arr") )

select(flights, dep_time, arr_time, dep_time)

select(flights, contains("time"))


flights_sml <- select(flights,
                      year:day,
                      ends_with("delay"),
                      distance,
                      air_time)

mutate(flights_sml,
       gain = dep_delay - arr_delay,
       speed = distance/air_time*60)


#transmute preserves only the new columns
transmute(flights_sml,
       gain = dep_delay - arr_delay,
       speed = distance/air_time*60)

# %/% integer division

5%/%3

5/3

# %% is module
5%%3

x<-c(1:10)
x

lag(x)
lead(x)

cumsum(x)
cummin(x)
cumprod(x)
factorial(10)

by_day = group_by(flights, month, day, year)

by_day

summarise(by_day,delay=mean(dep_delay, na.rm = TRUE))

flights %>% group_by(year, month, day) %>% summarise(mean = mean(dep_delay))

