class Cliente
	attr_accessor :dni,:nombre,:apellido,:telefono,:vehiculos
	def initialize(dni,nombre,apellido,telefono,vehiculos)
		@dni,@nombre,@apellido,@telefono,@vehiculos = dni,nombre,apellido,telefono,vehiculos
	end

	def calcular_prima_total
		return @vehiculos.inject(0.0) {|resultado, vehiculo| vehiculo.calcular_prima + resultado  }
	end

	def imprimir_datos
		return "DNI:#{dni} NOMBRE:#{nombre} APELLIDO:#{apellido} TELEFONO:#{telefono}"
	end

	def imprimir_reporte_vehiculos
		reporte = ""
		@vehiculos.each{ |vehiculo|
			reporte += "#{vehiculo.mostrar_datos_basicos}\n"
		}
		return reporte
	end

	def imprimir_reporte_detallado
		reporte = "#{imprimir_datos}#{imprimir_reporte_vehiculos}PRIMA TOTAL:#{calcular_prima_total}"
		return reporte
	end

	def total_vehiculos
		return @vehiculos.size
	end
end