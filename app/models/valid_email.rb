class ValidEmail < ActiveRecord::Base
  attr_accessible :checked_in_at, :email, :expires_at, :permissions

  validates :email, :presence => true, :email => true, :uniqueness => true

  default_scope :order => 'email ASC'

  def check_in
    self.update_attributes(:checked_in_at => Time.now + 1.second)
  end
  
  def checked_in?
    if checked_in_at.nil?
      return false
    elsif checked_in_at < updated_at
      return false
    else
      return true
    end
  end

  def expired?
    expires_at? ? (expires_at < Time.now) : false
  end

end
