class CreateItemComments < ActiveRecord::Migration
  def change
    create_table :item_comments do |t|
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end
end
