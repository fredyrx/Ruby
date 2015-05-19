class Copa
	attr_accessor :veneno
	def initialize(veneno=false)
		@veneno = veneno
	end

	def agregar_veneno()
		@veneno = true
	end
end