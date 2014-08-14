class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :place
      t.text :details
      t.integer :user_id

      t.timestamps
    end
  end
end
