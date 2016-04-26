require 'spec_helper'

describe RSAKeyGenerator do

	it 'Calculates N correctly' do 
		key_generator = RSAKeyGenerator.new
		key_generator.calculate_n
		result = (key_generator.n == key_generator.p * key_generator.q)
		expect(result).to be true
	end


	it 'Calculates Z correctly' do
		key_generator = RSAKeyGenerator.new
		key_generator.calculate_z
		result = (key_generator.z == (key_generator.p-1)*(key_generator.q-1))
		expect(result).to be true
	end

	it 'Calculates E correctly' do
		key_generator = RSAKeyGenerator.new
		key_generator.calculate_n
		key_generator.calculate_z
		key_generator.calculate_e

		result = (key_generator.e < key_generator.n)
		expect(result).to be true

		result = (key_generator.e.gcd(key_generator.z) == 1)
		expect(result).to be true
	end

	it 'Calculates D correctly' do 
		key_generator = RSAKeyGenerator.new
		key_generator.calculate_n
		key_generator.calculate_z
		key_generator.calculate_e
		key_generator.calculate_d

		result = ((key_generator.e*key_generator.d) % key_generator.z == 1)
		expect(result).to be true
	end

end