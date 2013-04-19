class Admin::ContributorsController < Admin::AdminController
  # GET /contributors
  #def index
    #@contributors = Contributor.all
  #end

  # GET /contributors/1
  #def show
    #@contributor = Contributor.find(params[:id])
  #end

  # GET /contributors/new
  def new
    @contributor = Contributor.new
    @article = Article.find(params[:article_id])
    @issue = @article.issue
  end

  # GET /contributors/1/edit
  def edit
    @contributor = Contributor.find(params[:id])
    @contributor
    @article = @contributor.articles.first
    @issue = @article.issue
  end

  # POST /contributors
  def create
    @contributor = Contributor.new(params[:contributor])
    @contributor.user = current_user
    @article = Article.find(params[:article_id])
    @issue = @article.issue

    if @contributor.save
      @article.contributors << @contributor
      flash[:notice] = 'Contributor was successfully created.'
      redirect_to admin_issue_article_path(@issue, @article)
    else
      render :action => "new"
    end
  end

  # PUT /contributors/1
  def update
    @contributor = Contributor.find(params[:id])
    @article = Article.find(params[:article_id])
    @issue = @article.issue

    if @contributor.update_attributes(params[:contributor])
      flash[:notice] = 'Contributor was successfully updated.'
      redirect_to admin_issue_article_path(@issue, @article)
    else
      render :action => "edit"
    end
  end

  # DELETE /contributors/1
  def destroy
    @contributor = Contributor.find(params[:id])
    @article = Article.find(params[:article_id])
    @article.contributors.delete(@contributor)
    #@contributor.destroy

    redirect_to admin_issue_article_path(@article.issue, @article)
  end
end
