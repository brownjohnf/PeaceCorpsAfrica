require 'spec_helper'

describe ValidEmail do
  before :each do
    @attr = {
      :email => 'user@example.com'
    }
  end

  describe 'properties' do
    it 'should respond to email' do
      ValidEmail.new(@attr).should respond_to :email
    end

    it 'should respond to checked_in_at' do
      ValidEmail.new(@attr).should respond_to :checked_in_at
    end

    it 'should respond to permissions' do
      ValidEmail.new(@attr).should respond_to :permissions
    end

    describe 'checked_in_at' do
      before :each do
        @valid_email = FactoryGirl.create :valid_email
      end

      it 'should be nil by default' do
        @valid_email.checked_in_at.should be_nil
      end
    end
  end

  describe 'methods' do
    it 'should respond to checked_in?' do
      ValidEmail.new(@attr).should respond_to :checked_in?
    end

    it 'should respond to check_in' do
      ValidEmail.new(@attr).should respond_to :check_in
    end

    describe 'checked_in?' do
      before :each do
        @valid_email = FactoryGirl.create :valid_email
      end

      it 'should be false by default' do
        @valid_email.checked_in?.should be_false
      end

      it 'should be true after check_in' do
        @valid_email.check_in
        @valid_email.checked_in?.should be_true
      end
    end

    describe 'check_in' do
      before :each do
        @valid_email = FactoryGirl.create :valid_email
      end

      it 'should set checked_in_at' do
        @valid_email.check_in
        @valid_email.checked_in_at.should_not be_nil
      end

      it 'should save itself' do
        @valid_email.check_in
        @valid_email.reload
        @valid_email.checked_in_at.should_not be_nil
      end

      it 'should set checked_in_at to Time.now' do
        time = Time.now - 1.second
        @valid_email.check_in
        @valid_email.reload
        @valid_email.checked_in_at.should be > time
      end
    end
  end
  
  describe 'validations' do
    it "should require an email address" do
      no_email = ValidEmail.new(@attr.merge(:email => ""))
      no_email.should_not be_valid
    end
    
    it "should accept valid email addresses" do
      addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
      addresses.each do |address|
        valid_email = ValidEmail.new(@attr.merge(:email => address))
        valid_email.should be_valid
      end
    end
    
    it "should reject invalid email addresses" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
      addresses.each do |address|
        invalid_email = ValidEmail.new(@attr.merge(:email => address))
        invalid_email.should_not be_valid
      end
    end
    
    it "should reject duplicate email addresses" do
      ValidEmail.create!(@attr)
      duplicate_email = User.new(@attr)
      duplicate_email.should_not be_valid
    end
    
    it "should reject email addresses identical up to case" do
      upcased_email = @attr[:email].upcase
      ValidEmail.create!(@attr.merge(:email => upcased_email))
      duplicate_email = User.new(@attr)
      duplicate_email.should_not be_valid
    end
  end
end
