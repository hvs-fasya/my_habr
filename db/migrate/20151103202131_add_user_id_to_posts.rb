class AddUserIdToPosts < ActiveRecord::Migration
  def change

  	add_belongs_to :posts, :user
  	add_index :posts, :user_id
  end
end
