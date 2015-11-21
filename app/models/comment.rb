class Comment < ActiveRecord::Base

	validates :body, :post_id, presence: true

  	after_save :send_notification

	belongs_to :post
	belongs_to :user

	private

	def send_notification
	   NotificationMailer.comment_notification(post.user, post, self).deliver_now
	end

end
