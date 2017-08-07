class ChangeColumnImageOfUsers < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:users, :image, "default.jpg")
  end
end
