#
#  Classname user.rb
#
#
#  Date e.g. 29/10/2009
#
#  @author Daniel Connolly, x11105810
#  @reference Agile Web Development with Rails fourth edition page 183
#
#
require 'digest/sha2'
class User < ActiveRecord::Base

  mount_uploader :avatar, AvatarUploader
  has_many :galleries
  has_many :reviews
  has_many :products
  has_one :wishlist

  validates :name, :presence => true

  validates :email, :uniqueness => true,
            :length => {:within => 5..50},
            :format => {:with =>/^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i}

  validates :password, :confirmation => true,
            :length => {:within => 4..20},
            :presence => true

  attr_accessor :password_confirmation
  attr_reader :password

  validate :password_must_be_present
  before_create { generate_token(:auth_token)}

  #  @reference Agile Web Development with Rails fourth edition page 187
  def User.authenticate(email, password)
    if user = find_by_email(email)
      if user.hashed_password == encrypt_password(password, user.salt)
        user
      end
    end
  end

  #  @reference Agile Web Development with Rails fourth edition page 187
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

  def send_password_reset
  generate_token(:password_reset_token)
  self.password_reset_sent_at = Time.zone.now
  save!
  UserMailer.password_reset(self).deliver
end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end  while User.exists?(column => self[column])
  end

  private

  #  @reference Agile Web Development with Rails fourth edition page 187
  def password_must_be_present
    errors.add(:password, "Please re-type your password") unless hashed_password.present?
  end

  #  @reference Agile Web Development with Rails fourth edition page 187
  def generate_salt
    self.salt = self.object_id.to_s + rand.to_s
  end
end
