class AddExpiryToAuthdetail < ActiveRecord::Migration[5.1]
  def change
    add_column :authdetails, :expiry_time, :datetime
  end
end
