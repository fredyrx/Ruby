require "observer"

class Notifier
	def update(bike,kilometers)
		puts "Recorrido #{kilometers}, el total es #{bike.km}"
		puts "Debe ir a mantenimiento" if bike.km > bike.service
	end
end

class Ebike
	include Observable # objeto que sera mirado
	attr_accessor :km, :service
	def initialize(km = 0,service = 500)
		@km, @service = km, service
		add_observer(Notifier.new)
	end

	def log(kilometers)
		@km += kilometers
		changed
		notify_observers(self, kilometers)
	end
end


ebike = Ebike.new
ebike.log(40)
ebike.log(70)
ebike.log(400)
puts ebike.km