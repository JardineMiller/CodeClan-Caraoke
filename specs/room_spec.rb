require('minitest/autorun')
require('minitest/rg')
require_relative('../person.rb')
require_relative('../room.rb')
require_relative('../song.rb')

class RoomSpec < MiniTest::Test

	def setup	
		@room = Room.new(5)
		@bohemian_rhapsody = Song.new({artist: "Queen", song: "Bohemian Rhapsody"})
		@two_shoes = Song.new({artist: "The Cat Empire", song: "Two Shoes"})
		@bad = Song.new({artist: "Michael Jackson", song: "Bad"})

		@jardine = Person.new("Jardine", 50, @two_shoes)
		@billy = Person.new("Billy", 10, @bad)
		@kirsty = Person.new("Kirsty", 50, @bohemian_rhapsody)
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

	def test_room_check_in__person_not_found
		@room.check_in(@graham)
		assert_equal([nil], @room.occupants)
	end

	def test_room_check_out
		@room.check_in(@jardine)
		@room.check_out(@jardine)
		assert_equal([], @room.occupants)
	end

	def test_add_song
		@room.add_song(@two_shoes)
		assert_equal([@two_shoes], @room.songs)
	end

end