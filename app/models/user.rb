require 'digest/sha2'
class User < ActiveRecord::Base

  mount_uploader :avatar, AvatarUploader
	has_many :products
  has_one :wishlist
  has_many :reviews

	validates :name, 	:presence => true
						
						
	validates :email,	:uniqueness	=> true,
						:length 	=> {:within => 5..50},
						:format 	=> {:with =>/^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i}
						
	validates :password, :confirmation => true,
						:length => {:within => 4..20},
						:presence => true


  attr_accessor 	:password_confirmation
	attr_reader		:password
	
	validate :password_must_be_present
	
	def User.authenticate(email, password)
		if user = find_by_email(email)
			if user.hashed_password == encrypt_password(password, user.salt)
				user
			end
		end
	end
	
	def User.encrypt_password(password, salt)
		Digest::SHA2.hexdigest(password + "wibble" + salt)
	end
	
	def password=(password)
		@password = password
		
		if password.present?
			generate_salt
			self.hashed_password = self.class.encrypt_password(password, salt)
		end
	end
	
	after_destroy :ensure_an_admin_remains
	
	def ensure_an_admin_remains
		if User.count.zero?
			raise "Can't delete last User"
		end
	end
	
	private
	
		def password_must_be_present
			errors.add(:password, "Please re-type your password") unless hashed_password.present?
		end	
	
		def generate_salt
			self.salt = self.object_id.to_s + rand.to_s
		end
end
