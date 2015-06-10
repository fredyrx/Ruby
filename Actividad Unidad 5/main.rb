require "./factory"
require "./concurso"
# Creamos a los participantes
concursante01 = ConcursanteFactory.bailarin("Carlos","Patron","23123223", "Lima", 23, 64)
concursante02 = ConcursanteFactory.cantante("Maria","Caceres","33123223", "Arequipa", 18, "Criollo")
concursante03 = ConcursanteFactory.acrobata("Jose","Carbon","73434343","Callao", 26)

#puts concursante01.mostrar_datos_concursante
#puts concursante02.mostrar_datos_concursante
#puts concursante03.mostrar_datos_concursante

# Creamos el concurso
concurso = Concurso.new("Los peruchos tienen talento")
concurso.agregar_concursante(concursante01)
concurso.agregar_concursante(concursante02)
concurso.agregar_concursante(concursante03)

#puts concurso.encontrar_concursante("73434343")
puts concurso.mostrar_concursantes_ordenados