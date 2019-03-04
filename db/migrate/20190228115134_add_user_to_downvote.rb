class AddUserToDownvote < ActiveRecord::Migration[5.1]
  def change
    add_column :downvotes, :user_id, :integer
    add_index :downvotes, :user_id
  end
end
