class AddColumnToBlog < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :user_id, :int
  end
end
