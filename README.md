# [¿Qué piensan los ecuatorianos sobre el Instituto Ecuatoriano de Seguridad Social (IESS)?](https://elquantificador.org/post/salud/2022-09-08-twitter-iess-analysis/)

Este repositorio incluye todos los archivos y código necesarios para reproducir el análisis de tweets sobre el Instituto Ecuatoriano de Seguridad Social.

Para más información, consulta el [perfil de GitHub del autor](https://github.com/asebastianc).

## Requisitos

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

## Cómo ejecutar el análisis

Ejecuta el script `code/twitter_analysis.R` desde R o RStudio con el
directorio del repositorio como directorio de trabajo. El script generará los
gráficos `bar_plot.png`, `map.png` y `wordcloud.png` dentro de la carpeta
`images/`.

Para más información, revisa el perfil de GitHub del autor, https://github.com/asebastianc
