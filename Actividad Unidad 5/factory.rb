require "./concursantes"

class ConcursanteFactory
	def self.acrobata(nombre,apellido,dni,region,edad)
	return Acrobata.new(nombre,apellido,dni,region,edad) 	
	end	
	def self.bailarin(nombre,apellido,dni,region,edad,peso)
	return Bailarin.new(nombre,apellido,dni,region,edad,peso) 	
	end	
	def self.cantante(nombre,apellido,dni,region,edad, genero)
	return Cantante.new(nombre,apellido,dni,region,edad,genero) 	
	end	

	private_class_method :new	

end


#f = ConcursanteFactory.cantante("Carlos","Ampuero","callaO",30,"criollo")
#puts f.mostrar_datos