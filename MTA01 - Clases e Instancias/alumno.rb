=begin

	Caso 1 : 
	Desarrollar una clase llamada Alumno que permita al alumno calcular su promedio de notas
	finales. Los alumnos estádefinidos por su código de alumno, nombre, apellido, notas: 
	práctica 01, práctica 02, práctica 03, parcial y final. Esto da como resultado la nota final 
	del alumno, que es lo que se quiere calcular, según esta fórmula:

	PF = Promedio práicas * 0.2 + Parcial * 0.3 + Final * 0.5

	Luego de creada la clase se pide instanciar 3 alumnos y que muestre a cada uno sus notas.

=end

# Autor: Fredy Ramos

class Alumno

	# Constantes
	PESO_PRACTICAS = 0.2
	PESO_PARCIAL = 0.3
	PESO_FINAL = 0.5


	def initialize(codigo, nombre, apellido)
		@codigo = codigo
		@nombre = nombre
		@apellido = apellido

		@practicas = Array.new(3,0)
		@parcial = 0
		@final = 0
	end

	def ingresar_notas(practicas, parcial, final)
		@practicas = practicas
		@parcial = parcial
		@final = final
		#puts @practicas
	end

	def calcular_promedio_practicas
		promedio = 0
		@practicas.each{|practica| promedio+=practica }
		return (promedio)/@practicas.count 
	end

	def calcular_promedio_final
		pf = calcular_promedio_practicas*PESO_PRACTICAS + @parcial*PESO_PARCIAL + @final*PESO_FINAL
		return pf
	end

	def mostrar_promedio
		descripcion = "#{@nombre} #{@apellido}"
		puts "#{descripcion.ljust(25)}: #{calcular_promedio_final.ceil}"
	end

	def mostrar_notas
		# Mostramos prom_practicas, parcial, final, promedio fina
		descripcion = "#{@nombre} #{@apellido}".ljust(20)
		puts "#{@codigo} #{descripcion} #{calcular_promedio_practicas} #{@parcial} #{@final} #{calcular_promedio_final.ceil}"
	end
end

# Instanciamos alumnos
alumno01 = Alumno.new("001","Fredy", "Ramos")
alumno02 = Alumno.new("002","Carlos", "Paredes")
alumno03 = Alumno.new("003","Martin", "FLores")

# Ingresamos notas
alumno01.ingresar_notas([15,13,17],15,16)
alumno02.ingresar_notas([18,12,9],15,11)
alumno03.ingresar_notas([12,12,13],19,14)

# Mostramos promedios
print "COD ","ALUMNO".ljust(22),"PP EP EF PF","\n"
puts "-------------------------------------"
alumno01.mostrar_notas
alumno02.mostrar_notas
alumno03.mostrar_notas

