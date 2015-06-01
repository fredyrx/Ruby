class Jugador
	attr_accessor :dni, :nombre, :apellido, :minutos_jugados
	def initialize(dni,nombre,apellido,minutos_jugados)
		@dni, @nombre, @apellido, @minutos_jugados = dni,nombre,apellido,minutos_jugados
	end

	def imprimir_datos
		return "#{dni} #{nombre} #{apellido}"
	end
end

class Arquero < Jugador
	attr_accessor :tiros_atajados, :goles_contra
	def initialize(dni,nombre,apellido,minutos_jugados,tiros_atajados, goles_contra)
		super(dni,nombre,apellido,minutos_jugados)
		@tiros_atajados, @goles_contra = tiros_atajados, goles_contra
	end

	def calcular_factor_rendimiento
		return @tiros_atajados*0.5 - @goles_contra*0.6
	end

	def calcular_bono
		return @minutos_jugados*5 + 800*calcular_factor_rendimiento
	end
end
class Defensa < Jugador
	attr_accessor :balon_recuperados, :balon_perdidos
	def initialize(dni,nombre,apellido,minutos_jugados,balon_recuperados, balon_perdidos)
		super(dni,nombre,apellido,minutos_jugados)
		@balon_recuperados, @balon_perdidos = balon_recuperados, balon_perdidos
	end

	def calcular_factor_rendimiento
		return @balon_recuperados*0.4 - @balon_perdidos*0.5
	end

	def calcular_bono
		return @minutos_jugados*4 + 500*calcular_factor_rendimiento
	end
end
class Mediocampo < Jugador
	attr_accessor :pases_efectivos,:asistencias
	def initialize(dni,nombre,apellido,minutos_jugados,pases_efectivos,asistencias)
		super(dni,nombre,apellido,minutos_jugados)
		@pases_efectivos,@asistencias = pases_efectivos,asistencias
	end

	def calcular_factor_rendimiento
		return @pases_efectivos*0.1 + @asistencias*0.5
	end

	def calcular_bono
		return @minutos_jugados*4 + 600*calcular_factor_rendimiento
	end
end
class Delantero < Jugador
	attr_accessor :tiros_arco, :goles
	def initialize(dni,nombre,apellido,minutos_jugados,tiros_arco, goles)
		super(dni,nombre,apellido,minutos_jugados)
		@tiros_arco, @goles = tiros_arco, goles
	end

	def calcular_factor_rendimiento
		return @tiros_arco*0.2 + @goles*0.6
	end

	def calcular_bono
		return @minutos_jugados*5 + 1000*calcular_factor_rendimiento
	end
end

class Programa
	attr_accessor :jugadores
	def initialize(jugadores)
		@jugadores = jugadores
	end

	def mostrar_jugador_mayor_rendimiento
		jugadores_por_fr =  @jugadores.sort_by {|jugador| jugador.calcular_factor_rendimiento()}
		jugador_max_fr = jugadores_por_fr.last 
		return  "#{jugador_max_fr.imprimir_datos} | FR: #{jugador_max_fr.calcular_factor_rendimiento}"
	end

	def imprimir_datos_jugadores
		texto = ""
		@jugadores.each do |jugador|
			texto += "#{jugador.imprimir_datos} | FR: #{jugador.calcular_factor_rendimiento} | Bono: #{jugador.calcular_bono} \n"
		end
		return texto
	end

	def calcular_monto_total_a_pagar
		total = 0
		@jugadores.each do |jugador|
			total += jugador.calcular_bono()
		end
		return total
	end

end

jugador01 = Arquero.new(12345678,"Raul","Fernandez",90,4,2)
jugador02 = Defensa.new(22345678,"Sergio","Ramos",45,21,9)
jugador03 = Mediocampo.new(32345678,"Xavi","Garcia",90,43,2)
jugador04 = Delantero.new(42345678,"Paolo","Guerrero",90,3,2)

app = Programa.new([jugador01,jugador02,jugador03,jugador04])
puts app.imprimir_datos_jugadores()
puts app.calcular_monto_total_a_pagar()
puts app.mostrar_jugador_mayor_rendimiento()