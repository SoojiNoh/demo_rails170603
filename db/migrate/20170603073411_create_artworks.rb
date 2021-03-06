class CreateArtworks < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
      t.string :category
      t.string :photo
      t.string :title, default: 'Untitled'
      t.string :size, array: true, default: []
      t.string :unit
      t.string :material
      t.date :created_date
      t.timestamps null: false
    end
  end
end
