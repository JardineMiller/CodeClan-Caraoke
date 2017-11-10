class Room

	attr_reader :size, :occupants, :songs

	def initialize(size)
		@size = size
		@occupants = []
		@songs = []
	end

	def check_in(guest)
		if @occupants.include?(guest) == false
			@occupants << guest
		end
	end

	def check_out(guest)
		if @occupants.include?(guest)
			@occupants.delete(guest)
		end
	end

	def add_song(song)
		@songs << song
	end

end