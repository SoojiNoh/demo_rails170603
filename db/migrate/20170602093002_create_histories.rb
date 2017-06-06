class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.string :type, null: true
      t.string :title, null: false, default: "none"
      t.string :year, null: true
      t.references :artist, index: true
      t.timestamps null: false
    end
  end
end
