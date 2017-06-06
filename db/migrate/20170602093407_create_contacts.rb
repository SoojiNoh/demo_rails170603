class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :type, null: false, default: "none"
      t.string :content, null: false, default: "none"
      t.references :contactable, polymorphic: true
      t.timestamps null: false
    end
  end
end
