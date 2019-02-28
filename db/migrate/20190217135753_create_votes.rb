class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer :upvote
      t.integer :downvote

      t.timestamps
    end
  end
end
