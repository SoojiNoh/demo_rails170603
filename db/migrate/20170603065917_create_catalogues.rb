class CreateCatalogues < ActiveRecord::Migration
  def change
    create_table :catalogues do |t|
      t.references :user, index: true, null: false
      t.references :artist, index: true
      t.references :space, index: true
      t.string :title, null: false
      t.string :description
      t.timestamps null: false
    end
  end
end
