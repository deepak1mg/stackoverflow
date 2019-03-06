class AddStatusToAuthdetail < ActiveRecord::Migration[5.1]
  def change
    add_column :authdetails, :status, :integer
  end
end
