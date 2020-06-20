library('datasets')
library(ggplot2)
library(ggthemes)
library(ggcorrplot)
library(corrplot)

str(mtcars)

#Boxplot to show the relationsip betwwen mpg and other variables
plot(mtcars$cyl, mtcars$mpg, main = "Scatterplot")
plot(mtcars$vs, mtcars$mpg, main = "Scatterplot")
plot(mtcars$am, mtcars$mpg, main = "Scatterplot")
plot(mtcars$cyl, mtcars$mpg, main = "Scatterplot")

#check how the variables correlate
cor(mtcars$cyl, mtcars$mpg)
cor(mtcars$vs, mtcars$mpg)
cor(mtcars$am, mtcars$mpg)
cor(mtcars$carb, mtcars$mpg)
cor(mtcars$disp, mtcars$mpg)
cor(mtcars$gear, mtcars$mpg)
cor(mtcars$hp, mtcars$mpg)
cor(mtcars$qsec, mtcars$mpg)
cor(mtcars$wt, mtcars$mpg)
cor(mtcars$drat, mtcars$mpg)
cor(mtcars$am, mtcars$hp)

#Build a linear model relating Miles per gallon  to Engine using the lm()
mod <- lm(mtcars$mpg ~ mtcars$vs)
summary(mod)

attributes(mod)
mod$coefficients

ggplot(data=mtcars, aes(mod$residuals)) +
  geom_histogram(binwidth = 1, color = "black", fill = "purple4") +
  theme(panel.background = element_rect(fill = "white"),
        axis.line.x=element_line(),
        axis.line.y=element_line()) +
  ggtitle("Histogram for Model Residuals")

plot(mtcars$vs, mtcars$mpg, main = "Scatterplot")
abline(mod)
abline(mod, col=2, lwd=3)

confint(mod, level=0.99)

summary(mod)

anova(mod)
sqrt(20.98)

ggplot(data = mtcars, aes(x = vs, y = mpg)) +
  geom_point() +
  stat_smooth(method = "lm", col = "dodgerblue3") +
  theme(panel.background = element_rect(fill = "white"),
        axis.line.x=element_line(),
        axis.line.y=element_line()) +
  ggtitle("Linear Model Fitted to Data")

#Build a linear model relating Miles per gallon  to Rear axle ratio using the lm()
mod_2 <- lm(mtcars$mpg ~ mtcars$drat)
summary(mod_1)

attributes(mod_2)
mod_1$coefficients

ggplot(data=mtcars, aes(mod_2$residuals)) +
  geom_histogram(binwidth = 1, color = "black", fill = "purple4") +
  theme(panel.background = element_rect(fill = "white"),
        axis.line.x=element_line(),
        axis.line.y=element_line()) +
  ggtitle("Histogram for Model Residuals")

plot(mtcars$drat, mtcars$mpg, main = "Scatterplot")
abline(mod_2)
abline(mod_2, col=2, lwd=3)

confint(mod_2, level=0.99)

summary(mod_2)

anova(mod_2)
sqrt(20.98)

ggplot(data = mtcars, aes(x = drat, y = mpg)) +
  geom_point() +
  stat_smooth(method = "lm", col = "dodgerblue3") +
  theme(panel.background = element_rect(fill = "white"),
        axis.line.x=element_line(),
        axis.line.y=element_line()) +
  ggtitle("Linear Model Fitted to Data")

#Build a linear model relating Miles per gallon  to Number of cylinders using the lm()
mod_2 <- lm(mtcars$mpg ~ mtcars$cyl)
summary(mod_2)

#Let's chect out the attributes stored in our modd
attributes(mod_2)
mod_2$coefficients


########fitting the model############
#We would consider the residuals (the distances between our observation and the model)
#It tells us something about how well our model fit our data.
#Generally,the residuals should be normally distributed around zero (i.e. a bell curve distribution).
#And there’s no obvious visual pattern to them,that indicates that a linear model is not appropriate for the data.
#We can make a histogram to visualize this using ggplot2.

ggplot(data=mtcars, aes(mod_2$residuals)) +
  geom_histogram(binwidth = 1, color = "black", fill = "purple4") +
  theme(panel.background = element_rect(fill = "white"),
        axis.line.x=element_line(),
        axis.line.y=element_line()) +
  ggtitle("Histogram for Model Residuals")
#From the graph, Our residuals look pretty symmetrical around 0, suggesting that our model fits the data well.

plot(mtcars$cyl, mtcars$mpg, main = "Scatterplot")

#To add the regression line to this plot, we use the abline() command
abline(mod_2)
abline(mod_2, col=2, lwd=3) #for color and line width

#To view the confidence interval for the model coefficients using the confint() command
confint(mod_2, level=0.99) 

#You can also check out the summary using the summary() command
summary(mod_2)

#we can produce the anova table for the linear regression using the anova() command
anova(mod_2) #this table corresponds to the f-statistics  in the linear regression summary
sqrt(20.98) #the value got is the same as the one for the residual standard error in the summary table


#Now we want to see how well our model fits into the data
ggplot(data = mtcars, aes(x = cyl, y = mpg)) +
  geom_point() +
  stat_smooth(method = "lm", col = "dodgerblue3") +
  theme(panel.background = element_rect(fill = "white"),
        axis.line.x=element_line(),
        axis.line.y=element_line()) +
  ggtitle("Linear Model Fitted to Data")

##Of the three linear models built, the one built relating mpg to cyl fitted well regardless of the negative correlation value got unlike VS and DRAT that have a positive correlation with mpg. This goes ahead to validate the phrase "Correlation isn't Causation".
##Through the Analysis of Variance we can see that the model is sound. The F-value of the High Performance Linear regression is 79.56 with a p-value of 6.113e-10. A high F-value indicates a strong relationship between the variables

#Looking at our one way ANOVA pdf we obtain the same Analysis of Variance, proving our model is sound with a F-value of 79.56 and P of 6.113e-10. 
#Our plots of the distribution of mpg show the more the number of cylinders, the lesser the value of mpg(i.e lesser the miles your car can travel)
#Therefore, in this model I would drop the 8 cylinder data due to low value of mpg. If you are looking to save money on gas, this model shows that a 4 cylinder engine is the way to go based on the mtcars data.

