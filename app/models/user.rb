class User < ActiveRecord::Base
  rolify

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :verified_at

  def verified?
    !verified_at.nil?
  end

  def verify
    valid_email = ValidEmail.find_by_email(self.email)
    unless valid_email.nil?
      valid_email.update_attributes(:checked_in_at => Time.now)
    end
    self.update_attributes(:verified_at => Time.now)
  end
end
