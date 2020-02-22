[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 05`](../Readme.md) > Postwork
## Fundamentos de MongoDB e importación de datos
### Postwork05

#### (1) Base de Datos

*Aquí pongan el nombre de su base de datos y la o las colecciones que crearon.*

```
Base de datos: AlejandroHdz
Colección:     US_borders
```

#### (2) Estructura del archivo CSV

*Aquí pongan el header del archivo CSV que usaron como dataset. La idea es que contrasten los documentos cargados en MongoDB con este header para asegurar que la carga fue correcta.*

```
id,Port name, State,Port Code,Border,Date,Measure,Value
```

#### (3) Consultas

*Aquí pongan las consultas que pensaron y como primera línea pongan con qué la van a ejecutar, es decir, un filtro, proyección, ordenamiento, etc.*

1. ¿Cuántos trenes de pasajeros ingresaron en 2018 y 2019 a los Estados Unidos?

*Solución: 405 accesos*

```json
// FILTER
{Measure:"Train Passengers"}
```

2. ¿Por cuál frontera hubo más accesos por la de México-Estados Unidos o por la de Estados Unidos-Canadá en el periodo 2018-2019?

*Solución: Por las fronteras con Canadá con 9006 ingresos de un total de 11,898*

```json
// SORT
{Border:"US-Canada Border"}
```

```json
// SORT
{Border:"US-Mexico Border"}
```

3. ¿Cuántos vehículos personales ingresaron por el Estado de Texas?

*Solución: 165*

```json
// PROJECTION
{Measure:"Personal Vehicles", State:"Texas"}
```
