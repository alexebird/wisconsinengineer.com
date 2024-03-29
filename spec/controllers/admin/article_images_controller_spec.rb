require 'spec_helper'

describe Admin::ArticleImagesController do

  def mock_article_image(stubs={})
    @mock_article_image ||= mock_model(ArticleImage, stubs)
  end

  describe "GET index" do
    it "assigns all article_images as @article_images" do
      ArticleImage.stub!(:find).with(:all).and_return([mock_article_image])
      get :index
      assigns[:article_images].should == [mock_article_image]
    end
  end

  describe "GET show" do
    it "assigns the requested article_image as @article_image" do
      ArticleImage.stub!(:find).with("37").and_return(mock_article_image)
      get :show, :id => "37"
      assigns[:article_image].should equal(mock_article_image)
    end
  end

  describe "GET new" do
    it "assigns a new article_image as @article_image" do
      ArticleImage.stub!(:new).and_return(mock_article_image)
      get :new
      assigns[:article_image].should equal(mock_article_image)
    end
  end

  describe "GET edit" do
    it "assigns the requested article_image as @article_image" do
      ArticleImage.stub!(:find).with("37").and_return(mock_article_image)
      get :edit, :id => "37"
      assigns[:article_image].should equal(mock_article_image)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created article_image as @article_image" do
        ArticleImage.stub!(:new).with({'these' => 'params'}).and_return(mock_article_image(:save => true))
        post :create, :article_image => {:these => 'params'}
        assigns[:article_image].should equal(mock_article_image)
      end

      it "redirects to the created article_image" do
        ArticleImage.stub!(:new).and_return(mock_article_image(:save => true))
        post :create, :article_image => {}
        response.should redirect_to(article_image_url(mock_article_image))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved article_image as @article_image" do
        ArticleImage.stub!(:new).with({'these' => 'params'}).and_return(mock_article_image(:save => false))
        post :create, :article_image => {:these => 'params'}
        assigns[:article_image].should equal(mock_article_image)
      end

      it "re-renders the 'new' template" do
        ArticleImage.stub!(:new).and_return(mock_article_image(:save => false))
        post :create, :article_image => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested article_image" do
        ArticleImage.should_receive(:find).with("37").and_return(mock_article_image)
        mock_article_image.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :article_image => {:these => 'params'}
      end

      it "assigns the requested article_image as @article_image" do
        ArticleImage.stub!(:find).and_return(mock_article_image(:update_attributes => true))
        put :update, :id => "1"
        assigns[:article_image].should equal(mock_article_image)
      end

      it "redirects to the article_image" do
        ArticleImage.stub!(:find).and_return(mock_article_image(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(article_image_url(mock_article_image))
      end
    end

    describe "with invalid params" do
      it "updates the requested article_image" do
        ArticleImage.should_receive(:find).with("37").and_return(mock_article_image)
        mock_article_image.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :article_image => {:these => 'params'}
      end

      it "assigns the article_image as @article_image" do
        ArticleImage.stub!(:find).and_return(mock_article_image(:update_attributes => false))
        put :update, :id => "1"
        assigns[:article_image].should equal(mock_article_image)
      end

      it "re-renders the 'edit' template" do
        ArticleImage.stub!(:find).and_return(mock_article_image(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested article_image" do
      ArticleImage.should_receive(:find).with("37").and_return(mock_article_image)
      mock_article_image.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the article_images list" do
      ArticleImage.stub!(:find).and_return(mock_article_image(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(article_images_url)
    end
  end

end
