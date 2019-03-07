class CreateAuthdetails < ActiveRecord::Migration[5.1]
  def change
    create_table :authdetails do |t|
      t.string :auth_token
      t.integer :status
      t.integer :user_id
      t.timestamps
    end

    add_index :authdetails, :user_id
  end
end
