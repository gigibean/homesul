class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :mobile
      t.string :adress
      t.date :birth
      t.references :user

      t.timestamps null: false
    end
    add_index :profiles, :user_id
  end
end
