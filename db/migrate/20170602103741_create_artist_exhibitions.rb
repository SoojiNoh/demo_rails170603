class CreateArtistExhibitions < ActiveRecord::Migration
  def change
    create_table :artist_exhibitions do |t|
      t.references :artist, index: true, null: false
      t.references :exhibition, index: true, null: false
      t.timestamps null: false
    end
  end
end
