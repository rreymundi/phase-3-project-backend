class AddListId < ActiveRecord::Migration[6.1]
  def change
    add_column :lists, :list_id, :integer
  end
end
