# Proyecto Análisis de la varianza del Tipo de Cambio USD/MXN durante las crisis en México

Analizar la variación del tipo de cambio USD-MXN durante los periodos de crisis que ha tenido México desde diciembre de 1992 hasta mayo 2020.
Se hará a partir de esta fecha, ya que es el año en que inicia el régimen cambiario actual que se denomina "de libre flotación", es decir, el valor de la moneda depende de la oferta y la demanda en el mercado cambiario.
Este régimen se implementó el 22 de diciembre de 1993.
Se utilizará el registro de datos disponibles en el portal del Banco de México y del portal Investing.com
El análisis se hará a través del lenguaje R con la herramienta RStudio.

## Procedimiento
```
#Cargar lo datos del Banxo de México y de investing.com y ver tabla
  dfbx <- read.csv("C:/Users/User/Desktop/Bedu2020/MiProyecto-02 - copia/DataFrames/rstudio/df_banxico.csv")
  dfiv <- read.csv("C:/Users/User/Desktop/Bedu2020/MiProyecto-02 - copia/DataFrames/rstudio/df_investing.csv")
  View(dfbx)
  View(dfiv)
````

### Analizar estructura de la tabla
```
str(dfbx)  
  'data.frame': 7141 obs. of  2 variables:
  $ fecha_bx: Factor w/ 7141 levels "1992-01-02","1992-01-03",..: 1 2 3 4 5 6 7 8 9 10 ...
  $ tc_bx   : num  3.08 3.07 3.07 3.07 3.07 ...
  
str(dfiv) 
  'data.frame': 7141 obs. of  2 variables:
  $ fecha_iv: Factor w/ 7141 levels "1992-01-02","1992-01-03",..: 1 2 3 4 5 6 7 8 9 10 ...
  $ tc_iv   : num  3.08 3.07 3.07 3.07 3.07 ...
```

### Instanciar la librería dplyr
 ```
  library(dplyr)
  library(ggplot2)
  library(plotly)
  library(scales)
  require(lubridate)
  library(tidyverse)
  library(lubridate)
```

### Analizar tipo de variable en las tablas y transformarlas
```
 class(dfbx[1,c(1)])
 [1] "factor"

 class(dfiv[1,c(1)])
 [1] "factor" 

#Cambiar formato de la columna "fecha"
 dfbx$fecha_bx <- as.Date(dfbx$fecha_bx)
 dfiv$fecha_iv <- as.Date(dfiv$fecha_iv)

#Analizar tipo de variable en la tabla
 class(dfbx[1,c(1)])
 [1] "Date"

 class(dfbx[1,c(1)])
 [1] "Date"
```

### Resumir la información de la columna del TC desde 1992
```
 summary(dfbx$tc_bx)
 Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
 3.061   9.160  10.952  11.383  13.248  25.119 
 
 summary(dfiv$tc_iv)
 Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
 3.060   9.164  10.954  11.380  13.251  25.102
```

### Hacer un histograma del tipo de cambio de 1992 a 2020 para conocer el rango de mayor frencuencia del valor del MXN respecto al USD
```
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
```

### Graficar el histórico del TC de Banxico y de investing.com
 ``` 
  ggplot(dfbx, aes(x = fecha_bx, y = tc_bx))+
    geom_line()+
    labs(x="Año", y = "Tipo de Cambio", title = "Tipo de Cambio USD-MXN \n Banxico")

  ggplot(dfiv, aes(x = fecha_iv, y = tc_iv))+
    geom_line()+
    labs(x="Año", y = "Tipo de Cambio", title = "Tipo de Cambio USD-MXN \n investing.com")
```

### Cambiar nombre de la columna fecha_bx y fecha_iv para combinar ambas gráficas
```
  names(dfbx)[1] = "fecha"
  names(dfiv)[1] = "fecha"

  str(dfbx)
  str(dfiv)

  dfcombine <- full_join(dfbx, dfiv, by="fecha")
  head(combine)
```

### Graficar la combinación de ambos históricos
```
  ggplot(dfcombine, aes(x = fecha))+
    geom_line(aes(y=tc_bx, col="Banxico"))+
    geom_line(aes(y=tc_iv, col="investig"))+
    labs(x="Año", y="Tipo de Cambio en MXN")+
    scale_fill_manual(values=c("Banxico","investing"))+
    scale_x_date(breaks="2 year", labels = year)
```

### Obtener el promedio de la varianza anual en los periodos de crisis desde 1992 a 2020
```
  TC1992 <- dfcombine %>%
  select(fecha,tc_bx,tc_iv) %>%
  filter(fecha > "1991-12-31", fecha < "1993-01-01")

  summary(TC1992$tc_bx)
  sd(TC1992$tc_bx)
  var(TC1992$tc_bx)

  summary(TC1992$tc_iv)
  sd(TC1992$tc_iv)
  var(TC1992$tc_iv)
```

### Periodos filtrados
  
* 1992  Inicio del régimen de libre flotación
* 1993  Año de control
* 1994  Levantamiento del EZLN, Asesinato de Colosio y Ruiz Massieu, “Error de diciembre”
* 1998  Año de control
* 2000  Cambio de partido en el poder presidencial
* 2005  Año de control
* 2008  Crisis económica subprime
* 2009  Crisis del H1N1
* 2016  Año de control
* 2020  Crisis del coronavirus (aún no está anualizado)
