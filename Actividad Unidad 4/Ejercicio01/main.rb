require "./publicaciones"
require "./cliente"
require "./impresora"

# Creamos algunas publicaciones
pub01 = Libro.new("the art of deception",340,"Kevin D. Mitnick","EEUU")
pub02 = Revista.new("Linux magazine",20,2015,5,"Linux New Media")
pub03 = Investigacion.new("Seguridad de plataforma docker",100,"Jay Lyman","Virtualizacion")
pub04 = Libro.new("El senior de los anillos",400,"Alguien","EEUU")

cliente = Cliente.new("Fredy", "Ramos",44862634)
cliente.agregar_publicacion(pub01)
cliente.agregar_publicacion(pub02)
cliente.agregar_publicacion(pub03)
cliente.agregar_publicacion(pub04)
cliente.eliminar_publicacion(pub04)

#puts cliente.cantidad_publicaciones_en_biblioteca
#puts cliente.num_pub_adquiridas

#puts cliente.mostrar_datos_personales
#puts cliente.mostrar_descripcion_publicaciones

#Impresora.instance
puts Impresora.imprimir(cliente)