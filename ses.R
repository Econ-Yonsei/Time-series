#단순지수 평활법

balance<-read.csv("C:/Users/USER/Desktop/3rdsem2/시계열분석/3_R/balance.csv",header=FALSE) #Import Data
head(balance)
length(balance)
balance<-ts(balance, start=1980, end=2016) #data type is time series
plot.ts(balance, xlab="YEAR", ylab="Balance on current account(million dollar)") #time plot, check the trend of plot, There is no seasonal trend.

install.packages("forecast")
library(forecast)

fit<-ses(balance, h=10,level=c(80,95),initial="simple", alpha=NULL)  #Simple Expotential Smoothing
fit
names(fit) #Describe statistics, fitted, residuals......etc

fit$model #Check the model
fit$fitted
fit$residuals

plot(fit,ylab="Balance on current account(million dollar)", xlab="year", main="", fcol="white", type="o") #'fit' model's plot
lines(fitted(fit), col="blue",type="o",pch=17) #the result of ses
lines(fit$mean)

#Check the chnage of alpha, if alpha increases, the fluctuation of data also increases.
fit1<-ses(balance, h=2,level=c(80,95), alpha=0.2)
fit2<-ses(balance, h=2,level=c(80,95), alpha=0.6)
fit3<-ses(balance, h=2,level=c(80,95), alpha=0.99)
fit1$model
fit2$model
fit3$model
#Plot
plot(fit1, ylab="Balance on current account(million dollar)", xlab="year", main="", fcol="white", type="o")
lines(fitted(fit1), col="blue",type="o",pch=2)
lines(fitted(fit2), col="red",type="o",pch=3)
lines(fitted(fit3), col="green",type="o",pch=5)
lines(fit1$mean,col="blue",type="o",pch=2)
lines(fit2$mean,col="red",type="o",pch=3)
lines(fit3$mean,col="green",type="o",pch=5)
legend("topleft", lty=1, pch=c(1,2,3,5),col=c(1,"blue","red","green"), c("data", 
                                                                         expression(alpha==0.2),expression(alpha==0.6), expression(alpha==0.99)))
