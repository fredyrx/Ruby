=begin
Caso 02a

Los invitados a una cena comparten una velada tranquila mientras conversan y beben
vino. Sir Persival conversa con Lady Raddish y Sir Fredderik departe con Sir Braulio
y así por el estilo. Todo ellos beben una copa de vino. De pronto uno de los 
invitados muere. Se descubre en la investigación que uno de los vasos estaba con
veneno y fue lo que provocó la muerte del invitado. Desarrollar el programa que 
permita simular la situación en que cada invitado recibe una copa de vino y 
solamente uno de ellos muere envenenado. 
=end

require "./cena"
require "./copa"
require "./invitado"


invitado01 = Invitado.new("Sir Persival")
invitado02 = Invitado.new("Lady Raddish")
invitado03 = Invitado.new("Sir Fredderik")
invitado04 = Invitado.new("Sir Braulio")

invitados = [invitado01,invitado02,invitado03,invitado04]

cena = Cena.new(invitados)

cena.servir_copas()
cena.envenenar_copa()
cena.brindar()

