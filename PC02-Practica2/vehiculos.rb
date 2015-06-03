class Vehiculo
	attr_accessor :placa,:marca,:modelo,:anho_fabricacion,:precio_base
	def initialize(placa,marca,modelo,anho_fabricacion,precio_base)
		@placa,@marca,@modelo,@anho_fabricacion,@precio_base = placa,marca,modelo,anho_fabricacion,precio_base
	end

	def calcular_prima
		return @precio_base/(10*(2015 - @anho_fabricacion + 1))
	end

	def mostrar_datos_basicos
		return "PLACA: #{@placa} | MARCA: #{@marca} | MODELO:#{@modelo} | ANHO FABRICACION: #{@anho_fabricacion} | PRECIO BASE: $#{@precio_base}"
	end
end
class Auto < Vehiculo
	def initialize(placa,marca,modelo,anho_fabricacion,precio_base)
		super(placa,marca,modelo,anho_fabricacion,precio_base)
	end
end

class Camioneta < Vehiculo
	attr_accessor :tipo_transmision
	def initialize(placa,marca,modelo,anho_fabricacion,precio_base,tipo_transmision)
		super(placa,marca,modelo,anho_fabricacion,precio_base)
		@tipo_transmision = tipo_transmision
	end

	def calcular_prima
		#AT (automatica) o MN (manual).
		prima = super
		if @tipo_transmision == "AT"
			prima = prima*1.1
		end
		return prima
	end
end

class Bus < Vehiculo
	attr_accessor :numero_ejes, :numero_asientos
	def initialize(placa,marca,modelo,anho_fabricacion,precio_base,numero_ejes, numero_asientos)
		super(placa,marca,modelo,anho_fabricacion,precio_base)
		@numero_ejes, @numero_asientos = numero_ejes, numero_asientos
	end

	def calcular_prima
		return (@precio_base+@numero_asientos*10)/(@numero_ejes*(2015 -@anho_fabricacion+1))
	end
end

