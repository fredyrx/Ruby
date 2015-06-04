#por nombre y apellido, DNI y se almacena el número de publicaciones 
class Cliente
	attr_accessor :nombre,:apellido,:dni,:num_pub_adquiridas,:biblioteca
	def initialize(nombre,apellido,dni)
		@nombre,@apellido,@dni = nombre,apellido,dni
		@num_pub_adquiridas = 0
		@biblioteca = []
	end

	def agregar_publicacion(publicacion)
		total = @biblioteca.size() 
		@biblioteca.push(publicacion)
		if total < @biblioteca.size
			@num_pub_adquiridas += 1
		end
	end

	def eliminar_publicacion(publicacion)
		@biblioteca.delete(publicacion)
	end

	def cantidad_publicaciones_en_biblioteca
		return @biblioteca.size
	end

	def mostrar_datos_personales
		"DNI: #{dni} NOMBRE Y APELLIDO: #{nombre} #{apellido}"
	end

	def mostrar_descripcion_publicaciones
		@biblioteca.inject("Publicaciones:\n") {|descripcion,pub| descripcion+="#{pub.mostrar_datos}\n"}
	end
end