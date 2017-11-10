require('minitest/autorun')
require('minitest/rg')
require_relative('../person.rb')
require_relative('../room.rb')
require_relative('../song.rb')

class PersonSpec < MiniTest::Test

	def setup	
		@person = Person.new("Jardine", 50, {artist: "The Cat Empire", song: "Two Shoes"})
	end

	def test_person_name
		assert_equal("Jardine", @person.name)
	end

	def test_person_wallet
		assert_equal(50, @person.wallet)
	end

	def test_person_fav_artist
		assert_equal("The Cat Empire", @person.fav_artist)
	end

	def test_person_fav_song
		assert_equal("Two Shoes", @person.fav_title)
	end

	def test_person_wallet__true
		assert_equal(true, @person.sufficient_funds?(40))
	end

	def test_person_wallet__false
		assert_equal(false, @person.sufficient_funds?(60))
	end

end