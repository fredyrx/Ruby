class Raza
	attr_accessor :nombre
	def initialize(nombre)
		@nombre = nombre
	end
end

class Jugador
	attr_accessor :nombre, :apellido, :mote , :raza, :puntaje
	def initialize(nombre, apellido, mote , raza)
		@nombre, @apellido, @mote , @raza = nombre, apellido, mote , raza
		@puntaje = 0
	end

	def registrar_puntaje(puntaje)
		@puntaje = puntaje
	end
end

class Liga
	attr_accessor :nombre, :max_jugadores, :jugadores
	def initialize(nombre, max_jugadores)
		@nombre, @max_jugadores = nombre, max_jugadores
		@jugadores = []
	end

	def registar_jugador(jugador)
		resultado = false
		if @jugadores.size < max_jugadores
			@jugadores.push(jugador)
			resultado = true
		end
		return resultado
	end

	def iniciar_juego
		# Simulamos el registro del puntaje
		@jugadores.each do |jugador|
			jugador.registrar_puntaje(rand(0..10))
		end
	end

	def calcular_puntaje_liga
		total = 0
		@jugadores.each do |jugador|
			total += jugador.puntaje
		end
		return total
	end

	def obtener_ganador_liga
		"""
		ganador = @jugadores[0]
		@jugadores.each do |jugador|
			if jugador.puntaje > ganador.puntaje
				ganador = jugador
			end 
		end
		"""
		return @jugadores.max_by { |ganador| ganador.puntaje }
	end

	def mostar_ganador
		ganador = obtener_ganador_liga
		"Ganador liga #{@nombre}: #{ganador.mote}(#{ganador.nombre})  Raza: #{ganador.raza.nombre} Puntaje: #{ganador.puntaje}"
	end

end

class Campeonato
	attr_accessor :nombre, :ligas
	def initialize(nombre)
		@nombre = nombre
		@ligas = []
	end

	def agregar_ligas(ligas)
		@ligas = ligas
	end

	def iniciar_campeonato
		ligas.each do |liga| 
			liga.iniciar_juego()
		end
	end

	def encotrar_mejor_liga
		mejor_liga = @ligas.max_by {|liga| liga.calcular_puntaje_liga }
		return mejor_liga
	end

	def mostrar_mejor_liga
		mejor_liga = encotrar_mejor_liga
		"Mejor liga: #{mejor_liga.nombre} Puntaje acumulado: #{mejor_liga.calcular_puntaje_liga}"
	end

	def mostrar_ganador_cada_liga
		respuesta = "GANADORES DE CADA LIGA\n"
		@ligas.each do |liga| 
			respuesta += liga.mostar_ganador + " \n" 
		end
		return respuesta
	end
end

# Instancioamos las razar
terran = Raza.new("Terran")
protoss = Raza.new("Protoss")
zerg = Raza.new("Zerg")

#Instanciamos a los jugadores
jugador01 = Jugador.new("fredy", "ramos", "escorpio", terran)
jugador02 = Jugador.new("calos", "caceres", "toro", zerg)
jugador03 = Jugador.new("francisco", "perez", "espacial", terran)
jugador04 = Jugador.new("miguel", "jimenez", "leon", protoss)
jugador05 = Jugador.new("jose", "aroon", "gun", protoss)
jugador06 = Jugador.new("luis", "garcia", "tin tin", terran)
jugador07 = Jugador.new("kenjo", "morales", "zeus", zerg)
jugador08 = Jugador.new("erick", "oki", "megatron", terran)
jugador09 = Jugador.new("keny", "santos", "optimus", zerg)

# Instanciamos las ligas
liga_platino = Liga.new("Platino",3)
liga_oro = Liga.new("Oro",3)
liga_plata = Liga.new("plata",3)

# Creamos el campeonato
campeonato = Campeonato.new("Campeonato de StarCraft")

# Registramos los jugadores en las ligas
liga_plata.registar_jugador(jugador01)
liga_plata.registar_jugador(jugador02)
liga_plata.registar_jugador(jugador03)

liga_oro.registar_jugador(jugador04)
liga_oro.registar_jugador(jugador05)
liga_oro.registar_jugador(jugador06)

liga_platino.registar_jugador(jugador07)
liga_platino.registar_jugador(jugador08)
liga_platino.registar_jugador(jugador09)

# Registramos las ligas en el campeonato

campeonato.agregar_ligas([liga_platino, liga_oro, liga_plata])
campeonato.iniciar_campeonato
puts campeonato.mostrar_mejor_liga
puts campeonato.mostrar_ganador_cada_liga

