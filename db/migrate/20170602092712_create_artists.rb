class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name, null: false, default: "none"
      t.string :role, null: true
      t.string :academic, null: true
      t.references :user, index: true
      t.timestamps null: false
    end
  end
end
