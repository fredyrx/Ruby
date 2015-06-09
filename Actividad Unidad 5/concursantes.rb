class Concursante
	attr_accessor :nombre, :apellido, :region, :edad, :calificacion_jurado
	def initialize(nombre, apellido, region, edad)
		@nombre, @apellido, @region, @edad = nombre, apellido, region, edad
		@calificacion_jurado = [0,0,0]
	end

	def calcular_ce
		if @edad >=0 and @edad <=17
			calificacion = 5
		elsif @edad >= 18 and @edad <=25
			calificacion = 3
		elsif @edad >= 26 and @edad <=50
			calificacion = 2 
		else			
			calificacion = 5
		end

		return calificacion
	end

	def calcular_cp
		if ["lima","callao"].include?(@region.downcase)
			calificacion = 3
		else
			calificacion = 5
		end
		return calificacion
	end

	def ingresar_calificacion_jurado(a,b,c)
		@calificacion_jurado = [a,b,c]
	end

	def calcular_puntaje_total
		return calcular_ce + calcular_cp + calificacion_jurado.inject(0){|result,puntaje| result+=puntaje}
	end

	def mostrar_datos
		return "Nombre y apellidos: #{@nombre} #{@apellido} \nRegion: #{@region}\nEdad:#{@edad}"
	end
end


class Cantante < Concursante
	attr_accessor :genero
	def initialize(nombre, apellido, region, edad, genero)
		super(nombre, apellido, region, edad)
		@genero = genero
	end

	def calcular_calificacion_por_genero
		calificacion = 0
		if @genero.downcase == "criollo" 
			calificacion = 1 
		end
		return calificacion
	end

	def calcular_puntaje_total
		return super + calcular_calificacion_por_genero
	end

	def mostrar_datos
		return "#{super} \nGenero musical:#{@genero}"
		
	end
end

class Bailarin < Concursante
	attr_accessor :peso
	def initialize(nombre, apellido, region, edad, peso)
		super(nombre, apellido, region, edad)
		@peso = peso
	end

	def calcular_calificacion_por_peso
		calificacion = 0
		if @peso < 65 
			calificacion = 1 
		end
		return calificacion
	end

	def calcular_puntaje_total
		return super + calcular_calificacion_por_peso
	end

	def mostrar_datos
		return "#{super}\nPeso:#{@peso}"
	end
end

class Acrobata < Concursante
	def initialize(nombre, apellido, region, edad)
		super(nombre, apellido, region, edad)
	end

end


c = Acrobata.new("","","callaO",30)
#puts c.calcular_calificacion_por_edad
#puts c.calcular_calificacion_por_procedencia
