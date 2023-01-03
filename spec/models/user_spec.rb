require 'rails_helper'

RSpec.describe User, type: :model do  

  # email tests
  it "should require an email" do
    @user = User.new(
      :name => 'John Smith',
      :email => '',
      :password => 'password'
    )
    expect(@user).to_not be_valid
  end

  it "should accept a valid email" do
    @user = User.new(
      :name => 'John Smith',
      :email => 'user@example.com',
      :password => 'password'
    )
    expect(@user).to be_valid
  end

  it "should reject duplicate email addresses" do
    @user = User.create(
      :name => 'John Smith',
      :email => 'user@example.com',
      :password => 'password'
    )
    @user2 = User.new(
      :name => 'John Smith',
      :email => 'user@example.com',
      :password => 'password'
    )
    expect(@user2).to_not be_valid
  end


  #password tests
  it "should require a password" do
    @user = User.new(
      :name => 'John Smith',
      :email => 'user@example.com',
      :password => ''
    )
    expect(@user).to_not be_valid
  end
  it "should reject short passwords" do
    @user = User.new(
      :name => 'John Smith',
      :email => 'user@example.com',
      :password => 'short'
    )    
    expect(@user).to_not be_valid
  end

  #new authentication tests
  describe "authentication" do

    it "should authenticate a password" do
      @user = User.create(
        :name => 'John Smith',
        :email => 'user@example.com',
        :password => 'password'
      ) 
      @user2 = User.new(
      :name => 'John Smith',
      :email => 'user@example.com',
      :password => 'password'
    ) 
      expect(@user2.authenticate_with_credentials(@user2.email, @user2.password)).to be_truthy
    end

    it "should allow a space before and after an email address" do 
      @user = User.create(
        :name => 'John Smith',
        :email => 'user@example.com',
        :password => 'password'
      ) 
      @user2 = User.new(
        :name => 'John Smith',
        :email => ' user@example.com ',
        :password => 'password'
      ) 
      expect(@user2.authenticate_with_credentials(@user2.email, @user2.password)).to be_truthy
    end

    it "email should not be case-sensitive" do
      @user = User.create(
        :name => 'John Smith',
        :email => 'user@example.com',
        :password => 'password'
      ) 
      @user2 = User.new(
        :name => 'John Smith',
        :email => 'USER@EXAMPLE.com',
        :password => 'password'
      ) 
      expect(@user2.authenticate_with_credentials(@user2.email, @user2.password)).to be_truthy
    end
  end

end
