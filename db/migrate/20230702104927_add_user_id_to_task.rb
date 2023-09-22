class AddUserIdToTask < ActiveRecord::Migration[7.0]
  def change
    add_reference :tasks, :user
  end
end
