class CreateList < ActiveRecord::Migration[5.0]
  def change
    create_table :lists do |t|
      t.integer :user_id
      t.string :found_lists
      t.string :title
      t.string :number1
      t.string :number2
      t.string :number3
      t.string :number4
      t.string :number5
      t.integer :average_rating
      t.datetime "created_at",         null: false
      t.datetime "updated_at",         null: false
    end
  end
end
