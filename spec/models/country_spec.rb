require 'spec_helper'

describe Country do
  before :each do
    @attr = {
      :code => 'SN',
      :start_date => '1961-01-02'
    }
  end

  it 'should create a new instance given valid attributes' do
    Country.create! @attr
  end

end
