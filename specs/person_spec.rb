require('minitest/autorun')
require('minitest/rg')
require_relative('../person.rb')
require_relative('../room.rb')
require_relative('../song.rb')

class PersonSpec < MiniTest::Test

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

	def test_person_name
		assert_equal("Jardine", @jardine.name)
	end

	def test_person_wallet
		assert_equal(50, @jardine.wallet)
	end

	def test_person_fav_artist
		assert_equal("The Cat Empire", @jardine.song.artist)
	end

	def test_person_fav_song
		assert_equal("Two Shoes", @jardine.song.title)
	end

	def test_person_wallet__true
		assert_equal(true, @jardine.sufficient_funds?(40))
	end

	def test_person_wallet__false
		assert_equal(false, @jardine.sufficient_funds?(60))
	end

	def test_person_pay_money
		assert_equal(45, @jardine.pay(5))		
	end

	def test_person_check_playlist__song_present
		@room.add_song(@two_shoes)
		assert_equal("Whoo!", @jardine.check_playlist(@room))
	end

end