class Revision < ActiveRecord::Base
  attr_accessible :author_id, :content, :page_id

  validates :author_id, :page_id, :content, :presence => true
  validates :author_id, :page_id, :numericality => { :is_integer => true }

  belongs_to :page
  belongs_to :author, :class_name => 'User', :foreign_key => :author_id

  default_scope :order => 'id DESC'
end
