class Cuenta
	attr_accessor :codigo, :saldo
	def initialize(codigo, saldo)
			@codigo, @saldo = codigo, saldo
	end

	def agregar_saldo(saldo)
		@saldo += saldo
	end

	def to_string
		return "CODIGO: #{codigo} SALDO:#{saldo}"
	end
end