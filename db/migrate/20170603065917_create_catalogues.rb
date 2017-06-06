class CreateCatalogues < ActiveRecord::Migration
  def change
    create_table :catalogues do |t|
      t.references :user, index: true
      t.references :artist, index: true, null: true
      t.references :space, index: true, null: true
      t.string :title, null: false
      t.string :description
      t.timestamps null: false
    end
  end
end
