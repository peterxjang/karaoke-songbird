User.delete_all
Song.delete_all
UserSong.delete_all
Playlist.delete_all

emails = ['admin@gmail.com', 'user@gmail.com'] + Array.new(4) { Faker::Internet.email }
emails.each do |email|
	user = User.create!(first_name: Faker::Name.first_name,
										  last_name: Faker::Name.last_name,
										  email: email,
										  password: 'password',
										  admin: email == 'admin@gmail.com')
end