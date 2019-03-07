class CreateBadges < ActiveRecord::Migration[5.1]
  def change
    create_table :badges do |t|
      t.integer :badge_type
      t.integer :user_id
      t.timestamps
    end
    add_index :badges, :user_id
  end
end
