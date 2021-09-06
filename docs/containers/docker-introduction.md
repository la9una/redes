Según AWS (Amazon Web Services): 

>Docker es una plataforma de software que le permite crear, probar e implementar aplicaciones rápidamente. Docker empaqueta software en unidades estandarizadas llamadas contenedores que incluyen todo lo necesario para que el software se ejecute, incluidas bibliotecas, herramientas de sistema, código y tiempo de ejecución. Con Docker, puede implementar y ajustar la escala de aplicaciones rápidamente en cualquier entorno con la certeza de saber que su código se ejecutará.

<div style="margin:0 auto; text-align:center;" >
<img src="../imgContainer/docker-logo.png" alt="Logo de Docker">
</div>

## ¿Por qué usar Docker?
Existen varios beneficios asociadas al uso de contenedores Docker: 

* Despliegue rápido: de aplicaciones y servicios, con enfoque en [CI](https://es.wikipedia.org/wiki/Integraci%C3%B3n_continua)/[CD](https://es.wikipedia.org/wiki/Entrega_continua). 
* Estandarización de procesos: tanto de desarrollo como de despliegue de aplicaciones
* Portabilidad: transferencia ágil de contenedores de una plataforma a otra
* Consumo ínfimo de recursos, al segregar procesos que se ejecutan de manera independiente, gracias al empleo de características y funciones del kernel de Linux, como [Cgroups](https://clibre.io/blog/por-secciones/hardening/item/425-cgroups-grupos-de-control-en-gnu-linux) y [namespaces](https://clibre.io/blog/por-secciones/hardening/item/384-namespaces-aislar-los-procesos-de-linux-en-sus-propios-entornos-de-sistema)

Por diseño, Docker está orientado a los microservicios, los cuáles presentan [notables ventajas en relación a arquitecturas monolíticas tradicionales](https://aws.amazon.com/es/microservices/) en ámbitos de desarrollo de software. 