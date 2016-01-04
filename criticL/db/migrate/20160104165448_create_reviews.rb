class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :reviewer_id
      t.integer :movie_id
      t.integer :rating
      t.text :content
      t.string :title

      t.timestamps null: false
    end
  end
end
