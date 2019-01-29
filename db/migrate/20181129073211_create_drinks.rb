class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string :title
      t.text :content
      t.references :user
      t.string :cover
      t.timestamps null: false
    end
    add_index :drinks, :user_id
  end
end
