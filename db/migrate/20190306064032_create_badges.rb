class CreateBadges < ActiveRecord::Migration[5.1]
  def change
    create_table :badges do |t|
      t.integer :badge_type
      t.timestamps
    end
  end
end
