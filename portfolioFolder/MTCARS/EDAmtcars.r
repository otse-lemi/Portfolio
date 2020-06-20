library('datasets')
library(ggplot2)
library(corrplot)
library(graphics)

str(mtcar_df)
class(mtcar_df)
colnames(mtcar_df)
head(mtcar_df, n=10)
tail(mtcar_df, n=5)
summary(mtcar_df)
fivenum(mtcars$mpg)
class(mtcars$cyl)

#All variables are numeric
#UNIVARIATE ANALYSIS - SCATTERPLOT
plot(mtcars$mpg)
plot(mtcars$cyl)
plot(mtcars$disp)
plot(mtcars$hp)
plot(mtcars$drat)
plot(mtcars$wt)
plot(mtcars$qsec)
plot(mtcars$vs)
plot(mtcars$am)
plot(mtcars$gear)
plot(mtcars$carb)

#CORRELATION MATRIX OF ALL COLUMNS
plot(mtcars)

plot(mtcars$mpg, type = "b")
plot(mtcars$mpg, type = "h")

#Histogram
hist(mtcars$mpg)
hist(mtcars$mpg, main = 'Miles Per Gallon',xlab = 'MPG.', col='red')
hist(mtcars$cyl, main = 'NUMBER OF CYLINDERS',xlab = 'CYL', col='red')
hist(mtcars$disp, main = 'DISPLACEMENT',xlab = 'DISP', col='red')
hist(mtcars$hp, main = 'GROSS HORSEPOWER',xlab = 'HP', col='red')
hist(mtcars$drat, main = 'REAR AXLE RATIO',xlab = 'DRAT', col='red')
hist(mtcars$wt, main = 'WEIGHT',xlab = 'WT', col='red')
hist(mtcars$qsec, main = 'QUARTER MILE TIME',xlab = 'QSEC', col='red')
hist(mtcars$vs, main = 'ENGINE',xlab = 'VS', col='red')
hist(mtcars$am, main = 'TRANSMISSION',xlab = 'AM', col='red')
hist(mtcars$gear, main = 'NUMBER OF GEARS',xlab = 'GEAR', col='red')
hist(mtcars$carb, main = 'NUMBER OF CARBERATORS',xlab = 'CARB', col='red')

#Barplot
barplot(mtcars$mpg, main = 'Miles Per Gallon',xlab = 'MPG.', col='blue')
barplot(mtcars$cyl, main = 'NUMBER OF CYLINDERS',xlab = 'CYL', col='blue')
barplot(mtcars$disp, main = 'DISPLACEMENT',xlab = 'DISP', col='blue')
barplot(mtcars$hp, main = 'GROSS HORSEPOWER',xlab = 'HP', col='blue')
barplot(mtcars$drat, main = 'REAR AXLE RATIO',xlab = 'DRAT', col='blue')
barplot(mtcars$wt, main = 'WEIGHT',xlab = 'WT', col='blue')
barplot(mtcars$qsec, main = 'QUARTER MILE TIME',xlab = 'QSEC', col='blue')
barplot(mtcars$vs, main = 'ENGINE',xlab = 'VS', col='blue')
barplot(mtcars$am, main = 'TRANSMISSION',xlab = 'AM', col='blue')
barplot(mtcars$gear, main = 'NUMBER OF GEARS',xlab = 'GEAR', col='blue')
barplot(mtcars$carb, main = 'NUMBER OF CARBERATORS',xlab = 'CARB', col='blue')

#Single box plot
boxplot(mtcars$mpg)


#Bivariate Analysis
plot(mtcars$mpg, mtcars$cyl)
plot(mtcars$mpg, mtcars$disp)
plot(mtcars$mpg, mtcars$hp)
plot(mtcars$mpg, mtcars$drat)
plot(mtcars$mpg, mtcars$wt)
plot(mtcars$mpg, mtcars$qsec)
plot(mtcars$mpg, mtcars$vs)
plot(mtcars$mpg, mtcars$am)
plot(mtcars$mpg, mtcars$gear)
plot(mtcars$mpg, mtcars$carb)

ggplot(mtcars,aes(x=cyl, y=mpg)) + geom_point(shape = 1)+ geom_smooth(method = lm)
ggplot(mtcars,aes(x=disp, y=mpg)) + geom_point(shape = 1)+ geom_smooth(method = lm)
ggplot(mtcars,aes(x=hp, y=mpg)) + geom_point(shape = 1)+ geom_smooth(method = lm)
ggplot(mtcars,aes(x=drat, y=mpg)) + geom_point(shape = 1)+ geom_smooth(method = lm)
ggplot(mtcars,aes(x=wt, y=mpg)) + geom_point(shape = 1)+ geom_smooth(method = lm)
ggplot(mtcars,aes(x=qsec, y=mpg)) + geom_point(shape = 1)+ geom_smooth(method = lm)
ggplot(mtcars,aes(x=gear, y=mpg)) + geom_point(shape = 1)+ geom_smooth(method = lm)
ggplot(mtcars,aes(x=carb, y=mpg)) + geom_point(shape = 1)+ geom_smooth(method = lm)

#multiple Boxplot
boxplot(mtcars[,0:10], main='Multiple Box plots')

