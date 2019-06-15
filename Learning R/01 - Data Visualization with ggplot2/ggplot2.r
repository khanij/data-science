# This is a comment

#install the package tidyverse
install.packages("tidyverse")

# Load tidyverse library.
library(tidyverse)

# qn: do car with big engine use more fuel than cars with small engine?
#ans, we use the dataframe 'mpg' from ggplot2 package to answer this

mpg   # this shall show the sample data from the dataframe 'mpg'
?mpg  # help doc on mpg   displ : car engine size, hwy : highway miles per gallon

#creating a plot

ggplot(data = mpg) +
         geom_point(mapping = aes(x=displ, y=hwy))

ggplot(data = mpg) +geom_point(mapping = aes(x=hwy, y=cyl))

ggplot(data = mpg) +geom_point(mapping = aes(x=class, y=drv))


ggplot(data = mpg) +
  geom_point(mapping = aes(x=displ, y=hwy, colour = class))
             
ggplot(data = mpg) +
  geom_point(mapping = aes(x=displ, y=hwy, size = class))

ggplot(data = mpg) +
  geom_point(mapping = aes(x=displ, y=hwy, alpha = class))  # alpha - transparency

ggplot(data = mpg) +
  geom_point(mapping = aes(x=displ, y=hwy, shape = class))

ggplot(data = mpg) +
  geom_point(mapping = aes(x=displ, y=hwy), color = "blue")


ggplot(data = mpg) +
  geom_point(mapping = aes(x=displ, y=hwy, colour = displ<5))

ggplot(data = mpg) +
  geom_point(mapping = aes(x=displ, y=hwy))+
  facet_wrap(~class, nrow = 2)

ggplot(data = mpg)+
  geom_point(mapping = aes(x=displ, y=hwy))+
  facet_grid(drv~cyl)

ggplot(data = mpg)+
  geom_point(mapping = aes(x=displ, y=hwy))+
  facet_grid(.~cyl)


mpg$drv
mpg$cyl


ggplot(data = mpg)+
  geom_point(mapping = aes(x=drv, y=cyl))

ggplot(data = mpg)+
  geom_point(mapping = aes(x=displ, y=hwy ))

ggplot(data = mpg)+
  geom_smooth(mapping = aes(x=displ, y=hwy ))   # line fit


ggplot(data = mpg)+
  geom_smooth(mapping = aes(x=displ, y=hwy, linetype = drv ))   # line fit for different drvs.

ggplot(data = mpg)+
  geom_point(mapping = aes(x=displ, y=hwy, shape = drv ))   # scatter plot for different drvs.


ggplot(data = mpg)+
  geom_smooth(mapping = aes(x=displ, y=hwy, group = drv ))   # one can group, notice this is similar to linetype= drv
# but does not display the legend.

ggplot(data = mpg)+
  geom_smooth(mapping = aes(x=displ, y=hwy, color = drv ),
              show.legend = FALSE)   # line fit for different drvs.  # notice, show.legend is parameter to the geom_fn.


ggplot(data=mpg)+
  geom_smooth(mapping = aes(x=displ, y=hwy))+
  geom_point(mapping = aes(x=displ, y=hwy))


ggplot(data=mpg, mapping = aes(x=displ, y=hwy))+
         geom_smooth()+
         geom_point()


ggplot(data=mpg, mapping = aes(x=displ, y=hwy))+
  geom_point(aes(color=class))+
  geom_smooth(se=FALSE)     ## se = show the disperse or not, range fit and not just line fit

ggplot(data=mpg, mapping = aes(x=displ, y=hwy))+
  geom_point(aes(color=class))+
  geom_smooth(data= filter(mpg, class=="subcompact"),
              se=FALSE)


ggplot(data=mpg, mapping = aes(x=displ, y=hwy, color=drv))+
  geom_point()+
  geom_smooth(se=FALSE)



ggplot(data=mpg, mapping = aes(x=displ, y=hwy))+
  geom_point(aes(color=drv)) +
  geom_smooth(aes(linetype=drv), se=FALSE )


ggplot(data=diamonds)+
  geom_bar(mapping = aes(x=cut))

?geom_bar

ggplot(data=diamonds)+
  stat_count(mapping = aes(x=cut))


## changing the stat of the bar chart
 demo <- tribble(
   ~a, ~b,
   "bar_1",10,
   "bar_2", 20,
   "bar_3", 30
 )

demo

ggplot(data=demo)+
  geom_bar(mapping = aes(x=a, y=b), stat=
             "identity")

ggplot(data=diamonds)+
  geom_bar(
    mapping = aes(x=cut, y=..prop.., group=1)
  )

ggplot(data = diamonds)+
  stat_summary(
    mapping = aes(x=cut, y=depth),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
  )

?stat_summary

?geom_col

?stat_smooth

ggplot(data=diamonds)+
  geom_bar(mapping = aes(x=cut, y=..prop.., fill=color))

ggplot(data = diamonds)+
  geom_bar(mapping = aes(x=cut, color=cut))


ggplot(data = diamonds)+
  geom_bar(mapping = aes(x=cut, fill=cut))

ggplot(data = diamonds)+
  geom_bar(mapping = aes(x=cut, fill = clarity))


ggplot(data = diamonds, mapping = aes(x=cut, fill = clarity))+
  geom_bar(alpha= 1/5, position = "identity")   # notice, everything is starting from 0 and not stacked.


ggplot(data = diamonds, mapping = aes(x=cut, color = clarity))+
  geom_bar(fill=NA, position = "identity")

ggplot(data = diamonds, mapping = aes(x=cut, fill = clarity))+
  geom_bar(position = "fill")

ggplot(data = diamonds, mapping = aes(x=cut, fill = clarity))+
  geom_bar(position = "dodge")


ggplot(data=mpg, mapping=aes(x=displ, y= hwy))+
  geom_point(position = "jitter")


ggplot(data=mpg, mapping=aes(x=displ, y= hwy))+
  geom_jitter()



ggplot(data=mpg, mapping=aes(x=cty, y= hwy))+
  geom_jitter()

ggplot(data=mpg, mapping=aes(x=cty, y= hwy))+
  geom_count()


ggplot(data=mpg, mapping=aes(x=class, y= hwy))+
  geom_boxplot()  +
  coord_flip()
