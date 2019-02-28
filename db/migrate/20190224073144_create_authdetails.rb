class CreateAuthdetails < ActiveRecord::Migration[5.1]
  def change
    create_table :authdetails do |t|
      t.string :auth_token

      t.timestamps
    end
  end
end
