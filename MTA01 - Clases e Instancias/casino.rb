=begin

	Caso 2 : Un casino desea desarrollar un canódromo virtual. Para ello quieren definir a cada
	no de los perros corredores. Estos llevan como identificación un nombre, un número de pista
	(del 1 al 7) y una velocidad base (entre 1 y 10). Se necesita que el perro pueda mostrar sus
	datos de la siguiente manera:

	Nombre : <<el nombre del perro>> Número : <<el número del perro>>

	En el caso de la velocidad se requiere que se cree un método llamado velocidad_carrera que 
	permita calcular la velocidad para una carrera particular. Cada vez que el perro corre puede 
	generar una velocidad diferente. Para ello la fórmula es la siguiente:

	Velocidad de Carrera = velocidad base + número aleatorio entre 1 y 10

	Para generar el número aleatorio se pide investigar cómo se puede lograr que se genere y con 
	ello desarrollar la fórmula. 

=end

class Perro

	attr_accessor :nombre, :pista, :velocidad

	def initialize(nombre, pista, velocidad)
		@nombre = nombre
		@pista = pista
		@velocidad = velocidad
	end

	def mostrar_datos
		return "Nombre : #{@nombre} Numero : #{@pista}"
	end

	def velocidad_carrera
		return velocidad + rand(1..10)
	end

end

# Instanciando 
perro01 = Perro.new("Boby",1,5)
perro02 = Perro.new("Seus",2,7)
perro03 = Perro.new("Rayo",3,9)

# Mostrar datos
puts perro01.mostrar_datos
puts perro02.mostrar_datos
puts perro03.mostrar_datos

# Calcular velocidades
puts perro01.velocidad_carrera
puts perro02.velocidad_carrera
puts perro03.velocidad_carrera
