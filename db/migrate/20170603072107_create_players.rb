class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :category
      t.integer :interval
      t.references :catalogue, index: true, null: false
      t.timestamps null: false
    end
  end
end
