class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name, null: false
      t.string :role, null: true
      t.references :user, index: false
      t.timestamps null: false
    end
  end
end
