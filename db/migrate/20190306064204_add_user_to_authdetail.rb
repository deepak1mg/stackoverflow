class AddUserToAuthdetail < ActiveRecord::Migration[5.1]
  def change
    add_column :authdetails, :user_id, :integer
  end
end
