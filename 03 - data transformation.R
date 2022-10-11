library(nycflights13)
library(tidyverse)
flights

# Filter with filter()
filter(flights, month == 1, day == 1)
jan1 <- filter(flights, month == 1, day == 1)
jan1

# comparisons ==, != etc
# for floating point use near
sqrt(2)^2 == 2
# FALSE
near(sqrt(2)^2,2)
# TRUE
# Logical Operators
# & AND   | OR    ! NOT
1 | 1
xor(1,2)

filter(flights, month == 11 | month == 12)
# or
filter(flights, month %in% c(11,12))
# or
filter(flights, month %in% seq(11,12))
# use DeMorgan
# !(x&y) == !x | !y

# NAS
is.na(NA)
df <- tibble(x = c(1,NA,3))
filter(df,x>1)
# preserve na
filter(df, is.na(x) | x>1)

# Exercises
# 1. All flights arrival delay >= 2 hours
filter(flights, arr_delay >= 120)
#2.
filter(flights, dest %in% c("IAH","HOU"))
#3.
airlines
filter(flights, carrier %in% c("UA","AA","DL"))
#d
filter(flights, month %in% seq(7,9))
# or
filter(flights, between(month,7,9))
#e
filter(flights, arr_delay >=120 & dep_delay <=0)
#f
filter(flights,dep_delay >= 60 & (dep_delay - arr_delay)>30)
