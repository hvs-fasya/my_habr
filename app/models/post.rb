class Post < ActiveRecord::Base

	validates :title, presence: true
	validates :body, presence: true

	has_many :comments, dependent: :destroy
	has_many :categories_posts, dependent: :destroy
	has_many :categories, through: :categories_posts
	has_many :posts_tags, dependent: :destroy
	has_many :tags, through: :posts_tags
	belongs_to :user

	scope :published, -> { where(published: true) }
	scope :unpublished, -> { where(published: false) }
	# scope :unpublished, ->(user) { user.admin? ? where(published: false) : where(published: false, user_id: user.id) }
  	# scope :unpublished_included, ->(user) { published | unpublished(user) }

  	has_many :subscriptions, :foreign_key => :subscribed_post_id
  	has_many :post_subscribers, through: :subscriptions#, :source => :post_subscriber

  	after_create :subscribe_author

  	protected

  	def subscribe_author
  	end
  	
end
