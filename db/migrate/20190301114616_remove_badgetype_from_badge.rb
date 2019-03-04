class RemoveBadgetypeFromBadge < ActiveRecord::Migration[5.1]
  def change
    remove_column :badges, :badgetype, :text
  end
end
