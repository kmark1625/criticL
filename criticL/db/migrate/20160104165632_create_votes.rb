class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value
      t.integer :review_id
      t.integer :voter_id

      t.timestamps null: false
    end
  end
end
