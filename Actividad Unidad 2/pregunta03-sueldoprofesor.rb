class Profesor
	attr_accessor :nombre, :dni, :tarifa, :encuesta, :horas
	def initialize(nombre, dni, tarifa, encuesta=0)
		@nombre, @dni , @tarifa = nombre, dni, tarifa
		@encuesta = encuesta
		@horas = 0
	end

	def ingresar_resultado_encuesta(encuesta)
		@encuesta = encuesta
	end

	def calcular_bono()
		bono = 0
		if @encuesta > 9.0
			bono = calcular_sueldo*0.2
		end
		return bono
	end

	def ingresar_horas_trabajadas(horas)
		@horas = horas
	end

	def calcular_sueldo
		return @tarifa*horas
	end

	def calcular_sueldo_total
		return calcular_sueldo + calcular_bono
	end

end

class Sistema
	attr_accessor :profesores
	def initialize(profesores)
		@profesores = profesores
	end

	def registrar_profesor(profesor)
		@profesores.push(profesor)
	end

	def calcular_planilla
		planilla = 0
		profesores.each do |profesor|
			planilla += profesor.calcular_sueldo_total 
		end
		return planilla
	end

	def mostrar_sueldo_profesor(dni)
		 profesor = buscar_profesor_por_dni(dni) 
		 if profesor.empty?
		 	respuesta = "Ningun profesor tiene el DNI N #{dni}"
		 else
		 	respuesta = "Sueldo: #{profesor[0].calcular_sueldo_total}"
		 end
		 return respuesta
	end
	:private
	def buscar_profesor_por_dni(dni)
		return @profesores.select {|profesor| profesor.dni == dni }
	end

end
profe01 = Profesor.new("Carlos","34675677",50)
profe02 = Profesor.new("Fredy","44862634",100)
profe03 = Profesor.new("Juan","44862633",75)

profe01.ingresar_horas_trabajadas(20)
profe01.ingresar_resultado_encuesta(9.1)
#puts profe01.calcular_bono
#puts profe01.calcular_sueldo_total

profe02.ingresar_horas_trabajadas(20)
profe02.ingresar_resultado_encuesta(9.1)
#puts profe02.calcular_bono
#puts profe02.calcular_sueldo_total

profe03.ingresar_horas_trabajadas(20)
profe03.ingresar_resultado_encuesta(9.1)
#puts profe03.calcular_bono
#puts profe03.calcular_sueldo_total



sistema = Sistema.new([profe01,profe02,profe03])
puts sistema.calcular_planilla
puts sistema.mostrar_sueldo_profesor("44862633")