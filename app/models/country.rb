class Country < ActiveRecord::Base

  attr_accessible :code, :name, :page_id, :active, :contact_email, :site_url, :donate_url, :start_date, :country_initiatives_attributes

  # required: name, start_date
  validates :name, :code, :presence => true
  validates :name, :contact_email, :site_url, :donate_url, :length => { :maximum => 255 }
  validates :code, :length => { :minimum => 2, :maximum => 2 }, :uniqueness => true
  validate :valid_date
  validate :valid_country

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
      if start_date.blank?
        errors.add(:start_date, 'must be present and in the proper format (yyyy-mm-dd)')
      #elsif ((start_date.to_date rescue ArgumentError) == ArgumentError)
        #errors.add(:start_date, 'must be a valid date (yyyy-mm-dd)')
      elsif start_date < '1961-01-01'.to_date
        errors.add(:start_date, 'must be later than Jan 1, 1961')
      elsif start_date > Date.today
        errors.add(:start_date, "must not be in the future: that just doesn't make sense!")
      end
    end

    def valid_country
      errors.add('Country code', 'must be a correct 2-letter ISO code') if Carmen.country_name(code).nil?
    end

    def do_before_validation
      self.name = Carmen.country_name(code)
      #self.start_date = start_date.to_date unless start_date.blank?
    end

    def do_before_save
      self.code = code.upcase
    end

end
