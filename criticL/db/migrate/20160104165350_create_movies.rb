class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.date :release_date
      t.string :runtime
      t.string :director
      t.string :cast
      t.text :poster_url
      t.decimal :avg_rating
      t.text :summary
      t.integer :creator_id

      t.timestamps null: false
    end
  end
end
