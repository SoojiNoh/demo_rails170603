class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :category
      t.string :title
      t.string :content
      t.string :producer
      t.string :route
      t.integer :page_num
      t.references :catalogue, index: true, null: false
      t.timestamps null: false
    end
  end
end
