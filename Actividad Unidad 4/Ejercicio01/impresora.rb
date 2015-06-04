class Impresora
	def self.instance
		@instance ||= new
	end

	def self.imprimir(cliente)
		"#{cliente.mostrar_datos_personales}\n#{cliente.mostrar_descripcion_publicaciones}"
	end

	private_class_method :new
end
