class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.text :answer
      t.integer :post_id
      t.timestamps
    end
    add_index :answers, :post_id
  end
end
