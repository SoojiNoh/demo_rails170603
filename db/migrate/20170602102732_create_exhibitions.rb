class CreateExhibitions < ActiveRecord::Migration
  def change
    create_table :exhibitions do |t|
      t.string :category, null: true
      t.string :title, null: false, default: "none"
      t.date :start_date, null: false, default: "none"
      t.date :end_date, default: :startDate
      t.timestamps null: false
    end
  end
end
