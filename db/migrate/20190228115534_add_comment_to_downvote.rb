class AddCommentToDownvote < ActiveRecord::Migration[5.1]
  def change
    add_column :downvotes, :comment_id, :integer
    add_index :downvotes, :comment_id
  end
end
