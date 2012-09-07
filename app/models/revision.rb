class Revision < ActiveRecord::Base
  attr_accessible :author_id, :content, :page_id

  validates :author_id, :page_id, :content, :presence => true
  validates :author_id, :page_id, :numericality => { :is_integer => true }
  validate :changed_content, :on => :create

  belongs_to :page
  belongs_to :author, :class_name => 'User', :foreign_key => :author_id

  default_scope :order => 'id DESC'

  after_save :do_after_save

  private

    def do_after_save
      self.page.set_html(content)
    end

    def changed_content
      existing = Revision.where(:page_id => page_id).limit(1).first
      if existing
        errors.add(:content, 'is unchanged') if content == existing.content
      end
    end

end
