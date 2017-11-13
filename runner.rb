require_relative('person.rb')
require_relative('room.rb')
require_relative('song.rb')

puts `clear`

$funky = Room.new("funky", 5)
$spotty = Room.new("spotty", 15)
$glitter = Room.new("glitter", 10)

$rooms = [$funky, $spotty, $glitter]

$bohemian_rhapsody = Song.new("Queen", "Bohemian Rhapsody")
$two_shoes = Song.new("The Cat Empire", "Two Shoes")
$bad = Song.new("Michael Jackson", "Bad")
$lose_control = Song.new("Eminem", "lose_control")

$songs = [$bohemian_rhapsody, $two_shoes, $bad, $lose_control]

def separator(sym)
	puts "#{sym * 50}"
end

def greeting
	puts "Welcome to the CodeClan Caraoke!".center(50)
	puts separator("=")
end

def list_options
	puts ""
	puts "-- 'list_rooms' to list rooms"
	puts "-- 'create_person' to create person"
	puts "-- 'remove_person' to remove person"
	puts "-- 'print_person' to print person details"
	puts "-- 'create_song' to create song"
	puts "-- 'quit' to quit the programme"
	puts ""
end

def find_room(room_name)
	$rooms.find {|room| room.name == room_name}
end

def find_person(person_name)
	for room in $rooms
		for each in room.occupants
			return each if each.name == person_name
		end
	end
end

def print_person
	print "Enter name: "
	person_name = gets.chomp.to_s
	person = find_person(person_name)
	puts ""
	puts "Name: #{person.name}"
	puts "Admission: #{person.type}"
	puts "Wallet: #{person.wallet}"
	puts "Song: #{person.song.title} by #{person.song.artist}"
end

def create_person
	puts ""
	print "Person name: "
	person_name = gets.chomp.to_s
	print "Admission type (adult, student, concession, child): "
	admission_type = gets.chomp.to_s
	print "Wallet: "
	age = gets.chomp.to_i
	print "Favourite song name: "
	song_title = gets.chomp.to_s	
	print "Favourite song artist: "
	song_artist = gets.chomp.to_s
	song = Song.new(song_artist, song_title)
	person = Person.new(person_name, admission_type, age, song)
	print "Add to which room? "
	answer = gets.chomp.to_s
	room = find_room(answer)
	room.check_in(person)
end

def remove_person
	print "Enter name: "
	person_name = gets.chomp.to_s
	for room in $rooms
		for each in room.occupants
			room.occupants.delete each if each.name == person_name
		end
	end
end

def list_rooms
	puts ""
	separator("-")
	print "Rooms".ljust(25)
	puts "Occupants".rjust(25)
	separator("-")
	$rooms.each{|room| puts "#{room.name.ljust(48)} #{room.occupants.count}"}
end	


greeting
input = ""
until input == 'quit' do
	puts""
	puts "-- 'list' to list options"
	puts ""
	input = gets.chomp
	list_options if input == 'list'
	create_person if input == 'create_person'
	remove_person if input == 'remove_person'
	print_person if input == 'print_person'
	list_rooms if input == 'list_rooms'
	puts ""
end




