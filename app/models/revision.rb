class Revision < ActiveRecord::Base
  attr_accessible :author_id, :content, :html, :page_id

  validates :author_id, :page_id, :content, :html, :presence => true
  validates :author_id, :page_id, :numericality => { :is_integer => true }

  belongs_to :page
  belongs_to :author, :class_name => 'User', :foreign_key => :author_id

  default_scope :order => 'id DESC'

  before_validation :do_before_validation
  after_save :do_after_save

  def next
    Revision.where(:page_id => page_id).where("id > ?", id).limit(1).first
  end

  def prev
    Revision.where(:page_id => page_id).where("id < ?", id).limit(1).first
  end

  private

    def do_before_validation
      self.html = Markdown.render(content)
    end

    def do_after_save
      self.page.set_html(html)
    end

end
