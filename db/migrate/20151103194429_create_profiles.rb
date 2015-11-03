class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|

      t.string :firstname
      t.string :lastname
      t.string :email
      t.integer :user_id

      t.timestamps null: false
    end

    add_index :profiles, :user_id

  end
end
