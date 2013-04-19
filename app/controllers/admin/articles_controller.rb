class Admin::ArticlesController < Admin::AdminController
  # GET /issue/1/articles
  #def index
    #@articles = Article.all
  #end

  # GET /issue/1/articles/1
  def show
    @article = Article.find(params[:id])
    @issue = Issue.find(params[:issue_id])
    @contributors = @article.contributors
    @categories= @article.categories
    @images = @article.images
  end

  # GET /issue/1/articles/new
  def new
    @article = Article.new
    @issue = Issue.find(params[:issue_id])
  end

  # GET /issue/1/articles/1/edit
  def edit
    @article = Article.find(params[:id])
    @issue = Issue.find(params[:issue_id])
  end

  # POST /issue/1/articles
  def create
    @article = Article.new(params[:article])
    @article.contents.gsub!("\n", "\n\n")
    @issue = Issue.find(params[:issue_id])
    @article.issue = @issue
    @article.user = current_user

    if @article.save
      flash[:notice] = 'Article was successfully created.'
      redirect_to admin_issue_article_path(@issue, @article)
    else
      render :action => "new"
    end
  end

  # PUT /issue/1/articles/1
  def update
    @article = Article.find(params[:id])
    @issue = Issue.find(params[:issue_id])

    if @article.update_attributes(params[:article])
      flash[:notice] = 'Article was successfully updated.'
      redirect_to admin_issue_article_path(@issue, @article)
    else
      render :action => "edit"
    end
  end

  # DELETE /issue/1/articles/1
  def destroy
    @article = Article.find(params[:id])
    issue = @article.issue
    @article.destroy
    #session[:article] = nil

    redirect_to(admin_issue_path(issue))
  end
end
