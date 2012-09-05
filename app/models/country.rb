class Country < ActiveRecord::Base

  attr_accessible :code, :name, :page_id, :active, :contact_email, :site_url, :donate_url, :start_date, :country_initiatives_attributes, :info_url

  # required: name, start_date
  validates :name, :code, :presence => true
  validates :name, :contact_email, :site_url, :donate_url, :length => { :maximum => 255 }
  validates :code, :length => { :minimum => 2, :maximum => 2 }, :uniqueness => true
  validates :start_date, :date => true
  validates :contact_email, :email => true, :allow_blank => true
  validates :donate_url, :site_url, :info_url, :url => true, :allow_blank => true
  validates :page_id, :numericality => { :only_integer => true }, :allow_blank => true
  validates :code, :iso2 => true

  before_validation :do_before_validation
  before_save :do_before_save

  has_many :country_initiatives, :dependent => :destroy
  has_many :initiatives, :through => :country_initiatives

  accepts_nested_attributes_for :country_initiatives, :allow_destroy => true

  default_scope order('name ASC')
  scope :active, where(:active => true)

  def join_date(initiative)
    country_initiatives.where(:initiative_id => initiative.id).limit(1).first.join_date
  end  

  def to_param
    code.downcase
  end

  private

    def do_before_validation
      self.name = Carmen.country_name(code)
      #self.start_date = start_date.to_date unless start_date.blank?
    end

    def do_before_save
      self.code = code.upcase
    end

end
