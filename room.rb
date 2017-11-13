class Room

	attr_reader :size, :occupants, :songs, :name

	def initialize(name, size)
		@name = name
		@size = size
		@occupants = []
		@songs = []
	end

	def is_full?
		return @occupants.count >= @size
	end

	def determine_price(person)
		case person.type
			when "adult"
				return 8
			when "student"
				return 6
			when "concession"
				return 5
			when "child"
				return 4
			end
	end

	def check_in(person)
		return if is_full?
		if @occupants.include?(person) == false
			price = determine_price(person)
			person.pay(price)
			@occupants << person
		end
	end

	def check_out(person)
		if @occupants.include?(person)
			@occupants.delete(person)
		end
	end

	def add_song(song)
		@songs << song
	end

end