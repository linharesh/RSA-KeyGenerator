require 'prime'

class PrimeNumberGenerator

	def generate_new_prime
		randomNumber = rand(100..1000)
		while (true)
			return randomNumber if Prime.prime?(randomNumber)
			randomNumber += 1
		end
	end
	
end