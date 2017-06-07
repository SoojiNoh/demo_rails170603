class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :category, null: true
      t.integer :interval, null: true
      t.references :catalogue, index: true, null: false
      t.timestamps null: false
    end
  end
end
