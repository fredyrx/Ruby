class Ingrediente
	attr_accessor :nombre, :nocivo
	def initialize(nombre,nocivo=false)
		@nombre = nombre
		@nocivo = nocivo
	end
end