require 'spec_helper'

describe User do
  before(:each) do
    @valid_attributes = {
      :name => 'Dave Thomas',
      :email => 'dave@wendys.com',
      :password => 'asdfasdf'
    }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@valid_attributes)
  end

  it "should correctly salt a password when a user is created" do
    u = User.create!(@valid_attributes)
    u.salt.should_not be_nil
    u.password.should_not == @valid_attributes[:password]
    x = User.find_by_login(@valid_attributes[:email], @valid_attributes[:password])
    x.name.should == u.name
  end

  it "should correctly salt a password when a user updates their password" do
    u = User.create!(@valid_attributes)
    old_pass = u.password
    old_salt = u.salt
    new_pass = 'hjkasdf'
    u.change_password new_pass
    u.save
    u.password.should_not == new_pass
    u.password.should_not == old_pass
    u.salt.should_not == old_salt
  end
end
