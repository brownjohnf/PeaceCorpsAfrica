class Country < ActiveRecord::Base

  attr_accessible :code, :name, :page_id, :active, :num_volunteers, :num_total_volunteers, :contact_email, :site_url, :donate_url, :pc_start_date, :country_initiatives_attributes

  # required: name, pc_start_date
  validates :name, :code, :pc_start_date, :presence => true
  validates :name, :contact_email, :site_url, :donate_url, :length => { :maximum => 255 }
  validates :code, :length => { :minimum => 2, :maximum => 2 }
  validate :valid_date, :unless => 'pc_start_date.blank?'

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

    def valid_date
      errors.add('PC Start Date', 'must be later than 1961') unless pc_start_date > '1961-01-01'.to_date
    end

    def do_before_validation
      self.name = Carmen.country_name(code)
      self.pc_start_date = pc_start_date.to_date unless pc_start_date.blank?
    end

    def do_before_save
      self.code = code.upcase
    end

end
