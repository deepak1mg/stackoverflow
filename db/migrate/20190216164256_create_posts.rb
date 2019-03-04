class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.text :title
      t.text :body
      t.text :tags
      t.belongs_to :users

      t.timestamps
    end
  end
end
