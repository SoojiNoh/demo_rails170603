class CreateArtistArtworks < ActiveRecord::Migration
  def change
    create_table :artist_artworks do |t|
      t.references :artist, index: true, null: false
      t.references :artwork, index: true, null: false      
      t.timestamps null: false
    end
  end
end
