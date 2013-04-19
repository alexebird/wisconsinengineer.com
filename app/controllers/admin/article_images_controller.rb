class Admin::ArticleImagesController < Admin::AdminController
  # GET /article_images/new
  def new
    @article_image = ArticleImage.new
    @contributor = Contributor.new_photographer
    @article = Article.find(params[:article_id])
  end

  # GET /article_images/1/edit
  def edit
    @article_image = ArticleImage.find(params[:id])
    @contributor = @article_image.contributors.first
    @article = Article.find(params[:article_id])
  end

  # POST /article_images
  def create
    @article = Article.find(params[:article_id])
    @article_image = ArticleImage.new(params[:article_image])
    @article_image.article = @article
    @article_image.ordering = @article.images.size
    @contributor = Contributor.new_photographer
    @contributor.attributes = params[:contributor]
    @contributor.user = current_user

    if @article_image.valid? && @contributor.valid?
      @article_image.save
      @contributor.save
      @article_image.contributors << @contributor
      flash[:notice] = 'ArticleImage was successfully created.'
      redirect_to admin_issue_article_path(@article.issue, @article)
    else
      render :action => "new"
    end
  end

  # PUT /article_images/1
  def update
    @article = Article.find(params[:article_id])
    @article_image = ArticleImage.find(params[:id])
    @contributor = @article_image.contributors.first
    @article_image.attributes = params[:article_image]
    @contributor.attributes = params[:contributor]

    if @article_image.valid? && @contributor.valid?
      @article_image.save
      @contributor.save
      flash[:notice] = 'ArticleImage was successfully updated.'
      redirect_to admin_issue_article_path(@article.issue, @article)
    else
      render :action => "edit"
    end
  end

  # DELETE /article_images/1
  def destroy
    @article_image = ArticleImage.find(params[:id])
    @article = @article_image.article
    @article.images.delete(@article_image)

    redirect_to admin_issue_article_path(@article.issue, @article)
  end
end
