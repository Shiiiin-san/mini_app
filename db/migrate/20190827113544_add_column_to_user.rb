class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :user_id, :int
  end
end
