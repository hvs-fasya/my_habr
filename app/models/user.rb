class User < ActiveRecord::Base

	validates :login, presence: true

	has_one :profile
	has_many :posts

end
