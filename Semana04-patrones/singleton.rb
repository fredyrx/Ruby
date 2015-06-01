require "singleton"
# 1era nomenclatura
class Singleton1
	def self.instance
		# get instance or create new
		@instance ||= new # forma corta
 		#@instance = @instance || new # forma larga
	end

	# Set method like a private
	private_class_method :new
end

puts Singleton1.instance
puts Singleton1.instance
# => puts Singleton.new # error

# 2da nomenclatura
class Singleton2
	class << self
		def instance
			# get instance or create new
			@instance ||= new # forma corta
	 		#@instance = @instance || new # forma larga
		end

	# Set method like a private
	private :new

	end
end

# era forma a lo ruby
class Printer
	include Singleton
end

printer = Printer.instance
puts "se ha creado a la instancia #{printer}"