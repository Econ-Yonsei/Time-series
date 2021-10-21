#계절지수평활법

guarantee<-read.csv("C:/Users/USER/Desktop/guarantee.csv",header=FALSE)
head(guarantee)
guarantee<-ts(guarantee, start=c(2010,1),end=c(2016,12),frequency=12) #Data->Time series Data
plot.ts(guarantee, xlab="time", ylab="supply of housing finance credit guarantee") #Time series Plot


#install.packages("forecast")
library("forecast")
fit1<-hw(guarantee, seasonal="additive", h=12, initial="optimal") #holt winters method
fit2<-hw(guarantee, seasonal="multiplicative",h=12)

#Model results->후보모형 설정 AIC, BIC가 작은 것은 것들이 좋음->fit1
fit1$model
fit2$model

plot(fit1, ylab="supply of housing finance credit guarantee", fcol="white",xlab="time",main="")
lines(fitted(fit1),col="red", lty=2, type="o",lwd=2,pch=1) 
lines(fitted(fit2),col="green", lty=3, type="o",lwd=2,pch=2)

lines(fit1$mean,col="red",type="o",lty=2, lwd=2, pch=1) #fit1$mean-> 예측값
lines(fit2$mean,col="green",type="o",lty=3, lwd=2, pch=2)
legend("topleft", lty=1:3, pch=c(16,1,2),col=1:3,  c("data","holter winters additive", "holter winters multiplicative"), cex=1.5)

