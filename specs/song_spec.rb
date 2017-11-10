require('minitest/autorun')
require('minitest/rg')
require_relative('../person.rb')
require_relative('../room.rb')
require_relative('../song.rb')

class SongSpec < MiniTest::Test
	
	def setup
		@song = Song.new({artist: "Queen", song: "Bohemian Rhapsody"}
	end

end