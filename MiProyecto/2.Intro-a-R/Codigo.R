library("ggplot2")
library("dplyr")
library('forecast')

sd(TC_1992$TC) #Año de control
sd(TC_1994$TC) #Año de crisis
sd(TC_1997$TC) #Año de control
sd(TC_2007$TC) #Año de crisis
sd(TC_2008$TC) #Año de crisis
sd(TC_2016$TC) #Año de control
sd(TC_2020$TC) #Año de crisis

summary(TC_1992$TC)
summary(TC_1994$TC)
summary(TC_1997$TC)
summary(TC_2007$TC)
summary(TC_2008$TC)
summary(TC_2016$TC)
summary(TC_2020$TC)

TC_1992 %>% 
  ts(TC_1992$TC) %>% 
  head()

TC92 <- ts(TC_1992)
log(TC92)


ggplot(TipoCambiario,
       aes(FECHA,TC)
) +
  geom_line() + 
  scale_x_date(
    breaks="1 year") +
  ylab("TC MXN-USD 1992-2020") +
  xlab("") +
  theme(axis.text.x = element_text(angle = 90))

ggplot(TC_1992,
       aes(FECHA,TC)
) +
  geom_line() + 
  scale_x_date(
    breaks="1 months") +
  ylab("TC MXN-USD 1994") +
  xlab("") +
  theme(axis.text.x = element_text(angle = 45))

ggplot(TC_1994,
       aes(FECHA,TC)
) +
  geom_line() + 
  scale_x_date(
    breaks="1 months") +
  ylab("TC MXN-USD 1994") +
  xlab("") +
  theme(axis.text.x = element_text(angle = 45))


ggplot(TC_2007,
       aes(FECHA,TC)
) +
  geom_line() + 
  scale_x_date(
    breaks="1 months") +
  ylab("TC MXN-USD 2007") +
  xlab("") +
  theme(axis.text.x = element_text(angle = 45))

ggplot(TC_2008,
       aes(FECHA,TC)
) +
  geom_line() + 
  scale_x_date(
    breaks="1 months") +
  ylab("TC MXN-USD 2008") +
  xlab("") +
  theme(axis.text.x = element_text(angle = 45))

ggplot(TC_2016,
       aes(FECHA,TC)
) +
  geom_line() + 
  scale_x_date(
    breaks="1 months") +
  ylab("TC MXN-USD 2008") +
  xlab("") +
  theme(axis.text.x = element_text(angle = 45))


ggplot(TC_2020,
       aes(FECHA,TC)
) +
  geom_line() + 
  scale_x_date(
    breaks="1 month") +
  ylab("TC MXN-USD 2020") +
  xlab("") +
  theme(axis.text.x = element_text(angle = 45))

dev.off()