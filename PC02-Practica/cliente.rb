class Cliente
	attr_accessor :nombre, :dni, :cuentas
	def initialize(nombre, dni)
			@nombre, @dni = nombre, dni
			@cuentas = []
	end

	def agregar_cuenta(cuenta)
		@cuentas.push(cuenta)
	end

	def saldo_total
		total = 0
		@cuentas.each do |cuenta|
			total += cuenta.saldo
		end
		return total
	end

	def saldo_cuentas
		resumen = "DNI: #{dni} NOMBRES:#{nombre}\nCuentas:\n"
		cuentas.each do |cuenta|
			resumen = resumen + "#{cuenta.to_string}\n"
		end
		return resumen
	end
end