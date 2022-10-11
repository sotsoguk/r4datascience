# 1. Data Visualisation
# load tidyverse

library(tidyverse)

# Using the mpg dataframe
# show some info about
mpg

# show explanation
?mpg

# First Scatter Plot
ggplot(data = mpg)+
  geom_point(mapping = aes(x=displ, y=hwy))

# Scatterplot class vs drv
ggplot(data = mpg)+
  geom_point(mapping = aes(x=class,y=drv))

# Adding aesthetics
ggplot(data = mpg)+
  geom_point(mapping = aes(x = displ,y=hwy, color =class))
# color has to be inside mapping, otherwise color for all data
ggplot(data = mpg)+
  geom_point(mapping = aes(x=displ,y=hwy),color="blue")

ggplot(data = mpg)+
  geom_point(mapping = aes(x=displ,y=hwy,color = class,shape = class))

# Facets / subplotsfor categories
ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ,y=hwy))+
  facet_wrap(~class,nrow=2)

# Subplots / Facets grid over two categories
ggplot(data = mpg)+
  geom_point(mapping = aes(x=displ,y=hwy))+
  facet_grid(drv ~cyl)

#  Leave out a dimension with . ( grid as wrap use)
ggplot(data = mpg)+
  geom_point(mapping = aes(x=displ,y=hwy))+
  facet_grid(. ~cyl)

# Exercises
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)

# Geometric Objetcts
ggplot(data = mpg)+
  geom_smooth(mapping =aes(x=displ,y=hwy, linetype=drv))

ggplot(data = mpg)+
  geom_smooth(mapping =aes(x=displ,y=hwy, linetype=drv))+
  geom_point(mapping = aes(x=displ,y=hwy, color = drv))

# Multiple Geoms, avoid duplicate code
# VERBOSE!!
# here, the mappings are local to geom
ggplot(data= mpg)+
  geom_point(mapping = aes(x=displ,y=hwy))+
  geom_smooth(mapping=aes(x=displ,y=hwy))

# BETTER
# here global mapping for all layers
ggplot(data = mpg,mapping=aes(x=displ,y=hwy))+
  geom_point()+
  geom_smooth()

# add mapping for some local layer
ggplot(data = mpg,mapping=aes(x=displ,y=hwy))+
  geom_point(mapping = aes(color=class))+
  geom_smooth(se = FALSE)

?geom_smooth

# Exercises
# 6.recreate graphs
# 1 2
# 3 4
# 5 6
#1.
ggplot(data=mpg, mapping=aes(x=displ,y=hwy))+
  geom_smooth(se = FALSE)+
  geom_point()
#2.
ggplot(data=mpg, mapping=aes(x=displ,y=hwy))+
  geom_smooth(mapping = aes(group=drv),se=FALSE)+
  geom_point()
#3.
ggplot(data=mpg, mapping=aes(x=displ,y=hwy,color=drv))+
  geom_smooth(se=FALSE)+
  geom_point()
#4.  
ggplot(data=mpg, mapping=aes(x=displ,y=hwy))+
  geom_smooth(se=FALSE)+
  geom_point(mapping=aes(color=drv))
#5.
ggplot(data=mpg, mapping=aes(x=displ,y=hwy))+
  geom_point(mapping=aes(color=drv))+
  geom_smooth(mapping=aes(linetype=drv), se=FALSE)
#6. 
ggplot(data=mpg,mapping=aes(x=displ,y=hwy))+
  geom_point(shape=21,mapping=aes(fill=drv),color="white",stroke=1)

# Statistical Transformation
diamonds

ggplot(data=diamonds)+
  geom_bar(mapping=aes(x=cut))
# geom_bar uses internally a stat transformation to count the categories
# same plot as above
ggplot(data=diamonds)+
  stat_count(mapping=aes(x=cut))
# every stat has a default geom and vice versa
# proportion instead of count
ggplot(data=diamonds)+
  geom_bar(mapping = aes(x=cut, y= ..prop..,group=1))
