# Ficha del artículo

Completa esta ficha al crear el repositorio y mantenla al día. Es el único
lugar con datos propios del artículo; el README es igual en todos los
repositorios.

## Identificación

- **Título:** ¿Qué piensan los ecuatorianos sobre el Instituto Ecuatoriano de Seguridad Social (IESS)?
- **Descripción del repositorio:** Repositorio del artículo de André Cóndor: "¿Qué piensan los ecuatorianos sobre el Instituto Ecuatoriano de Seguridad Social (IESS)?"
- **Autoría:** André Sebastián Cóndor
- **Fecha de publicación:** 2022-09-08
- **Artículo publicado:** https://elquantificador.org/post/salud/2022-09-08-twitter-iess-analysis/
- **Categoría:** Salud (el sitio también la clasifica en Política)
- **Edición:** Julio 2022-Enero 2023

## Estado

Publicado el 2022-09-08. El repositorio no incluye el código de descarga de
los tuits; el análisis parte del archivo ya guardado `data/tweets_iess_list.RData`.

## Pregunta y alcance

El artículo analiza qué opinan los ecuatorianos sobre el IESS a partir de unos
10 mil tuits ecuatorianos con menciones del instituto, descargados con la API
de Twitter en 2022 (el informe en `report/` está fechado en agosto de 2022).
Identifica las 20 palabras más frecuentes, una nube de 50 palabras, el tuit con
más retuits y la ubicación de los tuits con coordenadas en el mapa de las
provincias de Ecuador. La unidad de análisis es el tuit.

## Requisitos

- R: 4.1 o superior, según el README anterior (es una recomendación, no una
  versión registrada en `sessionInfo` ni en `renv`). Requiere también Java
  configurado para R (paquete `qdap`).
- Paquetes de R: qdap, RColorBrewer, rgdal, rmapshaper, rtweet, tidyverse, tm,
  wordcloud.

## Fuentes de datos

| Fuente | Institución | Periodo | Acceso | Script |
|---|---|---|---|---|
| Tuits públicos con menciones del IESS (`data/tweets_iess_list.RData`) | Twitter/X | 2022; el rango exacto de fechas no consta en el repositorio ni en el artículo | Descarga con la API de Twitter, fuera de este repositorio; el archivo ya guardado se versiona | `code/twitter_analysis.R` |
| Límites provinciales (`data/provincias.shp`, `.shx`, `.dbf`) | No documentada en el repositorio | No documentado | Archivos versionados en `data/` | `code/twitter_analysis.R` |

Los tuits son públicos. El repositorio no documenta quién publicó el shapefile
de provincias ni su vintage.

## Salidas

- `images/bar_plot.png`: las 20 palabras más frecuentes en los tuits.
- `images/wordcloud.png`: nube de las 50 palabras más frecuentes.
- `images/map.png`: mapa de las provincias con los puntos de origen de los tuits.
- `report/report_spanish/report.Rmd` y `report.html`: texto del informe en español; `report/report.pdf` y `report/report.zip` son versiones del informe.

## Cómo replicar en este repositorio

Los pasos salen del README anterior y del script.

1. Instala los paquetes listados y configura Java para R, como indica el
   README anterior (`setx PATH ...` en Windows y `Sys.setenv(JAVA_HOME = "")`
   en la consola de R).
2. Ejecuta `code/twitter_analysis.R` con la raíz del repositorio como
   directorio de trabajo. El script carga `data/tweets_iess_list.RData` y lee
   `data/provincias`.
3. El script guarda `bar_plot.png`, `wordcloud.png` y `map.png` en `images/`.

El script no descarga tuits nuevos; `rtweet` solo se usa para `lat_lng()`.

## README anterior

Texto del README de este repositorio antes de adoptar el README estándar,
conservado sin cambios de contenido para no perder información.

### [¿Qué piensan los ecuatorianos sobre el Instituto Ecuatoriano de Seguridad Social (IESS)?](https://elquantificador.org/post/salud/2022-09-08-twitter-iess-analysis/)

Este repositorio incluye todos los archivos y código necesarios para reproducir el análisis de tweets sobre el Instituto Ecuatoriano de Seguridad Social.

#### Requisitos

Se recomienda utilizar **R 4.1** o superior y tener instalados los siguientes
paquetes:

- `tidyverse`
- `tm`
- `qdap`
- `wordcloud`
- `RColorBrewer`
- `rgdal`
- `rtweet`
- `rmapshaper`

Aparte de instalar los paquetes necesarios listados en `code/twitter_analysis.R`,
es indispensable contar con **Java** configurado en RStudio. Primero descarga e
instala Java desde este enlace. Luego abre la ventana de comandos de Windows y
ejecuta la siguiente línea:

```
setx PATH "C:\\Program Files\\Java\\jre1.8.0_211\\bin\\server;%PATH%"
```

Finalmente, establece la variable de entorno en la consola de RStudio:

```
Sys.setenv(JAVA_HOME = "")
```
Para más detalles sobre este proceso, consulta las respuestas de StackOverflow.

#### Cómo ejecutar el análisis

Ejecuta el script `code/twitter_analysis.R` desde R o RStudio con el
directorio del repositorio como directorio de trabajo. El script generará los
gráficos `bar_plot.png`, `map.png` y `wordcloud.png` dentro de la carpeta
`images/`.

Para más información, consulta el [perfil de GitHub del autor](https://github.com/asebastianc).
