class AddPermitToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :permit, :integer, array:true, default: [], limit: 8
  end
end
