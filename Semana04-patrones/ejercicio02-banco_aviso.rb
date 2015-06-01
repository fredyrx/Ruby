require "observer"

class Notify
end

class NotifyEmail < Notify
 	def update(cuenta,saldo)
		if cuenta.saldo < cuenta.minimo_email
			puts "Email: su saldo actual es #{cuenta.saldo} "
		end
	end
end

class NotifySms < Notify
 	def update(cuenta,saldo)
		if cuenta.saldo < cuenta.minimo_sms
			puts "SMS: su saldo actual es #{cuenta.saldo} "
		end
	end
end

class Cliente
	attr_accessor :nombres,:correo,:telefono
	def initialize(nombres,correo,telefono)
		@nombres,@correo,@telefono = nombres,correo,telefono
	end
end


class Cuenta
	include Observable
	attr_accessor :saldo, :cliente, :minimo_email, :minimo_sms
	def initialize(cliente,saldo=1000.0,minimo_email=1000.0,minimo_sms=500.0)
		@saldo, @cliente, @minimo_email,@minimo_sms= saldo, cliente, minimo_email,minimo_sms
		# registrar a los observers
		add_observer(NotifyEmail.new)
		add_observer(NotifySms.new)
	end

	def realizar_retiro(saldo_retiro)
		@saldo -= saldo_retiro
		# hacer que el observer verifique el saldo
		changed
		notify_observers(self,@saldo) 
	end
end

cliente = Cliente.new("Fredy Ramos", "fredy.rx@gmail.com", "991047918")
cuenta_bancaria = Cuenta.new(cliente,2000.0)

cuenta_bancaria.realizar_retiro(500)
cuenta_bancaria.realizar_retiro(600)
cuenta_bancaria.realizar_retiro(700)
#puts cuenta_bancaria.saldo
