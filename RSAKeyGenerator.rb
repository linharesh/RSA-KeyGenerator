require_relative './PrimeNumberGenerator'

class RSAKeyGenerator

	attr_accessor :p
	attr_accessor :q
	attr_accessor :n
	attr_accessor :z
	attr_accessor :e
	attr_accessor :d

	def initialize
		prime_generator = PrimeNumberGenerator.new
		@p = prime_generator.generate_new_prime
		@q = prime_generator.generate_new_prime
	end

	def generate_and_print_RSA_pair
		calculate_n
		calculate_z
		calculate_e
		calculate_d
		puts "Public Key : ( #{@n} , #{@e} )"
		puts "Private Key : ( #{@n} , #{@d} )"
	end


	def calculate_n
		@n = @p * @q
	end

	def calculate_z
		@z = (@p-1)*(@q-1)
	end

	def calculate_e
		puts 'Calculating E...'
		@e = 5
		while (@e < @n)
			if @e.gcd(@z) == 1
				return @e
			end 
			@e += 1
		end
	end

	def calculate_d
		puts 'Calculating D...'
		@d = 1
		while true
			if (@e * @d) % @z == 1
				return @d
			end
		  @d += 1
		end
	end

end