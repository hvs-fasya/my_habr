class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|

    	t.index :post_subscriber_id
    	t.index :subscribed_post_id

    	t.belongs_to :post_subscriber
      	t.belongs_to :subscribed_post

    end
  end
end
