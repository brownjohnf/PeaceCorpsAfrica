class Page < ActiveRecord::Base
  attr_accessible :html, :locked_at, :locked_by, :title
end
