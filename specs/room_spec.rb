require('minitest/autorun')
require('minitest/rg')
require_relative('../person.rb')
require_relative('../room.rb')
require_relative('../song.rb')

class RoomSpec < MiniTest::Test

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

	def test_room_size
		assert_equal(5, @room.size)
	end	

	def test_room_songs__is_empty
		assert_equal([], @room.songs)
	end	

	def test_room_occupants__is_empty
		assert_equal([], @room.occupants)
	end	

	def test_room_check_in__person_found
		@room.check_in(@jardine)
		assert_equal([@jardine], @room.occupants)
	end

	def test_room_check_out
		@room.check_in(@jardine)
		@room.check_out(@jardine)
		assert_equal([], @room.occupants)
	end

	def test_room_add_song
		@room.add_song(@two_shoes)
		assert_equal([@two_shoes], @room.songs)
	end

	def test_room_is_full
		@room.check_in(@jardine)
		@room.check_in(@billy)
		@room.check_in(@kirsty)
		@room.check_in(@kelly)
		@room.check_in(@julia)
		assert_equal(true, @room.is_full?)
	end

	def test_room_is_full
		@room.check_in(@jardine)
		@room.check_in(@billy)
		@room.check_in(@kirsty)
		@room.check_in(@kelly)
		@room.check_in(@julia)
		@room.check_in(@james)
		assert_equal(5, @room.occupants.count)
	end

	def test_room_determine_price
		@room.check_in(@jardine)
		assert_equal(44, @jardine.wallet)
	end

end