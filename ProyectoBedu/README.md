# Proyecto Bedu 🧱

**La influencia política, económica y cultural del español y los hispanohablantes en Estados Unidos**

## ¿Qué necesidad o problema hay en el mercado? 🚀

_En esta era multipolar donde los actores del escenario internacional ya no sólo son los países sino una enorme cantidad de entes como las organizaciones internacionales, la sociedad civil o los individuos, el panhispanismo se ha identificado recientemente como un nuevo actor global._

_El hispanismo se entiende como la afinidad que existe entre los países con hablantes de la lengua española y a los numerosos elementos de naturaleza cultural histórica, geopolítica y cooperativa que existe entre estas naciones, pero ¿de dónde surge y qué importancia tiene?_

* _El panhispanismo, es la herencia de uno de los imperios más grandes de la historia, tanto por la cantidad de territorio que ocupó, como por el poder político y económico que tuvo y, sobre todo, por el tiempo que duró (más de tres siglos)._
* _Constituye, junto con el portugués (paniberismo), el primer espacio lingüístico del mundo._
* _Este espacio representa una quinta parte de la superficie del planeta._
* _El panhispanismo es un conjunto multinacional que agrupa a más de 800 millones de personas._
* _Congrega a más de 30 países en el mundo._
* _México es el país con la mayor cantidad de hispanohablantes._
* _Estados Unidos es el país con la mayor cantidad de hispanohablantes donde el español no es una legua oficial (la lengua de facto en los Estados Unidos es el inglés, pero no es el idioma oficial, de hecho, no lo tiene)._

_Con respecto al último punto, este proyecto se centrará en conocer la distribución geográfica de los hispanohablantes en los Estados Unidos y saber cómo se han articulado espacios de cooperación que se traduzcan en dar mayor visibilidad e influencia a estas poblaciones dentro de los estados y los asentamientos donde viven._

_La finalidad es encontrar los elementos que den un mayor equilibrio en términos geoculturales a algunos aspectos y cosmovisiones homogeneizadores de la globalización en curso y, en particular, poner en perspectiva esta herencia geocultural en un contexto (Estados Unidos) cuya narrativa es profundamente xenófoba, anti-inmigrante y marcadamente antimexicana._

## ¿Cuál es mi propuesta para resolver esa necesidad o problemas? 📋

_Crear un indicador de la influencia política-económica-cultural que tienen los hispanohablantes en los Estados Unidos._

## ¿Qué voy a hacer? 💡📌

_Analizar el nivel de influencia de los hispanohablantes en Estados Unidos a través de relacionar las bases de datos sobre la población hispanohablante y los elementos claves de participación política, comercio-consumo y trabajo._

## ¿Cómo lo voy a hacer? 🛠️

* 1.Revisar los censos recientes de los Estados Unidos (2016 y 2017) a nivel nacional y por estados.
* 2.Ver cuál es **el porcentaje** de la población de habla hispana que radica en los Estados Unidos y seleccionar los 5 estados con la mayor población.
* 3.Conocer el **número** de hispanohablantes que hablan español en cada estado.
* 4.Adicionalmente precisar cuáles son las 5 ciudades con **mayor cantidad de hispanohablantes**.
* 5.Correlacionar lo datos de esta población con los datos que den un **indicador** de su influencia en términos de **participación política** (votantes), **comercial-tributaria** (consumidores-contribuyentes) y **laboral** (trabajadores).
* 6.Construir un indicador de influencia que tiene el habla hispana en Estados Unidos.

## ¿Para qué lo voy a hacer? 📢🧭

Para generar un conocimiento nuevo, concretamente, producir las herramientas analíticas con las cuales se podrá medir la influencia de un idioma en un determinado territorio.

## ¿Quién usará o se verá beneficiado con tu producto?

Yo🤔

## ¿Cómo es?

## ¿Cuáles son sus prioridades?

## Ejemplo de consulta
```
AlejandroHdz> select agecal2017,totalcal2017,totalnational2017 from censuscaliforn
              ia2017 left join censustotal2017 on censuscalifornia2017.agecal2017=
              censustotal2017.agenational2017;
+-------------------+--------------+-------------------+
| agecal2017        | totalcal2017 | totalnational2017 |
+-------------------+--------------+-------------------+
| 05 to 9 years     | 2514352      | 20304238          |
| 10 to 14 years    | 2542780      | 20778454          |
| 15 to 19 years    | 2562668      | 21131660          |
| 20 to 24 years    | 2767775      | 22118635          |
| 25 to 29 years    | 3130234      | 23370460          |
| 30 to 34 years    | 2893545      | 21972212          |
| 35 to 39 years    | 2713487      | 21231997          |
| 40 to 44 years    | 2509575      | 19643373          |
| 45 to 49 years    | 2607438      | 20973858          |
| 50 to 54 years    | 2555250      | 21401094          |
| 55 to 59 years    | 2528756      | 22007956          |
| 60 to 64 years    | 2233922      | 19987702          |
| 65 to 69 years    | 1825565      | 16836381          |
| 70 to 74 years    | 1370235      | 12847065          |
| 75 to 79 years    | 929630       | 8741261           |
| 80 to 84 years    | 647135       | 5965290           |
| 85 years and over | 732793       | 6468682           |
| Total             | 39536653     | 325719178         |
| Under 5 years     | 2471513      | 19938860          |
+-------------------+--------------+-------------------+
```
