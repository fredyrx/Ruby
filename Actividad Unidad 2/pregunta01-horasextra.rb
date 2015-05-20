=begin
Realizar un programa orientado a Objetos para la empresa ORION que calcule el pago de una planilla, en donde el pago mínimo sea 750.00 nuevos soles. Considerar el pago por horas, horas extras, los descuentos necesarios y las comisiones tomando en consideración la siguiente tabla:

* Si las ventas < 1700.00 no hay comisión

* Si las Ventas >= 1700.00 y < 2500.00 la comisión es de 3%

* Si las Ventas >= 2500.00 y < 3200.00 la comisión es de 5%

* Si las Ventas >= 3200.00 y < 3700.00 la comisión es de 7%

* Si las Ventas >= 3700.00 la comisión es de 10%

Desarrollar el programa tomando en cosideración que cada empleado es registrado con su DNI, nombre y apellido. En el caso de los pagos por hora se tiene ya el dato del total (teniendo en cuenta que el mínimo es 750.00). En el caso de las horas extras se tomará en cuenta que cada hora extra se paga a 5.0 soles la hora. La comisión se calcula sobre el porcentaje del sueldo de horas + horas extras.

Elaborar un método que permita el cálculo de las horas extras de cada trabajador Elaborar un método que permita el cálculo de la comisión de cada trabajador

Elaborar un método que permita el cálculo de del sueldo total del trabajador

Elaborar un método que permita el cálculo de la planilla total de la empresa
=end

class Empleado

	PAGO_MINIMO = 750.0
	PAGO_HORA_EXTRA = 5.0

	attr_accessor :dni, :nombre, :apellidos, :ventas, :horas_extra, :descuentos

	def initialize(dni, nombre, apellidos)
		@dni, @nombre, @apellidos = dni, nombre, apellidos
		@ventas = 0
		@horas_extra = 0
		@descuentos = 0
	end

	def ingresar_ventas(ventas)
		@ventas = ventas
	end

	def ingresar_horas_extra(horas)
		@horas_extra = horas		
	end

	def ingresar_descuentos(monto)
		@descuentos = monto
		
	end

	def calcular_pago_base
		return PAGO_MINIMO
	end

	def calcular_pago_horas_extra
		return @horas_extra*PAGO_HORA_EXTRA
	end

	def calcular_comision(monto)
		porcentaje_comision = seleccionar_comision
		comision = monto*porcentaje_comision
		return comision

	end

	def calcular_pago_total
		pago = calcular_pago_base() + calcular_pago_horas_extra()

		pago_total =  pago + calcular_comision(pago) - descuentos
		return pago_total
	end

	:private
	def seleccionar_comision
		monto = @ventas
		case monto
			when monto < 1700
				comision = 0
			when monto < 2500
				comision = 0.03	
			when monto < 3200
				comision = 0.05
			when monto < 3700
				comision = 0.07
			else
				comision = 0.1
		end
	end

end

class Empresa

	attr_accessor :nombre, :empleados
	def initialize(nombre)
		@nombre = nombre
		@empleados = []
	end

	def registrar_empleado(dni, nombre, apellidos)
		empleado = Empleado.new(dni, nombre, apellidos) 	
		# Ingresamos valores simulados
		empleado.ingresar_horas_extra(simular_horas_extra)
		empleado.ingresar_ventas(simular_ventas)
		empleado.ingresar_descuentos(simular_descuento)
		empleados.push(empleado)
	end

	def calcular_planilla
		planilla = 0
		@empleados.each do |empleado|
			planilla += empleado.calcular_pago_total()
		end
		return planilla
	end
	:private
	# Metodos para simular montos
	def simular_horas_extra
		return rand(0..20)
	end

	def simular_ventas
		return rand(0..5000)
	end

	def simular_descuento
		return rand(0..500)
	end
end

orion = Empresa.new("Orion")
orion.registrar_empleado(44862634,"Fredy", "Ramos Pomari")
orion.registrar_empleado(49862633,"Carlos", "Perez Gonzales")
puts orion.calcular_planilla()