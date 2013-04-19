require 'spec_helper'

describe ArticleImagesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/article_images" }.should route_to(:controller => "article_images", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/article_images/new" }.should route_to(:controller => "article_images", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/article_images/1" }.should route_to(:controller => "article_images", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/article_images/1/edit" }.should route_to(:controller => "article_images", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/article_images" }.should route_to(:controller => "article_images", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/article_images/1" }.should route_to(:controller => "article_images", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/article_images/1" }.should route_to(:controller => "article_images", :action => "destroy", :id => "1") 
    end
  end
end
