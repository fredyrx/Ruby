 item = 

 class Asistente
 	attr_accessor :dni,:nombrea,:apellido
 	def initialize(dni,nombre,apellido)
 		@dni,@nombre,@apellido = dni,nombre,apellido
 	end

 	def mostrar_datos
 		return "#{@dni} #{@nombre} #{@apellido}"
 	end

 end

class Estudiante < Asistente
	CUOTA_BASE = 200
	attr_accessor :universidad, :carrera, :anho_academico
	def initialize(dni,nombre,apellido,universidad, carrera, anho_academico)
		super(dni,nombre,apellido)
		@universidad, @carrera, @anho_academico = universidad, carrera, anho_academico
	end

	def calcular_cuota
		return CUOTA_BASE - calcular_descuento()	end

	def mostrar_datos
		return "#{super} | Universidad:#{universidad} | Carrera:#{carrera} | Anio academico: #{anho_academico}"
	end
	
	:private
	def calcular_descuento
		descuento = 0
		if @anho_academico == 4 or @anho_academico == 5
			descuento = 50
		end 
		return descuento
	end
end

class Profesional < Asistente
	CUOTA_BASE = 250
	attr_accessor :grado_academico, :profesion
	def initialize(dni,nombre,apellido,grado_academico,profesion)
		super(dni,nombre,apellido)
		@grado_academico, @profesion = grado_academico, profesion
	end

	def calcular_cuota
		return CUOTA_BASE - calcular_descuento()		
	end

	def mostrar_datos
		return "#{super} | Grado academico:#{grado_academico} | Profesion: #{profesion}"
	end
	

	:private
	def calcular_descuento
		descuento = 0
		if grado_academico == "Mg" or grado_academico == "Dr"
			descuento = 50
		end 
		return descuento
	end
end

class Investigador < Asistente
	CUOTA_BASE = 100
	attr_accessor :area_investigacion
	def initialize(dni,nombre,apellido,area_investigacion)
		super(dni,nombre,apellido)
		@area_investigacion =area_investigacion
	end

	def calcular_cuota
		return CUOTA_BASE - calcular_descuento()		
	end

	def mostrar_datos
		return "#{super} | Area Investigacion:#{area_investigacion}"
	end

	:private
	def calcular_descuento
		descuento = 0
		if @area_investigacion == "IS"
			descuento = CUOTA_BASE
		end
		return descuento
	end
end

class Programa

	attr_reader :asistentes
	def initialize(asistentes)
		@asistentes = asistentes
	end

	def registrar_asistente(asistente)
		@asistentes.push(asistente)
	end

	def calcular_total_asistentes
		return @asistentes.size()
	end

	def listar_asistentes
		datos = "LISTA ASISTENTES\n"
		datos += "================\n"
		@asistentes.each do |asis|
			datos += "#{asis.mostrar_datos()} - Pago: /s. #{asis.calcular_cuota}" + "\n"
		end
		return datos
	end

	def obtener_monto_pagado(dni)
		respuesta = "No se encontro asistente."
		encontrados = @asistentes.select {|asis| dni == asis.dni }
		if encontrados.size() > 0
			asistente = encontrados[0]
			respuesta = "/s.#{asistente.calcular_cuota()}"
		end
		return respuesta
	end
end

# Creamos a los asistentes
asistente01 = Estudiante.new(12345678,"Juan","Perez","UPC","IS",2)
asistente02 = Estudiante.new(23456789,"Miguel","Cervantes","UPC","IS",4)
asistente03 = Profesional.new(34567890,"Juan","Santos","Ing","IS")
asistente04 = Profesional.new(87654321,"Pedro","Ramirez","Dr","IS")
asistente05 = Investigador.new(98765432,"Andres","Fernandez","IS")

asistentes = [asistente01,asistente02,asistente03,asistente04]

app = Programa.new(asistentes)
app.registrar_asistente(asistente05)
# Listando asistentes:
puts app.calcular_total_asistentes()
puts app.listar_asistentes
puts app.obtener_monto_pagado(15345678)

