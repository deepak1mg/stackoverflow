class CreateBadges < ActiveRecord::Migration[5.1]
  def change
    create_table :badges do |t|
      t.text :badgetype

      t.timestamps
    end
  end
end
