require "./cliente"
require "./vehiculos"
require "./programa"


auto01 = Auto.new("RG0343","TOYOTA","YARIS",2015,15000.0)
auto02 = Auto.new("H45DT5","HONDA","CIVIC",2015,26000.0)
#AT (automatica) o MN (manual).
camioneta01 = Camioneta.new("343FWD","VOLVO","DESTROY",2013,43000.0,"AT")
bus01 = Bus.new("DGJ4543","TOYOTA","CAD",2013,86000.0,4,80)
bus02 = Bus.new("VG35TG4","MERCEDES BENZ","TOTAL",2010,100000.0,6,60)
cliente01 = Cliente.new("44862634","Fredy", "Ramos", 991047918,[auto02,camioneta01])
cliente02 = Cliente.new("32543534","Carlos", "Paredes", 998343343,[auto01,bus01,bus02])

app = Programa.new("App Don seguro")
app.registrar_cliente(cliente01)
app.registrar_cliente(cliente02)

puts app.imprimir_reporte_clientes
puts app.imprimir_total_vehiculos_asegurados
puts app.imprimir_prima_total


#puts cliente01.imprimir_reporte_detallado