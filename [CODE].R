library(readxl)
data <- read_excel("C:/kuliah/semester 6/Time series analysis/AOL/USD/fixed.xlsx")
View(data)

library(tseries)
library(car)
library(nortest)
library(lmtest)

datats = ts(data[3])
datats
plot(datats)

data_train = datats[1:421]
data_train
data_test = datats[422:513]
data_test

# ----------------
# ARIMA 
# ----------------

# 0.63593 > 0.01 --> Gagal tolak (data stat thdp var)
summary(powerTransform(datats))

# 0.08829 > 0.05 --> gagal Tolak H0 (data tidak stats thdp mean)
adf.test(datats)
# karena tdk stat thdp mean jadi dia pola trend 

#0.01 < 0.05 --> Tolak H0 ( data stat thdp mean)
diff1 = diff(datats)
adf.test(diff1)

acf = acf(datats, lag.max = 150)
pacf = pacf(datats, lag.max = 100)

m1 = arima(data_train, order=c(5,1,5))
coeftest(m1)
er1 = residuals(m1)
Box.test(er1, type="Ljung-Box")
lillie.test(er1) # tidak memenuhi distribusi normal

sqrt(mean(er1^2))
accuracy(m1)

predict = predict(m1, n.ahead=92)
predict

error = data_test - predict$pred
error

sqrt(mean(error^2))
install.packages("forecast")
library(forecast)


pred_test <- predict(m1, n.ahead=92)$pred

# Hitung error untuk data train dan data test
error_test <- data_test - pred_test

# Hitung absolute percentage error
absolute_test <- abs(error_test / data_test) * 100

# Hitung MAPE 
mape_test <- mean(absolute_test,na.rm=TRUE)
mape_test


# ----------------
# NEURAL NETWORK
# ----------------
install.packages("forecast")
install.packages("Metrics")

# Memuat paket
library(forecast)
library(Metrics)

nn1 = nnetar(data_train, p=3, size=6)


predict_train_nn1 <- fitted(nn1)

absolute_error <- abs(data_train - predict_train_nn1)
percentage_error <- (absolute_error / data_train) * 100
MAPEtrain_nn1 <- mean(percentage_error, na.rm = TRUE)
MAPEtrain_nn1

haha = (predict_train_nn1 - data_train)^2
haha

mse <- mean(haha, na.rm = TRUE)
mse

rmse = sqrt(mse)
rmse

predict_nn1 <- forecast(nn1, h=92)

error_nn1 <- predict_nn1$mean - data_test
error_nn1

rmse_nn1 <- sqrt(mean(error_nn1^2))
rmse_nn1

MAPEtest_nn1 <- mape(data_test, predict_nn1$mean)
MAPEtest_nn1


plot(forecast(nn1))

library(readxl)
data <- read_excel("USD/fixed.xlsx")
View(data)

#-------------
# TS REGRESSION 
# -------------

#-------------
# Linear Reg
# -------------

data_train1 = data[1:421,]
data_test1 = data[422:513,]


n_train = nrow(data_train1)
n_train

model1 = lm(`kurs jual (USD)`~ t, data = data_train1)
summary(model1)

er2 = residuals(model1)
library(lmtest)
dwtest(model1, alternative ="two.sided")
bptest(model1)
library(nortest)
lillie.test(er2)

rmse = sqrt(mean(er2^2))
rmse
mape = sqrt(rmse)
mape

future_time <- data.frame(t = (nrow(data_train1) + 1):(nrow(data_train1) + 92))

# Lakukan prediksi
predictions <- predict(model1, newdata = future_time)

# Tampilkan prediksi
predictions

error2 = data_test[3] - predict
error2

rmse2 = sqrt(mean(error2^2))
rmse2
mape2 = sqrt(rmse2)
mape2

#-------------
# Exponential
# -------------
data$lny = log(data$`kurs jual (USD)`) #kalau di R log itu ln 
head(data)

model2 = lm(lny~t, data = data)
summary(model2)

a = exp(model2$coefficients[1])
a

#perhitungan error untuk model 2 berbeda ( karena dia ln, jadi mau diganti ke nilai awal)
yhat = exp(fitted.values(model2))
er2 = data$`kurs jual (USD)` - yhat
er2

dwtest(model2, alternative = "two.sided")
bptest(model2)
lillie.test(er2)
sqrt(mean(er2^2))

rmse = sqrt(mean(er2^2))
rmse
mape = sqrt(sqrt(mean(er2^2)))
mape

future_time <- data.frame(t = (nrow(data_train1) + 1):(nrow(data_train1) + 92))

# Lakukan prediksi
predictions <- predict(model2, newdata = future_time)

# Tampilkan prediksi
predictions

error3 = data_test[3] - predict
error3

rmse3 = sqrt(mean(error3^2))
rmse3
mape3 = sqrt(rmse3)
mape3

#-------------
# Quadratic
# -------------

data$t2 = data_train[2]^2
model3 = lm(`kurs jual (USD)`~t+t2, data = data)
summary(model3)

er3 = residuals(model3)
dwtest(model3, alternative ="two.sided")
bptest(model3)
lillie.test(er3)
sqrt(mean(er3^2))

AIC(model2)
rmse = sqrt(mean(er3^2))
mape = sqrt(rmse)
mape

future_time <- data.frame(t = (nrow(data_train1) + 1):(nrow(data_train1) + 92))

# Lakukan prediksi
predictions <- predict(model1, newdata = future_time)

# Tampilkan prediksi
predictions



error2 = data_test - predict
error2

rmse2 = sqrt(mean(error2^2))
rmse2
mape2 = sqrt(rmse2)
mape2



