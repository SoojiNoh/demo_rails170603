class CreateArtworkCatalogues < ActiveRecord::Migration
  def change
    create_table :artwork_catalogues do |t|
      t.references :artwork, index: true, null: false
      t.references :catalogue, index: true, null: false
      t.timestamps null: false
    end
  end
end
