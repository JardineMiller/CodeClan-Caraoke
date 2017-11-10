class Person
	attr_reader :name, :song
	attr_accessor :wallet

	def initialize(name, wallet, song)
		@name = name
		@wallet = wallet
		@song = song
	end

	def sufficient_funds?(price)
		return @wallet >= price
	end

end