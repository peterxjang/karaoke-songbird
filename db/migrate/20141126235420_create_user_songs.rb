class CreateUserSongs < ActiveRecord::Migration
  def change
    create_table :user_songs do |t|
    	t.belongs_to :user
    	t.belongs_to :song
    	t.belongs_to :playlist
      t.timestamps
    end
  end
end
