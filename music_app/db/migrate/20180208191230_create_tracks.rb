class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|
      t.timestamps 
      t.integer :album_id, null: false
      t.string :title, null: false
      t.integer :ord, null: false  
      t.string :lyrics
      t.boolean :regular, default:true
    end
    add_index :tracks, :title
    add_index :tracks, :ord
    add_index :tracks, :lyrics
    add_index :tracks, :regular
  end
end
