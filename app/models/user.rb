class User < ActiveRecord::Base

	attr_accessor :password

	has_and_belongs_to_many :jobs
	has_many :notes, dependent: :destroy
	
	EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	
	validates :name, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
	validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
	validates :password, :presence => true, :length => { :in => 6..20 }
	validates_confirmation_of :password

	before_save :encrypt_password
	after_save :clear_password

	def encrypt_password
		if password.present?
			self.salt = BCrypt::Engine.generate_salt
			self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
		end
	end

	def clear_password
		self.password = nil
	end

	def self.authenticate(email, password)
		user = find_by_email(email)
		if user && user.encrypted_password == BCrypt::Engine.hash_secret(password, user.salt)
			user
		else
			nil
		end
	end

end