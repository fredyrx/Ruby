class Publicacion
	attr_accessor :titulo, :paginas
	def initialize(titulo,paginas)
		@titulo, @paginas = titulo,paginas
	end

	def mostrar_datos
		"Titulo: #{titulo} | Paginas: #{paginas}"
	end
end

class Libro < Publicacion
	attr_accessor :autor,:pais_origen
	def initialize(titulo,paginas,autor,pais_origen)
		super(titulo,paginas)
		@autor,@pais_origen = autor,pais_origen
	end

	def mostrar_datos
		"#{super} | autor:#{autor} | pais origen:#{pais_origen}"
	end
end

class Revista < Publicacion
	attr_accessor :anho,:mes,:editorial
	def initialize(titulo,paginas,anho,mes,editorial)
		super(titulo,paginas)
		@anho,@mes,@editorial = anho,mes,editorial
	end
	def mostrar_datos
		"#{super} | Anho:#{anho} | Mes:#{mes} | Editorial:#{editorial}"
	end
end

class Investigacion < Publicacion
	attr_accessor :autor,:area_investigacion
	def initialize(titulo,paginas,autor,area_investigacion)
		super(titulo,paginas)
		@autor,@area_investigacion = autor,area_investigacion
	end
	def mostrar_datos
		"#{super} | autor:#{autor} | Area investigacion:#{area_investigacion}"
	end	
end