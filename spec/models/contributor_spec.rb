require 'spec_helper'

describe Contributor do
  before(:each) do
    load Rails.root.join('db/seeds.rb')
    @user = User.find :first
    @valid_attributes = {
      :name => "Arliss Prescott",
      :bio => "Talk show host."
    }
  end

  it "should create a new instance given valid attributes" do
    c = Contributor.new(@valid_attributes)
    c.contributor_type = ContributorType.author
    c.user = @user
    c.save.should == true
  end
end
