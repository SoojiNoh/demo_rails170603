class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
      t.string :name, null: false
      t.string :location, null: true
      t.string :map, null: true
      t.string :service_time, null: true
      t.timestamps null: false
    end
  end
end
