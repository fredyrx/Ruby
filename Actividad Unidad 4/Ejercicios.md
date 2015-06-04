Ejercicio 1

Dentro del proceso de digitalización de textos, se desea crear una aplicación para que los usuarios puedan gestionar las publicaciones digitales adquiridas. Los usuarios son identificados por nombre y apellido, DNI y se almacena el número de publicaciones adquiridas. Los usuarios pueden agregar y eliminar N publicaciones en su biblioteca, y estas publicaciones pueden ser libros, revistas o investigaciones.

En el caso de los libros se tendrá la siguiente información: Título, Total de páginas, Autor, País de origen.

En el caso de las revistas se almacenará: Título, Total de páginas, Año, Mes, Editorial

Y en el caso de las investigaciones se tendrá: Título, Total de páginas,Autor,Área de investigación.

Adicionalmente al planteamiento de las relaciones y las clases correspondientes se requiere implementar una clase llamada Impresora que deberá tener un método llamado imprimir_reporte que será el encargado de mostrar en pantalla los datos del cliente y la lista de sus publicaciones con sus datos completos.

Como requerimiento se deberá utilizar el patrón Factory para que el sistema solamente permita una instancia de impresora. 

	
Ejercicio 2

Una empresa de seguridad desea desarrollar una aplicación que le permita guardar la información de las personas que requieren usar un arma y solicitan entrenamiento. 

Para ello se debe tener en cuenta lo siguiente: Las personas en general requiere identificación completa con nombre, apellido, edad y DNI. Adicionalmente deberá tener un campo llamado “horas de entrenamiento” y un campo “apto”. Las horas y el campo comenzarán con 0 horas e “inapto” inicialmente. 

La persona podrá ir entrenando y sumando horas. En cuanto llegue a 600 horas entonces su estado pasará a apto. 

Desarrollar el programa que me permita automatizar dicho proceso. Deberá usar el patrón observer para las funcionalidades pertinentes. 

Ejercicio 3

Una empresa de venta de entradas desea desarrollar una aplicación que permita vender de manera automatizada sus espectáculos. Para ello se solicita realice una aplicación utilizando el patrón MVC que me permita presentar la selección de las obras a presentarse:

1.- Piaf
2.- Oh por Dios!
3.- Los Fabulatas 2
4.- Fausto
5.- El Trámite

Y el usuario pueda elegir su opción. Adicionalmente el usuario deberá seleccionar la cantidad de entradas. Cada uno de los espectáculos tiene un precio, un teatro y una función determinada por un día y hora. Considerar que cada venta solamente puede hacerse sobre un espectáculo. 

Desarrollar la aplicación teniendo en cuenta que los usuarios se registran para comprar las entradas pues el sistema requiere el nombre, apellido y DNI del comprador. 

El sistema deberá mostrar

Datos del comprador. 
Datos de las entradas a la obra comprada y cantidad.
Total a pagar por las entradas. 
