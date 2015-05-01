=begin

Caso 4 : Una empresa de arquitectura está implementando un sistema de presupuestos
automáticos. Para ello requiere que la presentación muestra un mensaje de esta forma:
Carlos Perez, el presupuesto calculado es: 2983.12

Este mensaje debe ser mostrado en una sola cadena. 
Para ello se pide crear una clase cuyos atributos sean el nombre de la persona y el
monto a pagar. 

=end

class Presupuesto

	attr_accessor :nombre, :monto
	def initialize(nombre, monto)
		@nombre = nombre
		@monto = monto
	end

	def mensaje
		return "%s, el presupuesto calculado es: %.2f" % [nombre.capitalize, monto]
	end
end

# Instanciamos
presupuesto01 = Presupuesto.new("fredy ramos",346366.3543)
puts presupuesto01.mensaje