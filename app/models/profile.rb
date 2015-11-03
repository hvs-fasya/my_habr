class Profile < ActiveRecord::Base

	validates :firstname, :lastname, presence: true
	validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "e-mail should be valid"}

	belongs_to :user
end
