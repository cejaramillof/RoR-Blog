class AddUserRefToComments < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :user, foreign_key: true
    add_column :comments, :state, :string, default: "unread"
  end
end
