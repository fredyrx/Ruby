require "./banco"

banco = Banco.new("bpd")
banco.registrar_cliente("Luis Perez","09384567",2324325, 200)
#puts banco.listar_clientes
banco.incrementar_saldo(2324325,300)
puts banco.listar_clientes

