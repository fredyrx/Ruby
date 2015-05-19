class Invitado
	attr_accessor :nombre, :copa
	def initialize(nombre)
		@nombre = nombre
		@copa = nil
	end

	def recibir_copa(copa)
		@copa = copa
	end

	def beber_vino()
		if @copa.veneno
			return "#{nombre} muere envenenado."
		else
			return "#{nombre} disfruta su vino."
		end
	end

	def presentarse()
		return "Hola, soy #{nombre}"
	end
end

#invitado01 = Invitado.new("Sir Persival")
#puts invitado01.presentarse