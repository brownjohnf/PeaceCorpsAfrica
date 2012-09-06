class Page < ActiveRecord::Base
  attr_accessible :html, :locked_at, :locked_by, :title, :country_id

  belongs_to :country
  
  validates :country_id, :title, :presence => true
  validates :country_id, :numericality => { :is_integer => true }
  validates :locked_by, :numericality => { :is_integer => true }, :allow_blank => true
  validates :title, :length => { :minimum => 3, :maximum => 255 }

  def to_param
    "#{id}-#{title.parameterize}"
  end

end
