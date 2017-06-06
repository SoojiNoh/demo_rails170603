class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
      t.string :name, null: false, default: 'none'
      t.string :location, null: true
      t.string :map, null: true
      t.string :serviceTime, null: true
      t.timestamps null: false
    end
  end
end
