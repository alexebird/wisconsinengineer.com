class Admin::CategoriesController < Admin::AdminController
  # GET /categories
  #def index
    #@categories = Category.all
  #end

  # GET /categories/1
  #def show
    #@category = Category.find(params[:id])
  #end

  # GET /categories/new
  #def new
    #@category = Category.new
  #end

  # GET /categories/1/edit
  #def edit
    #@category = Category.find(params[:id])
  #end

  # POST /categories
  def create
    article = Article.find(params[:article_id])
    category = Category.find(params[:category_id])
    if !article.category_ids.include?(category.id)
      article.categories << category
    end
    redirect_to admin_issue_article_path(article.issue, article)
  end

  # PUT /categories/1
  #def update
    #@category = Category.find(params[:id])

    #if @category.update_attributes(params[:category])
      #flash[:notice] = 'Category was successfully updated.'
      #redirect_to(@category)
    #else
      #render :action => "edit"
    #end
  #end

  # DELETE /categories/1
  def destroy
    article = Article.find(params[:article_id])
    category = Category.find(params[:id])
    article.categories.delete(category)

    redirect_to admin_issue_article_path(article.issue, article)
  end
end
