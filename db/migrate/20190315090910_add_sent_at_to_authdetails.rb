class AddSentAtToAuthdetails < ActiveRecord::Migration[5.1]
  def change
    add_column :authdetails, :sent_at, :datetime
  end
end
