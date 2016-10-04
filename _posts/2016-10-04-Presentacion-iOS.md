---
layout: blog
title:  "Presentación iOS"
date:   2016-10-04
categories: blog
excerpt_separator: <!--more-->
borders: "#A1B3B5"
background: "#F2F2F2"
emphasis: "#DE4730"
emphasiss: "#508084"
permalink: /presentacion-ios
style: |
  ul {
    list-style: none;
    padding-left: 15px;
  }
  figure.stack {
    display: flex;
    width: 100%;
  }
  figure.stack img {
    flex: 1;
    width: 30% !important;
    height: auto !important;
  }
  figure.stack img:nth-child(2) {
    margin-left: 15px;
    margin-right: 15px;
  }
---

Soy un estudiante de Diseño de la Universidad de Brasília, me encuentro haciendo 4 meses de estudios en la Universidad de los Andes en la opción de pregrado en Computación Visual.
Llegué a la ciudad el pasado 24 de julio y me quedaré hasta el 2 de noviembre de este año, pendiente a me quedar otro semestre.

<!--more-->

Estoy buscando una oportunidad donde pueda usar mis habilidades y experiencias.
Estudio en la universidad, dispongo de medio tiempo para trabajar.
Considero que mi desarrollo académico y profesional son mis prioridades y creo que los campos de la creación y la practica son fundamentales.

Finalmente, creo que estoy en el mejor ambiente para amplificar mis capacidades y me quedaría en la ciudad por más de un semestre sí es posible.
De esta forma, mis planes a corto plazo son aprovechar académicamente y profesionalmente el nuevo escenario en el que me encuentro.

## *The sort stuff*

#### Diseño y prototipado

- Figma
- Sketch
- Framer Studio
- Flinto
- Xcope
- Adobe Photoshop y Illustrator
- Affinity Designer y Photo

#### Programación

- Xcode y Swift
- C, C++ y variantes
- PaintCode
- Core Graphics
- Grand Central Dispatch

#### Colaboración

- Git
- Slack

## *The good stuff*

Yo empecé a estudiar desarrollo de *software* móvil con el lanzamiento de la lenguaje de programación Swift.
Esto pues tenia una sintaxis muy próxima al C y C++, lenguajes cuales ya uso a años.

Mis primeros proyectos en Swift fueron el STAmbience, STNewsFeedParser, FeedLines y Zen Metronomy.
Todos ellos desarrollados para utilizar de distintas habilidades con el objetivo de comprender la plataforma.

El [`STAmbience`](/swift/initial-commit) es un *framework* para iOS hecho para ayudar el desarrollador a crear versiones de sus pantallas que se adaptan a las condiciones de luminosidad programaticamente. 
En verdad esto es un *workaround* las restricciones del ambiente iOS en relación a los sensores de luminosidad. 
Para hacer esto utilize la capacidad de la lenguaje Swift de implementar protocolos abstractos, este lo cual una clase puede heredar.
Las visiones iOS `UIView` tienes una estructura prefija compatible con este abordaje.

{% include figure.html url="ios-lines-icon.png" description="Icones y mascaras de FeedLines" caption="Icones y mascaras de FeedLines" %}

Yo escribí esta última librería para hacer parte de un proyecto de interfaz gráfica de la aplicación FeedLines.
En el sítio de la ADC está un código de *parser XML* para *RSS*, pero por practica, yo decidi escribir mi propia librería para comprender más sobre la arquitectura de modularización.

El modulo que escribí fue el `STNewsFeedParser` que utiliza herramientas del `Foundation` para descargar y transformar los datos. Para crear más funcionalidades al código yo utilize las herramientas de RegEx del proprio Swift. Pues el descargue de datos puede congelar la interfaz, la clase tiene soporte a `Grand Central Dispatch`.

{% include figure.html url="ios-lines-views.png" description="Pantallas dibujadas en Sketch" caption="Pantallas dibujadas en Sketch" %}

<figure class="right"><img src="/assets/intentions-appicon.png"/><figcaption>Zen Metronomy</figcaption></figure>

Pues me gusta muchísimo meditar y, al buscar, no encontre una aplicación que fuese un buen metronome para esto, escribí un aplicación. Ella utiliza el `STAmbience` para hacer una interfaz adaptativa.

Los botones y interfaz en la imagen son hechos utilizando `UIBezierCurve`. Esto pues, creando una clase de dibujo de interfaz programática haz la aplicación más delgada y esto es muy importante, principalmente para herramientas pequeñas.

<figure class="stack">
	<img src="/assets/zen-RC.jpg"/>
	<img src="/assets/zen-CC.jpg"/>
	<img src="/assets/zen-IC.jpg"/>
</figure>

<figure class="stack">
	<img src="/assets/zen-RE.jpg"/>
	<img src="/assets/zen-CE.jpg"/>
	<img src="/assets/zen-IE.jpg"/>
</figure>

Ahora estoy, como estoy estudiando interacción en la universidad me dedico 4 horas por semana a desarrollo de juegos en SpriteKit y SceneKit. 
Proximamente tendré algunas pantalladas.

*[ADC]: Apple Developer Connection
