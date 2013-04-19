require 'spec_helper'

describe ContributorTypesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/contributor_types" }.should route_to(:controller => "contributor_types", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/contributor_types/new" }.should route_to(:controller => "contributor_types", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/contributor_types/1" }.should route_to(:controller => "contributor_types", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/contributor_types/1/edit" }.should route_to(:controller => "contributor_types", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/contributor_types" }.should route_to(:controller => "contributor_types", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/contributor_types/1" }.should route_to(:controller => "contributor_types", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/contributor_types/1" }.should route_to(:controller => "contributor_types", :action => "destroy", :id => "1") 
    end
  end
end
