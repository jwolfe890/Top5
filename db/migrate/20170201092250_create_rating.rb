class CreateRating < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.integer :rater_id
      t.integer :rated_id
      t.integer :rating
    end
  end
end
