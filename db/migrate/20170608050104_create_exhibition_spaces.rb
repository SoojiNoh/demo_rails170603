class CreateExhibitionSpaces < ActiveRecord::Migration
  def change
    create_table :exhibition_spaces do |t|
      t.references :exhibition, index: true, null: false
      t.references :space, index: true, null: false
      t.timestamps null: false
    end
  end
end
