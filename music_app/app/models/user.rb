class User < ApplicationRecord
  after_initialize do 
      self.session_token ||= User.generate_session_token
    end
    
  validates :email, presence: true
  validates :password, length: {minimum: 6, allow_nil: true}
  validates :email, :session_token, :password_digest, uniqueness: true 
  
  attr_reader :password
  
  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end
  
  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)  
  end
  
  def self.find_by_credentials(email,password)
    @user = User.find_by(email: email)
    if @user && @user.is_password?(password)
      return @user
    end
    nil
  end
  
  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

end