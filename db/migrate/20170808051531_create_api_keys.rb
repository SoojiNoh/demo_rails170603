class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :access_token
      t.references :accessible, polymorphic: true
      t.timestamps null: false
    end
  end
end
