class CreateArtistCatalogues < ActiveRecord::Migration
  def change
    create_table :artist_catalogues do |t|
      t.references :artist, index: true, foreign_key: true
      t.references :catalogue, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
