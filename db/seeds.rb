require 'csv'

User.delete_all
Song.delete_all
Performance.delete_all
Playlist.delete_all

# Create songs
# artists = Array.new(20) { Faker::Name.name }
# 100.times do 
# 	song = Song.create!(title: Faker::App.name,
# 											artist: artists.sample,
# 											duration: (120..360).to_a.sample)
# end
# songFinder = Echonest::Song.new(Rails.application.secrets.API_KEY_ECHONEST)
# p songFinder.search({combined: 'Weezer'})
CSV.foreach("karaoke Library.csv") do |row|
  song = Song.create!(title: row[1],
  										artist: row[0],
  										duration: (120..360).to_a.sample)
  # p 'SONG INFO'
  # p '========='
  # p songFinder.search({combined: row[0] + ' ' + row[1]}) if $. < 5
end


# Create users
emails = ['admin@gmail.com', 'user@gmail.com'] + Array.new(4) { Faker::Internet.email }
emails.each do |email|
	user = User.create!(first_name: Faker::Name.first_name,
										  last_name: Faker::Name.last_name,
										  email: email,
										  password: 'password',
										  admin: email == 'admin@gmail.com')
end

# Create playlists
5.times do 
	playlist = Playlist.create!
	20.times do 
		Performance.create!(user: User.all.sample, 
										 song: Song.all.sample,
										 playlist: playlist)
	end
end
