require "singleton"

# modo ruby
class Mouse01
	include Singleton
end

# modo experto
class Mouse

	def self.instance
		@instance ||= new
	end
	private_class_method :new	

end


mouse1 = Mouse.instance
mouse2 = Mouse.instance

# Verificamos que ambas instancias son las mismas, ya que tiene
# el mismo identificador de memoria
puts mouse1 == mouse2
