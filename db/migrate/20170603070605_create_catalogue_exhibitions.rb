class CreateCatalogueExhibitions < ActiveRecord::Migration
  def change
    create_table :catalogue_exhibitions do |t|
      t.references :catalogue, index: true, null: false
      t.references :exhibition, index: true, null: false
      t.timestamps null: false
    end
  end
end
