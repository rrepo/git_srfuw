class AddUserIdToKeziban < ActiveRecord::Migration
  def change
    add_column :keizibans, :user_id, :integer
  end
end
