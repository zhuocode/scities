# create object
x = 1:9
# what is it's length
length(x)
class(x)

y = sqrt(x)
class(y)
y

zone_names = c("armley", "chaltown", "headingly") 
length(zone_names)
zone_names = rep(x = zone_names, 3)
length(zone_names)
class(zone_names)

d = data.frame(zone_names, x, y)
d$pop = d$x ^ 2 + 100 * 2
m = lm(formula = pop ~ x, data = d)
summary(m)

plot(d$x, d$pop)
d$fitted = m$fitted.values
lines(d$x, d$fitted)
