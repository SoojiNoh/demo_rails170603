class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :category, null: false
      t.string :content, null: true
      t.references :contactable, polymorphic: true
      t.timestamps null: false
    end
  end
end
