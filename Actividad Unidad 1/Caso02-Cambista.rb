=begin

	2. Un cambista de Ocoña necesita saber cuántos billetes de 100, 50 y 20 dólares respectivamente 
	necesita para realizar un cambio de dinero de un cliente que le ha pedido le cambie una cantidad 
	en soles.

	Realice un programa orientado a objetos tal que le permita atender a dicho cliente.
	Considere registrar los datos del cliente: Nombre y dni además del monto que desea que le cambien.

	Considerar el tipo de cambio = 3.12 soles/dólar.

=end

class Atencion

		BILLETES = [100,50,20]
		TIPO_CAMBIO = 3.12

		attr_accessor :nombre, :dni, :monto_dolares

	def initialize(nombre, dni, monto_dolares)
		@nombre = nombre
		@dni = dni
		@monto_dolares = monto_dolares
	end

	def calcular_monto_soles
		return (monto_dolares*TIPO_CAMBIO).round(2)
	end

	def realizar_cambio
		monto_soles = calcular_monto_soles 

		puts "#{monto_dolares}$ equivalen a /s.#{monto_soles}"

		BILLETES.each do |tipo_billete|
			cantidad_billetes = monto_soles.to_i/tipo_billete
			monto_soles = monto_soles - cantidad_billetes*tipo_billete
			puts "#{cantidad_billetes} billetes de /s.#{tipo_billete}"
		end

		puts "/s.#{monto_soles.round(2)} en monedas"
	end
end

transaccion01 = Atencion.new("Fredy Ramos", 44862634, 1979)
transaccion01.realizar_cambio()