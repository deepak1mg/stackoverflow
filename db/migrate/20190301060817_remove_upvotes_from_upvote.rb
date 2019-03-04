class RemoveUpvotesFromUpvote < ActiveRecord::Migration[5.1]
  def change
    remove_column :upvotes, :upvotes, :integer
  end
end
