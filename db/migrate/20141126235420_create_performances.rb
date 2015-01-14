class CreatePerformances < ActiveRecord::Migration
  def change
    create_table :performances do |t|
    	t.belongs_to :user
    	t.belongs_to :song
    	t.belongs_to :playlist
      t.timestamps
    end
  end
end
