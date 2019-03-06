class AddPostToAnswer < ActiveRecord::Migration[5.1]
  def change
    add_column :answers, :post_id, :integer
  end
end
