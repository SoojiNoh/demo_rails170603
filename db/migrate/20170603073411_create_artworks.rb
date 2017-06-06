class CreateArtworks < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
      t.string :category
      t.string :artist_name
      t.string :photo
      t.string :title
      t.string :size
      t.integer :width
      t.integer :height
      t.string :material
      t.date :created_date
      t.references :artist, index: true
      t.timestamps null: false
    end
  end
end
