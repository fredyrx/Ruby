=begin

Caso 5 : Una empresa de dulces desea determinar el descuento a aplicar en una
venta según el tipo de cliente. Para ello tiene tres tipos de clientes: 
cliente oro, plata y normal. 
En el caso del cliente tipo oro el descuento es del 20% por pedidos de más de
1000 soles, en otro caso no hay descuento. En el caso de los clientes plata el
descuento es de 10% por pedidos de más de 1200 soles, en otros caso no hay descuento. 
En el caso de los clientes normales no hay descuento en ningún caso. 

Se pide crear el programa que permita calcular el descuento según el tipo de cliente. 	
	
=end

class TipoCliente

	def initialize(porcentaje_descuento = 0 , monto_minimo = 0)
		@porcentaje_descuento = (porcentaje_descuento/100.0)
		@monto_minimo = monto_minimo
	end

	def calcular_descuento(monto)
		descuento = 0
		if monto > @monto_minimo
			descuento = monto*@porcentaje_descuento
		end
		return descuento.round(2) 
	end

	def calcular_monto_con_descuento(monto)
		monto_total = monto
		if monto > @monto_minimo
			monto_total = monto*(1+@porcentaje_descuento) 
		end
		return monto_total.round(2)
	end

end

class Venta

	def initialize(tipo_cliente, monto)
		@tipo_cliente = tipo_cliente
		@monto = monto
	end

	def calcular_descuento
		return @tipo_cliente.calcular_descuento(@monto)
	end
end

# Creamos los tipos de cliente
cliente_oro = TipoCliente.new(20,1000)
cliente_plata = TipoCliente.new(10,1200)
cliente_normal = TipoCliente.new()

# Creamos 3 ventas
venta01 = Venta.new(cliente_oro,1300)
venta02 = Venta.new(cliente_plata,1300)
venta03 = Venta.new(cliente_normal,1300)

# Calculamos los descuentos para cada venta
puts venta01.calcular_descuento
puts venta02.calcular_descuento
puts venta03.calcular_descuento
