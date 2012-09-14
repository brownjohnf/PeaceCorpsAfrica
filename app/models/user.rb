class User < ActiveRecord::Base
  rolify

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :verified_at

  has_many :revisions, :foreign_key => :author_id

  def verified?
    !verified_at.nil?
  end

  def verify
    valid_email = ValidEmail.find_by_email(self.email)
    unless valid_email.nil?
      user = self
      if valid_email.expired?
        expired_roles = valid_email.permissions.split(',')
        expired_roles.each { |role| user.remove_role(role) }
      else
        good_roles = valid_email.permissions.split(',')
        current_roles = []
        roles.each { |role| current_roles << role.name }
        add_roles = good_roles - current_roles
        remove_roles = current_roles - good_roles
        add_roles.each do |role|
          user.add_role(role) unless self.has_role?(role)
        end
        remove_roles.each do |role|
          user.remove_role(role)
        end
      end
      valid_email.check_in
    end
    self.update_attributes(:verified_at => Time.now)
  end
end
