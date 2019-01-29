class RemovePostFromCreateLikes < ActiveRecord::Migration
  def up
    remove_reference :likes, :post, index: true, foreign_key: true
  end
  def down
    remove_reference :likes, :post, index: true, foreign_key: true
  end
end
