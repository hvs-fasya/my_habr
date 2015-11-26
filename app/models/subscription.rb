class Subscription < ActiveRecord::Base
	belongs_to :subscribed_post, :class_name => "Post"
	belongs_to :post_subscriber, :class_name => "User"

	validates :subscribed_post, presence: true
	validates :post_subscriber, presence: true
end
