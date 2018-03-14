class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.text :title
      t.boolean :free
      t.boolean :athlete
      t.boolean :advised

      t.timestamps
    end
  end
end
