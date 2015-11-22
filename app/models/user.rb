class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

	validates :email, presence: true

	has_one :profile
	has_many :posts
	has_many :comments

	has_many :subscriptions, :foreign_key => :post_subscriber_id
  	has_many :subscribed_posts, through: :subscriptions#, source: :subscribed_post

end
