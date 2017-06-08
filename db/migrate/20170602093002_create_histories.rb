class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.string :category, null: false
      t.string :title, null: false
      t.string :detail, null: true
      t.string :status, null: true
      t.string :start_date, null: true
      t.string :end_date, null: true, default: :start_date
      t.references :artist, index: true, null: false
      t.timestamps null: false
    end
  end
end
