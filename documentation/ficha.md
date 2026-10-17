# Ficha del artículo

Completa esta ficha al crear el repositorio y mantenla al día. Es el único
lugar con datos propios del artículo; el README es igual en todos los
repositorios.

## Identificación

- **Título:** ¿Qué piensan los ecuatorianos sobre el Instituto Ecuatoriano de Seguridad Social (IESS)?
- **Descripción del repositorio:** Repositorio del artículo de André Cóndor: "¿Qué piensan los ecuatorianos sobre el Instituto Ecuatoriano de Seguridad Social (IESS)?"
- **Autoría:** [COMPLETAR: nombres, igual que en el sitio]
- **Fecha de publicación:** [COMPLETAR: AAAA-MM-DD]
- **Artículo publicado:** [COMPLETAR: enlace a elquantificador.org]
- **Categoría:** [COMPLETAR: Economía, Política, Salud, Educación o Valores y
  comportamiento]
- **Edición:** [COMPLETAR: por ejemplo, Julio-Diciembre 2026]

## Estado

[COMPLETAR: en preparación, en revisión editorial o publicado. Anota qué falta
para cerrar el artículo.]

## Pregunta y alcance

[COMPLETAR: dos o tres oraciones con la pregunta, el periodo, la cobertura
geográfica y la unidad de análisis.]

## Requisitos

- R [COMPLETAR: versión, por ejemplo 4.5.x].
- Paquetes de R: [COMPLETAR: lista en orden alfabético].

## Fuentes de datos

| Fuente | Institución | Periodo | Acceso | Script |
|---|---|---|---|---|
| [COMPLETAR] | [COMPLETAR] | [COMPLETAR] | [COMPLETAR: descarga automática o manual] | `code/cleaning/00_download_fuente.R` |

Si alguna fuente no permite descarga automática, explica aquí cómo obtenerla y
dónde colocarla en `data/raw/`.

## Salidas

- `outputs/tables/[COMPLETAR].csv`: [COMPLETAR: qué contiene].
- `outputs/graphs/[COMPLETAR].png`: [COMPLETAR: qué muestra].
- `article/images/graficoN.png`: copias numeradas según el orden del texto.

## Cómo replicar en este repositorio

Este repositorio conserva sus instrucciones originales en la sección
"README anterior". Si todavía no tiene `MASTER.R`, sigue esas instrucciones.
Cuando se migre a la estructura estándar, reemplaza esta sección por los pasos
de `MASTER.R`.

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
