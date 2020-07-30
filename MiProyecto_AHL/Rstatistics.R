#PASO 1: Cargar lo datos del Banxo de México y de investing.com y ver tabla
dfbx <- read.csv("C:/Users/User/Desktop/Bedu2020/MiProyecto-02 - copia/DataFrames/rstudio/df_banxico.csv")
dfiv <- read.csv("C:/Users/User/Desktop/Bedu2020/MiProyecto-02 - copia/DataFrames/rstudio/df_investingcom.csv")

#Ver tabla
View(dfbx)
View(dfiv)

#Analizar estructura de la tabla
str(dfbx)
str(dfiv)

#Instanciar la librería dplyr
library(dplyr)
library(ggplot2)
library(plotly)
library(scales)
require(lubridate)
library(tidyverse)
library(lubridate)

#Analizar tipo de variable en la tabla
class(dfbx[1,c(1)])
class(dfiv[1,c(1)])

#Cambiar formato de la columna "fecha"
dfbx$fecha_bx <- as.Date(dfbx$fecha_bx)
dfiv$fecha_iv <- as.Date(dfiv$fecha_iv)

#Analizar tipo de variable en la tabla
class(dfbx[1,c(1)])
class(dfbx[1,c(1)])

#Resumir la información de la columna del TC desde 1992
summary(dfbx$tc_bx)
summary(dfiv$tc_iv)

#Hacer un histograma del tipo de cambio de 1992 a 2020 para conocer el rango de mayor frencuencia del valor del MXN respecto al USD
dfbx$tc_bx %>%
  hist(col = "yellow",
       ylab = "Frecuencia",
       main = "Tipo de cambio Peso-Dólar \n enero 1992 a mayo 2020 \n Fuente: Banxico",
       xlab = "Tipo de Cambio en pesos",
       breaks = 5
  )

dfiv$tc_iv %>%
  hist(col = "yellow",
       ylab = "Frecuencia",
       main = "Tipo de cambio Peso-Dólar \n enero 1992 a mayo 2020 \n Fuente: investing.com",
       xlab = "Tipo de Cambio en pesos",
       breaks = 10
  )

#Graficar el histórico del TC de Banxico y de investing.com
ggplot(dfbx, aes(x = fecha_bx, y = tc_bx))+
  geom_line()+
  labs(x="Año", y = "Tipo de Cambio en MXN", title = "Tipo de Cambio USD-MXN \n Banxico") +
  scale_x_date(breaks = "2 years", date_labels = "%Y")

ggplot(dfiv, aes(x = fecha_iv, y = tc_iv))+
  geom_line()+
  labs(x="Año", y = "Tipo de Cambio en MXN", title = "Tipo de Cambio USD-MXN \n Banxico") +
  scale_x_date(breaks = "2 years", date_labels = "%Y")

#Cambiar nombre de la columna fecha_bx y fecha_iv para combinar ambas gráficas
names(dfbx)[1] = "fecha"
names(dfiv)[1] = "fecha"

str(dfbx)
str(dfiv)

#Combinar los dataframes
dfcombine <- full_join(dfbx, dfiv, by="fecha")
head(combine)

ggplot(dfcombine, aes(x = fecha))+
  geom_line(aes(y=tc_bx, col="Banxico"))+
  geom_line(aes(y=tc_iv, col="investig"))+
  labs(x="Año", y="Tipo de Cambio en MXN")+
  scale_fill_manual(values=c("Banxico","investing"))+
  scale_x_date(breaks="2 year", labels = year)
str(dfcombine)

#Filtrar los datos por años de las crisis
TC2020 <- dfcombine %>%
  select(fecha,tc_bx,tc_iv) %>%
  filter(fecha > "2019-12-31", fecha < "2020-05-01")

summary(TC2020$tc_bx)
sd(TC2020$tc_bx)
var(TC2020$tc_bx)

summary(TC2020$tc_iv)
sd(TC2020$tc_iv)
var(TC2020$tc_iv)
