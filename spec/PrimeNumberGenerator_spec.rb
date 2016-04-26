require 'spec_helper'
require 'prime'

describe PrimeNumberGenerator do 

	it 'Generates a random prime number' do 
		prime_number_generator = PrimeNumberGenerator.new
		prime_num = prime_number_generator.generate_new_prime
		result = Prime.prime?(prime_num)
		expect(result).to be true
	end


	
end
