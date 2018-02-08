class Albums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.timestamps 
      t.integer :band_id, null: false
      t.string :title, null: false
      t.integer :year, null: false
      t.boolean :live, default: true, null:false
      
    end
    add_index :albums, :band_id
    add_index :albums, :title
    add_index :albums, :year
    add_index :albums, :live
  end
end
