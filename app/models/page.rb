class Page < ActiveRecord::Base
  attr_accessible :html, :locked_at, :locked_by, :title, :country_id, :revisions_attributes

  # country of creation, for permission tracking
  belongs_to :country

  # user currently editing the page
  belongs_to :editor, :class_name => User, :foreign_key => :locked_by

  # countries which use this page as their default page
  has_many :countries

  # initiatives which use this page as their default page
  has_many :initiatives

  # links in the page
  has_many :links_out, :class_name => Reference, :as => :link_source

  # links in other content pointing to this page
  has_many :links_in, :class_name => Reference, :as => :link_target

  # versions of this page
  has_many :revisions, :dependent => :destroy

  # the most recent revision (unless rolled back - feature yet to come)
  has_one :current_revision, :class_name => Revision

  # various users who have contributed revisions
  has_many :authors, :through => :revisions, :uniq => true

  # author of the current revision
  has_one :current_author, :through => :current_revision, :source => :author

  accepts_nested_attributes_for :revisions, :reject_if => Proc.new { |a| a.blank? }
  
  validates :country_id, :title, :presence => true
  validates :country_id, :numericality => { :is_integer => true }
  validates :locked_by, :numericality => { :is_integer => true }, :allow_blank => true
  validates :title, :length => { :minimum => 3, :maximum => 255 }

  default_scope :order => 'title ASC'

  def lock(user)
    self.locked_at = Time.now
    self.editor = user
    self.save
    return self
  end

  def unlock
    self.update_attributes(:locked_at => nil)
    return self
  end

  def locked?
    !locked_at.blank? && locked_at > Time.now - 15.minutes
  end

  def set_html(content)
    self.update_attributes(:html => content)
  end

  def to_param
    "#{id}-#{title.parameterize}"
  end

  private

end
