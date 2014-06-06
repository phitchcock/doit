class AddVisibilityToLists < ActiveRecord::Migration
  def change
    add_column :lists, :visibility, :integer
  end
end
