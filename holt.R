#이중지수평활법

install.packages("forecast")
library(forecast)

airmiles           #R에 내장된자료
plot(airmiles)    #데이터 시도표 작성

fit<-holt(airmiles, h = 10, level = c(80, 95),initial = 'simple', exponential = FALSE, alpha = 0.5, beta = 0.7)
fit
names(fit)
fit$model #Check the alpha and beta, 후반부의 큰 변화폭 때문에 alpha 값이 크게 측정됨.
 
plot(fit)
lines(fitted(fit), col="blue",type="o",pch=17)
lines(fit$mean)
