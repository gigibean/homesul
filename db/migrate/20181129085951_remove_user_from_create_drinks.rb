class RemoveUserFromCreateDrinks < ActiveRecord::Migration
  def up
    remove_column :drinks, :user, :integer
  end
  def down
    remove_column :drinks, :user, :integer
  end
end
