class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
    	t.string :title
    	t.string :artist
    	t.integer :duration
      t.timestamps
    end
  end
end
