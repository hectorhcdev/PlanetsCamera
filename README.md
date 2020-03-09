# Planets and Camera
## Autor

Héctor Henríquez Cabrera

Correo: [hector.henriquez101@alu.ulpgc.es](mailto:hector.henriquez101@alu.ulpgc.es)

Asignatura: Creando Interfaces de Usuario (CIU)

## Introducción

En esta cuarta práctica se ha creado una aplicación mediante **processing3** de un sistema solar y una nave que navega por el mismo. En dicho sistema se ha dispuesto un sol que contiene varios astros orbitando sobre él, estos mismo tienen la misma posibilidad de tener otros astros orbitando sobre ellos. Por lo que se dispuso una estructura de clases para representar dicho sistema. Además se ha dispuesto de una cámara fija y una móvil para explorar dicho sistema.

## Demo

![](demo.gif)

En la demo se puede apreciar el la rotación de cada planeta alrededor del Sol que se encuentra en el centro del sistema, además de que algunos plantes poseen lunas que orbitan alrededor de ellos.

## Implementación

### Librerías

Para la implementación de esta aplicación se ha usado **GifAnimation**. Pero esta no es necesario para su reproducción en otro sistema ya que  solo se uso para  la inclusión del gif, que serviría de demo, pero a  la hora de probar la aplicación no es necesario tenerlo instalado debido a que no ejecuta nada actualmente (en caso de querer generar un gif nuevo descomentar las líneas de esta librería) .

### Diseño

Para el diseño de esta aplicación se optó por añadir la menor cantidad de elementos que dificultarán la visualización del sistema, debido a que la funcionalidad principal era mostrar un sistema solar, por lo que se si sobrecargaba esta funcionalidad se habría quedado en segundo plano. Además se añadió un modelo 3D con forma de ojo para representar la cámara móvil.

### Funcionalidades

Se dispone de varias cámaras, una de ellas es móvil, la cual es controlada mediante el ratón y las teclas: W,S,SPACE y CONTROL. El uso de estas teclas es básicamente para movernos en la dirección apuntada con el ratón en su caso subir y bajar la altitud de la cámara.

### Controles

Todas las interrupciones manejadas en este programa han sido mediante   teclado, por lo que se han manejado las interrupciones generadas  mediante la función **keyPressed** y la función **keyReleased**. Las teclas y acciones consecuentes que las activan son:

|  Tecla  | Uso                                                  |
| :-----: | ---------------------------------------------------- |
|    W    | Avanzar en la dirección apuntada por la cámara       |
|    S    | Retroceder en la dirección apuntada por la cámara    |
|  SPACE  | Subir la cámara verticalmente                        |
| CONTROL | Bajar la cámara verticalmente                        |
|  RATÓN  | Apuntar hacia donde se desea mover/apuntar la cámara |

## Bibliografía

- [Guion de prácticas](https://cv-aep.ulpgc.es/cv/ulpgctp20/pluginfile.php/126724/mod_resource/content/22/CIU_Pr_cticas.pdf)
- [processing.org](https://processing.org/)
- [Modelo 3D](https://free3d.com/es/modelo-3d/eye-bot-524994.html)