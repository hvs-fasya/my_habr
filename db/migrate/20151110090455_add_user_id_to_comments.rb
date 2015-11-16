class AddUserIdToComments < ActiveRecord::Migration
  def change
  	add_belongs_to :comments, :user
  	add_index :comments, :user_id
  end
end
