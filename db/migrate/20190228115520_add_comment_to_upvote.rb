class AddCommentToUpvote < ActiveRecord::Migration[5.1]
  def change
    add_column :upvotes, :comment_id, :integer
    add_index :upvotes, :comment_id
  end
end
