class Page < ActiveRecord::Base
  attr_accessible :html, :locked_at, :locked_by, :title, :country_id, :revisions_attributes

  belongs_to :country
  belongs_to :editor, :class_name => User, :foreign_key => :locked_by
  has_many :countries
  has_many :initiatives
  has_many :revisions, :dependent => :destroy
  has_one :current_revision, :class_name => Revision

  accepts_nested_attributes_for :revisions
  
  validates :country_id, :title, :presence => true
  validates :country_id, :numericality => { :is_integer => true }
  validates :locked_by, :numericality => { :is_integer => true }, :allow_blank => true
  validates :title, :length => { :minimum => 3, :maximum => 255 }

  def lock(user)
    self.locked_at = Time.now
    self.editor = user
    self.save
    return self
  end

  def unlock
    self.locked_at = nil
    self.save
    return self
  end

  def locked?
    !locked_at.blank? && locked_at > Time.now - 15.minutes
  end

  def to_param
    "#{id}-#{title.parameterize}"
  end

end
