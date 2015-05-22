=begin

corazones = Array.new(13) {|index| ["corazon", index+1]} 
espadas = Array.new(13) {|index| ["espada", index+1]} 
diamantes = Array.new(13) {|index| ["diamante", index+1]} 
espadas = Array.new(13) {|index| ["espadas", index+1]} 

=end

class Carta

	attr_accessor :numero, :simbolo, :nombre
		def initialize(numero,simbolo)
		@numero, @simbolo = numero, simbolo
		@nombre = definir_nombre()	
	end

	def describir
		return "#{nombre} de #{simbolo}"
	end

	:private
	def definir_nombre
		if @numero == 1
			@nombre = "A"
		elsif @numero == 11
			@nombre = "J"
		elsif @numero == 12
			@nombre = "Q"
		elsif @numero == 13
			@nombre = "k"
		else
			@nombre = @numero.to_s()
		end
	end
end

class Baraja

	SIMBOLOS = ["corazon","trebol","diamante","espada"] 
	attr_accessor :maso
	def initialize
		@maso = generar_maso() 
	end

	def barajar
		@maso = @maso.shuffle()
	end

	def sacar_carta
		carta  = @maso.pop
		return carta
	end

	def tiene_cartas
		if @maso.size > 0
			return true
		else
			return false
		end
	end

	def mostrar_cartas
		descripcion = "\nCartas de maso \n============== \n"
		@maso.each {|carta|
			descripcion += "#{carta.describir()} \n"
		}
		descripcion += "total: #{@maso.size}\n"
		return descripcion
	end
	:private
	def generar_maso
		maso = []
		SIMBOLOS.each { |simbolo|
			palo = Array.new(13) { |index| Carta.new(index+1,simbolo) }
			maso = maso + palo
		}
		return maso
	end
		
end

class Jugador
	attr_accessor :numero, :mano
	def initialize(numero)
		@numero = numero
		@mano = []	
	end

	def recibir_carta(carta)
		@mano.push(carta)
	end

	def mostrar_mano
		descripcion = ""
		@mano.each { |carta|
			descripcion += "#{carta.describir()}\n" 
		}
		descripcion += "total: #{@mano.size}\n"
		return descripcion
	end

	def comparar_carta(carta_mesa)
		carta = nil
		candidatos = @mano.select {|carta| 
			carta.simbolo == carta_mesa.simbolo or carta.numero == carta_mesa.numero
		}
		carta = logica_ataque(candidatos)
		return carta
	end

	def entregar_carta(carta)
		carta_a_entregar = carta
		@mano.delete(carta)
		return carta_a_entregar
	end
	
	def tiene_cartas
		if @mano.size > 0
			return true
		else
			return false
		end
	end
	:private
	def logica_ataque(cartas)
		return cartas[0]
	end
end

class Juego
	attr_accessor:baraja, :jugadores, :maso_mesa
	def initialize(numero_jugadores)
		@jugadores = Array.new(numero_jugadores) {|index| Jugador.new(index+1)} 
		@baraja = Baraja.new()
		@maso_mesa = []
	end

	def barajar
		@baraja.barajar()
	end

	def repartir_cartas_inicial(cantidad_cartas=8)
		# damos 8 rondas de reparto de cartas
		for n in (0...cantidad_cartas)
			repartir_cartas()
		end
	end

	def mostrar_cartas_de_jugadores
		descripcion = ""
		@jugadores.each.with_index { |jugador, index|
			descripcion += "\nJugador #{index+1}\n=========\n"
			descripcion += jugador.mostrar_mano()
			#jugador.mostrar_mano()
		}
		return descripcion
	end

	def mostrar_cartas_de_maso
		return @baraja.mostrar_cartas
	end

	def mostrar_cartas_de_mesa
		descripcion = "\nCartas de mesa\n===========\n"
		@maso_mesa.each { |carta|
			descripcion += "#{carta.describir()}\n" 
		}
		descripcion += "total: #{@maso_mesa.size}\n"
		return descripcion		
	end

	def iniciar
		@maso_mesa.push(@baraja.sacar_carta())
		puts "CARTA INICIAL DE MESA: #{@maso_mesa.last().describir()}"
		ronda = 0
		for n in (0..50)
			ronda += 1
			puts ronda
			@jugadores.each {|jugador|
				jugar_turno(jugador)
				if !jugador.tiene_cartas
					return  "Jugar #{jugador.numero} gano"
					break
				end
			}
		end
	end

	:private
	def jugar_turno(jugador)
		carta_encima = @maso_mesa.last()
		#$puts carta_encima.describir()
		carta_igual = jugador.comparar_carta(carta_encima)
		if carta_igual
			@maso_mesa.push(jugador.entregar_carta(carta_igual))
		else
			carta_de_maso = entregar_carta_a_jugador()
			jugador.recibir_carta(carta_de_maso)
			if carta_de_maso.simbolo == carta_encima.simbolo
				# quitamos la mesa carta de la mano del jugador 
				# y lo colocamos en maso de la mesa
				@maso_mesa.push(jugador.entregar_carta(carta_de_maso))
			end

		end

	end

	# Si el jugador no tiene carta del mismo palo en su mano
	def entregar_carta_a_jugador
		if !@baraja.tiene_cartas # si no quedan cartas
			pasar_maso_mesa_a_baraja()
		end
			return @baraja.sacar_carta
	end

	def pasar_maso_mesa_a_baraja
		# dejamos la carta superior en el maso de la mesa
		carta_superior = @maso_mesa.pop 
		# Pasamos el maso  de la mesa en orden invertido a la baraja
		@baraja.maso = @maso_mesa.reverse
		# limpiamos el maso de la mesa
		@maso_mesa.clear()
		# agregamos el maso que estaba en la parte superior
		@maso_mesa.push(carta_superior)
	end

	def repartir_cartas
		@jugadores.each { |jugador|
			carta = sacar_carta_de_maso()
			jugador.recibir_carta(carta)
		}
	end

	def sacar_carta_de_maso
		carta = @baraja.sacar_carta
		return carta
	end
end

#baraja = Baraja.new()
#baraja.barajar()
ocho_locos = Juego.new(5)
ocho_locos.barajar()
ocho_locos.repartir_cartas_inicial()
#puts ocho_locos.mostrar_cartas_de_maso()
puts ocho_locos.mostrar_cartas_de_maso()
puts ocho_locos.mostrar_cartas_de_jugadores()
puts "A jugar !!!"
puts ocho_locos.iniciar()

puts ocho_locos.mostrar_cartas_de_maso()
puts ocho_locos.mostrar_cartas_de_jugadores()
puts ocho_locos.mostrar_cartas_de_mesa()

puts "*********"
#puts ocho_locos.maso_mesa[0].describir()
#print baraja.maso
