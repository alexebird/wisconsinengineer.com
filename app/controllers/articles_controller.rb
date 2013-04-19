class ArticlesController < ApplicationController
  layout "issues"

  def show
    @article = Article.find(params[:id])
    @issue = @article.issue
    @articles = {}

    @issue.articles.each do |article|
      #cat = article.category.name
      article.categories.each do |cat|
        cat = cat.name
        if @articles[cat]
          @articles[cat] << article
        else
          @articles[cat] = [article]
        end
      end
    end
  end
end
