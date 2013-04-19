require 'spec_helper'

describe Issue do
  before(:each) do
    load Rails.root.join('db/seeds.rb')

    @user = User.find :first
    @valid_attributes = {
      :show => true,
      :published => Time.now
    }
    @valid_contributor_attributes = {
      :name => "Dave T",
      :bio => "Creator of wendys"
    }
    @valid_article_attributes = {
      :headline => "Bricks builds house",
      :lead => "House is amazing",
      :contents => "This is the article."
    }
  end

  it "should create a new instance given valid attributes" do
    i = Issue.new(@valid_attributes)
    i.user = @user
    i.save

    c = Contributor.new(@valid_contributor_attributes)
    c.contributor_type = ContributorType.photographer
    c.user = @user
    c.save

    i.contributors << c
    i.contributors.should include(c)
    c.issues.should include(i)
  end

  it "should return it's articles for a specified category" do
    i = Issue.new(@valid_attributes)
    i.user = @user
    i.save
    i.articles.create(@valid_article_attributes.merge(:user => @user))
    i.articles.create(@valid_article_attributes.merge(:user => @user))
    a = i.articles.create(@valid_article_attributes.merge(:user => @user))
    cat_name = "article"
    c = Category.first(:conditions => { :name => cat_name })
    a.categories << c
    a.categories.should include(c)
    i.articles.should include(a)
    i.articles_by_category("editorial").should be_empty
    i.articles_by_category(cat_name).should include(a)
  end
end
