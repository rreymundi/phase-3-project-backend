class AddTaskStatus < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :status, :boolean
  end
end
