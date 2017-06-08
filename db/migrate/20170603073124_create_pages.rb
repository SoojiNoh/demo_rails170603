class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :category
      t.string :content
      t.string :route
      t.string :title
      t.integer :page_num
      t.references :catalogue, index: true, null: false
      t.timestamps null: false
    end
  end
end
