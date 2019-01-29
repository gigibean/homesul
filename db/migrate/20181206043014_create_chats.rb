class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.string :Title
      t.text :Content
      t.timestamps
    end
  end
end
