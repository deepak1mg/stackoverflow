class AddUserToBadge < ActiveRecord::Migration[5.1]
  def change
    add_column :badges, :user_id, :integer
    add_index :badges, :user_id
  end
end
