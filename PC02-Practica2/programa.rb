class Programa
	attr_accessor :nombre, :clientes
	def initialize(nombre, clientes=[])
		@nombre, @clientes = nombre, clientes
	end

	def registrar_cliente(cliente)
		@clientes.push(cliente)
	end

	def imprimir_reporte_clientes
		reporte = "REPORTE_CLIENTES\n"
		reporte += "================\n"
		@clientes.each do |cliente|
			reporte += cliente.imprimir_datos + "\n"
			reporte += cliente.imprimir_reporte_vehiculos + "\n"
			reporte += "PRIMA TOTAL: $#{cliente.calcular_prima_total}" +"\n"
			reporte += "------------------------\n"
		end
		return reporte
	end

	def calcular_prima_total
		return @clientes.inject(0.0) {|resultado,cliente| resultado+cliente.calcular_prima_total}
	end

	def imprimir_prima_total
		return "PRIMA TOTAL ASEGURADORA: $#{calcular_prima_total}"
	end

	def total_vehiculos_asegurados
		return @clientes.inject(0) {|resultado, cliente| resultado+cliente.total_vehiculos}
	end

	def imprimir_total_vehiculos_asegurados
		return "TOTAL VEHICULOS ASEGURADOS: #{total_vehiculos_asegurados}"
	end
end