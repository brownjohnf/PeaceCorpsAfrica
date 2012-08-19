class Country < ActiveRecord::Base
  rolify

  attr_accessible :code, :name, :page_id, :active

  validates :name, :presence => true
  validates :code, :presence => true

  before_validation :do_before_validation

  default_scope :order => 'name ASC'

  private

    def do_before_validation
      self.name = Carmen.country_name(code)
    end

end
