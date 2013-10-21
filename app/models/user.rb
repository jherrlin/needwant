class User < ActiveRecord::Base
	attr_accessible :email, :name, :password, :password_confirmation
	before_save { self.email = email.downcase }
	before_save :create_remember_token
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence:   true,
            	format:     { with: VALID_EMAIL_REGEX },
            	uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, length: { minimum: 6 }
	has_one :wishlist, dependent: :destroy

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	def create_remember_token
		self.remember_token = User.encrypt(User.new_remember_token)
	end
end