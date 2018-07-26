![CDSB_logo.png](CDSB_logo.png)


# Proyecto Colaborativo de Desarrollo de Software

### Nombre del proyecto:
rCONABIO

### Responsable principal:

[Alicia Mastretta-Yanes](https://github.com/AliciaMstt). Correo: amastretta@conabio.gob.mx, Twitter: @AliciaMstt

### Breve planteamiento del problema

Los análisis bioinformáticos pueden incluir conseguir y sistematizar información biológica sobre las especies. Para facilitar el análisis de grandes datos y garantizar la reproducibilidad de los análisis, ROpenSci desarrolló varios paquetes de R especializados en acceder, obtener y difundir información de bases de datos biológicas. Por ejemplo [spocc](https://github.com/ropensci/spocc) permite obtener ocurrencias de bases de datos como GBIF, Vertnet, BISON, iNaturalist, the Berkeley ecoengine, AntWeb, y eBird.

CONABIO alberga bases de datos con información taxonómica, de ocurrencias, categorías de riesgo, ficha técnica, entre otros, para especies de México. Esta información está abierta al público a través del portal [Enciclovida](http://www.enciclovida.mx/especies/8011454), sin embargo el objetivo de dicho portal es difusión, por lo que la información debe bajarse manualmente, lo que dificulta bajar información de varias especies y la reproducibilidad de la ciencia.

### Objetivo del proyecto:

Generar un paquete de R consistente con la estructura de los paquetes de ROpenSci que permita bajar de forma programática la información de las bases de datos de CONABIO disponibles a través de la API de Enciclovida. El paquete será difundido en la página de la CONABIO y se enviará a revisión para su publicación como uno de los paquetes de ROpenSci.

### Datos con los que se cuenta:

*	Outputs de Enciclovida en formato JSON (ejemplo http://www.enciclovida.mx/especies/8011454.json)

*	Código de Enciclovida https://github.com/calonso-conabio/buscador

*	Facilidad para establecer conexión a API de Enciclovida y discutir problemas con su administrador en CONABIO.

### Resultado ideal que debe generar el software:

Las funciones principales mínimas del paquete deberán:

*	`search_catConabio()`: Buscar en la base de datos CONABIO Catálogos al nivel taxonómico deseado (especie, familia, etc) consultas con al menos uno de los siguientes términos: nombre compun, nombre científico (científico o categoría mayor), tipo de distribuciópn (nativa, endémica, etc), categoría de riesgo, estado taxonómico y prioridad de conservación. Esta función debe conectarse con el motor de búsqueda avanzada de Enciclovida y obtener como resultado una dataframe con la lista de entradas (especies) que resultaron de la búsqueda y sus IDs dentro de Enclovida.

*	`get_ConabioTaxonInfo()`: Obtener información de un taxón (columnas relevantes a definir a partir del output de Enciclovida en formato JSON, ejemplo http://www.enciclovida.mx/especies/8011454.json) de un set de IDs de Eciclovida obtenidos con la función ‘search_catConabio’.

*	`get_SNIBocc()`: Obtener las ocurrencias del SNIB (base de datos de ocurrencias de la CONABIO) de un set de IDs de Eciclovida obtenidos con `search_catConabio’.


Si el tiempo lo permite, otras funciones podrán desarrollarse para bajar los otros tipos de datos disponibles.


### Referencias Útiles:


*	[Enciclovida](http://www.enciclovida.mx/)
* [Documentación con los requisitos de paquetes de R para ROpenSci](http://onboarding.ropensci.org/#files)
*	[Documentación de `GET` (paquete httr)](https://cran.r-project.org/web/packages/httr/vignettes/quickstart.html)
