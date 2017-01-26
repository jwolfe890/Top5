class CreateListTopic < ActiveRecord::Migration[5.0]
  def change
    create_table :list_topics do |t|
      t.integer :list_id
      t.integer :user_id
      t.string :content
    end
  end
end
