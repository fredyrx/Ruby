require "./concursantes"
require "./exceptions"

class ConcursanteFactory

	def self.cantante(nombre,apellido,dni,region,edad, genero)
		begin
			return Cantante.new(nombre,apellido,dni,region,edad,genero) 	
		rescue NegativeException => e
			puts "#{ex.class}: #{ex.message}"
		end
	end	

	def self.bailarin(nombre,apellido,dni,region,edad,peso)
		begin
			return Bailarin.new(nombre,apellido,dni,region,edad,peso) 		
		rescue NegativeException => e
			puts "#{ex.class}: #{ex.message}"
		end
	
	end	

	def self.acrobata(nombre,apellido,dni,region,edad)
		begin
			return Acrobata.new(nombre,apellido,dni,region,edad) 	
		rescue NegativeException => e
			puts "#{ex.class}: #{ex.message}"
		end
	end	

	private_class_method :new	

end


#f = ConcursanteFactory.cantante("Carlos","Ampuero","callaO",30,"criollo")
#puts f.mostrar_datos