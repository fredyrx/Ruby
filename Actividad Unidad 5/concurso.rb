class Concurso
	attr_accessor :nombre, :concursantes
	def initialize(nombre)
		@nombre= nombre
		@concursantes = []
	end

	def agregar_concursante(concursante)
		@concursantes.push(concursante)
	end

	def encontrar_concursante(dni)
		concursante = buscar_concursante_por_dni(dni)
		if concursante
			respuesta = "#{concursante.mostrar_datos_concursante}"
		end
	end

	def mostrar_concursantes_ordenados
		return  ordenar_concursantes_por_puntaje.inject("CONCURSANTES\n"){|result,c| result+="#{c.mostrar_datos_concursante}\n\n" }
	end

	private

	def ordenar_concursantes_por_puntaje
		lista = @concursantes.sort_by {|c| c.calcular_puntaje_total}
		return lista.reverse
	end

	def buscar_concursante_por_dni(dni)
		resultado = nil
		encontrados = @concursantes.select {|c| c.dni==dni}
		if encontrados
			resultado = encontrados[0]
		end
		return resultado
	end
end