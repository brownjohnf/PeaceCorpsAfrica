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
      temp = content.gsub(/(\[([a-z]*)\[((https*:\/\/)*[^\[]+)\]\])/) do |match|
        if $4.blank?
          if $2 == 'user'
            results = User.where("UPPER(name) LIKE UPPER(?)", "%#{$3}%")
            resource = 'User'
          else
            results = Page.where("UPPER(title) LIKE UPPER(?)", "%#{$3}%")
            resource = 'Page'
          end
            

          # if there are no results, set the missing link
          if results.count < 1
            "<a class=\"missing\" href=\"/#{resource.parameterize.pluralize}\">#{$3}<span class=\"icon-remove-circle\"></span></a>"
          # if there are more than 1 result, link to disambiguation
          elsif results.count > 1
            "<a class=\"disambiguation\" href=\"/#{resource.parameterize.pluralize}\">#{$3}<span class=\"icon-random\"></span></a>"
          # if there is only one result, link there
          else
            "<a href=\"/#{resource.parameterize.pluralize}/#{results.first.to_param}\">#{$3}</a>"
          end
        else
          "<a href=\"#{$3}\">#{$3}</a>"
        end
      end
=begin
      regex = Regexp.new(/([0-9a-z\-_.]+@{1}[0-9a-z\-_.]+([a-z]){2,5})/i)
      matchdata = regex.match(params[:valid_email][:email])
      good_emails = []
      bad_emails = []
      while matchdata != nil
        valid_email = ValidEmail.new(params[:valid_email].merge(:email => matchdata[0]))
        if valid_email.save
          good_emails << valid_email.email
        else
          bad_emails << valid_email.email
        end
        matchdata = regex.match(matchdata.post_match)
      end
=end
      self.html = Markdown.render(temp)
    end

    def do_after_save
      self.page.set_html(html)
    end

end
