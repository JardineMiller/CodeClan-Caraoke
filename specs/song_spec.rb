require('minitest/autorun')
require('minitest/rg')
require_relative('../person.rb')
require_relative('../room.rb')
require_relative('../song.rb')


class SongSpec < MiniTest::Test
	
	def setup
		@room = Room.new("Retro", 5)

		@bohemian_rhapsody = Song.new("Queen", "Bohemian Rhapsody")
		@two_shoes = Song.new("The Cat Empire", "Two Shoes")
		@bad = Song.new("Michael Jackson", "Bad")

		@jardine = Person.new("Jardine", "student", 50, @two_shoes)
		@billy = Person.new("Billy", "child", 10, @bad)
		@kirsty = Person.new("Kirsty", "adult", 50, @bohemian_rhapsody)
		@james = Person.new("James", "adult", 50, @bohemian_rhapsody)
		@kelly = Person.new("Kelly", "adult", 50, @bad)
		@julia = Person.new("Julia", "concession", 50, @bad)
	end

end