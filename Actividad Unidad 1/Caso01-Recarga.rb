=begin

	1. Un cliente de una empresa de telefonía ha realizado una compra de un celular de dicha empresa:
	Los datos del cliente son: Nombre, dirección, DNI.
	Del celular: número de celular, código de ciudad y saldo.
	Se desea realizar una recarga de celular y actualizar su saldo.
	Realice un programa orientado a objetos identificando las clases que intervendrían en la solución del problema.

	a. Registre los datos de un cliente, y los datos del celular que posee.
	b. Recargar el saldo de un celular de un cliente, muestre todos sus datos, el saldo inicial y el saldo final luego de la recarga.

=end

class Celular

	attr_accessor :numero_codigo, :codigo_ciudad, :saldo

	def initialize(numero,codigo_ciudad,saldo=0)
		@numero_codigo = numero_codigo
		@codigo_ciudad = codigo_ciudad
		@saldo = saldo
	end

	def recargar(monto)
		saldo += monto
	end
end

class Cliente

	attr_accessor :nombre, :direccion, :dni, :celular

	def initialize(nombre, direccion, dni, celular)
		@nombre = nombre
		@direccion = direccion
		@dni = dni
		@celular = celular
	end

	def comprar_celular(celular)
	end
end

class Empresa

	def initialize(nombre)
		@nombre = nombre
		@clientes = []
	end

end