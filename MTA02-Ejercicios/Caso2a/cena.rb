require "./copa"
require "./invitado"

class Cena

	attr_accessor :invitados

	def initialize(invitados)
		@invitados = invitados
	end
	:public
	def servir_copas()

		@invitados.each{ |invitado|
			copa_vino = Copa.new()
			invitado.recibir_copa(copa_vino)
		}

	end

	def envenenar_copa()
		copa_envenenada = Copa.new(veneno=true)
		azar = rand(0..@invitados.size()-1)
		@invitados[azar].copa.agregar_veneno()
	end

	def brindar()
		@invitados.each{ |invitado|
			puts invitado.beber_vino()
		}
	end
end

=begin
invitado01 = Invitado.new("Sir Persival")
invitado02 = Invitado.new("Lady Raddish")
invitado03 = Invitado.new("Sir Fredderik")
invitado04 = Invitado.new("Sir Braulio")

puts invitado01.presentarse
invitados = [invitado01,invitado02,invitado03,invitado04]

cena = Cena.new(invitados)
cena.servir_copas()
cena.servir_copas()
cena.brindar()
=end
