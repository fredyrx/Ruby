=begin
	
	Caso 3 : Una empresa distribuidora de golosinas al por menor requiere un sistema
	que le permita realizar los cálculos de los totales a pagar de las facturas con
	mayor precisión debido a problemas de redondeo que ha tenido con SUNAT. Para ello
	se pide que se cree una clase llamada Boleta que tenga como atributo el monto.
	Adicionalmente se necesita que tengan dos métodos, el primero de ellos debe poder
	calcular el IGV mientras que el segundo deberá mostrar el total a pagar (igv calculado + monto original)

	Sin embargo el total a pagar se debe redondear a dos decimales. 
	
=end

class Boleta

	attr_accessor :monto
	IGV = 0.19

	def initialize(monto)
		@monto = monto
	end

	def calcular_igv
		return monto*IGV
	end

	def monto_total
		return (monto + calcular_igv).round(2)
	end

	def redondeo_total
		# Para los enteros
		return "%.2f" % monto_total
	end
end	

boleta01 = Boleta.new(34.764)

puts boleta01.redondeo_total