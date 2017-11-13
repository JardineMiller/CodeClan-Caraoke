class Person
	attr_reader :name, :song, :type
	attr_accessor :wallet

	def initialize(name, type, wallet, song)
		@name = name
		@type = type
		@wallet = wallet
		@song = song
	end

	def sufficient_funds?(price)
		return @wallet >= price
	end

	def pay(amount)
		if sufficient_funds?(amount)
			@wallet -= amount
		end
	end

	def check_playlist(room)
		if room.songs.include?(@song)
			return "Whoo!"
		end
	end

end