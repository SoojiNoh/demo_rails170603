class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.string :category, null: true
      t.string :title, null: false
      t.string :start_date, null: true
      t.string :end_date, null: true, default: :start_date
      t.references :artist, index: true
      t.timestamps null: false
    end
  end
end
