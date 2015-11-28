class CreateWishlists < ActiveRecord::Migration
  def change
    create_table :wishlists do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.boolean :is_public

      t.timestamps null: false
    end
  end
end
