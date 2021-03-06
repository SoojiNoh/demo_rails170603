class CreateExhibitions < ActiveRecord::Migration
  def change
    create_table :exhibitions do |t|
      t.string :category, null: true
      t.string :title, null: false
      t.date :start_date, null: false
      t.date :end_date, default: :start_date
      t.timestamps null: false
    end
  end
end
