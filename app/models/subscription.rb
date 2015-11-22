class Subscription < ActiveRecord::Base
	belongs_to :subscribed_post, :class_name => "Post"
	belongs_to :post_subscriber, :class_name => "User"
end
