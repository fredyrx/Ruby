require "./cliente"
require "./cuenta"
class Banco
	attr_accessor :nombre, :clientes
	def initialize(nombre="banco")
		@clientes = []
	end

	def registrar_cliente(nombre, dni, codigo, saldo)
		cliente = Cliente.new(nombre, dni)
		cuenta = Cuenta.new(codigo,saldo)
		cliente.agregar_cuenta(cuenta)
		@clientes.push(cliente)
	end

	def buscar_cuenta(codigo)
		cuenta_encontrada = nil
		@clientes.each do |cliente|
			cliente.cuentas.each do |cuenta|
				if cuenta.codigo == codigo
					cuenta_encontrada = cuenta
					break
				end
				if cuenta_encontrada != nil
					break
				end
			end
		end
		return cuenta_encontrada
	end

	def incrementar_saldo(codigo,saldo)
		cuenta = buscar_cuenta(codigo)
		if cuenta!=nil
			cuenta.agregar_saldo(saldo)
		else
			return "No se encontro cuenta"
		end
	end
	def listar_clientes
		resumen = "LISTA DE CLIENTES\n-----------------\n"
		@clientes.each do |cli|
			resumen = resumen +  "#{cli.saldo_cuentas}"
		end
		return resumen
	end
end

