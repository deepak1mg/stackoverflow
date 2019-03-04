class AddBadgeTypeToBadge < ActiveRecord::Migration[5.1]
  def change
    add_column :badges, :badge_type, :text
  end
end
