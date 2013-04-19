require 'spec_helper'

describe Admin::ContributorTypesController do

  def mock_contributor_type(stubs={})
    @mock_contributor_type ||= mock_model(ContributorType, stubs)
  end

  describe "GET index" do
    it "assigns all contributor_types as @contributor_types" do
      ContributorType.stub!(:find).with(:all).and_return([mock_contributor_type])
      get :index
      assigns[:contributor_types].should == [mock_contributor_type]
    end
  end

  describe "GET show" do
    it "assigns the requested contributor_type as @contributor_type" do
      ContributorType.stub!(:find).with("37").and_return(mock_contributor_type)
      get :show, :id => "37"
      assigns[:contributor_type].should equal(mock_contributor_type)
    end
  end

  describe "GET new" do
    it "assigns a new contributor_type as @contributor_type" do
      ContributorType.stub!(:new).and_return(mock_contributor_type)
      get :new
      assigns[:contributor_type].should equal(mock_contributor_type)
    end
  end

  describe "GET edit" do
    it "assigns the requested contributor_type as @contributor_type" do
      ContributorType.stub!(:find).with("37").and_return(mock_contributor_type)
      get :edit, :id => "37"
      assigns[:contributor_type].should equal(mock_contributor_type)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created contributor_type as @contributor_type" do
        ContributorType.stub!(:new).with({'these' => 'params'}).and_return(mock_contributor_type(:save => true))
        post :create, :contributor_type => {:these => 'params'}
        assigns[:contributor_type].should equal(mock_contributor_type)
      end

      it "redirects to the created contributor_type" do
        ContributorType.stub!(:new).and_return(mock_contributor_type(:save => true))
        post :create, :contributor_type => {}
        response.should redirect_to(contributor_type_url(mock_contributor_type))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved contributor_type as @contributor_type" do
        ContributorType.stub!(:new).with({'these' => 'params'}).and_return(mock_contributor_type(:save => false))
        post :create, :contributor_type => {:these => 'params'}
        assigns[:contributor_type].should equal(mock_contributor_type)
      end

      it "re-renders the 'new' template" do
        ContributorType.stub!(:new).and_return(mock_contributor_type(:save => false))
        post :create, :contributor_type => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested contributor_type" do
        ContributorType.should_receive(:find).with("37").and_return(mock_contributor_type)
        mock_contributor_type.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :contributor_type => {:these => 'params'}
      end

      it "assigns the requested contributor_type as @contributor_type" do
        ContributorType.stub!(:find).and_return(mock_contributor_type(:update_attributes => true))
        put :update, :id => "1"
        assigns[:contributor_type].should equal(mock_contributor_type)
      end

      it "redirects to the contributor_type" do
        ContributorType.stub!(:find).and_return(mock_contributor_type(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(contributor_type_url(mock_contributor_type))
      end
    end

    describe "with invalid params" do
      it "updates the requested contributor_type" do
        ContributorType.should_receive(:find).with("37").and_return(mock_contributor_type)
        mock_contributor_type.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :contributor_type => {:these => 'params'}
      end

      it "assigns the contributor_type as @contributor_type" do
        ContributorType.stub!(:find).and_return(mock_contributor_type(:update_attributes => false))
        put :update, :id => "1"
        assigns[:contributor_type].should equal(mock_contributor_type)
      end

      it "re-renders the 'edit' template" do
        ContributorType.stub!(:find).and_return(mock_contributor_type(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested contributor_type" do
      ContributorType.should_receive(:find).with("37").and_return(mock_contributor_type)
      mock_contributor_type.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the contributor_types list" do
      ContributorType.stub!(:find).and_return(mock_contributor_type(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(contributor_types_url)
    end
  end

end
