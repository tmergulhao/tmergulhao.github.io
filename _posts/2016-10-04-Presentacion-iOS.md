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
Llegué a la ciudad el pasado 24 de julio y me quedaré hasta el 2 de noviembre de este año, y estoy esperando para poder extender mi estadía.

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
- Adobe Photoshop e Illustrator
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

Yo empecé a estudiar desarrollo de *software* móvil con el lanzamiento del lenguaje de programación Swift.
Esto pues tenia una sintaxis muy próxima al C y C++, lenguajes con los cuales ya tengo expriencia.

Mis primeros proyectos en Swift fueron el STAmbience, STNewsFeedParser, FeedLines y Zen Metronomy.
Todos ellos desarrollados con el fin de mejorar mis habilidades en estas plataformas.

El [`STAmbience`](/swift/initial-commit) es un *framework* para iOS hecho para ayudar al desarrollador a crear versiones de sus pantallas que se adaptan a las condiciones de luminosidad programaticamente. 
En verdad esto es un *workaround* las restricciones del ambiente iOS en relación a los sensores de luminosidad. 
Para hacer esto utilicé la capacidad de la lenguaje Swift de implementar protocolos abstractos, es decir la capacidad de una capacidad de heredar de una clase.
Las visiones iOS `UIView` permiten tener una estructura prefija compatible con esta estrategia.

{% include figure.html url="ios-lines-icon.png" description="Íconos y máscaras de FeedLines" caption="Icones y mascaras de FeedLines" %}

Yo escribí esta última librería para hacer parte de un proyecto de interfaz gráfica de la aplicación FeedLines.
En el sítio de la ADC está un código de *parser XML* para *RSS*, pero por práctica, yo decidí escribir mi propia librería para comprender más sobre la arquitectura de modularización.

El módulo que escribí fue el `STNewsFeedParser` que utiliza herramientas del `Foundation` para descargar y transformar los datos. Para crear más funcionalidades, yo utilicé las herramientas de RegEx del proprio Swift. Debido a que el proceso de descarga de datos puede congelar la interfaz, la clase tiene soporte a `Grand Central Dispatch`.

{% include figure.html url="ios-lines-views.png" description="Pantallas dibujadas en Sketch" caption="Pantallas dibujadas en Sketch" %}

<figure class="right"><img src="/assets/intentions-appicon.png"/><figcaption>Zen Metronomy</figcaption></figure>

Gracias a mi gusto por la meditación y a que, al buscar, no encontré una aplicación que fuese un buen metrónomo para ésto, escribí un aplicación. Ella utiliza el `STAmbience` para hacer una interfaz adaptativa.

Los botones y la interfaz en la imagen son hechos utilizando `UIBezierCurve`. Ésto pues, creando una clase de dibujo de interfaz programática, hace la aplicación más delgada y ésto es muy importante, principalmente para herramientas pequeñas.

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

Ahora, como estoy estudiando interacción en la universidad dedico 4 horas por semana al desarrollo de juegos en Sprite Kit y Scene Kit. 
Proximamente tendré algunas capturas de pantalla.

*[ADC]: Apple Developer Connection
